From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 23:46:07 +0200
Subject: [Buildroot] [PATCH] openpowerlink: add patch to fix musl build
Message-ID: <20180825214607.20387-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a one-liner patch that fixes the build with musl of
the openpowerlink package, caused by a missing <sys/types.h>
include. The patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/8aff5f6d7bcab616129368c1fb22026bb164e454/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ernel-edrv-edrv-rawsock_linux.c-add-missi.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch

diff --git a/package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch b/package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch
new file mode 100644
index 0000000000..4e00ecdb67
--- /dev/null
+++ b/package/openpowerlink/0004-stack-src-kernel-edrv-edrv-rawsock_linux.c-add-missi.patch
@@ -0,0 +1,35 @@
+From 710e2b8ba2ecf51057a89de24e6f0d387614ea53 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 25 Aug 2018 23:36:39 +0200
+Subject: [PATCH] stack/src/kernel/edrv/edrv-rawsock_linux.c: add missing
+ <sys/types.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is necessary to get the definition of the u_char type, otherwise
+the build fails with the musl C library with:
+
+stack/src/kernel/edrv/edrv-rawsock_linux.c:373:46: error: ?u_char? undeclared (first use in this function)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/371
+---
+ stack/src/kernel/edrv/edrv-rawsock_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/stack/src/kernel/edrv/edrv-rawsock_linux.c b/stack/src/kernel/edrv/edrv-rawsock_linux.c
+index f8e0216f..e5230a52 100644
+--- a/stack/src/kernel/edrv/edrv-rawsock_linux.c
++++ b/stack/src/kernel/edrv/edrv-rawsock_linux.c
+@@ -59,6 +59,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <arpa/inet.h>
+ #include <ifaddrs.h>
+ #include <linux/if_packet.h>
++#include <sys/types.h>
+ 
+ //============================================================================//
+ //            G L O B A L   D E F I N I T I O N S                             //
+-- 
+2.14.4
+
-- 
2.14.4
