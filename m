From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:35:58 +0100
Subject: [Buildroot] [git commit] package/iproute2: bump to version 4.20.0
Message-ID: <20190312203343.47B5E7F9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aa057f2f1c78f15e5120fbb0ef177cb5fd94c9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch. Renumber the remaining patch.

Add upstream patch fixing build with musl libc.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-ss-fix-compilation-under-glibc-2.18.patch} |  0
 ...s.h-provide-fallback-CLOCK_TAI-definition.patch | 32 ----------------------
 .../0002-f_flower-fix-build-with-musl-libc.patch   | 31 +++++++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 5 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch b/package/iproute2/0001-ss-fix-compilation-under-glibc-2.18.patch
similarity index 100%
rename from package/iproute2/0002-ss-fix-compilation-under-glibc-2.18.patch
rename to package/iproute2/0001-ss-fix-compilation-under-glibc-2.18.patch
diff --git a/package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch b/package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch
deleted file mode 100644
index c89db2b2eb..0000000000
--- a/package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 950bf78adc9a3290ed383eaeef01dee6543cfb97 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sat, 27 Oct 2018 17:25:31 +0200
-Subject: [PATCH] utils.h: provide fallback CLOCK_TAI definition
-
-q_{etf,taprio}.c uses CLOCK_TAI, which isn't exposed by glibc < 2.21 or
-uClibc, breaking the build. Provide a fallback definition like it is done
-for IPPROTO_MPLS and others.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- include/utils.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/utils.h b/include/utils.h
-index 258d630e..685d2c1d 100644
---- a/include/utils.h
-+++ b/include/utils.h
-@@ -126,6 +126,10 @@ struct ipx_addr {
- #define IPPROTO_MPLS	137
- #endif
- 
-+#ifndef CLOCK_TAI
-+# define CLOCK_TAI 11
-+#endif
-+
- __u32 get_addr32(const char *name);
- int get_addr_1(inet_prefix *dst, const char *arg, int family);
- int get_prefix_1(inet_prefix *dst, char *arg, int family);
--- 
-2.11.0
-
diff --git a/package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch b/package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..71b652d9d4
--- /dev/null
+++ b/package/iproute2/0002-f_flower-fix-build-with-musl-libc.patch
@@ -0,0 +1,31 @@
+From 28747146622a49c3e7b5c5b36dc02c6a64124770 Mon Sep 17 00:00:00 2001
+From: Hans Dedecker <dedeckeh@gmail.com>
+Date: Wed, 23 Jan 2019 22:02:31 +0100
+Subject: [PATCH] f_flower: fix build with musl libc
+
+XATTR_SIZE_MAX requires the usage of linux/limits.h; let's include it
+
+Signed-off-by: Hans Dedecker <dedeckeh@gmail.com>
+Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 2874714662
+
+ tc/f_flower.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tc/f_flower.c b/tc/f_flower.c
+index c563666702b5..9659e894dd1f 100644
+--- a/tc/f_flower.c
++++ b/tc/f_flower.c
+@@ -14,6 +14,7 @@
+ #include <unistd.h>
+ #include <string.h>
+ #include <net/if.h>
++#include <linux/limits.h>
+ #include <linux/if_arp.h>
+ #include <linux/if_ether.h>
+ #include <linux/ip.h>
+-- 
+2.20.1
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 00bd1c646a..28862ce19c 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	d9ec5ca1f47d8a85416fa26e7dc1cbf5d067640eb60e90bdc1c7e5bdc6a29984  iproute2-4.19.0.tar.xz
+sha256	c8adaa6a40f888476b23acb283cfa30c0dd55f07b5aa20663ed5ba2ef1f6fda8  iproute2-4.20.0.tar.xz
 sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 41d0b2c3d9..13b1f90f37 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.19.0
+IPROUTE2_VERSION = 4.20.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
