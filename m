From: Chris Zankel <chris@zankel.net>
Date: Wed, 5 Dec 2012 21:36:36 -0800
Subject: [Buildroot] [PATCH] xtensa: add -mlongcalls to CFLAGS for xtensa
Message-ID: <50c0320c.05bf440a.60fe.60b5@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The longcalls option allows calls across a greater range of addresses.

This option may degrade both code size and performance, but
the linker can generally optimize away the unnecessary overhead
when a call ends up within range

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 package/Makefile.in |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 9fdc745..98e7f7c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -56,6 +56,15 @@ TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
+# Use longcalls option for Xtensa globally.
+# The 'longcalls' option allows calls across a greater range of addresses,
+# and is required for some packages. While this option can degrade both
+# code size and performance, the linker can usually optimize away the
+# overhead when a call ends up within a certain range.
+ifeq ($(BR2_xtensa),y)
+TARGET_ABI += -mlongcalls
+endif
+
 STAGING_DIR=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot
 
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
-- 
1.7.9.5
