From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:10:56 +0100
Subject: [Buildroot] [git commit] package/multicat: add patch to fix musl
	build
Message-ID: <20160320141102.06686817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e314205dadf94b4fc73679278b89099fd920c724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix two musl build issues:
  1) `struct udphdr` requires definition of `_GNU_SOURCE`
  2) `mode_t` requires including <sys/types.h>

Fixes:
http://autobuild.buildroot.net/results/9f1/9f1a3f3aab854f1bd20f1064391e613457312022/

Upstream status: Pending [1]

[1] https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000126.html

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multicat/0002-Fix-musl-build.patch | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/multicat/0002-Fix-musl-build.patch b/package/multicat/0002-Fix-musl-build.patch
new file mode 100644
index 0000000..07e15a3
--- /dev/null
+++ b/package/multicat/0002-Fix-musl-build.patch
@@ -0,0 +1,47 @@
+Fix musl build
+
+Defining _GNU_SOURCE is required to get proper member names in `struct udphdr`
+when building against musl. Build error:
+
+  util.c: In function 'RawFillHeaders':
+  util.c:481:9: error: 'struct udphdr' has no member named 'source'
+       udph->source = htons(portsrc);
+           ^
+  util.c:482:9: error: 'struct udphdr' has no member named 'dest'
+       udph->dest   = htons(portdst);
+           ^
+  util.c:483:9: error: 'struct udphdr' has no member named 'len'
+       udph->len    = htons(sizeof(struct udphdr) + len);
+           ^
+  util.c:484:9: error: 'struct udphdr' has no member named 'check'
+       udph->check  = 0;
+
+Including <sys/types.h> in needed for mode_t, otherwise musl build fails:
+  util.h:91:1: error: unknown type name 'mode_t'
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+Sent upstream: https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000126.html
+
+diff -purN multicat-2.1.orig/util.c multicat-2.1/util.c
+--- multicat-2.1.orig/util.c	2015-07-17 18:03:17.000000000 +0200
++++ multicat-2.1/util.c	2016-03-19 22:21:01.110178772 +0100
+@@ -21,6 +21,8 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
+  *****************************************************************************/
+ 
++#define _GNU_SOURCE
++
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <stdint.h>
+diff -purN multicat-2.1.orig/util.h multicat-2.1/util.h
+--- multicat-2.1.orig/util.h	2015-07-15 22:47:39.000000000 +0200
++++ multicat-2.1/util.h	2016-03-19 22:21:58.649834990 +0100
+@@ -21,6 +21,7 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
+  *****************************************************************************/
+ 
++#include <sys/types.h>
+ #include <netinet/udp.h>
+ #include <netinet/ip.h>
+ 
