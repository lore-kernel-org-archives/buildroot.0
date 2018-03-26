From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 26 Mar 2018 12:34:05 -0700
Subject: [Buildroot] [PATCH v2] Config.in: add -Ofast option
Message-ID: <1522092845-9842-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-Ofast (introduced in GCC 4.6) It combines the existing optimization level -O3
with options that can affect standards compliance but result in better optimized
code. For example, -Ofast enables -ffast-math.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

---

v2:
- Add proper depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
---
 Config.in           | 10 ++++++++++
 package/Makefile.in |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Config.in b/Config.in
index 0002df5..145f915 100644
--- a/Config.in
+++ b/Config.in
@@ -527,6 +527,16 @@ config BR2_OPTIMIZE_S
 	  -ftree-vect-loop-version
 	  This is the default.
 
+config BR2_OPTIMIZE_FAST
+	bool "optimize for fast"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	help
+	  Optimize for fast. Disregard strict standards compliance. -Ofast
+	  enables all -O3 optimizations. It also enables optimizations that are
+	  not valid for all standard-compliant programs. It turns on -ffast-math
+	  and the Fortran-specific -fstack-arrays, unless -fmax-stack-var-size
+	  is specified, and -fno-protect-parens.
+
 endchoice
 
 config BR2_GOOGLE_BREAKPAD_ENABLE
diff --git a/package/Makefile.in b/package/Makefile.in
index e387ce6..828e12e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -128,6 +128,9 @@ endif
 ifeq ($(BR2_OPTIMIZE_S),y)
 TARGET_OPTIMIZATION = -Os
 endif
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+TARGET_OPTIMIZATION = -Ofast
+endif
 ifeq ($(BR2_DEBUG_1),y)
 TARGET_DEBUGGING = -g1
 endif
-- 
2.7.4
