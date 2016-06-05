From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:16:45 +0200
Subject: [Buildroot] [git commit] uclibc: add microblaze support
Message-ID: <20160605201808.C1D657FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=843fc192594e66db0068906ca8eac9cc92decfb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest uClibc-ng 1.0.15 release fixed open issues with
microblaze shared library and linuxthreads support.
gcc 4.9.3 and gcc 5.3.0 require a small patch.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.9.3/901-microblaze-uclibc.patch | 21 +++++++++++++++++++++
 package/gcc/5.3.0/892-microblaze-uclibc.patch | 24 ++++++++++++++++++++++++
 package/uclibc/Config.in                      |  5 +++--
 toolchain/toolchain-buildroot/Config.in       |  4 ++--
 4 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/package/gcc/4.9.3/901-microblaze-uclibc.patch b/package/gcc/4.9.3/901-microblaze-uclibc.patch
new file mode 100644
index 0000000..82c44e1
--- /dev/null
+++ b/package/gcc/4.9.3/901-microblaze-uclibc.patch
@@ -0,0 +1,21 @@
+Add dynamic linker support for uClibc
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+diff -Nur gcc-4.9.3.orig/gcc/config/microblaze/linux.h gcc-4.9.3/gcc/config/microblaze/linux.h
+--- gcc-4.9.3.orig/gcc/config/microblaze/linux.h	2016-06-04 21:21:09.430646655 +0200
++++ gcc-4.9.3/gcc/config/microblaze/linux.h	2016-06-04 21:21:44.596003509 +0200
+@@ -36,10 +36,13 @@
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINKER_E ".so.1"
++#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+ 
+ #if DEFAULT_LIBC == LIBC_MUSL
+ #define DYNAMIC_LINKER MUSL_DYNAMIC_LINKER
++#elif DEFAULT_LIBC == LIBC_UCLIBC
++#define DYNAMIC_LINKER UCLIBC_DYNAMIC_LINKER
+ #else
+ #define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
+ #endif
diff --git a/package/gcc/5.3.0/892-microblaze-uclibc.patch b/package/gcc/5.3.0/892-microblaze-uclibc.patch
new file mode 100644
index 0000000..a8eb5a6
--- /dev/null
+++ b/package/gcc/5.3.0/892-microblaze-uclibc.patch
@@ -0,0 +1,24 @@
+Add dynamic linker support for uClibc
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+diff -Nur gcc-5.3.0.orig/gcc/config/microblaze/linux.h gcc-5.3.0/gcc/config/microblaze/linux.h
+--- gcc-5.3.0.orig/gcc/config/microblaze/linux.h	2015-05-28 16:08:19.000000000 +0200
++++ gcc-5.3.0/gcc/config/microblaze/linux.h	2016-05-13 09:21:01.579262885 +0200
+@@ -28,7 +28,15 @@
+ #undef TLS_NEEDS_GOT
+ #define TLS_NEEDS_GOT 1
+ 
+-#define DYNAMIC_LINKER "/lib/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER	"/lib/ld.so.1"
++#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++
++#if DEFAULT_LIBC == LIBC_UCLIBC
++#define DYNAMIC_LINKER UCLIBC_DYNAMIC_LINKER
++#else
++#define DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
++#endif
++
+ #undef  SUBTARGET_EXTRA_SPECS
+ #define SUBTARGET_EXTRA_SPECS \
+   { "dynamic_linker", DYNAMIC_LINKER }
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 1aad9a0..f5a3310 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -59,14 +59,14 @@ choice
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_m68k || BR2_arm || BR2_armeb || BR2_xtensa
+		depends on BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on BR2_USE_MMU
-		depends on !BR2_m68k
+		depends on !BR2_m68k && !BR2_microblaze
 endchoice
 
 config BR2_PTHREAD_DEBUG
@@ -121,6 +121,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
 	default "m68k"	   if BR2_m68k
+	default "microblaze"   if BR2_microblaze
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "powerpc"  if BR2_powerpc
 	default "sh"	   if BR2_sh
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2b0ebc1..52009c4 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -24,13 +24,13 @@ choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_aarch64_be \
-		|| BR2_microblaze || BR2_powerpc64
+		|| BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
-		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
+		   BR2_bfin    || BR2_i386   || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
 		   BR2_sparc   || BR2_xtensa || BR2_x86_64
