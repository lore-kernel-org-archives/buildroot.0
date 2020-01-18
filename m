From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Jan 2020 17:39:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/parted: disable on uclibc
Message-ID: <20200118163929.663035-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like postgreSQL (and imagemagick), parted does not build against uClibc
with locales enabled, due to an uClibc bug, see
http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html:

In file included from atari.c:42:
atari.c: In function 'atr_part_correct':
atari.c:221:9: error: dereferencing pointer to incomplete type 'struct __uclibc_locale_struct'
  return isalnum_l(part->id[0], atr_c_locale)
         ^~~~~~~~~

So disable parted on uclibc

Fixes:
 - http://autobuild.buildroot.org/results/992518d340a9f32a0721d6e66936850c4c3ef2e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/parted/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/parted/Config.in b/package/parted/Config.in
index f48b365a2d..a35b30662f 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted needs a toolchain w/ locale, wchar"
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "parted needs a glibc or musl toolchain w/ locale, wchar"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
-- 
2.24.1
