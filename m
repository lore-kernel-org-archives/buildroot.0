From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:38:28 +0200
Subject: [Buildroot] [git commit] package/ifplugd: fix build with gcc 10
Message-ID: <20200818143416.DC299868D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d471c4da7d243ec2b8799e8778dff027759db53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/63f7c6fc4a2a30c8eb0298856a2615f816d50299

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...005-src-interface.h-fix-build-with-gcc-10.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/ifplugd/0005-src-interface.h-fix-build-with-gcc-10.patch b/package/ifplugd/0005-src-interface.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..febeb76854
--- /dev/null
+++ b/package/ifplugd/0005-src-interface.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,38 @@
+From 4ce42974267dd969a597a7357d6c98ccbe8140f8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 17 Aug 2020 20:41:29 +0200
+Subject: [PATCH] src/interface.h: fix build with gcc 10
+
+This will fix the following build failure:
+
+/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -D_REENTRANT  -DSYSCONFDIR="\"/etc\"" -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -pipe -W -Wall -Wno-unused-parameter   -o ifplugstatus ifplugstatus.o interface.o -L/home/buildroot/autobuild/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -ldaemon
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interface.o:(.bss+0x0): multiple definition of `interface_do_message'; ifplugstatus.o:(.bss+0xc): first defined here
+/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interface.o:(.bss+0x4): multiple definition of `interface_auto_up'; ifplugstatus.o:(.bss+0x4): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/63f7c6fc4a2a30c8eb0298856a2615f816d50299
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to Lennart Poettering <lennart@poettering.net>]
+---
+ src/interface.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/interface.h b/src/interface.h
+index 2f35a84..e603844 100644
+--- a/src/interface.h
++++ b/src/interface.h
+@@ -21,8 +21,8 @@
+  * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+  */
+ 
+-int interface_auto_up;
+-int interface_do_message;
++extern int interface_auto_up;
++extern int interface_do_message;
+ 
+ typedef enum { IFSTATUS_UP, IFSTATUS_DOWN, IFSTATUS_ERR } interface_status_t;
+ 
+-- 
+2.27.0
+
