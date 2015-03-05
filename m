From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  5 Mar 2015 22:06:13 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: re-add the patch for gcc < 4.4
Message-ID: <1425589573-14625-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch 0002-Fix-compiler-warning-flags.patch was
removed when the avr32 architecture was removed.
But it's still needed for blackfin adi-toolchain 2014R1.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../dvb-apps/0002-Fix-compiler-warning-flags.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch

diff --git a/package/dvb-apps/0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
new file mode 100644
index 0000000..9c6276b
--- /dev/null
+++ b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
@@ -0,0 +1,44 @@
+From 9b8f1df41f7579da63c27763ff184d351e4c7fef Mon Sep 17 00:00:00 2001
+From: Simon Dawson <spdawson@gmail.com>
+Date: Sun, 4 Jan 2015 12:06:18 +0100
+Subject: [PATCH] Fix compiler warning flags
+
+  When building for bfin, the build fails as follows.
+
+  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"
+
+An example of an autobuild failure arising from this is the following.
+
+  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/
+  http://autobuild.buildroot.net/results/6e7/6e7b48ad9768349d983985c3067c4267cde80541/
+
+Clearly, not all toolchains provide a gcc that understands
+the -Wno-packed-bitfield-compat flag; remove usage of this flag.
+
+Wno-packed-bitfield-compat option was added in gcc 4.4.
+
+[Romain:
+  - This patch is also needed for bfin toolchains which use gcc 4.3.5
+  - Add a link to bfin build failure]
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ util/scan/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/scan/Makefile b/util/scan/Makefile
+index d48c478..88667c5 100644
+--- a/util/scan/Makefile
++++ b/util/scan/Makefile
+@@ -14,7 +14,7 @@ inst_bin = $(binaries)
+ 
+ removing = atsc_psip_section.c atsc_psip_section.h
+ 
+-CPPFLAGS += -Wno-packed-bitfield-compat -D__KERNEL_STRICT_NAMES
++CPPFLAGS += -D__KERNEL_STRICT_NAMES
+ 
+ .PHONY: all
+ 
+-- 
+1.9.3
+
-- 
1.9.3
