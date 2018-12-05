From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Dec 2018 10:18:07 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181205090410.0f08dba3@windsurf>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <dc8cc6eb-59ab-2913-f094-cf5ae48eec4d@mind.be>
 <20181205090410.0f08dba3@windsurf>
Message-ID: <47a97a05-e9c1-41e9-2576-2aa31f69f401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/12/2018 09:04, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> Thanks for the review.
> 
> On Tue, 4 Dec 2018 23:24:58 +0100, Arnout Vandecappelle wrote:
> 
>>>    We only need to take care of direct dependencies (and not
>>>    recursively all dependencies), because we accumulate into those
>>>    per-package host and target directories the files installed by the
>>>    dependencies. Note that this only works because we make the
>>>    assumption that one package does *not* overwrite files installed by
>>>    another package.  
>>
>>  So that means that if BR2_PER_PACKAGE_DIRECTORIES=y, check-uniq-files should
>> give errors instead of warnings, no?
> 
> Possibly yes. But even as of today, check-uniq-files shows warnings for
> legitimate things that have been overwritten, such as .la files. So
> even if having check-uniq-files error out if files are overwritten is a
> desirable long-term goal, I'm not sure it's going to be reasonable to
> achieve this goal as part of this per-package SDK/target series.

 True. But on the other hand, the idea of this experimental, user-configurable
feature is that we get some time to debug it. That means we have to detect bugs,
so we need to do this.

 So, mark it as a side note as one of those things that still have to be done.

> 
>>>  comment "Security Hardening Options"
>>> diff --git a/Makefile b/Makefile
>>> index 23032988a5..35fe1b3644 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -207,7 +207,8 @@ BINARIES_DIR := $(BASE_DIR)/images
>>>  # The target directory is common to all packages,
>>>  # but there is one that is specific to each filesystem.
>>>  BASE_TARGET_DIR := $(BASE_DIR)/target
>>> -TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
>>> +PER_PACKAGE_DIR := $(BASE_DIR)/per-package  
>>
>>  Perhaps it would be nice to add a preparatory patch that reorders the
>> definitions of BASE_TARGET_DIR, TARGET_DIR, STAGING_DIR and HOST_DIR so they are
>> all together, and can be in a single BR2_PER_PACKAGE_DIRECTORIES condition.
> 
> I'll have a look at what can I do, but the ordering of those variables
> is a bit messy/complicated.

 I think the only ordering constraint before this patch is HOST_DIR, which gets
defined twice (once before and once after including .config). The other ones
don't have any complication, do they?


>>>  # initial definition so that 'make clean' works for most users, even without
>>>  # .config. HOST_DIR will be overwritten later when .config is included.
>>>  HOST_DIR := $(BASE_DIR)/host
>>> @@ -246,6 +247,12 @@ endif
>>>  #      make -j$((`getconf _NPROCESSORS_ONLN`+1))
>>>  .NOTPARALLEL:
>>>  
>>> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>>> +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
>>> +else
>>> +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
>>> +endif  
>>
>>  Was there any reason to move the definition of TARGET_DIR?
> 
> Yes: TARGET_DIR was defined prior to the .config file being included.
> Now that its definition depends on BR2_PER_PACKAGE_DIRECTORIES, we need
> to move the TARGET_DIR definition after the .config file is included.

 All the more reason to move it in a separate patch :-)

 I think the place where now HOST_DIR is defined a second time would be a good
location for doing this. TARGET_DIR should not be used anywhere outside of the
BR2_HAVE_DOT_CONFIG condition (to be double-checked) - it should be
BASE_TARGET_DIR instead, like is the case in the clean target.


