From: Maarten ter Huurne <maarten@treewalker.org>
Date: Thu, 11 Sep 2014 07:16:10 +0200
Subject: [Buildroot] [PATCH] dosfstools: Fixed compilation with musl libc
Message-ID: <1410412570-2427-1-git-send-email-maarten@treewalker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefile of dosfstools passes -D_GNU_SOURCE to get access to
non-standard definitions such as 'loff_t'. But this flag got lost
in the CFLAGS override.
---
 package/dosfstools/dosfstools.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index a6b83d0..a9d8392 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -13,6 +13,8 @@ DOSFSTOOLS_LICENSE_FILES = COPYING
 # Avoid target dosfstools dependencies, no host-libiconv
 HOST_DOSFSTOOLS_DEPENDENCIES =
 
+DOSFSTOOLS_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DOSFSTOOLS_DEPENDENCIES += libiconv
 DOSFSTOOLS_LDLIBS += -liconv
@@ -23,7 +25,8 @@ FSCK_FAT_BINARY = fsck.fat
 MKFS_FAT_BINARY = mkfs.fat
 
 define DOSFSTOOLS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(DOSFSTOOLS_CFLAGS)" LDLIBS="$(DOSFSTOOLS_LDLIBS)" -C $(@D)
 endef
 
 DOSFSTOOLS_INSTALL_BIN_FILES_$(BR2_PACKAGE_DOSFSTOOLS_FATLABEL)+=$(FATLABEL_BINARY)
-- 
1.8.4.5
