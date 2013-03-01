From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Mar 2013 23:02:52 +0100
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.15
Message-ID: <20130301220347.8EDA49ADD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d57f905d93bdb635c60c0213f0e4eaec2b0ace59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: update comment dependency, use DOSFSTOOLS_LDFLAGS for all flags]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/Config.in     |    6 ++++--
 package/dosfstools/dosfstools.mk |   15 +++++++++++----
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 1b92026..2156a04 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_DOSFSTOOLS
 	bool "dosfstools"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
@@ -24,5 +26,5 @@ config BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL
 	help
 	  Get or set the DOS FAT filesystem label.
 
-comment "dosfstools requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "dosfstools requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 4f89364..e3cc9cf 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,17 +4,24 @@
 #
 #############################################################
 
-DOSFSTOOLS_VERSION = 3.0.12
-DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
+DOSFSTOOLS_VERSION = 3.0.15
+DOSFSTOOLS_SITE = http://fossies.org/linux/misc
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
+DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+DOSFSTOOLS_DEPENDENCIES += libiconv
+DOSFSTOOLS_LDFLAGS += -liconv
+endif
+
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
 
 define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
-		CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
+		LDFLAGS="$(DOSFSTOOLS_LDFLAGS)" -C $(@D)
 endef
 
 DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS)+=$(MKDOSFS_BINARY)
