From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 21:28:15 +0200
Subject: [Buildroot] [git commit] libvpx: new package libvpx
Message-ID: <20130602212113.340759A097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1460245354019df29ffc4c3d76ddd61cb14dfd04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

adds webm multimedia support and the VP8 encoder/decoder library.

http://www.webmproject.org/

[Peter: strip trailing spaces, wrap help text]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/libvpx/Config.in |    7 ++++
 package/multimedia/libvpx/libvpx.mk |   53 +++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 931e6d3..dd74863 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -15,6 +15,7 @@ source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
+source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
diff --git a/package/multimedia/libvpx/Config.in b/package/multimedia/libvpx/Config.in
new file mode 100644
index 0000000..1332c56
--- /dev/null
+++ b/package/multimedia/libvpx/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBVPX
+	bool "libvpx"
+	help
+	  A high-quality, open video format that's freely available to
+	  everyone.
+
+	  http://webmproject.org
diff --git a/package/multimedia/libvpx/libvpx.mk b/package/multimedia/libvpx/libvpx.mk
new file mode 100644
index 0000000..131fd49
--- /dev/null
+++ b/package/multimedia/libvpx/libvpx.mk
@@ -0,0 +1,53 @@
+#############################################################
+#
+# libvpx
+#
+#############################################################
+
+LIBVPX_VERSION = v1.2.0
+LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
+LIBVPX_SITE_METHOD = git
+
+LIBVPX_LICENSE = BSD-3c
+LIBVPX_LICENSE_FILES = LICENSE PATENTS
+
+LIBVPX_INSTALL_STAGING = YES
+
+# ld is being used with cc options. therefore, pretend ld is cc.
+LIBVPX_CONF_ENV = \
+	LD="$(TARGET_CC)" \
+	CROSS=$(GNU_TARGET_NAME)
+
+LIBVPX_CONF_OPT = \
+	--disable-examples \
+	--disable-docs \
+	--disable-unit-tests
+
+# This is not a true autotools package.  It is based on the ffmpeg build system
+define LIBVPX_CONFIGURE_CMDS
+	(cd $(LIBVPX_SRCDIR) && rm -rf config.cache && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(LIBVPX_CONF_ENV) \
+	./configure \
+		--target=generic-gnu \
+		--enable-pic \
+		--prefix=/usr \
+		$(SHARED_STATIC_LIBS_OPTS) \
+		$(LIBVPX_CONF_OPT) \
+	)
+endef
+
+define LIBVPX_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define LIBVPX_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
+endef
+
+define LIBVPX_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
