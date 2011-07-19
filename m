From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 19 Jul 2011 19:48:51 +0000
Subject: [Buildroot] [Patch] Allow file to be built against static libs.
Message-ID: <F9C551623D2CBB4C9488801D14F864C6044668@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If selected "prefer static libs", file fails to build reporting:
relocation R_X86_64_32S against `zcalloc' can not be used when making
a shared object; recompile with -fPIC
The suggested -fPIC doesn't work.  The issue is that the default
configure has --enable-shared --enable-static.  This patch modifies
the configure to disable shared when "prefer static libs" is selected.

Signed-off-by Andy Kennedy <Andy.Kennedy@Adtran.com>
---
diff -Naur a/package/file/file.mk b/package/file/file.mk
--- a/package/file/file.mk	2011-03-14 10:39:51.000000000 -0500
+++ b/package/file/file.mk	2011-07-19 14:36:32.000000000 -0500
@@ -9,6 +9,11 @@
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+FILE_CONF_OPT = --disable-shared --enable-static
+HOST_FILE_CONF_OPT = --disable-shared --enable-static
+endif
+
 define FILE_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
 	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
