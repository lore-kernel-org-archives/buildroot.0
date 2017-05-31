From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:40:20 +0200
Subject: [Buildroot] [git commit] package/mono: bump to version 4.8.1.0
Message-ID: <20170601202900.EBF198294C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7f6224960cb788a78465864530da3596198ba24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps mono the version 4.8.1.0. Simultaneously it removes an
upstreamed patch and updates another one to the latest source code.

It also disables the compilation of 'aot' cause the build system was
fixed to support this option again.

It also disables the compilation of the optional BoringTLS stack: this
stack is distributed as an external component inside the mono source
tree and it carries it's own build system (cmake). To be compiled inside
buildroot it requires hacking the mono build system to pass the correct
compiling options to cmake. This will be done in a future patch set.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...6-Remove-unit-tests-from-mono-compilation.patch | 20 +++++-----
 ...009-fix-musl-incorrect-sigcontext-include.patch | 44 ----------------------
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               | 12 +++---
 4 files changed, 18 insertions(+), 60 deletions(-)

diff --git a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
index 3714b65..6adbd81 100644
--- a/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
+++ b/package/mono/0006-Remove-unit-tests-from-mono-compilation.patch
@@ -1,6 +1,6 @@
-From 155f96953d1b898f04a4e708c9ebc1e450b2f63e Mon Sep 17 00:00:00 2001
+From 357bea890354acda52aa6dfaec7fa232fa0b8208 Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Tue, 24 Nov 2015 23:11:10 +0100
+Date: Tue, 23 May 2017 11:19:58 +0200
 Subject: [PATCH] Remove unit-tests from mono compilation
 
 This patch fixes compiling errors with unit-tests under linux.
@@ -11,19 +11,19 @@ Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/mono/Makefile.am b/mono/Makefile.am
-index ef41dfe..7129507 100644
+index 8c9c2cb..7af36ec 100644
 --- a/mono/Makefile.am
 +++ b/mono/Makefile.am
-@@ -30,7 +30,7 @@ monotouch-do-clean:
- 	  (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$target); \
+@@ -34,7 +34,7 @@ monotouch-do-clean:
+          (cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$target); \
      done;
  else
--SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
-+SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
+-SUBDIRS = $(btls_dirs) arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
++SUBDIRS = $(btls_dirs) arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
  endif
  endif
--DIST_SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
-+DIST_SUBDIRS = arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
+-DIST_SUBDIRS = btls arch utils io-layer cil metadata $(sgen_dirs) mini dis tests unit-tests benchmark profiler
++DIST_SUBDIRS = btls arch utils io-layer cil metadata $(sgen_dirs) mini dis tests benchmark profiler
 -- 
-1.9.1
+2.7.4
 
diff --git a/package/mono/0009-fix-musl-incorrect-sigcontext-include.patch b/package/mono/0009-fix-musl-incorrect-sigcontext-include.patch
deleted file mode 100644
index 3d932b6..0000000
--- a/package/mono/0009-fix-musl-incorrect-sigcontext-include.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 63f0b0246b8125ae48b15bd182bb5831be02e6c9 Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Mon, 27 Jun 2016 21:32:11 +0200
-Subject: [PATCH] fix musl incorrect sigcontext include
-
-On musl __GLIBC__ is not defined, so the conditional logic will
-not produce correct result. Add a specific case to handle when
-__GLIBC__ is not defined.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- libgc/os_dep.c             | 2 +-
- mono/mini/exceptions-arm.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgc/os_dep.c b/libgc/os_dep.c
-index 8c8e098..34859c1 100644
---- a/libgc/os_dep.c
-+++ b/libgc/os_dep.c
-@@ -32,7 +32,7 @@
-       /* prototypes, so we have to include the top-level sigcontext.h to    */
-       /* make sure the former gets defined to be the latter if appropriate. */
- #     include <features.h>
--#     if 2 <= __GLIBC__
-+#     if 2 <= __GLIBC__ || !defined(__GLIBC__)
- #       if 2 == __GLIBC__ && 0 == __GLIBC_MINOR__
- 	  /* glibc 2.1 no longer has sigcontext.h.  But signal.h	*/
- 	  /* has the right declaration for glibc 2.1.			*/
-diff --git a/mono/mini/exceptions-arm.c b/mono/mini/exceptions-arm.c
-index b036aa7..a3e2164 100644
---- a/mono/mini/exceptions-arm.c
-+++ b/mono/mini/exceptions-arm.c
-@@ -14,7 +14,7 @@
- #include <string.h>
- 
- #ifndef MONO_CROSS_COMPILE
--#ifdef HAVE_ASM_SIGCONTEXT_H
-+#if defined(HAVE_ASM_SIGCONTEXT_H) && defined(__GLIBC__)
- #include <asm/sigcontext.h>
- #endif  /* def HAVE_ASM_SIGCONTEXT_H */
- #endif
--- 
-1.9.1
-
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 6719fec..89b8ed0 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 8965d107f4ebf4583ba1b50e0dcad39f0dc6adac8df7a083e9c5879ad93c0ea4  mono-4.6.2.16.tar.bz2
+sha256 18cb38a670e51609c36c687ed90ad42cfedabeffd0a2dc5f7f0c46249eb8dbef  mono-4.8.1.0.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 58dfab7..b066bc6 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.6.2.16
+MONO_VERSION = 4.8.1.0
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
@@ -20,9 +20,10 @@ MONO_AUTORECONF = YES
 # Disable managed code (mcs folder) from building
 MONO_CONF_OPTS = --with-mcs-docs=no \
 	--with-ikvm-native=no \
-	--enable-minimal=profiler,debug \
+	--enable-minimal=profiler,debug,aot \
 	--disable-mcs-build \
-	--enable-static
+	--enable-static \
+	--disable-btls
 
 # The libraries have been built by the host-mono build. Since they are
 # architecture-independent, we simply copy them to the target.
@@ -45,8 +46,9 @@ MONO_DEPENDENCIES += host-mono
 HOST_MONO_CONF_OPTS = --with-mcs-docs=no \
 	--disable-libraries \
 	--with-ikvm-native=no \
-	--enable-minimal=profiler,debug \
-	--enable-static
+	--enable-minimal=profiler,debug,aot \
+	--enable-static \
+	--disable-btls
 
 # ensure monolite is used
 HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
