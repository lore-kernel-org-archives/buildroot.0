From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 23:02:23 +0200
Subject: [Buildroot] [git commit] pulseaudio: fix NEON usage
Message-ID: <20130827210300.092499B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f09636710b14f1493de7c8cd24aaf3a5d1322389
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NEON intrinsics used by Pulseaudio are only available in either
-mfloat-abi=softfp or -mfloat-abi=hard, not in
-mfloat-abi=soft. Therefore having NEON support in the processor is
not sufficient, we also should *not* be using soft-float.

Moreover, looking at BR2_ARM_ENABLE_NEON to know if the processor has
NEON support is incorrect. This option is only here to allow the user
to tell whether the processor has NEON support or not, for the ARM
cores that only have optional NEON support. Instead, the
BR2_ARM_CPU_HAS_NEON option really indicates whether NEON is available
or not (it is either set automatically by the ARM cores that always
have NEON support, or when BR2_ARM_ENABLE_NEON is enabled by the user
to confirm that his ARM processor has NEON support).

This fixes build failures such as
http://autobuild.buildroot.org/results/675/675c96059be348b594cc92980bef391126931c83/build-end.log

[Peter: add comment about reason for soft abi check]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 910e4a7..195eb19 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -55,7 +55,19 @@ endef
 PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FORCE_CC
 endif
 
-PULSEAUDIO_CONF_OPT += $(if $(BR2_ARM_ENABLE_NEON),--enable-neon-opt=yes,--enable-neon-opt=no)
+# neon intrinsics not available with float-abi=soft
+ifeq ($(BR2_ARM_SOFT_FLOAT),)
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+PULSEAUDIO_USE_NEON = y
+endif
+endif
+
+ifeq ($(PULSEAUDIO_USE_NEON),y)
+PULSEAUDIO_CONF_OPT += --enable-neon-opt=yes
+else
+PULSEAUDIO_CONF_OPT += --enable-neon-opt=no
+endif
+
 # pulseaudio alsa backend needs pcm/mixer apis
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 PULSEAUDIO_CONF_OPT += --disable-alsa
