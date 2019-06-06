From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:52:45 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/ffmpeg: re-enable
 package if gcc bug 85180 is present
Message-ID: <20190606154047.5CE737FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c875d3faf0746dcbfbecf3bc2adf6b8cd30de02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. To avoid
this problem, until now, ffmpeg could not be selected on
Microblaze. However, this problem only happens due to optimization,
and can worked around by forcing -O0.

So, when BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y, this commit:
- adds --disable-optimizations to FFMPEG_CONF_OPTS
- passes -O0 to CFLAGS in FFMPEG_CONF_ENV

Then, we remove 'depends on !BR2_microblaze' from Config.in to
re-enable the package.

Note that the comment was talking about gcc bug 71124, but this gcc
bug is a duplicate of 85180. Since all Buildroot packages now use the
reference to gcc bug 85180 and the option is named
BR2_TOOLCHAIN_HAS_GCC_BUG_85180, we use this naming as well for
ffmpeg.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit 3b38f440c0ad62bd0fad1038d6f5910ded5f2f40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/Config.in | 2 --
 package/ffmpeg/ffmpeg.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 2d94c5712a..4377a32c98 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -7,8 +7,6 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on !BR2_nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	depends on !BR2_ARM_CPU_ARMV7M
-	# Microblaze build affected by gcc PR71124 (infinite loop)
-	depends on !BR2_microblaze
 	# m68k coldfire causes a build failure, because the check for
 	# atomics (atomic_store) succeeds, which causes ffmpeg to
 	# think atomic intrinsics are available, while they are
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b86d465df8..1e1004c378 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -517,6 +517,14 @@ else ifneq ($(GCC_TARGET_ARCH),)
 FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_ARCH)"
 endif
 
+FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+FFMPEG_CONF_OPTS += --disable-optimizations
+FFMPEG_CFLAGS += -O0
+endif
+
+FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
