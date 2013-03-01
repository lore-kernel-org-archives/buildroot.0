From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 07:23:24 -0300
Subject: [Buildroot] [PATCH 4/7] dosfstools: bump to version 3.0.15
In-Reply-To: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362133407-5840-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/Config.in     | 1 +
 package/dosfstools/dosfstools.mk | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 1b92026..6573cda 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOSFSTOOLS
 	bool "dosfstools"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 4f89364..3bb6a2f 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-DOSFSTOOLS_VERSION = 3.0.12
+DOSFSTOOLS_VERSION = 3.0.15
 DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
+DOSFSTOOLS_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),,libiconv)
+DOSFSTOOLS_LINK_ICONV = $(if $(BR2_ENABLE_LOCALE),,-liconv)
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 MKDOSFS_BINARY = mkdosfs
@@ -13,8 +15,8 @@ DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
 
 define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
-		CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" \
+		LDFLAGS="$(TARGET_LDFLAGS) $(DOSFSTOOLS_LINK_ICONV)" -C $(@D)
 endef
 
 DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS)+=$(MKDOSFS_BINARY)
-- 
1.7.12.4
