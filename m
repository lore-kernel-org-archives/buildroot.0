From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:38:45 +0100
Subject: [Buildroot] [PATCH] package/luajit: switch to moonjit fork
Message-ID: <20191204083845.6319-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this fork is based on LuaJIT 2.1.0-beta3 which supports ARM64

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/0001-no-bin-symlink.patch | 4 ++--
 package/luajit/0002-install-inc.patch    | 2 +-
 package/luajit/Config.in                 | 4 ++--
 package/luajit/luajit.hash               | 6 +++---
 package/luajit/luajit.mk                 | 5 ++---
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index dd1dfd89f..d32ec5ad6 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -43,8 +43,7 @@
+@@ -44,8 +44,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -59,7 +58,6 @@
+@@ -60,7 +59,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 86b766dfc..5f6547fc3 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -32,7 +32,7 @@
+@@ -33,7 +33,7 @@
  INSTALL_BIN=   $(DPREFIX)/bin
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 88c5bcbf2..f4d600158 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || \
 		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
-		BR2_powerpc || BR2_arm || BR2_armeb || \
+		BR2_powerpc || BR2_arm || BR2_armeb || BR2_aarch64 || \
 		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
 		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
 	# -m32 flag is used for 32bit builds and host-luajit has
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LUAJIT
 	  ABI-compatible to the standard Lua interpreter and can be
 	  deployed as a drop-in replacement.
 
-	  http://luajit.org/
+	  https://github.com/moonjit/moonjit
 
 if BR2_PACKAGE_LUAJIT
 
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 7e2d87ebb..532ec0b29 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://luajit.org/download.html
-md5 48353202cbcacab84ee41a5a70ea0a2c    LuaJIT-2.0.5.tar.gz
+# Locally calculated
+sha256 c3de8e29aa617fc594c043f57636ab9ad71af2b4a3a513932b05f5cdaa4320b2  luajit-2.1.2.tar.gz
 
 # Locally calculated
-sha256 accb335aa3102f80d31caa2c2508fbcb795314106493519a367f13a87d0e87de  COPYRIGHT
+sha256 aa64a7706ded773011b933f4230d7b35ba662598197f82ac2c7bca62abdaa4d7  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 5b08a42d9..68e6af4f5 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.0.5
-LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
-LUAJIT_SITE = http://luajit.org/download
+LUAJIT_VERSION = 2.1.2
+LUAJIT_SITE = $(call github,moonjit,moonjit,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 
-- 
2.20.1
