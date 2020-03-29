From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:44:19 +0200
Subject: [Buildroot] [git commit] package/rng-tools: bump to version 6.10
Message-ID: <20200329133201.7D4F688D1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96a398269c16751501224c4c1a8057f0ea066c1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libgcrypt is not an optional dependency and openssl is mandatory since
  https://github.com/nhorman/rng-tools/commit/699a404c290eaa08ed5dd37204d951ef6ee23578
- librtlsdr is an optional dependency since
  https://github.com/nhorman/rng-tools/commit/865277d591e20b7e21873433fb2a280c66d98c87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-fix-with-rtlsdr-option.patch | 29 ++++++++++++++++++++++
 package/rng-tools/Config.in                        |  4 +--
 package/rng-tools/rng-tools.hash                   |  2 +-
 package/rng-tools/rng-tools.mk                     | 11 ++++----
 4 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch b/package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch
new file mode 100644
index 0000000000..586a44e21f
--- /dev/null
+++ b/package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch
@@ -0,0 +1,29 @@
+From 45a8c51a20a518ed78c5ea1829a307c045f737be Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 Mar 2020 22:19:42 +0100
+Subject: [PATCH] configure.ac: fix --with-rtlsdr option
+
+Add missing ',' to allow the user to explicitly disable or enable rtlsdr
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nhorman/rng-tools/pull/88]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ba796f8..1f55052 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,7 +43,7 @@ AC_ARG_WITH([pkcs11],
+ 
+ AC_ARG_WITH([rtlsdr],
+ 	AS_HELP_STRING([--without-rtlsdr],
+-		[Disable rtlsdr support. ])
++		[Disable rtlsdr support. ]),
+ 	[],
+ 	[with_rtlsdr=no]
+ )
+-- 
+2.25.1
+
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 71514260e6..a86fbb0f74 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,13 +1,11 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64 || BR2_powerpc64le) # libgcrypt
 	# pthread_setaffinity_np
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_JITTERENTROPY_LIBRARY
-	# For rdrand & darn ligcrypt is required and it's not obvious to users
-	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64 || BR2_powerpc64le
 	select BR2_PACKAGE_LIBSYSFS
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Daemon to use hardware random number generators.
 
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
index b5194523eb..3202a88d67 100644
--- a/package/rng-tools/rng-tools.hash
+++ b/package/rng-tools/rng-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a57a7f51a2e3c0faa8afb979709a4c0cbea36d0b52fd835b104f8fb4fd1fa610  rng-tools-6.9.tar.gz
+sha256  2e462821aaa7d6dc24646aa0d2239d97cb8b07b3e60715159a9edcaa9189f8ef  rng-tools-6.10.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 5338e95590..8ebfc0975a 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 6.9
+RNG_TOOLS_VERSION = 6.10
 RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
-RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf
+RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
 
@@ -23,10 +23,11 @@ RNG_TOOLS_CONF_ENV += LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES += argp-standalone
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-RNG_TOOLS_DEPENDENCIES += libgcrypt
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+RNG_TOOLS_DEPENDENCIES += librtlsdr
+RNG_TOOLS_CONF_OPTS += --with-rtlsdr
 else
-RNG_TOOLS_CONF_OPTS += --without-libgcrypt
+RNG_TOOLS_CONF_OPTS += --without-rtlsdr
 endif
 
 define RNG_TOOLS_INSTALL_INIT_SYSV
