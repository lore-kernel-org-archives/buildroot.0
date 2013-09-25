From: Markos Chandras <markos.chandras@imgtec.com>
Date: Wed, 25 Sep 2013 16:00:57 +0100
Subject: [Buildroot] [PATCH] glibc: Pass correct -mabi for MIPS
Message-ID: <1380121257-10449-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to glibc-2.18/ports/sysdeps/mips/preconfigure,
if no -mabi was passed to CFLAGS, then it defaults to -mabi=n32.
This breaks o32 and n64 builds for MIPS64. Therefore, it is
necessary to append -mabi to CFLAGS.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/glibc/glibc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4dd2e63..68c4636 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -43,6 +43,16 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
 endif
 
+# MIPS64 defaults to n32 so pass the correct -mabi if
+# we are using a different ABI. OABI32 is also used
+# in MIPS so we pass -mabi=32 in this case as well
+# even though it's not strictly necessary.
+ifeq ($(BR2_MIPS_NABI64),y)
+GLIBC_EXTRA_CFLAGS += -mabi=64
+else ifeq ($(BR2_MIPS_OABI32),y)
+GLIBC_EXTRA_CFLAGS += -mabi=32
+endif
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
-- 
1.8.3.2
