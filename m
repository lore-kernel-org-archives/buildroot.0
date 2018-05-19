From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 23:12:47 +0200
Subject: [Buildroot] [git commit branch/next] libnss: bump to version 3.37
Message-ID: <20180519211204.A23F48122D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f36d4be02c262b4706ed05e0303feb3fbac3b435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch | 38 ----------------------
 package/libnss/libnss.hash                         |  2 +-
 package/libnss/libnss.mk                           |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch b/package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch
deleted file mode 100644
index 94f1a65273..0000000000
--- a/package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-# HG changeset patch
-# User Daiki Ueno <dueno@redhat.com>
-# Date 1516710574 -3600
-# Node ID 1668fafc1db4f739d5d15fbc94283858f842deb5
-# Parent  c3702e37a048e386f88e7c50a228d27669332725
-Bug 1432455, Build Hacl_Poly1305_64.o on AArch64 even with make, r=fkiefer
-
-[Upstream: https://hg.mozilla.org/projects/nss/rev/1668fafc1db4
- Peter: adjust paths for tarball]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -522,17 +522,22 @@ ifndef NSS_DISABLE_CHACHAPOLY
- 
-         ifneq (1,$(CC_IS_GCC))
-             EXTRA_SRCS += chacha20.c
-             VERIFIED_SRCS += Hacl_Chacha20.c
-         else
-             EXTRA_SRCS += chacha20_vec.c
-         endif
-     else
--        EXTRA_SRCS += poly1305.c
-+        ifeq ($(CPU_ARCH),aarch64)
-+            EXTRA_SRCS += Hacl_Poly1305_64.c
-+        else
-+            EXTRA_SRCS += poly1305.c
-+        endif
-+
-         EXTRA_SRCS += chacha20.c
-         VERIFIED_SRCS += Hacl_Chacha20.c
-     endif # x86_64
- endif # NSS_DISABLE_CHACHAPOLY
- 
- ifeq (,$(filter-out i386 x386 x86 x86_64 aarch64,$(CPU_ARCH)))
-     # All intel architectures get the 64 bit version
-     # With custom uint128 if necessary (faster than generic 32 bit version).
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 775ef4868c..fa145c91f2 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_35_RTM/src/SHA256SUMS
-sha256	f4127de09bede39f5fd0f789d33c3504c5d261e69ea03022d46b319b3e32f6fa  nss-3.35.tar.gz
+sha256	5821969e85d241833e96cb82bd4211ddea6d87003f2cccce25e0eab4aefa6268  nss-3.37.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0fa7f2cfac..053c09f7dc 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.35
+LIBNSS_VERSION = 3.37
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
