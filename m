From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:25:44 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 08/11] refpolicy: new
 package
In-Reply-To: <1455603506-26138-8-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-8-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223232544.52b16607@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 11:48:23 +0530, Niranjan Reddy wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 198e683..a5b31aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1519,6 +1519,8 @@ endmenu
>  
>  menu "Security"
>  	source "package/policycoreutils/Config.in"
> +	source "package/refpolicy/Config.in"
> +	source "package/refpolicy-contrib/Config.in"

I've looked at this refpolicy-contrib thing, and it adds quite a bit of
complexity to a patch that isn't already simple. If I understand
correctly, if one uses the refpolicy from the official release tarball,
then you don't need this refpolicy-contrib thing.

So may I suggest to split the problem into two patches:

 1. A patch adding the refpolicy package itself, only supporting
    the release tarball.

 2. A patch adding the refpolicy-contrib logic.

This way, we can hopefully make progress on (1), get it merged, and
work later on (2).

> +	  The current refpolicy does not fully support Buildroot
> +	  and needs modifications to work with the default system
> +	  file layout. These changes should be added as patches to
> +	  the refpolicy that modify a single SELinux policy.

So practically speaking, how is your selinux demo defconfig working?

> +choice
> +	prompt "SELinux policy type"
> +	default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +
> +	config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +		bool "Standard"
> +		help
> +		  Standard SELinux policy
> +
> +	config BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +		bool "MCS"
> +		help
> +		  SELinux policy with multi-catagory support
> +
> +	config BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +		bool "MLS"
> +		help
> +		  SELinux policy with multi-catagory and multi-level support

I think we normally don't indent the contents of choice...endchoice
blocks.

> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE
> +	string
> +	default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +	default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +	default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +
> +choice
> +	prompt "SELinux default state"
> +	default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +
> +	config BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
> +		bool "Enforcing"
> +		help
> +		  SELinux security policy is enforced
> +
> +	config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +		bool "Permissive"
> +		help
> +		  SELinux prints warnings instead of enforcing
> +
> +	config BR2_PACKAGE_REFPOLICY_STATE_DISABLE
> +		bool "Disabled"
> +		help
> +		  No SELinux policy is loaded

Ditto.

> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_STATE
> +	string
> +	default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
> +	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLE
> +
> +config BR2_PACKAGE_REFPOLICY_MODULES_FILE
> +	string "Refpolicy modules configuration"
> +	default "package/refpolicy/modules.conf"
> +	help
> +	  Location of a custom modules.conf file that lists the
> +	  SELinux policy modules to be included in the compiled
> +	  policy. See policy/modules.conf in the refpolicy sources for
> +	  the complete list of available modules.
> +	  NOTE: This file is only used if a Custom Git repo is
> +	  not specified.
> +
> +config BR2_PACKAGE_REFPOLICY_MODULAR
> +	bool "Build a modular SELinux policy"
> +	help
> +	  Select Y to build a modular SELinux policy. By default,
> +	  a monolithing policy will be built to save space on the

monolithing -> monolithic.

> +	  target. A modular policy can also be built if policies
> +	  need to be modified without reloading the target.
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +	bool "Custom Git repository"
> +	select BR2_PACKAGE_REFPOLICY_CONTRIB
> +	help
> +	 This option allows Buildroot to get the refpolicy source
> +	 code from a Git repository. This option should generally
> +	 be used to add custom SELinux policy to the base refpolicy
> +	 without having to deal with lots of patches.
> +
> +	 Please note that with the current configuration of the
> +	 mainline refpolicy git repositories, a refpolicy and a
> +	 refpolicy-contrib git repo must be specified. These are
> +	 linked using a git submodule which does not get initialized
> +	 during the Buildroot build.
> +
> +if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
> +	string "URL of custom repository"
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
> +	string "Custom repository version"
> +	help
> +	  Revision to use in the typical format used by Git
> +	  e.g. a SHA id, a tag, branch, ..
> +
> +endif

This part would go away in patch (1).


> +start() {
> +   echo -n "Initializing SELinux: "

Use printf here.

> +   # Context Label /dev/
> +   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ] && fgrep " /dev " /proc/mounts >/dev/null 2>&1 ; then

Why do you check for /sbin/restorecon existence here? Isn't it
installed as a mandatory dependency anyway?

> +      /sbin/restorecon -R -F /dev 2>/dev/null
> +   fi
> +
> +   # Context Label tmpfs mounts
> +   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ]; then

Ditto.

> +      /sbin/restorecon -R -F $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// && $3 =="tmpfs" { print $2 }' /etc/fstab) >/dev/null 2>&1

Wow, complicated :)

> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> new file mode 100644
> index 0000000..c23b23a
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.mk
> @@ -0,0 +1,123 @@
> +################################################################################
> +#
> +# refpolicy
> +#
> +################################################################################
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
> +REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
> +REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
> +REFPOLICY_SITE_METHOD = git
> +REFPOLICY_DEPENDENCIES += refpolicy-contrib
> +else
> +REFPOLICY_VERSION = 2.20130424
> +REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
> +REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy
> +endif
> +REFPOLICY_LICENSE = GPLv2
> +REFPOLICY_LICENSE_FILES = COPYING
> +
> +# Cannot use multiple threads to build the reference policy
> +REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
> +
> +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
> +	host-setools host-gawk host-python policycoreutils
> +
> +REFPOLICY_INSTALL_STAGING = YES
> +
> +REFPOLICY_POLICY_NAME = br_policy
> +
> +# To apply board specific customizations, create a refpolicy folder in
> +# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
> +# in package/refpolicy

This sort of comment doesn't belong here, it's general Buildroot usage.

> +# Passing the HOST_CONFIGURE_OPTS to the target build because all of the
> +# build utilities are expected to be on system. This fools the make files
> +# into using the host built utilities to compile the SELinux policy for
> +# the target.

This is really weird, but OK I haven't looked at the details, and I can
understand that refpolicy is a weird beast.

> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +	REFPOLICY_MONOLITHIC = n

indentation not needed.

> +define REFPOLICY_POLICY_COMPILE
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/policy
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/modules/active/modules
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files
> +	touch $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files/file_contexts.local
> +endef

This...

> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)

... should be defined inside the condition. Though it seems weird to
have a variable called REFPOLICY_POLICY_COMPILE that doesn't compile
anything at all, and just creates a few directories and creates one
empty file.

> +	REFPOLICY_POST_INSTALL_TARGET_HOOKS += REFPOLICY_POLICY_COMPILE

Indentation not needed here.

> +endif
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
