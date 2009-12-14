From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] Use BR2_TOOLCHAIN_BUILDROOT instead
	of BR2_TOOLCHAIN_SOURCE
Message-ID: <20091214232059.A9EDC77796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc994c533cdac1ab843a889c4afaae80234cc6b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_TOOLCHAIN_SOURCE option is removed in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                        |    4 ++--
 package/Makefile.in             |    4 ++--
 target/Config.in                |    2 +-
 toolchain/Config.in.1           |    2 +-
 toolchain/Config.in.2           |    6 +++---
 toolchain/gcc/gcc-uclibc-3.x.mk |    2 +-
 toolchain/uClibc/uclibc.mk      |    2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 5b71051..051b661 100644
--- a/Makefile
+++ b/Makefile
@@ -197,7 +197,7 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 # along with the packages to build for the target.
 #
 ##############################################################
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else
 BASE_TARGETS:=uclibc
@@ -289,7 +289,7 @@ include .config.cmd
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 # avoid pulling in external toolchain which is broken for toplvl parallel builds
 # Explicit ordering:
 include toolchain/dependencies/dependencies.mk
diff --git a/package/Makefile.in b/package/Makefile.in
index 7c009bb..25dd6da 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -36,7 +36,7 @@ endif
 
 
 #########################################################################
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
@@ -105,7 +105,7 @@ XXXX=xxxx
 ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
 endif
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
diff --git a/target/Config.in b/target/Config.in
index ab46dcb..4cae66c 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -74,7 +74,7 @@ config BR2_KERNEL_LINUX_ADVANCED
 # The kernel with the same version as linux headers cannot be compiled
 # when using an external toolchain, because the linux headers are not
 # handled by Buildroot in this case.
-if BR2_TOOLCHAIN_SOURCE
+if BR2_TOOLCHAIN_BUILDROOT
 
 config BR2_KERNEL_LINUX
 	bool "linux (Same version as linux headers)"
diff --git a/toolchain/Config.in.1 b/toolchain/Config.in.1
index 83bc710..5c26858 100644
--- a/toolchain/Config.in.1
+++ b/toolchain/Config.in.1
@@ -1,6 +1,6 @@
 #
 
-if BR2_TOOLCHAIN_SOURCE
+if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 2f7de75..6317ff4 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -37,7 +37,7 @@ config BR2_ENABLE_LOCALE
 
 config BR2_ENABLE_LOCALE_PREGENERATED
 	bool "Use pregenerated locale data?"
-	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_SOURCE && BROKEN # tarball missing
+	depends on BR2_ENABLE_LOCALE && BR2_TOOLCHAIN_BUILDROOT && BROKEN # tarball missing
 	help
 	  Instead of generating the locale data locally you can optionally
 	  download a pregenerated set of locales.
@@ -142,7 +142,7 @@ config BR2_GCC_CROSS_CXX
 
 config BR2_INSTALL_LIBSTDCPP
 	bool "Build/install c++ compiler and libstdc++?"
-	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT && BR2_TOOLCHAIN_SOURCE)
+	select BR2_LARGEFILE if (!BR2_GCC_SUPPORTS_SYSROOT && BR2_TOOLCHAIN_BUILDROOT)
 	select BR2_GCC_CROSS_CXX
 	help
 	  If you are building your own toolchain and want to build and install
@@ -157,7 +157,7 @@ config BR2_TARGET_OPTIMIZATION
 	help
 	  Optimizations to use when building for the target host.
 
-if BR2_TOOLCHAIN_SOURCE
+if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
 source "toolchain/sstrip/Config.in"
diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index 0af3f38..332af88 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -17,7 +17,7 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
 # without sysroot support. Sysroot toolchain is gcc-uclibc-4.x.mk
 ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 79d272f..f742d4e 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
-- 
1.6.3.3
