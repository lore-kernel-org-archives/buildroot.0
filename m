From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Sep 2016 16:14:00 +0200
Subject: [Buildroot] [PATCH v2] package/binutils: Disable -Os for ARM
	cortex-M cpus
Message-ID: <1472998440-7543-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ERROR: reloc type R_ARM_THM_MOVW_ABS_NC unsupported in this context
ERROR: reloc type R_ARM_THM_MOVT_ABS unsupported in this context
2 bad relocscollect2: error: ld returned 1 exit status

Binutils build fine with -O1, -O2 or -O3.

Reported upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=20552

Fixes:
http://autobuild.buildroot.net/results/e72/e727e6e9cf361acc786acec192a88f5f5444a2f6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2: fix condition (ThomasP)
    report the issue upstream (ThomasP)
    use O2 instead of O1 (Baruch)
---
 package/binutils/binutils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ff90a16..97daeff 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -77,6 +77,13 @@ ifeq ($(BR2_bfin),y)
 BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
 endif
 
+# Workaround a build issue with -Os for ARM Cortex-M cpus.
+# (Binutils 2.25.1 and 2.26.1)
+# https://sourceware.org/bugzilla/show_bug.cgi?id=20552
+ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
+BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
+endif
+
 # Install binutils after busybox to prefer full-blown utilities
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 BINUTILS_DEPENDENCIES += busybox
-- 
2.5.5
