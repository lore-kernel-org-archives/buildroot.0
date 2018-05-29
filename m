From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 May 2018 23:56:47 +0200
Subject: [Buildroot] [PATCH v2,1/1] aircrack-ng: bump to version 1.2
Message-ID: <20180529215647.19952-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add three patches (first one sent and merged upstream, second and
  third patchs retrieved upstream)
- Move to autotools-package
- Remove workaround for static handling of pthread as it isn't needed
  anymore
- Remove deactivation of libnl in static build as it isn't needed
  anymore
- Set libnl and zlib dependencies as optional and not mandatory
- Add duma and libgcrypt optional dependencies
- Update workaround for static handling of libpcap
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Make libnl and zlib optional
 - Add libgcrypt support
 - Add duma optional dependency

 .../0001-Fix-compilation-without-getauxval.patch   | 81 ++++++++++++++++++++++
 package/aircrack-ng/0001-stack-protector.patch     | 58 ----------------
 ...g-without-opt-should-skip-stack-protector.patch | 52 ++++++++++++++
 ...003-Autoconf-Added-NEON-intrinsic-support.patch | 64 +++++++++++++++++
 package/aircrack-ng/Config.in                      |  6 +-
 package/aircrack-ng/aircrack-ng.hash               |  7 +-
 package/aircrack-ng/aircrack-ng.mk                 | 77 +++++++++-----------
 7 files changed, 236 insertions(+), 109 deletions(-)
 create mode 100644 package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch
 delete mode 100644 package/aircrack-ng/0001-stack-protector.patch
 create mode 100644 package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch
 create mode 100644 package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch

