From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:42:45 +0100
Subject: [Buildroot] [git commit] package/mini-snmpd: fix musl build
Message-ID: <20200314143331.18D9F831C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b82333452a8759d7aca1866b77dfed1793310be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6903a0f685076b4a2c2824de6158da40e9e712d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../mini-snmpd/0001-linux.c-fix-musl-build.patch   | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/mini-snmpd/0001-linux.c-fix-musl-build.patch b/package/mini-snmpd/0001-linux.c-fix-musl-build.patch
new file mode 100644
index 0000000000..8e8bb090fd
--- /dev/null
+++ b/package/mini-snmpd/0001-linux.c-fix-musl-build.patch
@@ -0,0 +1,46 @@
+From 73fa408f51ec25121075aaccac9c9db1c68567cd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 12 Mar 2020 10:02:18 +0100
+Subject: [PATCH] linux.c: fix musl build
+
+Remove include on linux/if_link.h to avoid the following build failure
+with musl:
+
+In file included from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
+                 from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:4,
+                 from /home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/if_link.h:5,
+                 from linux.c:21:
+/home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
+ struct sysinfo {
+        ^~~~~~~
+In file included from linux.c:19:
+/home/buildroot/autobuild/instance-2/output-1/host/i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+ struct sysinfo {
+        ^~~~~~~
+  CC       mini_snmpd-globals.o
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6903a0f685076b4a2c2824de6158da40e9e712d8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/troglobit/mini-snmpd/commit/73fa408f51ec25121075aaccac9c9db1c68567cd]
+---
+ linux.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/linux.c b/linux.c
+index a657912..86a7085 100644
+--- a/linux.c
++++ b/linux.c
+@@ -18,7 +18,6 @@
+ #include <netpacket/packet.h>
+ #include <sys/sysinfo.h>
+ #include <sys/socket.h>
+-#include <linux/if_link.h>
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-- 
+2.25.1
+
