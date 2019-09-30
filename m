From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 16:10:43 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libgcrypt:
 replace reconfigure patch with upstream patch
Message-ID: <20190930151759.207AE8381A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad229675ef85a380eb014fb82e11aaeb1b4ef1cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

The `ac_cv_sys_symbol_underscore` reconfigure patch was added to
Buildroot back in 2007 [1], but was not reported to upstream back then.

Meanwhile, the issue has been fixed upstream [2] after the version bump to
version 1.8.4.

In order to add another upstream patch, which will add a pkg-config file
for libgrypt and therefore requires autoreconfiguration as well, replace the
current patch with the upstream patch.

[1] https://git.buildroot.net/buildroot/commit/package/libgcrypt?id=f1bcdf518fa7868b7819b0248f4b8da02a954dde
[2] https://github.com/gpg/libgcrypt/commit/0f4545b441b6fbdd6e9c4e95f5f2a367483e78ad

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0da00ddc8c0b895de7d9273df4399c1cde2de03b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-default-to-underscore-yes-for-cross-buil.patch | 48 ++++++++++++++++++++++
 package/libgcrypt/0001-reconfigure.patch           | 27 ------------
 package/libgcrypt/libgcrypt.mk                     |  4 +-
 3 files changed, 50 insertions(+), 29 deletions(-)

diff --git a/package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch b/package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch
new file mode 100644
index 0000000000..032cb7c84c
--- /dev/null
+++ b/package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch
@@ -0,0 +1,48 @@
+From 7fec3ac22efb86fce90a9edc5696e16ee88a65c7 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 24 Oct 2018 14:29:45 +0900
+Subject: [PATCH] build: Don't default to underscore=yes for cross-build.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* acinclude.m4: Don't set ac_cv_sys_symbol_underscore
+for cross build.
+
+--
+
+It made sense in the past when cross compile were basically for a.out
+system, but nowadays, it's better not to assume that.
+
+Fetched from: 0f4545b441b6fbdd6e9c4e95f5f2a367483e78ad
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ acinclude.m4 | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index fc208c53..6f7789d0 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -111,14 +111,10 @@ case "${host}" in
+         ac_cv_sys_symbol_underscore=yes
+         ;;
+     *)
+-      if test "$cross_compiling" = yes; then
+-        if test "x$ac_cv_sys_symbol_underscore" = x ; then
+-           ac_cv_sys_symbol_underscore=yes
+-        fi
+-      else
++      if test "$cross_compiling" != yes; then
+          tmp_do_check="yes"
+       fi
+-       ;;
++      ;;
+ esac
+ if test "$tmp_do_check" = "yes"; then
+   AC_REQUIRE([AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE])
+-- 
+2.22.0
+
diff --git a/package/libgcrypt/0001-reconfigure.patch b/package/libgcrypt/0001-reconfigure.patch
deleted file mode 100644
index 87d29a298b..0000000000
--- a/package/libgcrypt/0001-reconfigure.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/configure b/configure
-index 70a6d50..8f55d95 100755
---- a/configure
-+++ b/configure
-@@ -22306,14 +22306,15 @@ case "${host}" in
-     i386-emx-os2 | i345686-pc-os2*emx | i386-pc-msdosdjgpp)
-         ac_cv_sys_symbol_underscore=yes
-         ;;
--    *)
--      if test "$cross_compiling" = yes; then
--        if test "x$ac_cv_sys_symbol_underscore" = x ; then
--           ac_cv_sys_symbol_underscore=yes
-+    *)if test -z "$ac_cv_sys_symbol_underscore";then
-+        if test "$cross_compiling" = yes; then
-+            if test "x$ac_cv_sys_symbol_underscore" = x ; then
-+                ac_cv_sys_symbol_underscore=yes
-+            fi
-+        else
-+            tmp_do_check="yes"
-+        fi
-         fi
--      else
--         tmp_do_check="yes"
--      fi
-        ;;
- esac
- if test "$tmp_do_check" = "yes"; then
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 452cf17ce1..5aa44481ae 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -13,8 +13,8 @@ LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 
-LIBGCRYPT_CONF_ENV = \
-	ac_cv_sys_symbol_underscore=no
+# Patching acinclude.m4 in 0001
+LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
