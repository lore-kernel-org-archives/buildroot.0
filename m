From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Oct 2015 19:59:02 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix musl compile
Message-ID: <1446317942-18726-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch disabling glibc version check and adding some tweaks
for musl support (based on OpenWRT patch [1]).

Fixes ([2]):
  checking the glibc version... unsupported version
  configure: error: Valgrind requires glibc version 2.2 or later

[1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
[2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837/build-end.log

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...bc-detection-for-musl-plus-some-adjusteme.patch | 77 ++++++++++++++++++++++
 package/valgrind/valgrind.mk                       |  3 +
 2 files changed, 80 insertions(+)
 create mode 100644 package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch

diff --git a/package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch b/package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch
new file mode 100644
index 0000000..0a2f660
--- /dev/null
+++ b/package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch
@@ -0,0 +1,77 @@
+From fcb21d1480c17da6c59422d8eebfdf42d967f441 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 31 Oct 2015 19:45:04 +0100
+Subject: [PATCH] Disable glibc detection for musl (plus some adjustements).
+
+Patch based on the OpenWrt patch for valgrind/musl, see [1].
+
+[1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac             | 5 +++--
+ coregrind/vg_preloaded.c | 2 +-
+ include/pub_tool_redir.h | 9 ++++++++-
+ 3 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8ab7f9b..378ba9f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1066,8 +1066,9 @@ case "${GLIBC_VERSION}" in
+ 	;;
+      2.0|2.1|*)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
+-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
++	AC_MSG_WARN([Valgrind requires glibc version 2.2 or later,])
++	AC_MSG_WARN([Darwin libc, Bionic libc or Solaris libc])
++	GLIBC_VERSION=musl
+ 	;;
+ esac
+ 
+diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
+index 2ea7a7a..e49c832 100644
+--- a/coregrind/vg_preloaded.c
++++ b/coregrind/vg_preloaded.c
+@@ -56,7 +56,7 @@
+ void VG_NOTIFY_ON_LOAD(freeres)( void );
+ void VG_NOTIFY_ON_LOAD(freeres)( void )
+ {
+-#  if !defined(__UCLIBC__) \
++#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
+       && !defined(VGPV_arm_linux_android) \
+       && !defined(VGPV_x86_linux_android) \
+       && !defined(VGPV_mips32_linux_android) \
+diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
+index bac00d7..b8cd97e 100644
+--- a/include/pub_tool_redir.h
++++ b/include/pub_tool_redir.h
+@@ -242,8 +242,11 @@
+ /* --- Soname of the standard C library. --- */
+ 
+ #if defined(VGO_linux) || defined(VGO_solaris)
++# if defined(__GLIBC__) || defined(__UCLIBC__)
+ #  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
+-
++#else
++#  define  VG_Z_LIBC_SONAME  libcZdZa              // libc.*
++#endif
+ #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
+ #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
+ 
+@@ -274,7 +277,11 @@
+ /* --- Soname of the pthreads library. --- */
+ 
+ #if defined(VGO_linux)
++# if defined(__GLIBC__) || defined(__UCLIBC__)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
++#else
++#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
++#endif
+ #elif defined(VGO_darwin)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
+ #elif defined(VGO_solaris)
+-- 
+2.1.4
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 75d542a..a630125 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -12,6 +12,9 @@ VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = --disable-tls --disable-ubsan
 VALGRIND_INSTALL_STAGING = YES
 
+# patch touching configure.ac
+VALGRIND_AUTORECONF = YES
+
 # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
 # it forcibly adds -march=mips64. This causes Valgrind to be built
-- 
2.1.4
