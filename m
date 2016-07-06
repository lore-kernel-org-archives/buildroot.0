From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  6 Jul 2016 23:50:55 +0200
Subject: [Buildroot] [PATCH] package/pulseaudio: remove WebRTC hook for
	toolchains without C++
Message-ID: <1467841855-28784-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This hook is not required anymore since we handle WebRTC dependency
with --enable/disable-webrtc-aec.

Also the hook doesn't have any effect since we use autoreconf because
it should have been a POST_CONFIGURE_HOOKS.

So, we can remove it safely.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index e0d9ab4..74a028b 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -94,21 +94,6 @@ else
 PULSEAUDIO_CONF_OPTS += --disable-webrtc-aec
 endif
 
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-# The optional webrtc echo canceller is written in C++, causing auto* to want
-# to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
-# If we don't have C++ support enabled in BR, CXX will point to /bin/false,
-# which makes configure think we aren't able to create C++ .so files
-# (arguable true), breaking the build when it tries to install the .so
-# workaround it by patching up the libtool invocations to use C mode instead
-define PULSEAUDIO_FORCE_CC
-	$(SED) 's/--tag=CXX/--tag=CC/g' -e 's/(CXXLD)/(CCLD)/g' \
-		$(@D)/src/Makefile.in
-endef
-
-PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FORCE_CC
-endif
-
 # neon intrinsics not available with float-abi=soft
 ifeq ($(BR2_ARM_SOFT_FLOAT),)
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-- 
2.5.5