>>> -host-finalize: $(HOST_DIR_SYMLINK)
>>> +host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>>> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)	
>>> +	@$(call MESSAGE,"Creating global host directory")
>>> +	$(foreach pkg,$(sort $(PACKAGES)),\
>>> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>>> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>>> +		$(HOST_DIR)$(sep))  
>>
>>  Don't you think it's worth factoring this into a pkg-utils macro? I'm thinking:
>>
>> # rsync-per-package(packages,type,destdir)
>> # copy every per-package host or target dir (as determined by type) for packages
>> # (a list of packages) into destdir.
>> # copying is done by making hardlinks using rsync
>> define rsync-per-package
>> 	$(foreach pkg,$(sort $(1)),\
>> 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
>> 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
>> 		$(3)$(sep))
>> endef
> 
> Perhaps I could re-use the prepare-per-package-directory macro already
> in package/pkg-utils.mk, which is currently defined as:
> 
> ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> define prepare-per-package-directory
>         mkdir -p $(HOST_DIR) $(TARGET_DIR)
>         $(foreach pkg,$(1),\
>                 rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>                 $(PER_PACKAGE_DIR)/$(pkg)/host/ \
>                 $(HOST_DIR)$(sep))
>         $(foreach pkg,$(1),\
>                 rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
>                 $(PER_PACKAGE_DIR)/$(pkg)/target/ \
>                 $(TARGET_DIR)$(sep))
> endef
> endif
> 
> This macro is for now used to prepare the per-package directories during
> the build, but it could also be used to prepare the global directories
> at the end of the build. The only thing that we need is to separate it
> into two macros that do the host and target separately, since for the
> global directories, these are done in host-finalize and target-finalize
> respectively.

 Well, yes, that's the same indeed... But you'll still want the
prepare-per-package-directory macro, I think, otherwise you'd have to call the
inner macro twice everywhere (admittedly, "everywhere" is just in 2 places, or 3
if we add it to kconfig as well).

> 
>>>  	@$(call MESSAGE,"Finalizing target directory")
>>>  	# Check files that are touched by more than one package
>>>  	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt  
>>
>>  Side note: if we make check-uniq-files return errors, we should probably also
>> move it to a per package step so the autobuilders can identify the failing
>> package. But that can be done later.
> 
> Yes, let's not do everything in this series please :)

 Absolutely, but I guess you have a todo list somewhere, no?

> 
>>>      # Remove duplicate and trailing '/' for proper match
>>> @@ -20,7 +21,7 @@ main() {
>>>      while read file; do
>>>          is_elf "${file}" || continue
>>>          elf_needs_rpath "${file}" "${hostdir}" || continue
>>> -        check_elf_has_rpath "${file}" "${hostdir}" && continue
>>> +        check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
>>>          if [ ${ret} -eq 0 ]; then
>>>              ret=1
>>>              printf "***\n"
>>> @@ -57,6 +58,7 @@ elf_needs_rpath() {  
>>
>>  I think there should be some explanation why elf_needs_rpath doesn't need to
>> check all per-package directories. Basically it's because any library that the
>> executable may depend on must already have been rsynced into ${host_dir} which
>> is the per-package host directory.
> 
> It seems pretty obvious to me, no? 

 I admit it was pretty late already, but still, it took me more than 10 minutes
to realize that.

> I mean the per-package host directory

 That's the first problem already: it's hard to realize that HOST_DIR/host_dir
really is the per-package host directory. But I guess that that's a matter of
being used to it.

 That reminds me: perhaps a paragraph should be added to
docs/manual/adding-packages-generic.txt to explain that HOST_DIR, STAGING_DIR
and TARGET_DIR point to the per-package directory when used within a package.

> contains all the stuff installed by the dependencies of the
> package, so it obviously contains all the necessary libraries.

 That's the second reason why it's not so obvious. When executable A links with
library B, it will typically have an rpath to the per-package directory of B.
It's not directly obvious that you can just as well check for the presence of
the library in the per-package of A to know that it needs an rpath to the
per-package of B.

> 
> But fair enough: where do you want to see this explanation ? In the
> commit log ? As a comment in the script itself ?

 I think in the script itself. It could use a little bit more explanation in its
overall comment at the beginning of the file even without this patch.

 Regards,
 Arnout


> 
> Once again, thanks for the review!
> 
> Thomas
> 
