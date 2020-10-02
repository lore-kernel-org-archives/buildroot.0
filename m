From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:05:21 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/read-edid: fix
 build with gcc 10
Message-ID: <20201002082506.CC3428E6B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1399c9d85bff61a4dadb75779927d7e6d29c7b8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/28bde8049b6610273bceae26eca407c819a37dcd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6ecad89a450eba790404ea25977a2e03129b6a81)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/read-edid/0003-fix-build-with-gcc-10.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/read-edid/0003-fix-build-with-gcc-10.patch b/package/read-edid/0003-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..713b09aa8d
--- /dev/null
+++ b/package/read-edid/0003-fix-build-with-gcc-10.patch
@@ -0,0 +1,49 @@
+fix build with gcc 10
+
+Define quiet as static to avoid the following build failure with gcc 10
+(which defaults to -fno-common):
+
+/home/naourr/work/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: CMakeFiles/get-edid.dir/i2c.c.o:(.bss+0x0): multiple definition of `quiet'; CMakeFiles/get-edid.dir/get-edid.c.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/28bde8049b6610273bceae26eca407c819a37dcd
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to pyrophobicman at gmail.com]
+
+diff -Nura read-edid-3.0.2.orig/get-edid/classic.c read-edid-3.0.2/get-edid/classic.c
+--- read-edid-3.0.2.orig/get-edid/classic.c	2020-09-25 23:25:01.928805414 +0200
++++ read-edid-3.0.2/get-edid/classic.c	2020-09-25 23:26:37.440807301 +0200
+@@ -26,7 +26,7 @@
+ #define dosmemput(buffer,length,offset) memcpy(offset,buffer,length)
+ 
+ #define display(...) if (quiet == 0) { fprintf(stderr, __VA_ARGS__); }
+-int quiet;
++static int quiet;
+ 
+ real_ptr far_ptr_to_real_ptr( uint32 farptr )
+ {
+diff -Nura read-edid-3.0.2.orig/get-edid/get-edid.c read-edid-3.0.2/get-edid/get-edid.c
+--- read-edid-3.0.2.orig/get-edid/get-edid.c	2020-09-25 23:25:01.928805414 +0200
++++ read-edid-3.0.2/get-edid/get-edid.c	2020-09-25 23:28:20.740809341 +0200
+@@ -9,7 +9,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-int quiet=0;
++static int quiet=0;
+ int i2conly=0; //0=both, 1=i2conly, 2=classiconly
+ int i2cbus=-1;
+ int classmon=0;
+diff -Nura read-edid-3.0.2.orig/get-edid/i2c.c read-edid-3.0.2/get-edid/i2c.c
+--- read-edid-3.0.2.orig/get-edid/i2c.c	2020-09-25 23:25:01.928805414 +0200
++++ read-edid-3.0.2/get-edid/i2c.c	2020-09-25 23:28:32.152809567 +0200
+@@ -15,7 +15,7 @@
+ 
+ //Ideas (but not too much actual code) taken from i2c-tools. Thanks guys.
+ 
+-int quiet;
++static int quiet;
+ 
+ #define display(...) if (quiet == 0) { fprintf(stderr, __VA_ARGS__); }
+ 
