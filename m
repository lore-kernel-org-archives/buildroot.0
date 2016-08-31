From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 21:45:36 +0200
Subject: [Buildroot] [git commit branch/next] gcc: remove BR2_GCC_ENABLE_TLS
	option
Message-ID: <20160831194551.2BE4280131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bd02bc230e1b3b22ca3eb23fb3dcb91b878283a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The current BR2_GCC_ENABLE_TLS can cause users to make incorrect
choices, and is not very useful. This options allows to decide whether
we pass --enable-tls or --disable-tls to gcc, to enable or disable
support for Thread Local Storage.

Its behavior is:

 - The option is default to "y" but only exists if we're using
   uClibc/NPTL or glibc.

 - When we're using uClibc, the option can be disabled.

So, in practice, this means that currently:

 - TLS support is always on for glibc

 - TLS support is on by default for uClibc/NPTL, but can be disabled in
   the configuration. This is in fact bad and causes the build failure
   reported in bug #7424 (this bug is still reproducible on master)

 - TLS support is always disabled for uClibc/no-thread and
   uClibc/linuxthreads.

 - TLS support is always disabled for musl. This does not cause any
   build failure, but musl can use TLS support, and therefore be more
   efficient. According to
   http://www.openwall.com/lists/musl/2012/10/04/1, "Note that if you've
   been building gcc with --disable-tls, __thread was already working
   but gets emulated (very poorly; it's slow and will abort() if it runs
   out of memory) through libgcc.".

So, this commit completely removes the BR2_GCC_ENABLE_TLS and instead
makes the right choice inside gcc.mk directly:

 - TLS support enabled for glibc, musl and uClibc/NPTL

 - TLS support in other cases, i.e uClibc/no-thread and
   uClibc/linuxthreads.

We have intentionally *not* added the option to
Config.in.legacy. Indeed, the new behavior is *exactly* the same as the
older behavior, with the exception of:

 - People can no longer disable TLS support in uClibc/NPTL, which was
   anyway causing a build failure and therefore was not used.

 - TLS support is now enabled on musl, but people using musl already had
   BR2_GCC_ENABLE_TLS not set, so they wouldn't get the legacy warning.

Fixes bug #7424.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/Config.in.host | 8 --------
 package/gcc/gcc.mk         | 9 ++++++---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7262714..aa0a698 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -154,14 +154,6 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 	  Fortran language and you want Fortran libraries to be
 	  installed on your target system.
 
-config BR2_GCC_ENABLE_TLS
-	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	default y
-	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_GLIBC
-	help
-	  Enable the compiler to generate code for accessing
-	  thread local storage variables
-
 config BR2_GCC_ENABLE_LTO
 	bool "Enable compiler link-time-optimization support"
 	select BR2_BINUTILS_ENABLE_LTO
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 39c3eeb..82050b4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -133,10 +133,13 @@ ifeq ($(BR2_sparc)$(BR2_sparc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
-ifeq ($(BR2_GCC_ENABLE_TLS),y)
-HOST_GCC_COMMON_CONF_OPTS += --enable-tls
-else
+# TLS support is not needed on uClibc/no-thread and
+# uClibc/linux-threads, otherwise, for all other situations (glibc,
+# musl and uClibc/NPTL), we need it.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_PTHREADS)$(BR2_PTHREADS_NONE),yy)
 HOST_GCC_COMMON_CONF_OPTS += --disable-tls
+else
+HOST_GCC_COMMON_CONF_OPTS += --enable-tls
 endif
 
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
