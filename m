From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Apr 2019 19:08:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: fix build on or1k with
 gcc < 6
Message-ID: <20190421170851.26397-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8cb80bef5c60ac1e5f6507fbc68c21c32f4af84a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jemalloc/jemalloc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index 1273f8a72a..f4d64851bf 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -11,5 +11,11 @@ JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 
+# gcc bug internal compiler error: in merge_overlapping_regs, at
+# regrename.c:304. This bug is fixed since gcc 6.
+ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
+JEMALLOC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.20.1
