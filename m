From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 23:17:52 +0200
Subject: [Buildroot] [git commit branch/next] Config.in: add -Og option
Message-ID: <20160524213034.DDFEC805CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ff845927b3559d29f0b9d751e1ac6106201d4c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

-Og (introduced in GCC 4.8) lets you optimize for debugging experience,
which can be useful for when you want optimized code that is nonetheless
debuggable.

Signed-off-by: Martin Kelly <martin@surround.io>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in           | 10 ++++++++++
 package/Makefile.in |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Config.in b/Config.in
index b8e5d18..4b48c00 100644
--- a/Config.in
+++ b/Config.in
@@ -512,6 +512,16 @@ config BR2_OPTIMIZE_3
 	  and also turns on the -finline-functions, -funswitch-loops and
 	  -fgcse-after-reload options.
 
+config BR2_OPTIMIZE_G
+	bool "optimize for debugging"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  Optimize for debugging. This enables optimizations that do not
+	  interfere with debugging. It should be the optimization level of
+	  choice for the standard edit-compile-debug cycle, offering a
+	  reasonable level of optimization while maintaining fast compilation
+	  and a good debugging experience.
+
 config BR2_OPTIMIZE_S
 	bool "optimize for size"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index 616bdd0..2d454a6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -122,6 +122,9 @@ endif
 ifeq ($(BR2_OPTIMIZE_3),y)
 TARGET_OPTIMIZATION = -O3
 endif
+ifeq ($(BR2_OPTIMIZE_G),y)
+TARGET_OPTIMIZATION = -Og
+endif
 ifeq ($(BR2_OPTIMIZE_S),y)
 TARGET_OPTIMIZATION = -Os
 endif
