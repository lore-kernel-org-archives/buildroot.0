From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:00:08 +0200
Subject: [Buildroot] [PATCH v3 03/10] musl: build broken on Thumb,
	use ARM mode
In-Reply-To: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1459450815-6494-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the musl C library on Thumb (Thumb1, not Thumb2), fails with:

 {standard input}:20: Error: only lo regs allowed with immediate -- `mov fp,#0'
 {standard input}:21: Error: only lo regs allowed with immediate -- `mov lr,#0'
 {standard input}:25: Error: unshifted register required -- `and ip,a1,#-16'

Since there are no cores that we support that are Thumb1 only, use the
same solution as the one used by glibc: build the C library in ARM
mode.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 081a700..733f940 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -23,6 +23,12 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# Thumb build is broken, build in ARM mode, since all architectures
+# that support Thumb1 also support ARM.
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MUSL_EXTRA_CFLAGS += -marm
+endif
+
 define MUSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
-- 
2.6.4
