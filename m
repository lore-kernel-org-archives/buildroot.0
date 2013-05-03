From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 3 May 2013 18:39:37 +0800
Subject: [Buildroot] [PATCH v7 4/7] arch: toolchain: Introduce binary format
	FLAT types.
In-Reply-To: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
References: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1367577580-3518-4-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Just introduce the symbol and options in arch generic Config.in.
Add FLAT types specific compiling flags into package makefile.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

v5-change:
- Move FLAT types specific compiling flags back to package makefile.
The flags can't be set to compile Linux kernel.

v3-changes:
- Add dependancy to bfin and m68k
- Add help text for FLAT binary types.
- Split shared flat flags.
---
 arch/Config.in      |   26 ++++++++++++++++++++++++++
 package/Makefile.in |   11 +++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 175add5..3ffe82e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -211,6 +211,32 @@ config BR2_BINFMT_FLAT
 
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
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
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
-- 
1.7.0.4
