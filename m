From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 23:21:21 +0100
Subject: [Buildroot] [PATCH v13 2/8] refpolicy: new package
In-Reply-To: <1477423570-15694-2-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1477423570-15694-1-git-send-email-bryce.ferguson@rockwellcollins.com>
 <1477423570-15694-2-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <20161212232121.01e9059e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 14:26:04 -0500, Bryce Ferguson wrote:
> From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> The patch is for adding selinux reference policy (refpolicy).
> It is a complete SELinux policy that can be used as the system policy
> for a variety of systems and used as the basis for creating other policies.
> 
> Changes were made to this patch in between versions 12 and 13 for which
> the change history can be found here: https://patchwork.ozlabs.org/patch/649175/
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

This patch/commit is too complicated / too long. Please try to split it
into smaller chunks by only introducing the very mandatory
functionality first, and progressively add more capabilities.

It also has a number of issues. See below for the details.

> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> new file mode 100644
> index 0000000..5a46829
> --- /dev/null
> +++ b/package/refpolicy/Config.in
> @@ -0,0 +1,146 @@
> +config BR2_PACKAGE_REFPOLICY
> +	bool "refpolicy"
> +	select BR2_PACKAGE_POLICYCOREUTILS
> +	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # policycoreutils

This does not properly account for the dependencies of policycoreutils
and SELinux support in Busybox, which are:

        depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
        depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
        depends on !BR2_STATIC_LIBS #libsemanage
        depends on !BR2_arc # libsemanage
        depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage

> +comment "refpolicy needs a toolchain w/ threads, glibc or musl"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)

So this comment needs fixing. It should be:

comment "refpolicy needs a glibc toolchain w/ thread, dynamic library"
	depends on !BR2_arc
	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
		!BR2_TOOLCHAIN_USES_GLIBC

> +if BR2_PACKAGE_REFPOLICY
> +
> +choice
> +prompt "SELinux policy type"
> +default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +bool "Standard"
> +help
> +Standard SELinux policy

What is a "Standard SELinux policy" ?

> +
> +config BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +bool "MCS"
> +help
> +SELinux policy with multi-catagory support

Typo: category

> +
> +config BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +bool "MLS"
> +help
> +SELinux policy with multi-catagory and multi-level support

Typo: category

> +endchoice

The indentation of the choice is all wrong. It should be like this:

choice
	prompt "SELinux policy type
	default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD

config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
	bool "Standard"
	help
	  ....

config ...
	bool ...
	help
	  ....

endchoice

> +choice
> +prompt "SELinux default state"
> +default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
> +bool "Enforcing"
> +help
> +SELinux security policy is enforced
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +bool "Permissive"
> +help
> +SELinux prints warnings instead of enforcing
> +
> +config BR2_PACKAGE_REFPOLICY_STATE_DISABLE
> +bool "Disabled"
> +help
> +No SELinux policy is loaded
> +endchoice

Please fix the choice indentation.

> +config BR2_PACKAGE_REFPOLICY_NAME
> +	string "Custom policy Name"
> +	default "Buildroot"

Is it really useful to be able to customize this? I guess it can be
dropped in a first iteration.

> +
> +config BR2_PACKAGE_REFPOLICY_STATE
> +	string
> +	default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
> +	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
> +	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLE

This should be close to the refpolicy state choice.

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
> +config BR2_PACKAGE_REFPOLICY_BOOLEAN_FILE
> +	string "Refpolicy boolean configuration"
> +	default "package/refpolicy/booleans.conf"
> +	help
> +	  Location of a custom booleans.conf file that lists the
> +	  SELinux booleans to be set in the compiled
> +	  policy. See policy/booleans.conf in the refpolicy sources for
> +	  the complete list of available modules.
> +	  NOTE: This file is only used if a Custom Git repo is
> +	  not specified.

