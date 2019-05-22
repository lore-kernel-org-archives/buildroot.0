From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 15:59:01 +0200
Subject: [Buildroot] [PATCH v2 2/7] package/ffmpeg: re-enable package if
 BUG_85180 is present
In-Reply-To: <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522135906.30796-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
This package has been excluded from building if BUG_85180 is present.
Bug shows up building ffmpeg with optimization.

In config.mk if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
- add --disable-optimizations to FFMPEG_CONF_OPTS
- passing -O0 to CFLAGS in FFMPEG_CONF_ENV
Then remove 'depends on !BR2_microblaze' from Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1->V2:
* use BUG_85180 instead of BUG_71124 since they are the same bug

 package/ffmpeg/Config.in | 2 --
 package/ffmpeg/ffmpeg.mk | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index 8c91b149f4..a3cc5be1a4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -525,6 +525,11 @@ endif
 
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+FFMPEG_CONF_OPTS += --disable-optimizations
+FFMPEG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
 	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
-- 
2.17.1
