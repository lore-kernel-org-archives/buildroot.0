From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Feb 2018 22:48:15 +0100
Subject: [Buildroot] [PATCH 1/4] package/gdb: bump to version 8.1
Message-ID: <20180204214818.9869-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new option to handle the new libmpfr dependency.

https://sourceware.org/ml/gdb-announce/2018/msg00001.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gdb/Config.in.host | 8 ++++++++
 package/gdb/gdb.hash       | 1 +
 package/gdb/gdb.mk         | 9 +++++++++
 3 files changed, 18 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 99e1cae5ba..86f5953a7a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,6 +67,13 @@ config BR2_GDB_VERSION_8_0
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
+config BR2_GDB_VERSION_8_1
+	bool "gdb 8.1.x"
+	# Needs a C++11 compiler
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endchoice
 
 endif
@@ -79,4 +86,5 @@ config BR2_GDB_VERSION
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
 	default "8.0.1"    if BR2_GDB_VERSION_8_0
+	default "8.1"      if BR2_GDB_VERSION_8_1
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 62edd93792..3af72db23d 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,6 +3,7 @@ sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe5049
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
+sha512  ffd82f415d7652d62dad1716c307836f594217a363429609beb7d70239e8bf06b73b393345b0e000796228e56681ed7656ac3c8be05e91d6d652ab0d5b1dc357	gdb-8.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  e57582766e7d510b26bea63606429e6289414c31c60e28fef24d3d82fa20fb5a1f92b3831fde53e4f7c178c9e099609d3292628cf921a99109e297af4e5f83d9 	gdb-arc-2017.09-release-gdb.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 5ca464ad46..718948fc61 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -164,6 +164,15 @@ else
 GDB_CONF_OPTS += --without-zlib
 endif
 
+# mpfr dependency has been added in gdb 8.1
+ifeq ($(BR2_GDB_VERSION_8_1)$(BR2_PACKAGE_MPFR),yy)
+GDB_DEPENDENCIES += mpfr
+HOST_GDB_DEPENDENCIES += host-mpfr
+GDB_CONF_OPTS += --with-mpfr
+else
+GDB_CONF_OPTS += --without-mpfr
+endif
+
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
 define GDB_REMOVE_UNNEEDED_FILES
-- 
2.14.3
