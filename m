From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 23:55:52 +0200
Subject: [Buildroot] [git commit] libnfnetlink: add patch to fix musl build
	issue
Message-ID: <20150808215621.03BDC80DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e554d3c787648c0785079551dc9f64a701a7f63
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/17aac78e49d016b1044be4e600033b85a3420c5b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnfnetlink/0002-musl.patch |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/libnfnetlink/0002-musl.patch b/package/libnfnetlink/0002-musl.patch
new file mode 100644
index 0000000..bee7898
--- /dev/null
+++ b/package/libnfnetlink/0002-musl.patch
@@ -0,0 +1,32 @@
+Include <sys/types.h> to get the u_int* definitions
+
+This is needed to fix the build with the musl C library, and this
+patch comes from
+http://git.alpinelinux.org/cgit/aports/plain/main/libnfnetlink/musl-fix-includes.patch.
+
+It will no longer be needed with upcoming upstream releases of
+libnfnetlink, since they have switched to use the <stdint.h> types
+instead. However this change was too invasive to backport.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+--- libnfnetlink-1.0.1.orig/include/libnfnetlink/linux_nfnetlink.h
++++ libnfnetlink-1.0.1/include/libnfnetlink/linux_nfnetlink.h
+@@ -1,6 +1,6 @@
+ #ifndef _NFNETLINK_H
+ #define _NFNETLINK_H
+-#include <linux/types.h>
++#include <sys/types.h>
+ #include <libnfnetlink/linux_nfnetlink_compat.h>
+ 
+ enum nfnetlink_groups {
+--- libnfnetlink-1.0.1.orig/include/libnfnetlink/libnfnetlink.h
++++ libnfnetlink-1.0.1/include/libnfnetlink/libnfnetlink.h
+@@ -15,6 +15,7 @@
+ #define aligned_u64 unsigned long long __attribute__((aligned(8)))
+ #endif
+ 
++#include <sys/types.h>
+ #include <sys/socket.h>	/* for sa_family_t */
+ #include <linux/netlink.h>
+ #include <libnfnetlink/linux_nfnetlink.h>
