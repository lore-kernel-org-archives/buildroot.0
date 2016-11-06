From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:19:48 +0100
Subject: [Buildroot] [git commit branch/next] webrtc-audio-processing:
	refactor architecture dependency as a blind option
Message-ID: <20161107205049.D929D7FB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ea3a3b9c32f88871a1c3090a2a0dd5097061928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation to the addition of a webrtc GStreamer plugin that will
have to select the webrtc-audio-processing package (and therefore
inherits its dependencies), this commits adds a
BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS blind option to avoid
duplicating the architecture dependencies of this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webrtc-audio-processing/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 79a06d8..02715b0 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	# pthread_condattr_setclock
@@ -12,6 +16,6 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
 comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, gcc >= 4.8"
-	depends on BR2_arm || BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
