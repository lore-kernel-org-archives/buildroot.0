From: Nathan Lynch <ntl@pobox.com>
Date: Tue,  7 May 2013 12:16:19 -0500
Subject: [Buildroot] [PATCH v3] chrony: new package
Message-ID: <1367946979-11619-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---

 v3: Converted to generic-package due to hand-written configure script
     Use readline and/or libnss if available
     Pass --disable-ipv6 if !BR2_INET_IPV6

 v2: Add upstream URL to help text
     Add dependency on BR2_USE_MMU (fork)
     Add header to chrony.mk
     Checked build with br-arm-basic, br-arm-full-nothread; no changes needed

 package/Config.in        |  1 +
 package/chrony/Config.in |  8 ++++++++
 package/chrony/chrony.mk | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/chrony/Config.in
 create mode 100644 package/chrony/chrony.mk

diff --git a/package/Config.in b/package/Config.in
index 81a3f76..d980871 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/can-utils/Config.in"
+source "package/chrony/Config.in"
 source "package/connman/Config.in"
 source "package/crda/Config.in"
 source "package/ctorrent/Config.in"
diff --git a/package/chrony/Config.in b/package/chrony/Config.in
new file mode 100644
index 0000000..05d6fc1
--- /dev/null
+++ b/package/chrony/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CHRONY
+	bool "chrony"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Chrony is a pair of programs which are used to maintain the
+	  accuracy of the system clock.
+
+	  http://chrony.tuxfamily.org/
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
new file mode 100644
index 0000000..1cf94a3
--- /dev/null
+++ b/package/chrony/chrony.mk
@@ -0,0 +1,46 @@
+#############################################################
+#
+# chrony
+#
+#############################################################
+
+CHRONY_VERSION = 1.27
+CHRONY_SITE = http://download.tuxfamily.org/chrony/
+CHRONY_LICENSE = GPLv2
+CHRONY_LICENSE_FILES = COPYING
+
+CHRONY_CONF_OPT = --host-system=Linux --host-machine=$(BR2_ARCH) --prefix=/usr
+
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+CHRONY_DEPENDENCIES += host-pkgconf libnss
+else
+CHRONY_CONF_OPT += --without-nss
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+CHRONY_DEPENDENCIES += readline
+else
+CHRONY_CONF_OPT += --disable-readline
+endif
+
+ifneq ($(BR2_INET_IPV6),y)
+CHRONY_CONF_OPT += --disable-ipv6
+endif
+
+define CHRONY_CONFIGURE_CMDS
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPT)
+endef
+
+define CHRONY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define CHRONY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+define CHRONY_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/chronyc $(TARGET_DIR)/usr/sbin/chronyd
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.4
