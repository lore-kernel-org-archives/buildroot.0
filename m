From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Sep 2012 23:06:50 +0200
Subject: [Buildroot] [git commit] package: add opus-tools
Message-ID: <20120912073359.5A6C599621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0bbb2eda9a810ac3e07a99c0042e246c24e74b2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in     |    1 +
 package/opus-tools/Config.in     |   10 ++++++++++
 package/opus-tools/opus-tools.mk |   22 ++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index afe4a23..273d9bc 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -19,6 +19,7 @@ source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
+source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
diff --git a/package/opus-tools/Config.in b/package/opus-tools/Config.in
new file mode 100644
index 0000000..2552d19
--- /dev/null
+++ b/package/opus-tools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_OPUS_TOOLS
+	bool "opus-tools"
+	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_LIBOGG
+	help
+	  Opus codec command line tools. This package provides the
+	  reference implementations of encoder and decoder utilities
+	  for libopus.
+
+	  http://opus-codec.org
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
new file mode 100644
index 0000000..233ad9a
--- /dev/null
+++ b/package/opus-tools/opus-tools.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# opus-tools
+#
+#############################################################
+
+OPUS_TOOLS_VERSION = 0.1.5
+OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_TOOLS_CONF_OPT = --disable-oggtest --disable-opustest
+OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkg-config
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+OPUS_TOOLS_DEPENDENCIES += libpcap
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+OPUS_TOOLS_CONF_OPT += --enable-sse
+else
+OPUS_TOOLS_CONF_OPT += --disable-sse
+endif
+
+$(eval $(autotools-package))
