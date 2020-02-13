From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 23:36:44 +0100
Subject: [Buildroot] [PATCH v2,3/3] package/parted: disable on uclibc
In-Reply-To: <20200213223644.2346193-1-fontaine.fabrice@gmail.com>
References: <20200213223644.2346193-1-fontaine.fabrice@gmail.com>
Message-ID: <20200213223644.2346193-3-fontaine.fabrice@gmail.com>
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
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Update parted's reverse dependencies

 package/parted/Config.in          | 6 ++++--
 package/python-pyparted/Config.in | 7 +++++--
 package/udisks/Config.in          | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

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
diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 60f54a5484..cb7d93f74d 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -2,11 +2,14 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # parted
 	select BR2_PACKAGE_PARTED
 	help
 	  Python bindings for GNU parted (libparted).
 
 	  https://github.com/rhinstaller/pyparted
 
-comment "pyparted needs a toolchain w/ locale, wchar"
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "pyparted needs a glibc or musl toolchain w/ locale, wchar"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+		
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index f4044b0d0d..04a632dd8d 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2, parted
 	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-- 
2.24.1
