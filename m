From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 23:54:17 +0200
Subject: [Buildroot] [PATCH/next 2/2] gcc: remove BR2_GCC_ENABLE_TLS option
In-Reply-To: <1472507657-9983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472507657-9983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1472507657-9983-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/gcc/Config.in.host | 8 --------
 package/gcc/gcc.mk         | 4 +++-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 37728e0..8ed946b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -148,14 +148,6 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
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
index 39c3eeb..3d5e3fa 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -133,7 +133,9 @@ ifeq ($(BR2_sparc)$(BR2_sparc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
-ifeq ($(BR2_GCC_ENABLE_TLS),y)
+# On glibc, musl and uClibc/NPTL, enable TLS support. Otherwise (i.e
+# just uClibc/no-thread and uClibc/linux-threads), disable it.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL)$(BR2_PTHREADS_NATIVE),y)
 HOST_GCC_COMMON_CONF_OPTS += --enable-tls
 else
 HOST_GCC_COMMON_CONF_OPTS += --disable-tls
-- 
2.7.4
