From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Mon, 7 Dec 2015 21:39:22 +0100
Subject: [Buildroot] [PATCH 1/2] wine: Make the sane-config patch obsolete
 by using configure flags
Message-ID: <5665EE7A.1080409@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/0003-sane-config-fix.patch | 21 ---------------------
 package/wine/wine.mk                    |  3 ++-
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 package/wine/0003-sane-config-fix.patch

diff --git a/package/wine/0003-sane-config-fix.patch b/package/wine/0003-sane-config-fix.patch
deleted file mode 100644
index d53843a..0000000
--- a/package/wine/0003-sane-config-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Add support for SANE_CONFIG variable
-
-Instead of using directly the sane-config command, allow to pass a
-SANE_CONFIG environment variable to override where to find the
-sane-config tool.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -1375,7 +1375,7 @@
- if test "x$with_sane" != "xno"
- then
-     ac_save_CPPFLAGS="$CPPFLAGS"
--    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`sane-config --cflags 2>/dev/null`],[`sane-config --ldflags 2>/dev/null`])
-+    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`${SANE_CONFIG:-sane-config} --cflags 2>/dev/null`],[`${SANE_CONFIG:-sane-config} --ldflags 2>/dev/null`])
-     AC_CHECK_HEADER(sane/sane.h,
-         [WINE_CHECK_SONAME(sane,sane_init,,[SANE_CFLAGS=""],[$SANE_LIBS])],
-         [SANE_CFLAGS=""])
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 38576db..e29d616 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -173,8 +173,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
 WINE_CONF_OPTS += --with-sane
+WINE_CONF_OPTS += SANE_CFLAGS="`$(STAGING_DIR)/usr/bin/sane-config --cflags 2>/dev/null`"
+WINE_CONF_OPTS += SANE_LIBS="`$(STAGING_DIR)/usr/bin/sane-config --ldflags 2>/dev/null`"
 WINE_DEPENDENCIES += sane-backends
-WINE_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
 else
 WINE_CONF_OPTS += --without-sane
 endif
-- 
1.9.1
