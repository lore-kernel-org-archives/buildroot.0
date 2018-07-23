From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Jul 2018 19:43:45 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: bump to version 0.30
Message-ID: <20180723174345.29552-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since this version, ncmpc depends on C++14:
https://github.com/MusicPlayerDaemon/ncmpc/commit/aea91692b05e7c2cd2e1b09cf10b0196e3527807

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/Config.in  | 7 +++++--
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 324d8f7c2a..d22ea368b4 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_NCMPC
 	bool "ncmpc"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
@@ -13,6 +15,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ wchar, threads"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 0e9a4a903c..021b532c83 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 ef68a9b67172383ea80ee46579015109433fa058728812d2b0ebede660d85f12  ncmpc-0.29.tar.xz
+sha256 e3fe0cb58b8a77f63fb1645c2f974b334f1614efdc834ec698ee7d861f1b12a3  ncmpc-0.30.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index d70ed46ea9..296fce12d2 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).29
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).30
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
-- 
2.14.1
