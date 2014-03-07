From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 00:08:38 +0100
Subject: [Buildroot] [git commit] jack2: new package
Message-ID: <20140307230906.5B43A9BDFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32a40fdee2dba75345a5f8ad5f4b3c812c3e9dd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: use github download helper, small improvements to Config.in]

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/jack2/Config.in |   19 +++++++++++++++++++
 package/jack2/jack2.mk  |   29 +++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 417c9b8..70e5a7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -11,6 +11,7 @@ source "package/ffmpeg/Config.in"
 source "package/flac/Config.in"
 source "package/gstreamer/Config.in"
 source "package/gstreamer1/Config.in"
+source "package/jack2/Config.in"
 source "package/lame/Config.in"
 source "package/libvpx/Config.in"
 source "package/madplay/Config.in"
diff --git a/package/jack2/Config.in b/package/jack2/Config.in
new file mode 100644
index 0000000..2117f48
--- /dev/null
+++ b/package/jack2/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_JACK2
+	bool "jack2"
+	depends on BR2_LARGEFILE # libsndfile
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  JACK Audio Connection Kit (server and example clients).
+
+	  JACK is a low-latency sound server, allowing multiple
+	  applications to connect to one audio device, and to share
+	  audio between themselves.  This package contains the daemon
+	  jackd as well as some example clients.
+
+	  http://jackaudio.org/
+
+comment "jack2 needs a toolchain w/ largefile and threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
new file mode 100644
index 0000000..279fca0
--- /dev/null
+++ b/package/jack2/jack2.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# jack2
+#
+################################################################################
+
+JACK2_VERSION = 37976441044d69b91d61d8f6278949a39cf1b7b7
+JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
+JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
+JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
+
+define JACK2_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS)	\
+		./waf configure			\
+		--prefix=/usr			\
+                --alsa				\
+       )
+endef
+
+define JACK2_BUILD_CMDS
+       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))
+endef
+
+define JACK2_INSTALL_TARGET_CMDS
+       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
+endef
+
+$(eval $(generic-package))
