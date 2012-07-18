From: Dmitry <golubovsky@gmail.com>
Date: Wed, 18 Jul 2012 17:34:27 -0400
Subject: [Buildroot] [PATCH] Add package linux-pam (resending,
	fixed indentation, mentioned website)
Message-ID: <1342647267-20745-1-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. Add the linux-pam package building instructions
2. If the linux-pam package is selected, make sure it builds before
   busybox just in case busybox is configured with PAM support
   (make linux-pam a dependency of busybox)

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/Config.in              |    1 +
 package/busybox/busybox.mk     |    3 +++
 package/linux-pam/Config.in    |   15 +++++++++++++++
 package/linux-pam/linux-pam.mk |   37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/linux-pam/Config.in
 create mode 100644 package/linux-pam/linux-pam.mk

diff --git a/package/Config.in b/package/Config.in
index 6aabb8e..4bbb293 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -660,6 +660,7 @@ source "package/bootutils/Config.in"
 endif
 source "package/htop/Config.in"
 source "package/kmod/Config.in"
+source "package/linux-pam/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 394a1ae..4a1de33 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -11,6 +11,9 @@ else
 BUSYBOX_VERSION = $(call qstrip,$(BR2_BUSYBOX_VERSION))
 BUSYBOX_SITE = http://www.busybox.net/downloads
 endif
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+BUSYBOX_DEPENDENCIES += linux-pam
+endif
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
new file mode 100644
index 0000000..8a9bbca
--- /dev/null
+++ b/package/linux-pam/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LINUX_PAM
+	bool "linux-pam"
+	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_FLEX_LIBFL
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	help
+	  A Security Framework that Provides Authentication for Applications
+
+	  http://linux-pam.org
+
+comment "linux-pam requires a toolchain with WCHAR and locale support"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
new file mode 100644
index 0000000..5024033
--- /dev/null
+++ b/package/linux-pam/linux-pam.mk
@@ -0,0 +1,37 @@
+############################################
+#
+# linux-pam
+# 
+############################################
+
+LINUX_PAM_VERSION = 1.1.4
+LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
+LINUX_PAM_SITE = http://linux-pam.org/library/
+LINUX_PAM_INSTALL_STAGING = YES
+LINUX_PAM_INSTALL_TARGET = YES
+LINUX_PAM_CONF_OPT = --disable-prelude --disable-isadir --disable-nis --disable-regenerate-docu
+LINUX_PAM_CONF_OPT += --enable-securedir=/lib/security --libdir=/lib
+LINUX_PAM_DEPENDENCIES = gettext libintl flex
+LINUX_PAM_LICENSE = BSD
+LINUX_PAM_LICENSE_FILES = COPYING
+
+define LINUX_PAM_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC) -lintl -lfl" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define LINUX_PAM_DISABLE_INNETGR
+	echo >>$(@D)/config.h
+	echo "#undef HAVE_RUSEROK">>$(@D)/config.h
+	echo "#define HAVE_RUSEROK_AF">>$(@D)/config.h
+	echo "#define ruserok_af(a, b, c, d, e) (-1)" >>$(@D)/config.h
+	echo "#undef innetgr">>$(@D)/config.h
+	echo "#define innetgr(a, b, c, d) 0" >>$(@D)/config.h
+	echo "all:" >$(@D)/doc/Makefile
+	echo "" >>$(@D)/doc/Makefile
+	echo "install:" >>$(@D)/doc/Makefile
+	echo "" >>$(@D)/doc/Makefile
+endef
+
+LINUX_PAM_POST_CONFIGURE_HOOKS += LINUX_PAM_DISABLE_INNETGR
+
+$(eval $(autotools-package))
-- 
1.7.2.5
