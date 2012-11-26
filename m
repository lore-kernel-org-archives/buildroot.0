From: Chris Zankel <chris@zankel.net>
Date: Mon, 26 Nov 2012 13:57:38 -0800
Subject: [Buildroot] [PATCH 1/2] xtensa: add config option to enable
	longcalls option
Message-ID: <50b40b44.c9d4440a.12ab.ffffdc54@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The longcalls option allows calls across a greater range of addresses.

This option should be used when call targets can potentially be
out of range. It may degrade both code size and performance, but
the linker can generally optimize away the unnecessary overhead
when a call ends up within range.

This option is enabled by default.

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 arch/Config.in.xtensa |   17 +++++++++++++++++
 package/Makefile.in   |    6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 60c03f5..2ab553e 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -35,3 +35,20 @@ config BR2_XTENSA_OVERLAY_DIR
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
+
+menu "Target build options"
+
+config BR2_XTENSA_LONGCALLS
+	bool "Enable longcalls option"
+	default y
+	help
+	  Enable or disable transformation of call instructions to allow
+	  calls across a greater range of addresses.
+          This option should be used when call targets can potentially be
+	  out of range. It may degrade both code size and performance, but
+	  the linker can generally optimize away the unnecessary overhead
+	  when a call ends up within range. 
+
+	  Should be enabled by default.
+
+endmenu
diff --git a/package/Makefile.in b/package/Makefile.in
index 9fdc745..6a35126 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -56,6 +56,12 @@ TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
+# Xtensa: The 'longcalls' option is required for large binary packages.
+# Use a global option for all packages for now.
+ifeq ($(BR2_XTENSA_LONGCALLS),y)
+TARGET_CPPFLAGS += -mlongcalls
+endif
+
 STAGING_DIR=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot
 
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-- 
1.7.9.5
