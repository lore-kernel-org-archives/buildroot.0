From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 1 Jul 2017 22:00:49 +0200
Subject: [Buildroot] [RFC PATCH v5 04/11] pkg-generic: create a list af
 installed files per step and package
In-Reply-To: <0a8ba202-8a3f-944c-f546-b0d399423e18@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-5-git-send-email-wg@grandegger.com>
 <0a8ba202-8a3f-944c-f546-b0d399423e18@mind.be>
Message-ID: <671458bb-f987-542a-d550-1e5ea46d33e0@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnount,

Am 01.07.2017 um 18:15 schrieb Arnout Vandecappelle:
> 
> 
> On 30-06-17 10:37, Wolfgang Grandegger wrote:
>> The GLOBAL_INSTRUMENTATION_HOOKS "step_pkg_size*" are extended to create
>> a file with the list of all installed files per step and package. The
>> file name is "<package-build-dir>/.br_<host|staging|target>_filelist".
>> This file could be used by other hooks to scan the installed files,
>> e.g. to check the bin arch, the host rpath or for rpath sanitation.
>>
>> For a quick hack, the "packages-file-list.txt" is created as before.
> 
>   And the intention would be to move the generation of packages-file-list.txt to
> the finalize step, right?
> 
>>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>   package/pkg-generic.mk | 46 ++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 32 insertions(+), 14 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index f474704..825ab0c 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -57,33 +57,51 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>>   
>>   # Hooks to collect statistics about installed files
>>   
>> -# This hook will be called before the target installation of a
>> -# package. We store in a file named .br_filelist_before the list of
>> -# files currently installed in the target. Note that the MD5 is also
>> -# stored, in order to identify if the files are overwritten.
>> +# This hook will be called before the installation of a host,
>> +# staging or target package.
> 
>   Just "package" - all packages are one of the three.
> 
>> +# We store in a file named .br_filelist_before the list of files
>> +# currently installed in the root directory. Note that the MD5 is
>> +# also stored, in order to identify if the files are overwritten.
>> +# Arguments:
>> +# $1: path to the root directory of host, staging or target tree
> 
>   Could you include http://patchwork.ozlabs.org/patch/724235/ in your series? It
> cleans it up a little bit.
> 
>>   define step_pkg_size_start
>> -	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>> +	(cd $(1) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>>   		$($(PKG)_DIR)/.br_filelist_before
>>   endef
>>   
>> -# This hook will be called after the target installation of a
>> -# package. We store in a file named .br_filelist_after the list of
>> -# files (and their MD5) currently installed in the target. We then do
>> -# a diff with the .br_filelist_before to compute the list of files
>> -# installed by this package.
>> +# This hook will be called before the installation of a host,
>                                after                        package.
> 
>> +# staging or target package.
>> +# We store in a file named .br_filelist_after the list of files
>> +# (and their MD5) currently installed in the root directory. We
>> +# then do a diff with the .br_filelist_before to compute the list
>> +# of files installed by this package.
>> +# Arguments:
>> +# $1: path to the root directory of host, staging or target tree
>> +# $2: name of the installation tree ("host"|"staging"|"target")
>> +# $3: name of the package
>>   define step_pkg_size_end
>> -	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
>> +	(cd $(1); find . -type f -print0 | xargs -0 md5sum) | sort > \
>>   		$($(PKG)_DIR)/.br_filelist_after
>> +	: > $($(PKG)_DIR)/.br_$(2)_filelist; \
>                                             ^^^Not needed
> 
>   But instead of doing this, I have a slight preference for doing the redirect
> outside of the while loop instead of appending to the file inside the loop. It's
> more efficient and also easier to read IMO.
> 
>>   	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
>>   		while read hash file ; do \
>> -			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
>> +			echo "$${file}" | sed -e 's/^\.\///' >> $($(PKG)_DIR)/.br_$(2)_filelist ; \
>                                                So remove
> this:^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +			if [ $(2) = "target" ]; then \
>> +				echo "$(3),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
>> +			fi ; \
>>   		done
>     And insert here:  > $($(PKG)_DIR)/.br_$(2)_filelist
> 
>>   endef
>>   
>>   define step_pkg_size
>> +	$(if $(filter install-host,$(2)),\
>> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(HOST_DIR))) \
>> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(HOST_DIR),"host",$(3))))
>> +	$(if $(filter install-staging,$(2)),\
>> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(STAGING_DIR))) \
>> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(STAGING_DIR),"staging",$(3))))
>>   	$(if $(filter install-target,$(2)),\
>> -		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
>> -		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
>> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(TARGET_DIR))) \
>> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(TARGET_DIR),"target",$(3))))
>>   endef
> 
>   This is getting quite complicated... I'm thinking the following:
> 
> define step_pkg_size_install-host
> 	$(call step_pkg_size_$(1),$(HOST_DIR),$(2),$(3))
> endef
> 
> define step_pkg_size_install-staging
> 	$(call step_pkg_size_$(1),$(STAGING_DIR),$(2),$(3))
> endef
> 
> define step_pkg_size_install-target
> 	$(call step_pkg_size_$(1),$(TARGET_DIR),$(2),$(3))
> endef
> 
> define step_pkg_size
> 	$(call step_pkg_size_$(2),$(1),$(2),$(3))
> endef
> 
> (untested, as usual) but I'm not entirely sure that it's better. Obviously, this
> should be done in a separate patch.

This needs polish to be more efficient and elegant. Already the name is 
not a good choice. I just hijecked it to get the job done for the moment.

Wolfgang.
