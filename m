From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 14 Dec 2020 13:17:03 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.60
Message-ID: <20201214121703.1189147-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 3.60 and remove local patch that has been upstreamed.

Release Notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.60_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/0001-fix-old-abi-ppc.patch | 40 -----------------------
 package/libnss/libnss.hash                |  4 +--
 package/libnss/libnss.mk                  |  2 +-
 3 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 package/libnss/0001-fix-old-abi-ppc.patch

diff --git a/package/libnss/0001-fix-old-abi-ppc.patch b/package/libnss/0001-fix-old-abi-ppc.patch
deleted file mode 100644
index 202b4ad271..0000000000
--- a/package/libnss/0001-fix-old-abi-ppc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a7a862bab5e4aae4615ddae3cbe230345f92ed0d Mon Sep 17 00:00:00 2001
-From: Lauri Kasanen <cand@gmx.com>
-Date: Mon, 1 Jun 2020 12:11:45 +0300
-Subject: [PATCH v3] Bug 1642174 /usr/bin/ld: OBJS/Linux_SINGLE_SHLIB/sha512-p8.o:
- ABI version 2 is not compatible with ABI version 1 output
-
-Don't try to build the SHA-2 accelerated asm on old-ABI ppc.
-
-Currently make only, I don't have enough gyp-fu to do that side.
-However, the reporters of 1642174 and 1635625 both used make, not gyp.
-
-Signed-off-by: Lauri Kasanen <cand@gmx.com>
-[Fetch-from: https://bugzilla.mozilla.org/show_bug.cgi?id=1642174
- Manually modified paths to apply to nss subdirectory in release tarball.]
-Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
----
- lib/freebl/Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 5f7384429..e0461c7d3 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -267,9 +267,12 @@ ifeq ($(CPU_ARCH),arm)
- endif
- ifeq ($(CPU_ARCH),ppc)
-     EXTRA_SRCS += gcm-ppc.c
--    ASFILES += sha512-p8.s
- ifdef USE_64
-     DEFINES += -DNSS_NO_INIT_SUPPORT
-+    PPC_ABI := $(shell $(CC) -dM -E - < /dev/null | awk '$$2 == "_CALL_ELF" {print $$3}')
-+    ifeq ($(PPC_ABI),2)
-+        ASFILES += sha512-p8.s
-+    endif
- endif # USE_64
- endif # ppc
- endif # Linux
---
-2.19.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 02593c7dde..16a2e5c521 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_58_RTM/src/SHA256SUMS
-sha256  9f73cf789b5f109b978e5239551b609b0cafa88d18f0bc8ce3f976cb629353c0  nss-3.58.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_60_RTM/src/SHA256SUMS
+sha256  84abd5575ab874c53ae511bd461e5d0868d1a1b384ee40753154cdd1d590fe3d  nss-3.60.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8e6a77d2cb..d762ac6f64 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.58
+LIBNSS_VERSION = 3.60
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1
