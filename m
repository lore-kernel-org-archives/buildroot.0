From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 09:45:36 +0200
Subject: [Buildroot] [git commit branch/next] package/iproute2: bump to
 version 5.1.0
Message-ID: <20190524073947.0E2208D67A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46ccd145f98b96cb439c8389e4bc0787b4bc2f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch accepted in upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ss-fix-compilation-under-glibc-2.18.patch | 39 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/iproute2/0001-ss-fix-compilation-under-glibc-2.18.patch b/package/iproute2/0001-ss-fix-compilation-under-glibc-2.18.patch
deleted file mode 100644
index b6934f5d17..0000000000
--- a/package/iproute2/0001-ss-fix-compilation-under-glibc-2.18.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9700927a008a803ac119bdf816bdc1baa69d705c Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Wed, 20 Feb 2019 15:41:51 +0100
-Subject: [PATCH] ss: fix compilation under glibc < 2.18
-
-Commit c759116a0b2b6da8df9687b0a40ac69050132c77 introduced support for
-AF_VSOCK. This define is only provided since glibc version 2.18, so
-compilation fails when using older toolchains.
-
-Provide the necessary definitions if needed.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
----
- misc/ss.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/misc/ss.c b/misc/ss.c
-index 9e821faf..766fdc5f 100644
---- a/misc/ss.c
-+++ b/misc/ss.c
-@@ -51,6 +51,14 @@
- #include <linux/tipc_netlink.h>
- #include <linux/tipc_sockets_diag.h>
- 
-+/* AF_VSOCK/PF_VSOCK is only provided since glibc 2.18 */
-+#ifndef PF_VSOCK
-+#define PF_VSOCK 40
-+#endif
-+#ifndef AF_VSOCK
-+#define AF_VSOCK PF_VSOCK
-+#endif
-+
- #define MAGIC_SEQ 123456
- #define BUF_CHUNK (1024 * 1024)
- #define LEN_ALIGN(x) (((x) + 1) & ~1)
--- 
-2.19.2
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index b7e3e701c5..5edee4614d 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	df047302a39650ef832c07e8dab5df7a23218cd398bd310c8628e386161d20ba  iproute2-5.0.0.tar.xz
+sha256	dc5a980873eabf6b00c0be976b6e5562b1400d47d1d07d2ac35d5e5acbcf7bcf  iproute2-5.1.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 539db5e015..d0b239c653 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.0.0
+IPROUTE2_VERSION = 5.1.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
