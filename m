From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 23:19:27 +0100
Subject: [Buildroot] [git commit] lua-periphery: fix build on Sparc/Sparc64
Message-ID: <20151116222014.76A09819BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f2cd8f5ecd7d035f00664c604fd8bfd5f1afcb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch similar to the one for c-periphery fixing the build on
Sparc and Sparc64 caused by unsupported high baudrates on this
architecture.

Fixes:

  http://autobuild.buildroot.org/results/c2f/c2fd64ed2f17c53a4704284a8281305f97a48169/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lua-periphery/0002-Fix-build-on-SPARC.patch    |   60 ++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/lua-periphery/0002-Fix-build-on-SPARC.patch b/package/lua-periphery/0002-Fix-build-on-SPARC.patch
new file mode 100644
index 0000000..ce461dd
--- /dev/null
+++ b/package/lua-periphery/0002-Fix-build-on-SPARC.patch
@@ -0,0 +1,60 @@
+[PATCH] Fix build on SPARC
+
+On SPARC, the definitions of B2500000, B3000000, B3500000 and B4000000
+are not necessarily available, so use those values only if defined in
+the kernel headers.
+
+It fixes SPARC build failures such as:
+
+src/serial.c: In function '_serial_baudrate_to_bits':
+src/serial.c:73:30: error: 'B2500000' undeclared (first use in this function)
+         case 2500000: return B2500000;
+                              ^
+src/serial.c:73:30: note: each undeclared identifier is reported only once for each function it appears in
+src/serial.c:74:30: error: 'B3000000' undeclared (first use in this function)
+         case 3000000: return B3000000;
+                              ^
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/lua-periphery/c-periphery/src/serial.c
+===================================================================
+--- a/lua-periphery/c-periphery/src/serial.c
++++ b/lua-periphery/c-periphery/src/serial.c
+@@ -70,10 +70,18 @@
+         case 1152000: return B1152000;
+         case 1500000: return B1500000;
+         case 2000000: return B2000000;
++#ifdef B2500000
+         case 2500000: return B2500000;
++#endif
++#ifdef B3000000
+         case 3000000: return B3000000;
++#endif
++#ifdef B3500000
+         case 3500000: return B3500000;
++#endif
++#ifdef B4000000
+         case 4000000: return B4000000;
++#endif
+         default: return -1;
+     }
+ }
+@@ -107,10 +115,18 @@
+         case B1152000: return 1152000;
+         case B1500000: return 1500000;
+         case B2000000: return 2000000;
++#ifdef B2500000
+         case B2500000: return 2500000;
++#endif
++#ifdef B3000000
+         case B3000000: return 3000000;
++#endif
++#ifdef B3500000
+         case B3500000: return 3500000;
++#endif
++#ifdef B4000000
+         case B4000000: return 4000000;
++#endif
+         default: return -1;
+     }
+ }
