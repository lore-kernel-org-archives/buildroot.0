From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 18:10:41 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/gqview: fix build
 with gcc 10
Message-ID: <20200929160349.A60138E1CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8eb45fe842801002c6f1c10f3a62fa96f121c15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/ab19e23cae603b2aa6e696e4937d106883e78b76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50688b9b10e49dd141a2544cad60bee408400c34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gqview/0002-fix-build-with-gcc-10.patch | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/gqview/0002-fix-build-with-gcc-10.patch b/package/gqview/0002-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..55791c78b9
--- /dev/null
+++ b/package/gqview/0002-fix-build-with-gcc-10.patch
@@ -0,0 +1,27 @@
+fix build with gcc 10
+
+Define bar_exif_key_count and bar_exif_key_list as extern to avoid the
+following build failure with gcc 10 (which defaults to -fno-common):
+
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: info.o:(.rodata+0x0): multiple definition of `bar_exif_key_count'; bar_exif.o:(.rodata+0x0): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: info.o:(.bss+0x0): multiple definition of `bar_exif_key_list'; bar_exif.o:(.data+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ab19e23cae603b2aa6e696e4937d106883e78b76
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naur gqview-2.1.5.orig/src/bar_exif.h gqview-2.1.5/src/bar_exif.h
+--- gqview-2.1.5.orig/src/bar_exif.h	2020-09-09 20:32:50.506755031 +0200
++++ gqview-2.1.5/src/bar_exif.h	2020-09-09 20:33:30.370755818 +0200
+@@ -24,8 +24,8 @@
+ 
+ /* these are exposed for when duplication of the exif bar's text is needed */
+ 
+-const gchar **bar_exif_key_list;
+-const gint bar_exif_key_count;
++extern const gchar **bar_exif_key_list;
++extern const gint bar_exif_key_count;
+ 
+ gchar *bar_exif_validate_text(gchar *text);
+ 
