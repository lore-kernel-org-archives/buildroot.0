From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Feb 2019 22:11:47 +0100
Subject: [Buildroot] [PATCH-for-master 2/2] package/iproute2: backport patch
 to fix compilation under glibc < 2.18
In-Reply-To: <20190225211147.14947-1-patrickdepinguin@gmail.com>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
Message-ID: <20190225211147.14947-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

When compiling iproute2 using a toolchain containing glibc 2.17 and older, it fails due to a missing definition of AF_VSOCK.

Add a submitted and accepted upstream patch to fix this issue.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...-ss-fix-compilation-under-glibc-2.18.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch

diff --git a/package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch b/package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch
new file mode 100644
index 0000000000..b6934f5d17
--- /dev/null
+++ b/package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch
@@ -0,0 +1,39 @@
+From 9700927a008a803ac119bdf816bdc1baa69d705c Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 20 Feb 2019 15:41:51 +0100
+Subject: [PATCH] ss: fix compilation under glibc < 2.18
+
+Commit c759116a0b2b6da8df9687b0a40ac69050132c77 introduced support for
+AF_VSOCK. This define is only provided since glibc version 2.18, so
+compilation fails when using older toolchains.
+
+Provide the necessary definitions if needed.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+---
+ misc/ss.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/misc/ss.c b/misc/ss.c
+index 9e821faf..766fdc5f 100644
+--- a/misc/ss.c
++++ b/misc/ss.c
+@@ -51,6 +51,14 @@
+ #include <linux/tipc_netlink.h>
+ #include <linux/tipc_sockets_diag.h>
+ 
++/* AF_VSOCK/PF_VSOCK is only provided since glibc 2.18 */
++#ifndef PF_VSOCK
++#define PF_VSOCK 40
++#endif
++#ifndef AF_VSOCK
++#define AF_VSOCK PF_VSOCK
++#endif
++
+ #define MAGIC_SEQ 123456
+ #define BUF_CHUNK (1024 * 1024)
+ #define LEN_ALIGN(x) (((x) + 1) & ~1)
+-- 
+2.19.2
+
-- 
2.19.2
