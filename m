From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 May 2017 23:40:54 +0200
Subject: [Buildroot] [PATCH 2/3] mpir: fix build on ARM Thumb-only platforms
In-Reply-To: <1494193255-15762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1494193255-15762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1494193255-15762-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optimized ARM assembly code is not suitable for Thumb-only
platforms, so use the generic code in such situations.

Fixes:

  http://autobuild.buildroot.net/results/4d7f2a1326f75e11693bdd51ad274079b0dd0ce4/
  (ARM Cortex-M4 toolchain)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpir/mpir.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index b7f3829..cf17502 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -20,4 +20,10 @@ ifeq ($(BR2_MIPS_NABI64),y)
 MPIR_CONF_OPTS += ABI=64
 endif
 
+# The optimized ARM assembly code uses ARM-only (i.e not Thumb1/2
+# compatible) instructions.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_ARM_CPU_HAS_ARM),y:)
+MPIR_CONF_ENV += MPN_PATH="generic"
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