diff --git a/package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch b/package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch
new file mode 100644
index 0000000000..8a291356ca
--- /dev/null
+++ b/package/aircrack-ng/0001-Fix-compilation-without-getauxval.patch
@@ -0,0 +1,81 @@
+From 0017bae95dbcf336495e36ac83c868ca1d7f2846 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 26 May 2018 22:52:30 +0200
+Subject: [PATCH] Fix compilation without getauxval
+
+Protect getauxval call and sys/auxv.h include by #ifdef HAS_AUXV in
+trampoline_arm.c and trampoline_ppc.c.
+Indeed, auxv is not available on some toolchains such as uclibc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: merged (https://github.com/aircrack-ng/aircrack-ng/pull/1896)]
+---
+ src/trampoline_arm.c | 4 ++++
+ src/trampoline_ppc.c | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/src/trampoline_arm.c b/src/trampoline_arm.c
+index 45db82db..e653109a 100644
+--- a/src/trampoline_arm.c
++++ b/src/trampoline_arm.c
+@@ -17,8 +17,10 @@
+  */
+ 
+ #if defined(__arm__) || defined(__aarch64__)
++#ifdef HAS_AUXV
+ #include <sys/auxv.h>
+ #include <asm/hwcap.h>
++#endif
+ #else
+ #error "The wrong CPU architecture file has been included."
+ #endif
+@@ -39,6 +41,7 @@ int
+ simd_get_supported_features (void)
+ {
+   int result = 0;
++#ifdef HAS_AUXV
+   long hwcaps = getauxval (AT_HWCAP);
+ 
+ #if defined(HWCAP_ASIMD)
+@@ -53,6 +56,7 @@ simd_get_supported_features (void)
+   {
+     result |= SIMD_SUPPORTS_NEON;
+   }
++#endif
+ #endif
+ 
+   return (result);
+diff --git a/src/trampoline_ppc.c b/src/trampoline_ppc.c
+index 0d439776..b5c0cb2b 100644
+--- a/src/trampoline_ppc.c
++++ b/src/trampoline_ppc.c
+@@ -17,8 +17,10 @@
+  */
+ 
+ #if defined(__ppc__) || defined(__PPC__)
++#ifdef HAS_AUXV
+ #include <sys/auxv.h>
+ #include <bits/hwcap.h>
++#endif
+ #else
+ #error "The wrong CPU architecture file has been included."
+ #endif
+@@ -39,6 +41,7 @@ int
+ simd_get_supported_features (void)
+ {
+   int result = 0;
++#ifdef HAS_AUXV
+   long hwcaps = getauxval (AT_HWCAP2);
+ 
+ #if defined(PPC_FEATURE2_ARCH_2_07)
+@@ -46,6 +49,7 @@ simd_get_supported_features (void)
+   {
+     result |= SIMD_SUPPORTS_POWER8;
+   }
++#endif
+ #endif
+ 
+   return (result);
+-- 
+2.14.1
+
diff --git a/package/aircrack-ng/0001-stack-protector.patch b/package/aircrack-ng/0001-stack-protector.patch
deleted file mode 100644
index 5f2bd1b18f..0000000000
--- a/package/aircrack-ng/0001-stack-protector.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Added option to disable stack-protector support auto-detection in gcc.
-
-Downloaded from upstream commit:
-http://trac.aircrack-ng.org/changeset/2889/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-Index: /trunk/INSTALLING
-===================================================================
---- trunk/INSTALLING	(revision 2888)
-+++ trunk/INSTALLING	(revision 2889)
-@@ -83,4 +83,6 @@
- * macport:  Set this flag to true to compile on OS X with macports.
- 
-+* stackprotector: Allows to enable/disable auto-detection of stack-protector support in gcc
-+
- Example:
- 
-Index: /trunk/common.mak
-===================================================================
---- trunk/common.mak	(revision 2888)
-+++ trunk/common.mak	(revision 2889)
-@@ -64,4 +64,13 @@
- ifeq ($(PCRE), true)
- COMMON_CFLAGS += $(shell $(PKG_CONFIG) --cflags libpcre) -DHAVE_PCRE
-+endif
-+
-+STACK_PROTECTOR	= true
-+ifeq ($(stackprotector), false)
-+	STACK_PROTECTOR	= false
-+endif
-+
-+ifeq ($(STACKPROTECTOR), false)
-+	STACK_PROTECTOR	= false
- endif
- 
-@@ -235,12 +244,14 @@
- endif
- 
--ifeq ($(GCC_OVER49), 0)
--	ifeq ($(GCC_OVER41), 1)
--		COMMON_CFLAGS += -fstack-protector
-+ifeq ($(STACK_PROTECTOR), true)
-+	ifeq ($(GCC_OVER49), 0)
-+		ifeq ($(GCC_OVER41), 1)
-+			COMMON_CFLAGS += -fstack-protector
-+		endif
- 	endif
--endif
--
--ifeq ($(GCC_OVER49), 1)
--	COMMON_CFLAGS += -fstack-protector-strong
-+
-+	ifeq ($(GCC_OVER49), 1)
-+		COMMON_CFLAGS += -fstack-protector-strong
-+	endif
- endif
- 
diff --git a/package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch b/package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch
new file mode 100644
index 0000000000..8563c78d33
--- /dev/null
+++ b/package/aircrack-ng/0002-autotools-The-flag-without-opt-should-skip-stack-protector.patch
@@ -0,0 +1,52 @@
+From 58fe40daf3e082d9e63d689d795a3bbecf72fedb Mon Sep 17 00:00:00 2001
+From: Joseph Benden <joe@benden.us>
+Date: Mon, 16 Apr 2018 11:26:23 -0700
+Subject: [PATCH] autotools: The flag --without-opt should skip stack protector
+ flags. (#1864)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from upstream: https://github.com/aircrack-ng/aircrack-ng/commit/58fe40daf3e082d9e63d689d795a3bbecf72fedb]
+---
+ build/m4/aircrack_ng_compiler.m4 | 28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/build/m4/aircrack_ng_compiler.m4 b/build/m4/aircrack_ng_compiler.m4
+index 0fb19726..8a973dbf 100644
+--- a/build/m4/aircrack_ng_compiler.m4
++++ b/build/m4/aircrack_ng_compiler.m4
+@@ -108,19 +108,23 @@ case "$ax_cv_[]_AC_LANG_ABBREV[]_compiler_vendor" in
+             CYGWIN*|MSYS*|cygwin*|msys*)
+                 ;;
+             *)
+-                AS_IF([test "x$gcc_over49" = "xno"], [
+-                    AS_IF([test "x$gcc_over41" = "xyes"], [
+-                        AX_CHECK_COMPILE_FLAG([-fstack-protector], [
+-                            AX_APPEND_FLAG(-fstack-protector, [opt_[]_AC_LANG_ABBREV[]flags])
+-                        ])
+-                    ], [])
+-                ], [])
++                case $with_opt in
++                    yes | "")
++                        AS_IF([test "x$gcc_over49" = "xno"], [
++                            AS_IF([test "x$gcc_over41" = "xyes"], [
++                                AX_CHECK_COMPILE_FLAG([-fstack-protector], [
++                                    AX_APPEND_FLAG(-fstack-protector, [opt_[]_AC_LANG_ABBREV[]flags])
++                                ])
++                            ], [])
++                        ], [])
+ 
+-                AS_IF([test "x$gcc_over49" = "xyes"], [
+-                    AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [
+-                        AX_APPEND_FLAG(-fstack-protector-strong, [opt_[]_AC_LANG_ABBREV[]flags])
+-                    ])
+-                ], [])
++                        AS_IF([test "x$gcc_over49" = "xyes"], [
++                            AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [
++                                AX_APPEND_FLAG(-fstack-protector-strong, [opt_[]_AC_LANG_ABBREV[]flags])
++                            ])
++                        ], [])
++                        ;;
++                esac
+                 ;;
+         esac
+         ;;
diff --git a/package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch b/package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch
new file mode 100644
index 0000000000..59c7ade4e9
--- /dev/null
+++ b/package/aircrack-ng/0003-Autoconf-Added-NEON-intrinsic-support.patch
@@ -0,0 +1,64 @@
+From 149929109eab1f79c4b90aa423f6d6eb4ee0e882 Mon Sep 17 00:00:00 2001
+From: Joseph Benden <joe@benden.us>
+Date: Tue, 8 May 2018 11:49:22 -0700
+Subject: [PATCH] Autoconf: Added NEON intrinsic support. (#1879, #1872)
+
+Perform NEON intrinsic support using Autoconf, instead of failing to build on older ARM processors without NEON features.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from upstream: https://github.com/aircrack-ng/aircrack-ng/commit/149929109eab1f79c4b90aa423f6d6eb4ee0e882]
+---
+ build/m4/aircrack_ng_simd.m4 | 16 ++++++++++++++++
+ src/Makefile.am              |  2 ++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/build/m4/aircrack_ng_simd.m4 b/build/m4/aircrack_ng_simd.m4
+index 9d13031e..74135f32 100644
+--- a/build/m4/aircrack_ng_simd.m4
++++ b/build/m4/aircrack_ng_simd.m4
+@@ -95,6 +95,21 @@ then
+         AX_APPEND_FLAG(-mfpu=neon, [arm_neon_[]_AC_LANG_ABBREV[]flags])
+         AC_SUBST(arm_neon_[]_AC_LANG_ABBREV[]flags)
+     ])
++
++    AS_VAR_PUSHDEF([CACHEVAR], [ax_cv_neon_[]_AC_LANG_ABBREV[]flags])
++    AC_CACHE_CHECK([whether _AC_LANG compiler supports NEON instructions], CACHEVAR, [
++        ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
++        _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $arm_neon_[]_AC_LANG_ABBREV[]flags"
++        AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
++#if !defined(__ARM_NEON) && !defined(__ARM_NEON__) && !defined(__aarch64) && !defined(__aarch64__)
++#error macro not defined
++#endif
++        ]])], [AS_VAR_SET(CACHEVAR,[yes])], [AS_VAR_SET(CACHEVAR,[no])])
++        _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags
++    ])
++    AS_IF([test x"AS_VAR_GET(CACHEVAR)" = xyes],
++        [NEON_FOUND=1], [NEON_FOUND=0])
++    AS_VAR_POPDEF([CACHEVAR])
+ fi
+ 
+ if test $IS_PPC -eq 1
+@@ -185,6 +200,7 @@ fi
+ AM_CONDITIONAL([X86], [test "$IS_X86" = 1])
+ AM_CONDITIONAL([ARM], [test "$IS_ARM" = 1])
+ AM_CONDITIONAL([PPC], [test "$IS_PPC" = 1])
++AM_CONDITIONAL([NEON], [test "$NEON_FOUND" = 1])
+ ])
+ 
+ AC_DEFUN([AIRCRACK_NG_SIMD_C], [
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3cc8ebdc..beac9dce 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -116,9 +116,11 @@ endif
+ pkglibexec_PROGRAMS = aircrack-ng--generic
+ 
+ if ARM
++if NEON
+ pkglibexec_PROGRAMS += aircrack-ng--neon \
+                        aircrack-ng--asimd
+ endif
++endif
+ 
+ if PPC
+ pkglibexec_PROGRAMS += aircrack-ng--altivec \
diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 12fda1cbf2..9e691e7f89 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -3,11 +3,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	# libnl has issues when linking statically
-	# they need fixing in libnl itself
-	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  A set of tools for auditing wireless networks
 
diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index e210ad2e4a..a5fbbcfd31 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,3 +1,6 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1 2b2fbe50fedb606b3bd96a34d49f07760e8e618a aircrack-ng-1.2-rc4.tar.gz
-md5 3bbc7d5035a98ec01e78774d05c3fcce aircrack-ng-1.2-rc4.tar.gz
+sha1 ccc7a44ad2243c66b9a45fe133514485a72d674f aircrack-ng-1.2.tar.gz
+md5 bb11ec14e1fe505d8d0d51cee0c54df9 aircrack-ng-1.2.tar.gz
+
+# Hash for license file:
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4 LICENSE
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 6b384c0720..fe0f504ed1 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,69 +4,58 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.2-rc4
+AIRCRACK_NG_VERSION = 1.2
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
-AIRCRACK_NG_DEPENDENCIES = openssl zlib host-pkgconf
+AIRCRACK_NG_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBNL),libnl) \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_PCRE),pcre) \
+	$(if $(BR2_PACKAGE_ZLIB),zlib) \
+	host-pkgconf
+AIRCRACK_NG_AUTORECONF = YES
 # Enable buddy-ng, easside-ng, tkiptun-ng, wesside-ng
