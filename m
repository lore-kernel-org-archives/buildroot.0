From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:30:58 +0200
Subject: [Buildroot] [git commit] package/sysdig: depend on lua ABI version
 5.1
Message-ID: <20200727203323.300E280059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9362f414c0c86f141c3df53263a7419ecf9828fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since sysdig is compatible with lua interpreters that provide the
version 5.1 ABI we should depend on that instead of unconditionally
selecting luajit.

Use luainterpreter as the dependency, now that either lua or luajit
can be used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - reorder dependencies in Config.in: package deps go after toolchain
    deps
  - keep the toolchain deps together in the comment
  - switch to using luainterpreter as a build dependency
  - split the now-long _DEPENDENCIES list
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysdig/Config.in | 11 +++++------
 package/sysdig/sysdig.mk | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index ee53b4fa20..0ca468c396 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -2,18 +2,17 @@ config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq
-	depends on !BR2_STATIC_LIBS # luajit, elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_USE_WCHAR # elfutils
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_JQ
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBB64
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -26,9 +25,9 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc or uclibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library and a Linux kernel to be built"
+comment "sysdig needs a glibc or uclibc toolchain w/ C++, threads, gcc >= 4.8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) \
+	    || !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index c604032cf4..9c8b818181 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -9,9 +9,20 @@ SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DENABLE_DKMS=OFF -DUSE_BUNDLED_DEPS=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64 elfutils
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
+SYSDIG_DEPENDENCIES = \
+	elfutils \
+	jq \
+	jsoncpp \
+	libb64 \
+	libcurl \
+	luainterpreter \
+	ncurses \
+	openssl \
+	zlib \
+
+
 # sysdig creates the module Makefile from a template, which contains a
 # single place-holder, KBUILD_FLAGS, wich is only replaced with two
 # things:
