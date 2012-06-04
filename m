From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jun 2012 23:07:31 +0200
Subject: [Buildroot] [git commit] pulseaudio: fix build error on toolchains
	without C++ support
Message-ID: <20120604210956.DCA6F96E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50995f43e18032a386bf2a4b0de47f2322a110a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optional webrtc echo canceller is written in C++, causing auto* to want
to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
If we don't have C++ support enabled in BR, CXX will point to /bin/false,
which makes configure think we aren't able to create C++ .so files
(arguable true), breaking the build when it tries to install the .so
workaround it by patching up the libtool invocations to use C mode instead.

Fixes http://autobuild.buildroot.net/results/114e5bf0086f2394b36f17a70cb54b357a72413c

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 175adfa..6d05822 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -32,6 +32,21 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+# The optional webrtc echo canceller is written in C++, causing auto* to want
+# to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
+# If we don't have C++ support enabled in BR, CXX will point to /bin/false,
+# which makes configure think we aren't able to create C++ .so files
+# (arguable true), breaking the build when it tries to install the .so
+# workaround it by patching up the libtool invocations to use C mode instead
+define PULSEAUDIO_FORCE_CC
+	$(SED) 's/--tag=CXX/--tag=CC/g' -e 's/(CXXLD)/(CCLD)/g' \
+		$(@D)/src/Makefile.in
+endef
+
+PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FORCE_CC
+endif
+
 # pulseaudio alsa backend needs pcm/mixer apis
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 PULSEAUDIO_CONF_OPT += --disable-alsa
