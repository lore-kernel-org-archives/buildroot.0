From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 22:10:22 +0100
Subject: [Buildroot] [git commit] package/bridge-utils: fix build with newer
	kernels
Message-ID: <20130324210955.900CB9B2A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a1f303ea24075d8d2f2388452cec965591d5e57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... while keeping compatibility with older ones.

Preventive fix to autobuild failures! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...s.patch => bridge-utils-000-build-system.patch} |    0
 ...dge-utils-001-fix-for-kernel-headers-3.8+.patch |   30 ++++++++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/bridge-utils/bridge-utils.patch b/package/bridge-utils/bridge-utils-000-build-system.patch
similarity index 100%
rename from package/bridge-utils/bridge-utils.patch
rename to package/bridge-utils/bridge-utils-000-build-system.patch
diff --git a/package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch b/package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch
new file mode 100644
index 0000000..0455a90
--- /dev/null
+++ b/package/bridge-utils/bridge-utils-001-fix-for-kernel-headers-3.8+.patch
@@ -0,0 +1,30 @@
+commit 5eebb7f9288b7881ffb929b1fd494fe3ac3be27d
+Author: Russell Senior <russell@personaltelco.net>
+Date:   Wed Mar 6 12:49:42 2013 -0800
+
+    bridge-utils: Fix compile against linux-3.8.x
+    
+    Linux 3.8 has a header, include/uapi/linux/if_bridge.h that uses a
+    struct in6_addr but doesn't define it.  The trivial seeming fix of
+    including the header that does define it causes more problems.  The
+    problem was discussed on mailing lists in January 2013.  The final
+    suggestion I found was here:
+    
+          http://www.redhat.com/archives/libvir-list/2013-January/msg01253.html
+    
+    This is intended to implement that suggestion.
+    
+    Signed-off-by: Russell Senior <russell@personaltelco.net>
+
+diff --git a/libbridge/libbridge.h b/libbridge/libbridge.h
+index 39964f2..dd14bae 100644
+--- a/libbridge/libbridge.h
++++ b/libbridge/libbridge.h
+@@ -20,6 +20,7 @@
+ #define _LIBBRIDGE_H
+ 
+ #include <sys/socket.h>
++#include <netinet/in.h>
+ #include <linux/if.h>
+ #include <linux/if_bridge.h>
+ 
