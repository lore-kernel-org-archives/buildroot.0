From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:19:24 +0200
Subject: [Buildroot] [git commit] gcc: rename option for ARC gcc
Message-ID: <20160920192304.2487781D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50332a530b1b87095f6f3bffb3db2c1b4187fe49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARC gcc version is now based on gcc 6.x and no longer gcc 4.8.x,
which makes the option BR2_GCC_VERSION_4_8_ARC a bit irrelevant, as is
the prompt of this option.

This commit therefore renames this option to BR2_GCC_VERSION_ARC, and
adjust its prompt as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                       |  8 ++++++++
 package/gcc/Config.in.host             | 10 +++++-----
 package/gcc/gcc-initial/gcc-initial.mk |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8957be7..5914718 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_GCC_VERSION_4_8_ARC
+	bool "gcc arc option renamed"
+	select BR2_LEGACY
+	select BR2_GCC_VERSION_ARC
+	help
+	  The option that selects the gcc version for the ARC
+	  architecture has been renamed to BR2_GCC_VERSION_ARC.
+
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
 	select BR2_KERNEL_HEADERS_3_18
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 134b16c..3460fdd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -8,7 +8,7 @@ config BR2_GCC_SUPPORTS_GRAPHITE
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
+	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X
 	help
 	  Select the version of gcc you wish to use.
@@ -56,12 +56,12 @@ choice
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
-	config BR2_GCC_VERSION_4_8_ARC
-		bool "gcc 4.8-arc"
+	config BR2_GCC_VERSION_ARC
+		bool "gcc arc (6.x)"
 		# Only supported architecture
 		depends on BR2_arc
 		select BR2_GCC_NEEDS_MPC
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 
 	config BR2_GCC_VERSION_4_9_X
@@ -121,7 +121,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.2.0"     if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng013" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.09-eng013" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1e58d8b..aa88a68 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -29,7 +29,7 @@ HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 # available (--with-newlib is passed, and therefore inhibit_libc is
 # defined), it tries to use the C library for the libgmon
 # library. Since it's not needed in gcc-initial, we disabled it here.
-ifeq ($(BR2_GCC_VERSION_4_8_ARC),y)
+ifeq ($(BR2_GCC_VERSION_ARC),y)
 define HOST_GCC_INITIAL_DISABLE_LIBGMON
 	$(SED) 's/crtbeginS.o libgmon.a crtg.o/crtbeginS.o crtg.o/' \
 		$(@D)/libgcc/config.host
