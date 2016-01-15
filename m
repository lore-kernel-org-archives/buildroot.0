From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 15 Jan 2016 15:52:16 +0100
Subject: [Buildroot] [PATCH] libnspr: only enable thumb if
	BR2_ARM_INSTRUCTIONS_THUMB2
Message-ID: <1452869536-13918-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnspr currently passes --enable-thumb2 if the CPU has thumb
instructions. This option will pass -mthumb to the compiler. However,
if an external multilib toolchain is used that has a thumb-specific
variant, it will try to use that one. But we only copy a single variant
to the sysroot, so the build will fail with:

In order to fix this, only enable thumb2 when we are really using
thumb2. Note that it is still necessary to pass this option, cfr.
http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214

We could have chosen to still enable thumb2 with the internal toolchain.
However, that would mean we create a discrepancy between the result of
building with the same (buildroot) toolchain when it is used as an
internal one or as an external one. To avoid potentially surprising
results, just stick to the option chosen for the rest of the rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Build-tested with various combinations of thumb, thumb2, floating point,
and external toolchains. I didn't test with an internal toolchain but
what could go wrong there? :-)
---
 package/libnspr/libnspr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 8e58986..c9bfa0c 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -50,7 +50,7 @@ LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIBRARY= install
 endif
 
 ifeq ($(BR2_arm),y)
-ifeq ($(BR2_ARM_CPU_HAS_THUMB2),y)
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2),y)
 LIBNSPR_CONF_OPTS += --enable-thumb2
 else
 LIBNSPR_CONF_OPTS += --disable-thumb2
-- 
2.7.0.rc3
