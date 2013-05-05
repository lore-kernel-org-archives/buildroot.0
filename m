From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:54:37 +0200
Subject: [Buildroot] [git commit] arch: toolchain: Introduce binary format
	FLAT types.
Message-ID: <20130505205713.6AD9A99B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57c05432917de3b9aec293d713acafde01ac9b07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just introduce the symbol and options in arch generic Config.in.
Add FLAT types specific compiling flags into package makefile.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in      |   26 ++++++++++++++++++++++++++
 package/Makefile.in |   11 +++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index fa9dad3..5ca05cd 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -226,6 +226,32 @@ config BR2_BINFMT_FLAT
 
 endchoice
 
+# Set up flat binary type
+choice
+	prompt "FLAT Binary type"
+	depends on BR2_BINFMT_FLAT
+	default BR2_BINFMT_FLAT_ONE
+
+config BR2_BINFMT_FLAT_ONE
+	bool "One memory region"
+	help
+	  All segments are linked into one memory region.
+
+config BR2_BINFMT_FLAT_SEP_DATA
+	bool "Separate data and code region"
+	depends on BR2_bfin || BR2_m68k
+	help
+	  Allow for the data and text segments to be separated and placed in
+	  different regions of memory.
+
+config BR2_BINFMT_FLAT_SHARED
+	bool "Shared binary"
+	depends on BR2_bfin || BR2_m68k
+	help
+	  Allow to load and link indiviual FLAT binaries at run time.
+
+endchoice
+
 if BR2_arcle || BR2_arceb
 source "arch/Config.in.arc"
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index a8bf36b..dd3bc7d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,6 +103,17 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
+TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
+TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
+endif
+ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
+TARGET_LDFLAGS += -msep-data
+TARGET_CFLAGS += -msep-data
+TARGET_CXXFLAGS += -msep-data
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
