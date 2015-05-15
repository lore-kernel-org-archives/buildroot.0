From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 May 2015 08:00:38 +0200
Subject: [Buildroot] [PATCH v5 07/24] refpolicy: new package
In-Reply-To: <1431553177-7280-8-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-8-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMMJ+FYp+awTJFq1QmsgpEfMRR01Yfimr6AekmVFvoXjChg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Wed, May 13, 2015 at 11:39 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
[...]
> --- /dev/null
> +++ b/package/refpolicy/refpolicy.mk
> @@ -0,0 +1,118 @@
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
> +REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
> +       TEST_TOOLCHAIN="$(HOST_DIR)"
> +
> +# Build requies python2 to run
s/requies/requires/

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
> +       if [ -f $(@D)/modules.conf.bk ]; then \
> +               echo "[Preserved modules.conf]" ; \
> +               mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
> +       fi
> +       $(REFPOLICY_CUSTOM_MODULES_CONF)
> +endef
> +
> +define REFPOLICY_INSTALL_STAGING_CMDS
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
> +               $(if $(BR2_HAVE_DOCUMENTATION),install-docs) \
No need for conditional target. BR2_HAVE_DOCUMENTATION is already
deprecated and will be removed sooner or later.
So for staging install, choose either to always or never install the doc.

> +               $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define REFPOLICY_INSTALL_TARGET_CMDS
> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install \
> +               $(REFPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
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

Regards,

-- 
Samuel
