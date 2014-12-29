From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Dec 2014 16:00:37 +0100
Subject: [Buildroot] [git commit] freerdp: pass appropriate ARM ABI flags
Message-ID: <20141229150127.5920D807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64f94d1109ea950e64cf6bbf14df9ed776ad308e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the line of commit 530693787b3 ("package/freerdp: do not use Neon
extensions when not available") done by Yann E. Morin, freerdp also
passes an explicit -mfloat-abi= flag, and defaults to softfp. This
obviously breaks badly when building an EABIhf system.

This commit therefore fixes freerdp.mk to pass the appropriate
ARM_FP_ABI value to freerdp's build system.

Fixes:

  http://autobuild.buildroot.org/results/6ca/6ca9de1a11c675533baa68f7a6bf7b6af7cb4345/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
