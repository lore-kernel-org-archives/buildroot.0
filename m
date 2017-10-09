From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 18:27:30 -0400
Subject: [Buildroot] [PATCH 7/8] restorecond: new package
In-Reply-To: <20171009222731.15119-1-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
Message-ID: <20171009222731.15119-7-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

restorecond is now a seperate package released by the SELinux maintainers.

restorecond is a daemon that watches for file creation and then sets the
default SELinux file context for that file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/restorecond/Config.in        | 12 +++++++++
 package/restorecond/restorecond.hash |  2 ++
 package/restorecond/restorecond.mk   | 48 ++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/restorecond/Config.in
 create mode 100644 package/restorecond/restorecond.hash
 create mode 100644 package/restorecond/restorecond.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f35d6f3688..18e878d8d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -41,6 +41,7 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/restorecond/
 F:	package/refpolicy/
 F:	package/sepolgen/
 F:	package/setools/
diff --git a/package/Config.in b/package/Config.in
index b9c62de1f3..c9677a460c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1840,6 +1840,7 @@ menu "Security"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
+	source "package/restorecond/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
new file mode 100644
index 0000000000..f9c3ebe6ba
--- /dev/null
+++ b/package/restorecond/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_RESTORECOND
+	bool "restorecond"
+	depends on BR2_PACKAGE_DBUS # dbus-glib
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  restorecond is a daemon that watches for file creation and then sets the
+	  default SELinux file context for that file.
diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
new file mode 100644
index 0000000000..f52bbd2161
--- /dev/null
+++ b/package/restorecond/restorecond.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 cb8e0a8d706cb2c1f105125f3514dffffefcbcfb49199183a7f91ab0bdf1f24d restorecond-2.7.tar.gz
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
new file mode 100644
index 0000000000..98ae3e7314
--- /dev/null
+++ b/package/restorecond/restorecond.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# restorecond
+#
+################################################################################
+
+RESTORECOND_VERSION = 2.7
+RESTORECOND_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+RESTORECOND_LICENSE = GPL-2.0
+RESTORECOND_LICENSE_FILES = COPYING
+
+RESTORECOND_DEPENDENCIES = libglib2 libselinux dbus-glib
+
+RESTORECOND_MAKE_OPTS += \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
+	ARCH="$(BR2_ARCH)"
+
+# We need to pass DESTDIR at build time because it's used by
+# RESTORECOND build system to find headers and libraries.
+define RESTORECOND_BUILD_CMDS
+	$(MAKE) -C $(@D) $(RESTORECOND_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+endef
+
+define RESTORECOND_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(@D)/restorecond.init \
+		$(TARGET_DIR)/etc/init.d/restorecond
+endef
+
+define RESTORECOND_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D $(@D)/restorecond.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/restorecond.service
+		
+	$(INSTALL) -m 0600 -D $(@D)/org.selinux.Restorecond.service \
+		$(TARGET_DIR)/etc/systemd/system/org.selinux.Restorecond.service
+endef
+
+define RESTORECOND_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/restorecond.conf $(TARGET_DIR)/etc/selinux
+	$(INSTALL) -m 0644 -D $(@D)/restorecond_user.conf $(TARGET_DIR)/etc/selinux
+	$(INSTALL) -m 0755 -D $(@D)/restorecond $(TARGET_DIR)/usr/sbin
+endef
+
+
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.13.6
