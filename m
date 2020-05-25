From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:38 -0600
Subject: [Buildroot] [PATCH v3 2/9] package/sysdig: depend on lua ABI
 version 5.1
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since sysdig is compatible with lua interpreters that provide the
version 5.1 ABI we should depend on that instead of unconditionally
selecting luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/sysdig/Config.in | 9 ++++-----
 package/sysdig/sysdig.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 0a1b3f8935..51d031e85b 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -2,9 +2,9 @@ config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on !BR2_STATIC_LIBS # luajit, elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
@@ -12,7 +12,6 @@ config BR2_PACKAGE_SYSDIG
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBB64
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -25,8 +24,8 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
+comment "sysdig needs a glibc or uclibc toolchain w/ C++, luajit or lua 5.1, gcc >= 4.8, dynamic library, and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index c604032cf4..c118b422f0 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -9,9 +9,15 @@ SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64 elfutils
+SYSDIG_DEPENDENCIES = zlib jsoncpp libcurl ncurses openssl jq libb64 elfutils
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+SYSDIG_DEPENDENCIES += lua
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+SYSDIG_DEPENDENCIES += luajit
+endif
+
 # sysdig creates the module Makefile from a template, which contains a
 # single place-holder, KBUILD_FLAGS, wich is only replaced with two
 # things:
-- 
2.25.1
