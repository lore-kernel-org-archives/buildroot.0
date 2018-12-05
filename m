From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Dec 2018 09:04:10 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <dc8cc6eb-59ab-2913-f094-cf5ae48eec4d@mind.be>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <dc8cc6eb-59ab-2913-f094-cf5ae48eec4d@mind.be>
Message-ID: <20181205090410.0f08dba3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Thanks for the review.

On Tue, 4 Dec 2018 23:24:58 +0100, Arnout Vandecappelle wrote:

> >    We only need to take care of direct dependencies (and not
> >    recursively all dependencies), because we accumulate into those
> >    per-package host and target directories the files installed by the
> >    dependencies. Note that this only works because we make the
> >    assumption that one package does *not* overwrite files installed by
> >    another package.  
> 
>  So that means that if BR2_PER_PACKAGE_DIRECTORIES=y, check-uniq-files should
> give errors instead of warnings, no?

Possibly yes. But even as of today, check-uniq-files shows warnings for
legitimate things that have been overwritten, such as .la files. So
even if having check-uniq-files error out if files are overwritten is a
desirable long-term goal, I'm not sure it's going to be reasonable to
achieve this goal as part of this per-package SDK/target series.

> >  comment "Security Hardening Options"
> > diff --git a/Makefile b/Makefile
> > index 23032988a5..35fe1b3644 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -207,7 +207,8 @@ BINARIES_DIR := $(BASE_DIR)/images
> >  # The target directory is common to all packages,
> >  # but there is one that is specific to each filesystem.
> >  BASE_TARGET_DIR := $(BASE_DIR)/target
> > -TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> > +PER_PACKAGE_DIR := $(BASE_DIR)/per-package  
> 
>  Perhaps it would be nice to add a preparatory patch that reorders the
> definitions of BASE_TARGET_DIR, TARGET_DIR, STAGING_DIR and HOST_DIR so they are
> all together, and can be in a single BR2_PER_PACKAGE_DIRECTORIES condition.

I'll have a look at what can I do, but the ordering of those variables
is a bit messy/complicated.

> >  # initial definition so that 'make clean' works for most users, even without
> >  # .config. HOST_DIR will be overwritten later when .config is included.
> >  HOST_DIR := $(BASE_DIR)/host
> > @@ -246,6 +247,12 @@ endif
> >  #      make -j$((`getconf _NPROCESSORS_ONLN`+1))
> >  .NOTPARALLEL:
> >  
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
> > +else
> > +TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(BASE_TARGET_DIR))
> > +endif  
> 
>  Was there any reason to move the definition of TARGET_DIR?

Yes: TARGET_DIR was defined prior to the .config file being included.
Now that its definition depends on BR2_PER_PACKAGE_DIRECTORIES, we need
to move the TARGET_DIR definition after the .config file is included.

> > -host-finalize: $(HOST_DIR_SYMLINK)
> > +host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)	
> > +	@$(call MESSAGE,"Creating global host directory")
> > +	$(foreach pkg,$(sort $(PACKAGES)),\
> > +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> > +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
> > +		$(HOST_DIR)$(sep))  
> 
>  Don't you think it's worth factoring this into a pkg-utils macro? I'm thinking:
> 
> # rsync-per-package(packages,type,destdir)
> # copy every per-package host or target dir (as determined by type) for packages
> # (a list of packages) into destdir.
> # copying is done by making hardlinks using rsync
> define rsync-per-package
> 	$(foreach pkg,$(sort $(1)),\
> 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
> 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
> 		$(3)$(sep))
> endef

Perhaps I could re-use the prepare-per-package-directory macro already
in package/pkg-utils.mk, which is currently defined as:

ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
define prepare-per-package-directory
        mkdir -p $(HOST_DIR) $(TARGET_DIR)
        $(foreach pkg,$(1),\
                rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
                $(PER_PACKAGE_DIR)/$(pkg)/host/ \
                $(HOST_DIR)$(sep))
        $(foreach pkg,$(1),\
                rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
                $(PER_PACKAGE_DIR)/$(pkg)/target/ \
                $(TARGET_DIR)$(sep))
endef
endif

This macro is for now used to prepare the per-package directories during
the build, but it could also be used to prepare the global directories
at the end of the build. The only thing that we need is to separate it
into two macros that do the host and target separately, since for the
global directories, these are done in host-finalize and target-finalize
respectively.

> >  	@$(call MESSAGE,"Finalizing target directory")
> >  	# Check files that are touched by more than one package
> >  	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt  
> 
>  Side note: if we make check-uniq-files return errors, we should probably also
> move it to a per package step so the autobuilders can identify the failing
> package. But that can be done later.

Yes, let's not do everything in this series please :)

> >      # Remove duplicate and trailing '/' for proper match
> > @@ -20,7 +21,7 @@ main() {
> >      while read file; do
> >          is_elf "${file}" || continue
> >          elf_needs_rpath "${file}" "${hostdir}" || continue
> > -        check_elf_has_rpath "${file}" "${hostdir}" && continue
> > +        check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
> >          if [ ${ret} -eq 0 ]; then
> >              ret=1
> >              printf "***\n"
> > @@ -57,6 +58,7 @@ elf_needs_rpath() {  
> 
>  I think there should be some explanation why elf_needs_rpath doesn't need to
> check all per-package directories. Basically it's because any library that the
> executable may depend on must already have been rsynced into ${host_dir} which
> is the per-package host directory.

It seems pretty obvious to me, no? I mean the per-package host
directory contains all the stuff installed by the dependencies of the
package, so it obviously contains all the necessary libraries.

But fair enough: where do you want to see this explanation ? In the
commit log ? As a comment in the script itself ?

Once again, thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
