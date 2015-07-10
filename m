From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 10 Jul 2015 20:09:42 +0200
Subject: [Buildroot] [PATCH v7 06/22] refpolicy: new package
In-Reply-To: <1433251718-3167-7-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-7-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMMKZ8pmWFumzeRt_RCJweTWGxasSTp=wYfrQpuEo5oOB8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Tue, Jun 2, 2015 at 3:28 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Certainly a few words about why/how is supported a custom
refpolicy_contrib could be added...
>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
[...]

> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> new file mode 100644
> index 0000000..14d3d5b
> --- /dev/null
> +++ b/package/refpolicy/Config.in
> @@ -0,0 +1,91 @@
> +config BR2_PACKAGE_REFPOLICY
> +       bool "refpolicy"
> +       select BR2_PACKAGE_POLICYCOREUTILS
> +       select BR2_PACKAGE_BUSYBOX_SELINUX
It should be conditional (in case someone add support for other init system):
s/$/if BR2_PACKAGE_BUSYBOX/

> +       depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
> +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # policycoreutils
> +       help
> +         The SELinux Reference Policy project (refpolicy) is a
> +         complete SELinux policy that can be used as the system
> +         policy for a variety of systems and used as the basis
> +         for creating other policies. Reference Policy was originally
> +         based on the NSA example policy, but aims to accomplish
> +         many additional goals.
> +
> +         The current refpolicy does not fully support Buildroot
> +         and needs modifications to work with the default system
> +         file layout.  These changes should be added as patches to
> +         the refpolicy that modify a single SELinux policy.
> +
> +comment "refpolicy needs a toolchain w/ threads, glibc or musl"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +               || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
> +if BR2_PACKAGE_REFPOLICY
> +
> +choice
> +       prompt "SELinux policy type"
> +       default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +
> +       config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +               bool "Standard"
> +               help
> +                 Standard SELinux policy
> +
> +       config BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +               bool "MCS"
> +               help
> +                 SELinux policy with multi-catagory support
> +
> +       config BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +               bool "MLS"
> +               help
> +                 SELinux policy with multi-catagory and multi-level support
> +endchoice
> +
> +config BR2_PACKAGE_REFPOLICY_TYPE
> +       string
> +       default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
> +       default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
> +       default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
> +
> +config BR2_PACKAGE_REFPOLICY_MODULES_FILE
> +       string "Refpolicy modules configuration"
> +       default "package/refpolicy/modules.conf"
> +       help
> +         Location of a custom modules.conf file that lists the
> +         SELinux policy modules to be included in the compiled
> +         policy. See policy/modules.conf in the refpolicy sources for
> +         the complete list of available modules.
> +         NOTE: This file is only used if a Custom Git repo is
> +         not specified.
> +
> +config BR2_PACKAGE_REFPOLICY_MODULAR
> +       bool "Build a modular SELinux policy"
> +       help
> +         Select Y to build a modular SELinux policy. By default,
> +         a monolithing policy will be built to save space on the
> +         target. A modular policy can also be built if policies
> +         need to be modified without reloading the target.
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +       bool "Custom Git repository"
> +       select BR2_PACKAGE_REFPOLICY_CONTRIB
> +       help
> +        This option allows Buildroot to get the refpolicy source
> +        code from a Git repository.
> +
> +if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
> +       string "URL of custom repository"
> +
> +config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
> +       string "Custom repository version"
> +       help
> +         Revision to use in the typical format used by Git
> +         e.g. a SHA id, a tag, branch, ..
> +
> +endif
> +
> +endif
> diff --git a/package/refpolicy/S00selinux b/package/refpolicy/S00selinux
> new file mode 100644
> index 0000000..f2ac2e6
> --- /dev/null
> +++ b/package/refpolicy/S00selinux
[...]

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
> diff --git a/package/refpolicy/modules.conf b/package/refpolicy/modules.conf
> new file mode 100644
> index 0000000..58282d8
> --- /dev/null
> +++ b/package/refpolicy/modules.conf
> @@ -0,0 +1,406 @@
> +#
> +# This file contains a listing of available modules.
> +# To prevent a module from  being used in policy
> +# creation, set the module name to "off".
> +#
> +# For monolithic policies, modules set to "base" and "module"
> +# will be built into the policy.
> +#
> +# For modular policies, modules set to "base" will be
> +# included in the base module.  "module" will be compiled
> +# as individual loadable modules.
> +#
I trust you on it ;-)

[...]

> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> new file mode 100644
> index 0000000..eca53d7
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.hash
> @@ -0,0 +1,2 @@
> +#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
> +sha256 6039ba854f244a39dc727cc7db25632f7b933bb271c803772d754d4354f5aef4  refpolicy-2.20130424.tar.bz2
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> new file mode 100644
> index 0000000..7956aaa
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.mk
> @@ -0,0 +1,117 @@
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
> +REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy/
> +endif
> +REFPOLICY_LICENSE = GPLv2
> +REFPOLICY_LICENSE_FILES = COPYING
> +
> +# Cannot use multiple threads to build the reference policy
> +REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
> +
> +REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
> +       host-setools host-gawk host-python policycoreutils
> +
> +REFPOLICY_INSTALL_STAGING = YES
> +
> +REFPOLICY_POLICY_NAME = br_policy
> +
> +# To apply board specific customizations, create a refpolicy folder in
> +# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
> +# in package/refpolicy
> +
> +# Pointing to the host compiler to build a sort application during the build.
> +# The host compiler tools are not used for any part of the refpolicy build.
> +# Note, the TEST_TOOLCHAIN option will also set the
> +# LD_LIBRARY_PATH at run time.
LD_LIBRARY_PATH at runtime of what? the sort application?

> +REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
s/REFPOLICY_MAKE_CMDS/REFPOLICY_MAKE_OPTS/ would be less confusing ;-)

> +       TEST_TOOLCHAIN="$(HOST_DIR)"
> +
> +# Build requires python2 to run
> +REFPOLICY_MAKE_ENV = \
> +       PYTHON="$(HOST_DIR)/usr/bin/python2" \
> +       AWK="$(HOST_DIR)/usr/bin/gawk" \
> +       M4="$(HOST_DIR)/usr/bin/m4"
> +
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +       REFPOLICY_MONOLITHIC = n
> +else
> +       REFPOLICY_MONOLITHIC = y
> +endif
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
> +define REFPOLICY_GIT_SUBMODULE_SETUP
> +       rsync -ar $(REFPOLICY_CONTRIB_DIR)/* $(@D)/policy/modules/contrib/
You may want to add $(RSYNC_VCS_EXCLUSIONS) [1].

> +endef
> +else
> +REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))
> +define REFPOLICY_CUSTOM_MODULES_CONF
> +       cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf
> +endef
> +endif
> +
> +define REFPOLICY_CONFIGURE_CMDS
> +       $(REFPOLICY_GIT_SUBMODULE_SETUP)
> +       # If an external repo is used to build refpolicy, this preserves the
> +       # custom modules.conf which defines the enabled components.
> +       if [ -f $(@D)/policy/modules.conf ]; then \
> +               mv $(@D)/policy/modules.conf $(@D)/modules.conf.bk ; \
> +       fi
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) bare \
> +               $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +       $(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
> +       $(SED) "/MONOLITHIC/c\MONOLITHIC = $(REFPOLICY_MONOLITHIC)" $(@D)/build.conf
> +       $(SED) "/NAME/c\NAME = $(REFPOLICY_POLICY_NAME)" $(@D)/build.conf
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
> +               $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
s/REFPOLICY_MAKE_CMDS/REFPOLICY_MAKE_OPTS/

> +       if [ -f $(@D)/modules.conf.bk ]; then \
> +               echo "[Preserved modules.conf]" ; \
> +               mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
> +       fi
> +       $(REFPOLICY_CUSTOM_MODULES_CONF)
> +endef
> +
> +define REFPOLICY_INSTALL_STAGING_CMDS
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
> +               install-docs $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_INSTALL_TARGET_CMDS
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install \
> +               $(REFPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
s/REFPOLICY_MAKE_CMDS/REFPOLICY_MAKE_OPTS/

> +       $(INSTALL) -m 0755 -D package/refpolicy/config $(TARGET_DIR)/etc/selinux/config
> +       $(SED) "/^SELINUXTYPE/c\SELINUXTYPE=$(REFPOLICY_POLICY_NAME)" \
> +               $(TARGET_DIR)/etc/selinux/config
> +       touch $(TARGET_DIR)/.autorelabel
> +       $(RM) $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/booleans
> +endef
> +
> +define REFPOLICY_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 0755 -D package/refpolicy/S00selinux \
> +               $(TARGET_DIR)/etc/init.d/S00selinux
> +endef
> +
> +define REFPOLICY_POLICY_COMPILE
> +       $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/policy
> +       $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/modules/active/modules
> +       $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files
> +       touch $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files/file_contexts.local
> +endef
> +
> +ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
> +       REFPOLICY_POST_INSTALL_TARGET_HOOKS += REFPOLICY_POLICY_COMPILE
> +endif
> +
> +$(eval $(generic-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] http://git.buildroot.net/buildroot/tree/Makefile#n456

Regards,

-- 
Samuel
