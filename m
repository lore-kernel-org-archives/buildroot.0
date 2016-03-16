From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:43:13 +0100
Subject: [Buildroot] [PATCH 07/16] musl: build broken on Thumb, use ARM mode
In-Reply-To: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1458164602-16983-8-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/musl/musl.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 081a700..0e881f9 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -23,6 +23,11 @@ MUSL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 MUSL_INSTALL_STAGING = YES
 
+# Thumb build is broken, build in ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MUSL_EXTRA_CFLAGS += -marm
+endif
+
 define MUSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
-- 
2.6.4
