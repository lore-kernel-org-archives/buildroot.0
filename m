From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Nov 2017 17:22:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix fenv build failure on
 ARCv2 with glibc
In-Reply-To: <20171111162242.15110-1-bernd.kuhls@t-online.de>
References: <20171111162242.15110-1-bernd.kuhls@t-online.de>
Message-ID: <20171111162242.15110-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/toolchain?id=0633eb58a2912328508a76f8fe9875a0d113a880
added glibc support for ARCv2 which lacks fenv.h.

Code format was suggested by Arnout:
http://lists.busybox.net/pipermail/buildroot/2017-November/206631.html

Fixes
http://autobuild.buildroot.net/results/aec/aec300d7d4472421398a24202d6871c965bd1be5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 17a4881348..1b0e71a836 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	default y
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
+	depends on !BR2_archs38 || !BR2_TOOLCHAIN_USES_GLIBC
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	depends on !BR2_nios
 	# No support for ARMv7-M in the ARM assembly logic
-- 
2.11.0
