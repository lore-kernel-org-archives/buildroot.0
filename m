From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Feb 2013 00:05:28 +0100
Subject: [Buildroot] [git commit branch/next] exfat-utils: new package
Message-ID: <20130222231134.2F5C79AC62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe1504bb62722ddc815f2043a28dd9bec7e36653
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/exfat-utils/Config.in      |   11 +++++++++++
 package/exfat-utils/exfat-utils.mk |   24 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 983ac4a..3df85f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ source "package/curlftpfs/Config.in"
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