Both of these options can be removed in the first patch, just
unconditionally use package/refpolicy/*.conf to start.

> +
> +config BR2_PACKAGE_REFPOLICY_MODULAR
> +	bool "Build a modular SELinux policy"
> +	help
> +	  Select Y to build a modular SELinux policy. By default,
> +	  a monolithic policy will be built to save space on the
> +	  target. A modular policy can also be built if policies
> +	  need to be modified without reloading the target.

Same: please drop in the first patch, and do that in a subsequent patch
in the series.

> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +	bool "Custom Git repository"
> +	select BR2_PACKAGE_REFPOLICY_CONTRIB

This package no longer exists, and you're actually fetching it from the
refpolicy Git repo through the submodule if I understand correctly.

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

Same for this functionality: separate patch. I'm also not sure to
understand why we would want this exactly. What does this repository
typically contains? Can you show the layout of what it contains, so we
can understand what it's like?

> +stop() {
> +   # There is nothing to do
> +   echo "OK"
> +}

Don't print "OK" then.

> +
> +case "$1" in
> +   start)
> +      start
> +      ;;
> +   stop)
> +      stop
> +      ;;
> +   *)
> +      echo "Usage: $0 {start|stop}"
> +      exit 1
> +      ;;
> +esac
> +
> +exit $?

exit $? is not needed.

> diff --git a/package/refpolicy/booleans.conf b/package/refpolicy/booleans.conf
> new file mode 100644
> index 0000000..31c70b9
> --- /dev/null
> +++ b/package/refpolicy/booleans.conf

How was this file generated?

> diff --git a/package/refpolicy/config b/package/refpolicy/config
> new file mode 100644
> index 0000000..5eee807
> --- /dev/null
> +++ b/package/refpolicy/config
> @@ -0,0 +1,8 @@
> +# This file controls the state of SELinux on the system.
> +# SELINUX= can take one of these three values:
> +#     enforcing - SELinux security policy is enforced.
> +#     permissive - SELinux prints warnings instead of enforcing.
> +#     disabled - No SELinux policy is loaded.
> +SELINUX=permissive
> +# SELINUXTYPE= name of the selinux policy to use
> +SELINUXTYPE=refpolicy

Instead of having a template, what about simply generating this file
from the .mk file, since it contains only two lines? In your .mk file:

	echo SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE) > $(TARGET_DIR)/etc/selinux/config
	echo SELINUXTYPE=$(BR2_PACKAGE_REFPOLICY_NAME) >> $(TARGET_DIR)/etc/selinux/config

and that's it?

> diff --git a/package/refpolicy/modules.conf b/package/refpolicy/modules.conf
> new file mode 100644
> index 0000000..2304dc4
> --- /dev/null
> +++ b/package/refpolicy/modules.conf

How was this file generated? Do we need to keep it inside Buildroot?

> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> new file mode 100644
> index 0000000..c10de45
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.hash
> @@ -0,0 +1,2 @@
> +#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
> +sha256 2dd2f45a7132137afe8302805c3b7839739759b9ab73dd1815c01afe34ac99de  refpolicy-2.20151208.tar.bz2

This doesn't match the version used in the .mk file.

> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> new file mode 100644
> index 0000000..3622b6e
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.mk
> @@ -0,0 +1,111 @@
> +################################################################################
> +#
> +# refpolicy
> +#
> +################################################################################
> +
> +REFPOLICY_VERSION = RELEASE_2_20151208
> +REFPOLICY_SITE = https://github.com/TresysTechnology/refpolicy.git
> +REFPOLICY_SITE_METHOD = git

Please add a comment about why you're not using the Github helper.

> +REFPOLICY_GIT_SUBMODULES = y

Please add a comment that explains why you're using submodules here (I
guess it's because of refpolicy-contrib).

> +REFPOLICY_LICENSE = GPLv2
> +REFPOLICY_LICENSE_FILES = COPYING
> +
> +# Cannot use multiple threads to build the reference policy
> +REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
> +
> +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
> +	host-setools host-gawk host-python policycoreutils

It's not clear to me why we need to have a build dependency on
policycoreutils. Could you explain?

> +REFPOLICY_INSTALL_STAGING = YES
> +
> +
> +# To apply board specific customizations, create a refpolicy folder in
> +# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
> +# in package/refpolicy

Not useful, this is generic Buildroot knowledge.

> +
> +# Passing the HOST_CONFIGURE_OPTS to the target build because all of the
> +# build utilities are expected to be on system. This fools the make files
> +# into using the host built utilities to compile the SELinux policy for
> +# the target.
> +#
> +# Note, the TEST_TOOLCHAIN option will also set the
> +# LD_LIBRARY_PATH at run time.
> +REFPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
> +	TEST_TOOLCHAIN="$(HOST_DIR)"

That's really weird, and makes me wonder if we shouldn't have a
host-refpolicy package to build whatever host tool is needed, and a
refpolicy target package to actually build/install the policy on the
target.

> +# Build requires python2 to run
> +REFPOLICY_MAKE_ENV = \
> +	PYTHON="$(HOST_DIR)/usr/bin/python2" \
> +	AWK="$(HOST_DIR)/usr/bin/gawk" \
> +	M4="$(HOST_DIR)/usr/bin/m4"
> +
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +REFPOLICY_MONOLITHIC = n
> +else
> +REFPOLICY_MONOLITHIC = y
> +endif

It's a little bit odd that the option is backwards, but I guess it's
because building monolithic is what makes most sense by default (hence
the BR2_PACKAGE_REFPOLICY_MODULAR being disabled by default). So, OK.

> +
> +REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))
> +define REFPOLICY_CUSTOM_MODULES_CONF
> +	cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf
> +endef
> +
> +REFPOLICY_BOOLEAN_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_BOOLEAN_FILE))
> +define REFPOLICY_CUSTOM_BOOLEAN_CONF
> +	cp $(REFPOLICY_BOOLEAN_FILE) $(@D)/policy/booleans.conf
> +endef

Please simplify by just using the *.conf files from package/refpolicy/
for now (see above).

> +define REFPOLICY_CONFIGURE_CMDS
> +	# If an external repo is used to build refpolicy, this preserves the
> +	# custom modules.conf which defines the enabled components.
> +	if [ -f $(@D)/policy/modules.conf ]; then \
> +		mv $(@D)/policy/modules.conf $(@D)/modules.conf.bk ; \
> +	fi
> +	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) bare \
> +		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +	$(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
> +	$(SED) "/MONOLITHIC/c\MONOLITHIC = $(REFPOLICY_MONOLITHIC)" $(@D)/build.conf
> +	$(SED) "/NAME/c\NAME = $(BR2_PACKAGE_REFPOLICY_NAME)" $(@D)/build.conf
> +
> +	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
> +		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +	if [ -f $(@D)/modules.conf.bk ]; then \
> +		echo "[Preserved modules.conf]" ; \
> +		mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
> +	fi

Not clear at all why we need this modules.conf.bk dance. Since it's
only for "an external repo", can we get rid of this for now, or at
least have it as part of a subsequent patch.

> +	$(REFPOLICY_CUSTOM_MODULES_CONF)
> +	$(REFPOLICY_CUSTOM_BOOLEAN_CONF)
> +endef
> +
> +define REFPOLICY_INSTALL_STAGING_CMDS
> +	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
> +		install-docs $(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_INSTALL_TARGET_CMDS
> +	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install \
> +		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
> +	$(INSTALL) -m 0755 -D package/refpolicy/config $(TARGET_DIR)/etc/selinux/config
> +	$(SED) "/^SELINUXTYPE/c\SELINUXTYPE=$(BR2_PACKAGE_REFPOLICY_NAME)" \
> +		$(TARGET_DIR)/etc/selinux/config
> +	$(SED) "/^SELINUX=/c\SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE)" \
> +		$(TARGET_DIR)/etc/selinux/config
> +	touch $(TARGET_DIR)/.autorelabel
> +	$(RM) $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/booleans
> +endef
> +
> +define REFPOLICY_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/refpolicy/S00selinux \
> +		$(TARGET_DIR)/etc/init.d/S00selinux
> +endef
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/policy
> +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/modules/active/modules
> +$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files
> +touch $(TARGET_DIR)/etc/selinux/$(BR2_PACKAGE_REFPOLICY_NAME)/contexts/files/file_contexts.local

This definitely cannot work at all, it's not part of any command.
Building a modular policy should only be added in a follow-up patch, to
keep the initial patch simpler.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
