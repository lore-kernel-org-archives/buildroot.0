From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Sep 2015 23:13:03 +0200
Subject: [Buildroot] [PATCHv2] package/kodi: needs .py modules
Message-ID: <1442178783-27567-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi segfaults as soon as it tries to load a python module:

    Could not find platform independent libraries <prefix>
    Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
    ImportError: No module named site
    Segmentation fault

Turns out that keeping .py modules (with or without .pyc) fixes the
issue.

Currently, Kodi selects python, but since the format of modules is a
choice, we can not select it.

Fix that by inverting the dependency on python from Kodi:
  - turn it into a depends rather than a select,
  - add the dependency to ! pyc-only
  - update the comment accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v1 -> v2:
  - fix spurious 'i' (vim insert)
---
 package/kodi/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 797f59d..6d6c47b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
-comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
+comment "kodi needs python and .py modiules, and a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON_PYC_ONLY
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -65,7 +66,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
-	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_BSDDB
 	select BR2_PACKAGE_PYTHON_BZIP2
 	select BR2_PACKAGE_PYTHON_CURSES
@@ -94,6 +94,8 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # python
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
 	help
 	  Kodi is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
-- 
1.9.1
