From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Feb 2013 07:48:04 -0300
Subject: [Buildroot] [PATCHv2 2/2] exfat-utils: new package
In-Reply-To: <1360061284-11353-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360061284-11353-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360061284-11353-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                  |  1 +
 package/exfat-utils/Config.in      | 11 +++++++++++
 package/exfat-utils/exfat-utils.mk | 24 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/exfat-utils/Config.in
 create mode 100644 package/exfat-utils/exfat-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 2a4656c..1e8297b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -191,6 +191,7 @@ source "package/curlftpfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/exfat/Config.in"
+source "package/exfat-utils/Config.in"
 source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
new file mode 100644
index 0000000..1fc68be
--- /dev/null
+++ b/package/exfat-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_EXFAT_UTILS
+	bool "exfat-utils"
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	help
+	  exFAT filesystem utilities.
+
+	  http://code.google.com/p/exfat/
+
+comment "exfat-utils requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
new file mode 100644
index 0000000..b1191e8
--- /dev/null
+++ b/package/exfat-utils/exfat-utils.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# exfat-utils
+#
+#############################################################
+
+EXFAT_UTILS_VERSION = 1.0.1
+EXFAT_UTILS_SITE = http://exfat.googlecode.com/files
+EXFAT_UTILS_DEPENDENCIES = host-scons
+EXFAT_UTILS_LICENSE = GPLv3
+EXFAT_UTILS_LICENSE_FILES = COPYING
+
+define EXFAT_UTILS_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) $(SCONS))
+endef
+
+define EXFAT_UTILS_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) $(SCONS) \
+		DESTDIR=$(TARGET_DIR)/usr/bin install)
+endef
+
+$(eval $(generic-package))
-- 
1.7.12.4
