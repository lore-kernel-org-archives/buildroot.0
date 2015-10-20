From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 20 Oct 2015 22:51:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: broken with musl on x86
Message-ID: <1445374313-30804-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch replaces a previous submission made by Bernd Kuhls some while ago
[1].

The posix_memalign declaration is incompatible with musl for C++, because of
the exception specification [2]. Note, the referenced patch is part of the a
patch series to "Add musl support to GCC".

Instead of patching gcc in Buildroot we disable jsoncpp and any reverse
dependendy with the musl toolchain on x86.

[1] https://patchwork.ozlabs.org/patch/505425/
[2] https://gcc.gnu.org/ml/gcc-patches/2015-04/msg01084.html

Fixes:
http://autobuild.buildroot.net/results/588/5885d33b8d9f17878f565f3ae5371017dc89aede/
http://autobuild.buildroot.net/results/0d9/0d90c7c13ae1640b07709c4c686e0237ada1324d/
http://autobuild.buildroot.net/results/30b/30b98ac7362c27254218a6e521d29971070f8c3c/
http://autobuild.buildroot.net/results/292/29289c125166630aeaf884ccc006bcf12c8aa0f6/

and many more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/cmake/Config.in            | 4 ++++
 package/jsoncpp/Config.in          | 5 +++++
 package/kodi-pvr-argustv/Config.in | 4 ++++
 package/kodi-pvr-filmon/Config.in  | 4 ++++
 package/kodi-pvr-pctv/Config.in    | 4 ++++
 package/kodi-pvr-stalker/Config.in | 4 ++++
 package/sysdig/Config.in           | 4 ++++
 7 files changed, 29 insertions(+)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 6f04a4a..4ba844a 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64)) # jsoncpp
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
 	depends on BR2_USE_WCHAR # libarchive
@@ -38,3 +39,6 @@ comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "ctest needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
diff --git a/package/jsoncpp/Config.in b/package/jsoncpp/Config.in
index 83118c4..a29e569 100644
--- a/package/jsoncpp/Config.in
+++ b/package/jsoncpp/Config.in
@@ -1,4 +1,6 @@
 config BR2_PACKAGE_JSONCPP
+	# posix_memalign is incompatible with musl for C++ on x86
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	bool "jsoncpp"
@@ -13,3 +15,6 @@ config BR2_PACKAGE_JSONCPP
 
 comment "jsoncpp needs a toolchain w/ C++, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "jsoncpp needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
index 247d83c..c9b74e0 100644
--- a/package/kodi-pvr-argustv/Config.in
+++ b/package/kodi-pvr-argustv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_ARGUSTV
 	bool "kodi-pvr-argustv"
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64)) # jsoncpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
@@ -10,3 +11,6 @@ config BR2_PACKAGE_KODI_PVR_ARGUSTV
 
 comment "kodi-pvr-argustv needs a toolchain w/ gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "kodi-pvr-argustv needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
index 3d87ec8..a6e2a7d 100644
--- a/package/kodi-pvr-filmon/Config.in
+++ b/package/kodi-pvr-filmon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_FILMON
 	bool "kodi-pvr-filmon"
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64)) # jsoncpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
@@ -10,3 +11,6 @@ config BR2_PACKAGE_KODI_PVR_FILMON
 
 comment "kodi-pvr-filmon needs a toolchain w/ gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "kodi-pvr-filmon needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
index 1bef551..bd32349 100644
--- a/package/kodi-pvr-pctv/Config.in
+++ b/package/kodi-pvr-pctv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_PCTV
 	bool "kodi-pvr-pctv"
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64)) # jsoncpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
@@ -10,3 +11,6 @@ config BR2_PACKAGE_KODI_PVR_PCTV
 
 comment "kodi-pvr-pctv needs a toolchain w/ gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "kodi-pvr-pctv needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
index 26a8c3f..1d570cd 100644
--- a/package/kodi-pvr-stalker/Config.in
+++ b/package/kodi-pvr-stalker/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_STALKER
 	bool "kodi-pvr-stalker"
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64)) # jsoncpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
@@ -10,3 +11,6 @@ config BR2_PACKAGE_KODI_PVR_STALKER
 
 comment "kodi-pvr-stalker needs a toolchain w/ gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+comment "kodi-pvr-stalker needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index dc71d5f..c1908b5 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSDIG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_JSONCPP
+	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64)) # jsoncpp
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
@@ -19,3 +20,6 @@ config BR2_PACKAGE_SYSDIG
 comment "sysdig needs a toolchain w/ C++, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+
+comment "sysdig needs a (e)glibc or uClibc toolchain w/ C++ on x86"
+	depends on (BR2_TOOLCHAIN_USES_MUSL && (BR2_i386 || BR2_x86_64))
-- 
2.6.1
