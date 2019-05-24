From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 22:41:48 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: re-enable package if gcc
 bug 85180 is present
Message-ID: <20190524203642.0D5328D6BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b38f440c0ad62bd0fad1038d6f5910ded5f2f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/ffmpeg/Config.in | 2 --
 package/ffmpeg/ffmpeg.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index eec7ce0f6b..a5c05d9c1c 100644
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
index 8c91b149f4..5c070b7ee4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -523,6 +523,14 @@ else ifneq ($(GCC_TARGET_ARCH),)
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
