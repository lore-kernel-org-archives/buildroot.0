From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:40:19 +0200
Subject: [Buildroot] [git commit branch/next] Revert "package/parted:
 disable on uclibc"
Message-ID: <20200829193456.1CE83807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebf2949aaf3589505f714d9825bb3c8396ec68f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 25b1dc4613326b1b2674ab07484993991ab90886 disabled parted on
uClibc due to the following build failure:

atari.c:221:9: error: dereferencing pointer to incomplete type 'struct __uclibc_locale_struct'
  return isalnum_l(part->id[0], atr_c_locale)

This was fixed in upstream uClibc-ng as of upstream commit
d1a3ca7ca56630fddde7311a0474eed4a21335a7, which was part of the 1.0.33
uClibc-ng release. On the Buildroot side, even though Buildroot
2020.02 was using uClibc-ng 1.0.32, we already had this patch
backported.

So we can now safely re-enable parted for uClibc-ng toolchains, as
well as its reverse dependencies.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 0e27ce1d2e..0ed24f8836 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -3,14 +3,12 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # parted
 	select BR2_PACKAGE_PARTED
 	help
 	  Python bindings for GNU parted (libparted).
 
 	  https://github.com/rhinstaller/pyparted
 
-comment "pyparted needs a glibc or musl toolchain w/ locale, wchar"
+comment "pyparted needs a toolchain w/ locale, wchar"
 	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
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
