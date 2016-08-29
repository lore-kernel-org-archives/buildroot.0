From: Paul Cercueil <paul.cercueil@analog.com>
Date: Mon, 29 Aug 2016 11:25:50 +0200
Subject: [Buildroot] [PATCH] libserialport: Fix detection of OS when
	compiling for ucLinux
Message-ID: <1472462750-18919-1-git-send-email-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling with a toolchain targetted at ucLinux, libserialport's
configure.ac would fail at detecting the target operating system.
As a result, the Linux-specific files were not compiled in that
particular case.

While this commit does not fix any autobuider failure for this package,
it fixes autobuilder failures for other packages, for instance:

http://autobuild.buildroot.net/results/69e/69e43bc171e554cf10f2ad526cebf5e0e524538a/

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 package/libserialport/0001-uclinux-detection.patch | 26 ++++++++++++++++++++++
 package/libserialport/libserialport.mk             |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 package/libserialport/0001-uclinux-detection.patch

diff --git a/package/libserialport/0001-uclinux-detection.patch b/package/libserialport/0001-uclinux-detection.patch
new file mode 100644
index 0000000..7d7199c
--- /dev/null
+++ b/package/libserialport/0001-uclinux-detection.patch
@@ -0,0 +1,26 @@
+From faab9aa5879fab93556b7a3a6f24070eeb3cbf15 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul.cercueil@analog.com>
+Date: Mon, 29 Aug 2016 11:11:01 +0200
+Subject: [PATCH] Fix Linux files not compiled in with a toolchain for ucLinux
+
+Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f6b66e8..de6f5b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,7 +74,7 @@ AC_DEFINE_UNQUOTED([SP_LIB_VERSION_REVISION], [$SP_LIB_VERSION_REVISION], [.])
+ AC_DEFINE_UNQUOTED([SP_LIB_VERSION_AGE], [$SP_LIB_VERSION_AGE], [.])
+ AC_DEFINE_UNQUOTED([SP_LIB_VERSION_STRING], ["$SP_LIB_VERSION"], [.])
+ 
+-AM_CONDITIONAL([LINUX], [test -z "${host_os##linux*}"])
++AM_CONDITIONAL([LINUX], [test -z "${host_os##linux*}" || test -z "${host_os##uclinux*}"])
+ AM_CONDITIONAL([WIN32], [test -z "${host_os##mingw*}" || test -z "${host_os##cygwin*}"])
+ AM_CONDITIONAL([MACOSX], [test -z "${host_os##darwin*}"])
+ AM_CONDITIONAL([FREEBSD], [test -z "${host_os##freebsd*}"])
+-- 
+2.8.1
+
diff --git a/package/libserialport/libserialport.mk b/package/libserialport/libserialport.mk
index d8c3a3d..86ae17f 100644
--- a/package/libserialport/libserialport.mk
+++ b/package/libserialport/libserialport.mk
@@ -10,5 +10,6 @@ LIBSERIALPORT_LICENSE = LGPLv3+
 LIBSERIALPORT_LICENSE_FILES = COPYING
 LIBSERIALPORT_INSTALL_STAGING = YES
 LIBSERIALPORT_DEPENDENCIES = host-pkgconf
+LIBSERIALPORT_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.8.1
