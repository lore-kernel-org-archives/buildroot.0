From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun,  6 Aug 2017 11:52:28 -0300
Subject: [Buildroot] [PATCH v2] package/stella: bump version to 5.0.1
Message-ID: <1502031148-14106-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch, since
stella now uses -std=c++14 that builds fine when using PPC altivec
vectorization.

Update toolchain dependencies to gcc 4.9 since codebase now uses C++14 features.

Fixes:
http://autobuild.buildroot.net/results/0e787fd27537e1ff84a76bf71121048596d808a1/

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---

Changes v1 -> v2 (as reviewed by Baruch Siach)
- using upstream tarball release
- update toolchain dependencies to gcc 4.9

---
 .../0001-Add-cross-compilation-support.patch       | 10 +++----
 .../stella/0002-Do-not-strip-when-installing.patch |  8 ++---
 ...-gnu-11-standard-to-prevent-errors-on-PPC.patch | 35 ----------------------
 package/stella/Config.in                           |  6 ++--
 package/stella/stella.hash                         |  2 +-
 package/stella/stella.mk                           |  4 +--
 6 files changed, 15 insertions(+), 50 deletions(-)
 delete mode 100644 package/stella/0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch

diff --git a/package/stella/0001-Add-cross-compilation-support.patch b/package/stella/0001-Add-cross-compilation-support.patch
index 3266d31d26de..1aefd86cf43b 100644
--- a/package/stella/0001-Add-cross-compilation-support.patch
+++ b/package/stella/0001-Add-cross-compilation-support.patch
@@ -1,6 +1,6 @@
-From fba2627bebc7d497f64827a0517316e9b5c64c0a Mon Sep 17 00:00:00 2001
+From ef1cffc526d3cf9562d50efbf8addc2aa4c06b52 Mon Sep 17 00:00:00 2001
 From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Tue, 26 Jul 2016 13:24:00 -0300
+Date: Sun, 30 Jul 2017 18:23:23 -0300
 Subject: [PATCH 1/2] Add cross-compilation support
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
@@ -9,10 +9,10 @@ Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 0d90a4f0acde..a4afea8e1880 100755
+index c2f304729651..b05321aac3da 100755
 --- a/configure
 +++ b/configure
-@@ -502,8 +502,9 @@ if test -n "$_host"; then
+@@ -499,8 +499,9 @@ if test -n "$_host"; then
  			_host_os=win32
  			;;
  		*)
@@ -23,7 +23,7 @@ index 0d90a4f0acde..a4afea8e1880 100755
 +			_host_os=unix
  			;;
  	esac
- 	
+ 
 -- 
 1.9.1
 
diff --git a/package/stella/0002-Do-not-strip-when-installing.patch b/package/stella/0002-Do-not-strip-when-installing.patch
index cba4b088fde0..8a95a81a5ac2 100644
--- a/package/stella/0002-Do-not-strip-when-installing.patch
+++ b/package/stella/0002-Do-not-strip-when-installing.patch
@@ -1,6 +1,6 @@
-From a86140353cb2e162d88da9caa1716915be2f6893 Mon Sep 17 00:00:00 2001
+From d506a586b299682a425d3c3de68baefb7221fa9a Mon Sep 17 00:00:00 2001
 From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Tue, 26 Jul 2016 13:25:12 -0300
+Date: Sun, 30 Jul 2017 18:25:12 -0300
 Subject: [PATCH 2/2] Do not strip when installing
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
@@ -9,10 +9,10 @@ Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 6dd0129587b3..b1aea5eed4a1 100644
+index 346640e53bea..fedaed05a4d6 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -172,7 +172,7 @@ config.mak: $(srcdir)/configure
+@@ -173,7 +173,7 @@ config.mak: $(srcdir)/configure
  
  install: all
  	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
diff --git a/package/stella/0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch b/package/stella/0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
deleted file mode 100644
index 76d12a2cdd93..000000000000
--- a/package/stella/0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6946a491cae42b971aad3bc5d822e0e549eca8bd Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Thu, 1 Dec 2016 15:20:33 -0200
-Subject: [PATCH] Use gnu++11 standard to prevent errors on PPC.
-
-PPC altivec vectorization triggers a bug when compiling with -std=c++11
-because "bool" is redefined in altivec.h.
-
-Acording to a bug report in GCC, "You need to use -std=g++11 or
-undefine bool after the include of altivec.h as context sensitive
-keywords is not part of the C++11 standard".
-
-So let's use gnu++11 standard.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 6dd0129587b3..6ed50ea4c335 100644
---- a/Makefile
-+++ b/Makefile
-@@ -51,7 +51,7 @@ else
- endif
- CXXFLAGS+= -Wall -Wextra -Wno-unused-parameter -Wno-ignored-qualifiers
- ifdef HAVE_GCC
--  CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=c++11
-+  CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=gnu++11
- endif
- 
- ifdef PROFILE
--- 
-1.9.1
-
diff --git a/package/stella/Config.in b/package/stella/Config.in
index 4c10983a3eb2..959169726f37 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_STELLA
 	bool "stella"
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
@@ -11,6 +11,6 @@ config BR2_PACKAGE_STELLA
 
 	  https://stella-emu.github.io/
 
-comment "stella needs a toolchain w/ dynamic library, C++, gcc >= 4.8"
+comment "stella needs a toolchain w/ dynamic library, C++, gcc >= 4.9"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index e6f146fd9345..15e75c1e82c3 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 93a75d1b343b1e66b6dc526c0f9d8a0c3678d346033f7cdfe76dc93f14d956ad  stella-4.7.3-src.tar.xz
+sha256 34ff90b60a4d277ada2815c4d65eda18c87371d0fb15e872b8ac82aac3e0b07a  stella-5.0.1-src.tar.xz
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index e610a9bdfd6f..7f4e45ea1f9d 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-STELLA_VERSION = 4.7.3
+STELLA_VERSION = 5.0.1
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
-STELLA_SITE = https://github.com/stella-emu/stella/releases/download/release-$(STELLA_VERSION)
+STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
-- 
1.9.1
