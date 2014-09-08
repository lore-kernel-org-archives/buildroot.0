From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 8 Sep 2014 15:46:55 +0000
Subject: [Buildroot] [PATCH] parted not building static
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AD59C@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parted would not build when PREFER_STATIC_LIB was selected.  The configure
error reports "Add --disable-dynamic-loading" as the fix.  Added this fix.

Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/parted/parted.mk b/package/parted/parted.mk
--- a/package/parted/parted.mk  2014-02-27 14:51:23.000000000 -0600
+++ b/package/parted/parted.mk  2014-09-08 10:37:39.288121610 -0500
@@ -19,6 +19,10 @@
 PARTED_CONF_OPT += --without-readline
 endif

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PARTED_CONF_OPT += --disable-dynamic-loading
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2),y)
 PARTED_DEPENDENCIES += lvm2
 PARTED_CONF_OPT += --enable-device-mapper
