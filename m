From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 26 May 2016 16:54:20 +0100
Subject: [Buildroot] [PATCH 2/2] ffmpeg: disable for mips64r2 and mips64r6
In-Reply-To: <1464278060-49999-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464278060-49999-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1464278060-49999-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS architecture detection is not accurate and is always detected as
mips64 even if we are using mips64r2 or mips64r6. Due to that, ffmpeg's
build system will pass the -mips64 flag which will conflict with the
-march option that our toolchain wrapper uses, and it will fail to build
showing errors like this one:

error: '-mips64' conflicts with the other architecture options, which
specify a mips64r2 processor

This problem has been already fixed upstream, but we would need to
backport 17 patches plus some changes in the ffmpeg.mk file. This is too
much, so better to just disable ffmpeg for mips64r2 and mips64r6 for the
upcoming Buildroot release.

This commit can be reverted in the next ffmpeg's version bump.

Fixes:

  http://autobuild.buildroot.net/results/7fd/7fd8187c0110cdcac622e667f4a81d2db84f11ef/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ffmpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 6b7a6e7..096ff95 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	default y if !BR2_nios2
+	# ffmpeg's configure script only supports mips64 (r1) variant
+	default y if !BR2_nios2 && !BR2_mips_64r2 && !BR2_mips_64r6
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-- 
2.7.3
