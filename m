From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:26:57 +0200
Subject: [Buildroot] [git commit] package/nanocom: fix build with gcc 10
Message-ID: <20200905211900.03B037F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f2b3a7149edc6579b5a06eae0773d5d3b8cdcb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4af4710cb9bbb1bc770b9824339dd7dbf8a80b05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nanocom/0001-fix-build-with-gcc-10.patch | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/nanocom/0001-fix-build-with-gcc-10.patch b/package/nanocom/0001-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..8fcc546523
--- /dev/null
+++ b/package/nanocom/0001-fix-build-with-gcc-10.patch
@@ -0,0 +1,36 @@
+fix build with gcc 10
+
+Define curr_state as extern in nanocom.h to avoid the following build
+failure with gcc 10 (which defaults to -fno-common):
+
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /tmp/ccLQeiek.o:(.bss+0x7c): multiple definition of `curr_state'; /tmp/ccse155z.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4af4710cb9bbb1bc770b9824339dd7dbf8a80b05
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naurp nanocom-1.0.orig/nanocom.c nanocom-1.0/nanocom.c
+--- nanocom-1.0.orig/nanocom.c	2020-09-04 14:50:15.973320870 +0200
++++ nanocom-1.0/nanocom.c	2020-09-04 14:53:49.429325087 +0200
+@@ -20,6 +20,8 @@ Based upon microcom by Anca and Lucian J
+ 
+ #include "nanocom.h"
+ 
++state curr_state;
++
+ int crnl_mapping; //0 - no mapping, 1 mapping
+ 
+ char device[MAX_DEVICE_NAME]; /* serial device name */
+diff -Naurp nanocom-1.0.orig/nanocom.h nanocom-1.0/nanocom.h
+--- nanocom-1.0.orig/nanocom.h	2020-09-04 14:50:15.973320870 +0200
++++ nanocom-1.0/nanocom.h	2020-09-04 14:51:12.269321982 +0200
+@@ -73,7 +73,7 @@ typedef struct {
+     char echo_type; /*r for remote, l for local and n for none*/
+ } state;
+ 
+-state curr_state;
++extern state curr_state;
+    
+ #endif /* NANOCOM_H */
+ 
