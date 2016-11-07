From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:06:00 +0100
Subject: [Buildroot] [git commit] ffmpeg: disable on Microblaze
Message-ID: <20161107220604.D5C7281794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8e573fcb98f39b7fb3165d45dcb99f244eec4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building ffmpeg on Microblaze triggers the gcc PR71124, which causes
an infinite loop in the compiler. This causes numerous timeouts in the
autobuilders, such as, just over the last two days:

http://autobuild.buildroot.net/results/b47fb2ae810ada475fef215c1efb54a9891fef6f
http://autobuild.buildroot.net/results/a8a1dfb7d4a7a6babe665214030e2245d572d1d3
http://autobuild.buildroot.net/results/248c58cd20686497c4dabc1a19b2c8c7c76b33ab
http://autobuild.buildroot.net/results/3641092f62551bd41c24eafdce46804f9551b761
http://autobuild.buildroot.net/results/f2f65106c3e9dcfd546d5dad7cd0f7cd7145420c
http://autobuild.buildroot.net/results/c45f085ca421b12195fe6a9298b3b3a9cb761360
http://autobuild.buildroot.net/results/349de9b8251b9b72ace595920303e45497833c29

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index a3ca105..e813595 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	# No support for ARMv7-M in the ARM assembly logic
-	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M
+	# Microblaze build affected by gcc PR71124 (infinite loop)
+	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
