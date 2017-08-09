From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:34:50 +0200
Subject: [Buildroot] [git commit branch/next] package/stella: bump version
	to 5.0.1
Message-ID: <20170809225752.EA88A807A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=583432b94b9e82ed541fef8138da09ebb5340448
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed 0003-Use-gnu-11-standard-to-prevent-errors-on-PPC.patch, since
stella now uses -std=c++14 that builds fine when using PPC altivec
vectorization.

Removed 0004-gcc7.patch, backported from upstream.

Update toolchain dependencies to gcc 4.9 since codebase now uses C++14 features.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Arnout: also remove 0004-gcc7.patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Add-cross-compilation-support.patch       | 10 +++----
 .../stella/0002-Do-not-strip-when-installing.patch |  8 ++---
 ...-gnu-11-standard-to-prevent-errors-on-PPC.patch | 35 ----------------------
 package/stella/0004-gcc7.patch                     | 23 --------------
 package/stella/Config.in                           |  6 ++--
 package/stella/stella.hash                         |  2 +-
 package/stella/stella.mk                           |  4 +--
 7 files changed, 15 insertions(+), 73 deletions(-)

diff --git a/package/stella/0001-Add-cross-compilation-support.patch b/package/stella/0001-Add-cross-compilation-support.patch
index 3266d31..1aefd86 100644
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
index cba4b08..8a95a81 100644
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
index 76d12a2..0000000
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
diff --git a/package/stella/0004-gcc7.patch b/package/stella/0004-gcc7.patch
deleted file mode 100644
index 979682d..0000000
--- a/package/stella/0004-gcc7.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From fb6e573263b7fb80a12d0eb74d22e13899f745ee Mon Sep 17 00:00:00 2001
-From: Stephen Anthony <sa666666@gmail.com>
-Date: Mon, 17 Apr 2017 18:52:04 -0230
-Subject: [PATCH] Update UNIX configure script for gcc7 and above.
-
-Backported from upstream commit:
-https://github.com/stella-emu/stella/commit/fb6e573263b7fb80a12d0eb74d22e13899f745ee
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/configure b/configure
-index 94b91ef9..b1218e9f 100755
---- a/configure
-+++ b/configure
-@@ -417,7 +417,7 @@ elif test "$have_gcc" = yes; then
- 	fi
- 
- 	case $cxx_version in
--		4.[7-9]|4.[7-9].[0-9]|4.[7-9].[0-9][-.]*|[5-6].[0-9]|[5-6].[0-9].[0-9]|[5-6].[0-9].[0-9][-.]*)
-+		4.[7-9]|4.[7-9].[0-9]|4.[7-9].[0-9][-.]*|[5-9]|[5-9].[0-9]|[5-9].[0-9].[0-9]|[5-9].[0-9].[0-9][-.]*)
- 			_cxx_major=`echo $cxx_version | cut -d '.' -f 1`
- 			_cxx_minor=`echo $cxx_version | cut -d '.' -f 2`
- 			cxx_version="$cxx_version, ok"
diff --git a/package/stella/Config.in b/package/stella/Config.in
index 4c10983..9591697 100644
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
index e6f146f..15e75c1 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 93a75d1b343b1e66b6dc526c0f9d8a0c3678d346033f7cdfe76dc93f14d956ad  stella-4.7.3-src.tar.xz
+sha256 34ff90b60a4d277ada2815c4d65eda18c87371d0fb15e872b8ac82aac3e0b07a  stella-5.0.1-src.tar.xz
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index e610a9b..7f4e45e 100644
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
 
