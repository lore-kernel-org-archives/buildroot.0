From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Oct 2014 03:03:20 +0100
Subject: [Buildroot] [git commit] pulseaudio: correct libgtk3 handling
Message-ID: <20141026020556.41485AF6E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7006bff9b3cda17b36bd45e94426b64f270c625e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gtk3 support uses X11 specific functionality, so it should only be
enabled if the X11 backend is enabled.

Fixes:
http://autobuild.buildroot.net/results/9d9/9d9ddea26a5193367a80eede1be1122cec5cd939/
http://autobuild.buildroot.net/results/3fb/3fbbdbf39e29319b349b2cf155397a121f24bf28/
http://autobuild.buildroot.net/results/ccf/ccf31740a0e730f2626db9051931b1e0703c770d/

And many others.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 8d3d0f7..d24dcc8 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -47,6 +47,14 @@ else
 PULSEAUDIO_CONF_OPTS += --without-caps
 endif
 
+# gtk3 support needs X11 backend
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+PULSEAUDIO_DEPENDENCIES += libgtk3
+PULSEAUDIO_CONF_OPTS += --enable-gtk3
+else
+PULSEAUDIO_CONF_OPTS += --disable-gtk3
+endif
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
