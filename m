From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 18 Feb 2014 00:41:45 +0100
Subject: [Buildroot] [PATCH 1/2] infra: Add PRE_*_HOOKS for every step
In-Reply-To: <530285E6.1070306@mind.be>
References: <1392334048-30321-1-git-send-email-maxime.hadjinlian@gmail.com>
 <530285E6.1070306@mind.be>
Message-ID: <CAGduivyqRW+KWq0rjt17odQjjzeUrLe+DuAQ5BJC1Gnhr+W54w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all

On Mon, Feb 17, 2014 at 10:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 14/02/14 00:27, Maxime Hadjinlian wrote:
>> Add PRE_*_HOOKS to all the different steps through which a package may go.
>>
>> This will help avoid using POST_*_HOOKS to do tasks that should be done
>> in the PRE_*_HOOKS of the next step.
>> Otherwise, when the user would do a make foo-re<step>, this would not do
>> what was really intented, the POST_*_HOOK of the preceding step not
>> being executed.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  docs/manual/adding-packages-hooks.txt | 17 +++++++++++++++++
>>  package/pkg-generic.mk                | 22 ++++++++++++++++++++--
>>  2 files changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
>> index d96c991..38d3e4a 100644
>> --- a/docs/manual/adding-packages-hooks.txt
>> +++ b/docs/manual/adding-packages-hooks.txt
>> @@ -14,17 +14,34 @@ of the package construction.
>>
>>  The following hook points are available:
>>
>> +* +LIBFOO_PRE_DOWNLOAD_HOOKS+
>>  * +LIBFOO_POST_DOWNLOAD_HOOKS+
>> +
>> +* +LIBFOO_PRE_EXTRACT_HOOKS+
>>  * +LIBFOO_POST_EXTRACT_HOOKS+
>> +
>> +* +LIBFOO_PRE_RSYNC_HOOKS+
>>  * +LIBFOO_POST_RSYNC_HOOKS+
>> +
>>  * +LIBFOO_PRE_PATCH_HOOKS+
>>  * +LIBFOO_POST_PATCH_HOOKS+
>> +
>>  * +LIBFOO_PRE_CONFIGURE_HOOKS+
>>  * +LIBFOO_POST_CONFIGURE_HOOKS+
>> +
>> +* +LIBFOO_PRE_BUILD_HOOKS+
>>  * +LIBFOO_POST_BUILD_HOOKS+
>> +
>> +* +LIBFOO_PRE_INSTALL_HOOKS+ (for host packages only)
>>  * +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
>> +
>> +* +LIBFOO_PRE_INSTALL_STAGING_HOOKS+ (for target packages only)
>>  * +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
>> +
>> +* +LIBFOO_PRE_INSTALL_TARGET_HOOKS+ (for target packages only)
>>  * +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
>> +
>> +* +LIBFOO_PRE_LEGAL_INFO_HOOKS+
>>  * +LIBFOO_POST_LEGAL_INFO_HOOKS+
>>
>>  These variables are 'lists' of variable names containing actions to be
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 555c3c2..b6016d9 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -70,6 +70,7 @@ endif
>>
>>  # Retrieve the archive
>>  $(BUILD_DIR)/%/.stamp_downloaded:
>> +     $(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>>  ifeq ($(DL_MODE),DOWNLOAD)
>
>  Actually, I think it's more appropriate that the message is printed
> before the hooks, like in the patch step, and not after the hooks.
Agreed, at least the users knows in which steps he is.
>
>  Note that that also means that the MESSAGE call should be removed from
> AUTORECONF_HOOK - which is not ideal either... So I'm not 100% certain
> about this.
Maybe we don't have to make a rule about that and simply do, what
seems to be best ?
>
>>  # Only show the download message if it isn't already downloaded
>>       $(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
>> @@ -100,6 +101,7 @@ endif
>>  # Unpack the archive
>>  $(BUILD_DIR)/%/.stamp_extracted:
>>       @$(call step_start,extract)
>> +     $(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Extracting")
>>       $(Q)mkdir -p $(@D)
>>       $($(PKG)_EXTRACT_CMDS)
>> @@ -112,6 +114,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
>>  # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
>>  # used.
>>  $(BUILD_DIR)/%/.stamp_rsynced:
>> +     $(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
>>       @test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
>>       rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
>> @@ -141,8 +144,8 @@ $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
>>  $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
>>  $(BUILD_DIR)/%/.stamp_patched:
>>       @$(call step_start,patch)
>> -     @$(call MESSAGE,"Patching")
>>       $(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
>> +     @$(call MESSAGE,"Patching")
>>       $(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
>>       $(Q)( \
>>       for D in $(PATCH_BASE_DIRS); do \
>> @@ -172,6 +175,7 @@ $(BUILD_DIR)/%/.stamp_configured:
>>  # Build
>>  $(BUILD_DIR)/%/.stamp_built::
>>       @$(call step_start,build)
>> +     $(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Building")
>>       $($(PKG)_BUILD_CMDS)
>>       $(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
>> @@ -181,6 +185,7 @@ $(BUILD_DIR)/%/.stamp_built::
>>  # Install to host dir
>>  $(BUILD_DIR)/%/.stamp_host_installed:
>>       @$(call step_start,install-host)
>> +     $(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Installing to host directory")
>>       $($(PKG)_INSTALL_CMDS)
>>       $(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
>> @@ -190,6 +195,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
>>  # Install to staging dir
>>  $(BUILD_DIR)/%/.stamp_staging_installed:
>>       @$(call step_start,install-staging)
>> +     $(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Installing to staging directory")
>>       $($(PKG)_INSTALL_STAGING_CMDS)
>>       $(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
>> @@ -206,6 +212,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>>  # Install to images dir
>>  $(BUILD_DIR)/%/.stamp_images_installed:
>>       @$(call step_start,install-image)
>> +     $(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Installing to images directory")
>>       $($(PKG)_INSTALL_IMAGES_CMDS)
>>       $(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
>> @@ -215,6 +222,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
>>  # Install to target dir
>>  $(BUILD_DIR)/%/.stamp_target_installed:
>>       @$(call step_start,install-target)
>> +     $(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
>>       @$(call MESSAGE,"Installing to target")
>>       $(if $(BR2_INIT_SYSTEMD),\
>>               $($(PKG)_INSTALL_INIT_SYSTEMD))
>> @@ -377,19 +385,28 @@ $(2)_EXTRACT_CMDS ?= \
>>       $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
>>       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
>>
>> -# post-steps hooks
>> +# pre/post-steps hooks
>> +$(2)_PRE_DOWNLOAD_HOOKS        ?=
>>  $(2)_POST_DOWNLOAD_HOOKS        ?=
>> +$(2)_PRE_EXTRACT_HOOKS         ?=
>>  $(2)_POST_EXTRACT_HOOKS         ?=
>> +$(2)_PRE_RSYNC_HOOKS           ?=
>>  $(2)_POST_RSYNC_HOOKS           ?=
>>  $(2)_PRE_PATCH_HOOKS            ?=
>>  $(2)_POST_PATCH_HOOKS           ?=
>>  $(2)_PRE_CONFIGURE_HOOKS        ?=
>>  $(2)_POST_CONFIGURE_HOOKS       ?=
>> +$(2)_PRE_BUILD_HOOKS           ?=
>>  $(2)_POST_BUILD_HOOKS           ?=
>> +$(2)_PRE_INSTALL_HOOKS         ?=
>>  $(2)_POST_INSTALL_HOOKS         ?=
>> +$(2)_PRE_INSTALL_STAGING_HOOKS ?=
>>  $(2)_POST_INSTALL_STAGING_HOOKS ?=
>> +$(2)_PRE_INSTALL_TARGET_HOOKS  ?=
>>  $(2)_POST_INSTALL_TARGET_HOOKS  ?=
>> +$(2)_PRE_INSTALL_IMAGES_HOOKS  ?=
>>  $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
>> +$(2)_PRE_LEGAL_INFO_HOOKS      ?=
>>  $(2)_POST_LEGAL_INFO_HOOKS      ?=
>>
>>  # human-friendly targets and target sequencing
>> @@ -545,6 +562,7 @@ $(1)-legal-info:
>>  # Packages without a source are assumed to be part of Buildroot, skip them.
>>  ifneq ($(call qstrip,$$($(2)_SOURCE)),)
>>
>> +     $(foreach hook,$($(2)_PRE_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
>
>  The POST_LEGAL_INFO_HOOKS are executed even if the condition is not
> true, so the same should be done for the PRE_ hooks.
Right ! Thanks, I will fix this.
>
>  Regards,
>  Arnout
>
>>  ifeq ($$($(2)_SITE_METHOD),local)
>>  # Packages without a tarball: don't save and warn
>>       @$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
