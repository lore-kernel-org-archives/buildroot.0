From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 24 Apr 2019 14:53:45 -0400
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version 0.6.3
Message-ID: <20190424185345.52875-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In additon:
  - Rebase both patches to work with the new version.
  - Add the dependency libconfig

All tests pass:
  - br-arm-full [1/6]: OK
  - br-arm-cortex-a9-glibc [2/6]: OK
  - br-arm-cortex-m4-full [3/6]: SKIPPED
  - br-x86-64-musl [4/6]: OK
  - br-arm-full-static [5/6]: SKIPPED
  - sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/janus-gateway/0001-disable-ssp.patch  | 37 ++++++++++-----
 ...dd-test-for-Wunused-but-set-variable.patch | 47 ++++++++++++-------
 package/janus-gateway/Config.in               |  1 +
 package/janus-gateway/janus-gateway.hash      |  2 +-
 package/janus-gateway/janus-gateway.mk        |  4 +-
 5 files changed, 57 insertions(+), 34 deletions(-)

diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
index f03b58589b..e9dabbd66a 100644
--- a/package/janus-gateway/0001-disable-ssp.patch
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -1,4 +1,7 @@
-Do not force SSP usage
+From 4b02c8207adb888d35951bbc1c5b3029594f44c6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 24 Apr 2019 13:56:27 -0400
+Subject: [PATCH] Do not force SSP usage
 
 The toolchain may not support SSP, so do not enforce its usage, let
 the package user pass the appropriate CFLAGS to enable SSP if needed.
@@ -7,16 +10,24 @@ Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (rebased against v0.1.0)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against v0.6.3)
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 257ea8c..ca17a29 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -20,7 +20,6 @@ LT_INIT
+ # Common CFLAGS
+ CFLAGS="$CFLAGS \
+ 	-fPIC \
+-	-fstack-protector-all \
+ 	-fstrict-aliasing \
+ 	-ggdb3 \
+ 	-pthread \
+-- 
+2.20.1
 
-diff -rupN janus-gateway-master.orig/Makefile.am janus-gateway-master/Makefile.am
---- janus-gateway-master.orig/Makefile.am	2014-11-27 14:36:31.000000000 +0000
-+++ janus-gateway-master/Makefile.am	2014-12-01 16:39:50.551935028 +0000
-@@ -14,7 +14,7 @@ AM_CFLAGS += -Wredundant-decls  # sophia
- # some fairly big refactoring though, which can wait.
- # AM_CFLAGS += -Wshadow -Wstrict-aliasing=2
- 
--AM_CFLAGS += -fstack-protector-all -g -ggdb -fPIC -rdynamic -pthread
-+AM_CFLAGS += -g -ggdb -fPIC -rdynamic -pthread
- 
- # FIXME: make docs work with distcheck
- DISTCHECK_CONFIGURE_FLAGS = --disable-docs --enable-post-processing
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 13bc21ea42..9cf77f76ba 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -16,32 +16,33 @@ supported, and only uses it in this case.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (rebased against v0.1.0)
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against v0.6.3)
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- Makefile.am                 |  2 +-
- configure.ac                |  3 ++
- m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 78 insertions(+), 1 deletion(-)
+ Makefile.am                 |  1 +
+ configure.ac                |  6 ++-
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 79 insertions(+), 2 deletions(-)
  create mode 100644 m4/ax_check_compile_flag.m4
 
 diff --git a/Makefile.am b/Makefile.am
-index 5d23e0b..0f51f6a 100644
+index c6e9ad2..42d256b 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -6,7 +6,7 @@ AM_CFLAGS = \
- 	-Wnested-externs -Wstrict-prototypes -Wunsafe-loop-optimizations \
- 	-Wwrite-strings -Wno-missing-field-initializers -Wno-unused-parameter \
- 	-Wcast-align -Wformat-nonliteral -Wformat-security -Wswitch-default \
--	-Wmissing-include-dirs -Wno-aggregate-return -Wunused-but-set-variable \
-+	-Wmissing-include-dirs -Wno-aggregate-return @GCC_WARN_UNUSED_BUT_SET@ \
- 	-Warray-bounds -Wold-style-definition -Wsign-compare -Wlarger-than=65537
- AM_CFLAGS += -Wno-undef  # sophiasip is not -Wundef--safe
- AM_CFLAGS += -Wno-redundant-decls  # sophiasip also contains redundant declarations
+@@ -140,6 +140,7 @@ janus_CFLAGS = \
+ 	-DTRANSPORTDIR=\"$(transportdir)\" \
+ 	-DEVENTDIR=\"$(eventdir)\" \
+ 	-DCONFDIR=\"$(confdir)\" \
++	@GCC_WARN_UNUSED_BUT_SET@ \
+ 	$(BORINGSSL_CFLAGS) \
+ 	$(NULL)
+ 
 diff --git a/configure.ac b/configure.ac
-index 17870a7..f9bb1e4 100644
+index ca17a29..beef91a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7,6 +7,9 @@ AM_SILENT_RULES([yes])
- AC_GNU_SOURCE
+@@ -13,6 +13,9 @@ AM_SILENT_RULES([yes])
+ AC_USE_SYSTEM_EXTENSIONS
  
  AC_PROG_CC
 +AX_CHECK_COMPILE_FLAG([-Wunused-but-set-variable],
@@ -50,6 +51,16 @@ index 17870a7..f9bb1e4 100644
  
  LT_PREREQ([2.2])
  LT_INIT
+@@ -64,8 +67,7 @@ clang*)
+ 	CFLAGS="$CFLAGS \
+ 		-Wcast-align \
+ 		-Wno-override-init \
+-		-Wunsafe-loop-optimizations \
+-		-Wunused-but-set-variable"
++		-Wunsafe-loop-optimizations"
+ esac
+ 
+ JANUS_VERSION=63
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
@@ -131,5 +142,5 @@ index 0000000..51df0c0
 +AS_VAR_POPDEF([CACHEVAR])dnl
 +])dnl AX_CHECK_COMPILE_FLAGS
 -- 
-2.1.0
+2.20.1
 
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 6eac763f72..9b70fa0cad 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -5,6 +5,7 @@ menuconfig BR2_PACKAGE_JANUS_GATEWAY
 	depends on BR2_USE_MMU # libnice
 	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNICE
 	select BR2_PACKAGE_LIBSRTP
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 9b13e0f0fc..1f6625faab 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c9c3b741a5d9f956845d5094c211690178cc0d630a7b23b870437c88a7e4ed3b janus-gateway-v0.5.0.tar.gz
+sha256 de8f4e3e8b19a099c903b5db7813dbbf442084af686c9922796736d42c8a8c98 janus-gateway-v0.6.3.tar.gz
 sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index cea06b754e..59048b4dd6 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.5.0
+JANUS_GATEWAY_VERSION = v0.6.3
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-	libsrtp host-gengetopt libglib2 openssl
+	libsrtp host-gengetopt libglib2 openssl libconfig
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
-- 
2.20.1