-AIRCRACK_NG_MAKE_OPTS = unstable=true
+AIRCRACK_NG_CONF_OPTS = --with-experimental
 
-# Account for libpthread in static
-AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) \
-	$(if $(BR2_STATIC_LIBS),-lpthread -lz)
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+AIRCRACK_NG_CONF_OPTS += --with-opt
+else
+AIRCRACK_NG_CONF_OPTS += --without-opt
+endif
 
-# libnl support has issues when building static
-ifeq ($(BR2_STATIC_LIBS),y)
-AIRCRACK_NG_MAKE_OPTS += libnl=false
+ifeq ($(BR2_PACKAGE_DUMA),y)
+AIRCRACK_NG_DEPENDENCIES += duma
+AIRCRACK_NG_CONF_OPTS += --with-duma
 else
-AIRCRACK_NG_MAKE_OPTS += libnl=true
-AIRCRACK_NG_DEPENDENCIES += libnl
+AIRCRACK_NG_CONF_OPTS += --without-duma
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
-AIRCRACK_NG_MAKE_OPTS += STACK_PROTECTOR=true
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+AIRCRACK_NG_DEPENDENCIES += libgcrypt
+AIRCRACK_NG_CONF_OPTS += \
+	--with-gcrypt \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-AIRCRACK_NG_MAKE_OPTS += STACK_PROTECTOR=false
+AIRCRACK_NG_CONF_OPTS += --without-gcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 AIRCRACK_NG_DEPENDENCIES += libpcap
-AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
-	$(if $(BR2_STATIC_LIBS),LIBPCAP="-lpcap `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`")
-else
-AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=no
+AIRCRACK_NG_CONF_OPTS += \
+	--with-libpcap-include=$(STAGING_DIR)/usr/include \
+	--with-libpcap-lib=$(STAGING_DIR)/usr/lib
+ifeq ($(BR2_STATIC_LIBS),y)
+AIRCRACK_NG_CONF_ENV += \
+	LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
-
-ifeq ($(BR2_PACKAGE_PCRE),y)
-AIRCRACK_NG_DEPENDENCIES += pcre
-AIRCRACK_NG_MAKE_OPTS += pcre=true
-else
-AIRCRACK_NG_MAKE_OPTS += pcre=false
 endif
 
-# Duplicate -lpthread, because it is also needed by sqlite
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 AIRCRACK_NG_DEPENDENCIES += sqlite
-AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3 $(if $(BR2_STATIC_LIBS),-lpthread)"
+AIRCRACK_NG_CONF_OPTS += --with-sqlite3
 else
-AIRCRACK_NG_MAKE_OPTS += sqlite=false
+AIRCRACK_NG_CONF_OPTS += --without-sqlite3
 endif
 
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-AIRCRACK_NG_MAKE_OPTS += NEWSSE=true
-else
-AIRCRACK_NG_MAKE_OPTS += NEWSSE=false
-endif
-
-define AIRCRACK_NG_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(AIRCRACK_NG_LDFLAGS)" \
-		$(MAKE) -C $(@D) $(AIRCRACK_NG_MAKE_OPTS)
-endef
-
-define AIRCRACK_NG_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
-		prefix=/usr $(AIRCRACK_NG_MAKE_OPTS) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.14.1
