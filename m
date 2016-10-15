From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 19:47:12 +0200
Subject: [Buildroot] [git commit] package/kodi: needs .py modules
Message-ID: <20161015175130.A410A81F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95bf21910899dd0bcd7df6ecdff13914f7aa99ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

In addition, the !MMU and !static dependencies are updated since they
are no longer needed for Python (we now depend on it rather than
selecting it), but for other packages. The !MMU dependency is moved to
the _ARCH_SUPPORTS symbol as well.

Also, we can no longer "select BR2_PACKAGE_SAMBA4", because samba4
selects python, and we can no longer select python. Therefore, we switch
to a "depends on" dependency for samba4, which is fine as a user willing
to use Kodi with Samba will certainly realize that Samba should be
enabled.

Fixes bug #9221.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas:
 - update on latest master
 - take care of the !MMU/!static dependencies.
 - take care of the samba4 problem.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f388a72..4174c6b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,17 +1,19 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
+	depends on BR2_USE_MMU # libcdio, and others
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
-comment "kodi needs a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
+comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_HOST_GCC_AT_LEAST_4_6 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
-		|| BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_USE_MMU
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_PACKAGE_PYTHON \
+		|| BR2_PACKAGE_PYTHON_PYC_ONLY
 
 config BR2_PACKAGE_KODI_EGL_GLES
 	bool
@@ -42,10 +44,11 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
-	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
-	depends on !BR2_STATIC_LIBS # python
+	depends on !BR2_STATIC_LIBS # libsquish, and others
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_THREAD
@@ -83,7 +86,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
-	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_BSDDB
 	select BR2_PACKAGE_PYTHON_BZIP2
 	select BR2_PACKAGE_PYTHON_CURSES
@@ -200,16 +202,9 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
-comment "samba support needs a glibc or uClibc toolchain w/ RPC"
-	depends on (!BR2_TOOLCHAIN_USES_GLIBC && \
-		!BR2_TOOLCHAIN_USES_UCLIBC) || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
-
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_SAMBA4
+	depends on BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support
 
