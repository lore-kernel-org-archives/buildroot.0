From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 15:11:30 +0100
Subject: [Buildroot] [PATCH] freerdp: pass appropriate ARM ABI flags
Message-ID: <1419862290-6251-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the line of commit 530693787b3 ("package/freerdp: do not use Neon
extensions when not available") done by Yann E. Morin, freerdp also
passes an explicit -mfloat-abi= flag, and defaults to softfp. This
obviously breaks badly when building an EABIhf system.

This commit therefore fixes freerdp.mk to pass the appropriate
ARM_FP_ABI value to freerdp's build system.

Fixes:

  http://autobuild.buildroot.org/results/6ca/6ca9de1a11c675533baa68f7a6bf7b6af7cb4345/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index a703500..57cd7a8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -75,4 +75,8 @@ else
 FREERDP_CONF_OPTS += -DWITH_SSE2=OFF
 endif
 
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+FREERDP_CONF_OPTS += -DARM_FP_ABI=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+endif
+
 $(eval $(cmake-package))
-- 
2.1.0
