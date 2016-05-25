From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 25 May 2016 17:14:12 +0100
Subject: [Buildroot] [PATCH] ffmpeg: disable for mips64r2 and mips64r6
Message-ID: <1464192852-53397-1-git-send-email-Vincent.Riera@imgtec.com>
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
 package/ffmpeg/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index a273aea..debef0a 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -2,6 +2,10 @@ menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	depends on !BR2_nios2
+	# MIPS architecture detection is not accurate for 64-bit
+	# variants. This has been already fixed upstream, so please
+	# remove it in the next version bump.
+	depends on !BR2_mips_64r2 && !BR2_mips_64r6
 	help
 	  FFmpeg is a complete, cross-platform solution to record, convert
 	  and stream audio and video.
-- 
2.7.3
