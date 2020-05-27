From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 27 May 2020 11:50:58 +0200
Subject: [Buildroot] [PATCH] Revert "package/parted: disable on uclibc"
Message-ID: <20200527095058.wdnaekjl46vzmrny@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 25b1dc4613326b1b2674ab07484993991ab90886.

This is fixed in uClibc-ng 1.0.34.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/parted/Config.in          | 6 ++----
 package/python-pyparted/Config.in | 6 ++----
 package/udisks/Config.in          | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/parted/Config.in b/package/parted/Config.in
index a35b30662f..f48b365a2d 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -10,6 +9,5 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted needs a glibc or musl toolchain w/ locale, wchar"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "parted needs a toolchain w/ locale, wchar"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 6e3bde2030..60f54a5484 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -2,13 +2,11 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # parted
 	select BR2_PACKAGE_PARTED
 	help
 	  Python bindings for GNU parted (libparted).
 
 	  https://github.com/rhinstaller/pyparted
 
-comment "pyparted needs a glibc or musl toolchain w/ locale, wchar"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "pyparted needs a toolchain w/ locale, wchar"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 04a632dd8d..f4044b0d0d 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # polkit
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2, parted
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # polkit, lvm2
 	depends on !BR2_STATIC_LIBS # lvm2, spidermonkey
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-- 
2.11.0
