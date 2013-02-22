From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Feb 2013 00:03:57 +0100
Subject: [Buildroot] [git commit branch/next] exfat: new package
Message-ID: <20130222231133.F36E19AC64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f73abd78ba566f664f6012d0cd90dd26f4eb434
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/exfat/Config.in |   15 +++++++++++++++
 package/exfat/exfat.mk  |   25 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2fad94d..983ac4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ source "package/cramfs/Config.in"
 source "package/curlftpfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/exfat/Config.in"
 source "package/flashbench/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
diff --git a/package/exfat/Config.in b/package/exfat/Config.in
new file mode 100644
index 0000000..c7e7fdb
--- /dev/null
+++ b/package/exfat/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_EXFAT
+	bool "exFAT (FUSE)"
+	depends on BR2_LARGEFILE # libfuse
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBFUSE
+	help
+	  A full-featured exFAT file system implementation for GNU/Linux
+	  and other Unix-like systems as a FUSE module.
+
+	  http://code.google.com/p/exfat/
+
+comment "exfat requires a toolchain with LARGEFILE, WCHAR and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
new file mode 100644
index 0000000..673b6d2
--- /dev/null
+++ b/package/exfat/exfat.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# exfat
+#
+#############################################################
+
+EXFAT_VERSION = 1.0.1
+EXFAT_SITE = http://exfat.googlecode.com/files
+EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
+EXFAT_DEPENDENCIES = host-scons libfuse
+EXFAT_LICENSE = GPLv3
+EXFAT_LICENSE_FILES = COPYING
+
+define EXFAT_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) $(SCONS))
+endef
+
+define EXFAT_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) $(SCONS) \
+		DESTDIR=$(TARGET_DIR)/usr/sbin install)
+endef
+
+$(eval $(generic-package))
