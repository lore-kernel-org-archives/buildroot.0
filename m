From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:03:23 +0200
Subject: [Buildroot] [git commit] mpir: fix build on ARM Thumb-only platforms
Message-ID: <20170509151441.244F57FA5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa3fbeb1bf4b0d3bed85bbeab4bd0f7b1c13e21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optimized ARM assembly code is not suitable for Thumb-only
platforms, so use the generic code in such situations.

Fixes:

  http://autobuild.buildroot.net/results/4d7f2a1326f75e11693bdd51ad274079b0dd0ce4/
  (ARM Cortex-M4 toolchain)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
