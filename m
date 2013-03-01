From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 13:24:04 -0300
Subject: [Buildroot] [PATCHv2] dosfstools: bump to version 3.0.15
Message-ID: <1362155044-23258-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/Config.in     |  2 ++
 package/dosfstools/dosfstools.mk | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 1b92026..bd5cf89 100644
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
 
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 4f89364..1e1d891 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-DOSFSTOOLS_VERSION = 3.0.12
-DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
+DOSFSTOOLS_VERSION = 3.0.15
+DOSFSTOOLS_SITE = http://fossies.org/linux/misc
+DOSFSTOOLS_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
+DOSFSTOOLS_LDFLAGS = "$(if $(BR2_ENABLE_LOCALE),,-liconv)"
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 MKDOSFS_BINARY = mkdosfs
@@ -13,8 +15,8 @@ DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
 
 define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
-		CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
+		LDFLAGS="$(TARGET_LDFLAGS) $(DOSFSTOOLS_LDFLAGS)" -C $(@D)
 endef
 
 DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS)+=$(MKDOSFS_BINARY)
-- 
1.7.12.4
