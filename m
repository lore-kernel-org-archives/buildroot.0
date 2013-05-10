From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 23:02:37 -0500
Subject: [Buildroot] [PATCH v3 6/7] libvpx: new package libvpx
In-Reply-To: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368158558-6069-7-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

adds webm multimedia support and the VP8 encoder/decoder library.

http://www.webmproject.org/

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/libvpx/Config.in |    6 ++++
 package/multimedia/libvpx/libvpx.mk |   52 +++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 package/multimedia/libvpx/Config.in
 create mode 100644 package/multimedia/libvpx/libvpx.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index d0594b9..a0927e9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -20,6 +20,7 @@ source "package/multimedia/gst1-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/gst1-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
+source "package/multimedia/libvpx/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
diff --git a/package/multimedia/libvpx/Config.in b/package/multimedia/libvpx/Config.in
new file mode 100644
index 0000000..2327971
--- /dev/null
+++ b/package/multimedia/libvpx/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBVPX
+	bool "libvpx"
+	help
+	  a high-quality, open video format that's freely available to everyone.
+
+	  http://webmproject.org
diff --git a/package/multimedia/libvpx/libvpx.mk b/package/multimedia/libvpx/libvpx.mk
new file mode 100644
index 0000000..879a531
--- /dev/null
+++ b/package/multimedia/libvpx/libvpx.mk
@@ -0,0 +1,52 @@
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
+LIBVPX_INSTALL_STAGING = YES
+LIBVPX_LICENSE = BSD-3c 
+LIBVPX_LICENSE_FILES = LICENSE PATENTS 
+
+LIBVPX_INSTALL_STAGING = YES
+
+LIBVPX_CONF_ENV = \
+	LD=$$CC \
+	CROSS=$(GNU_TARGET_NAME)
+
+LIBVPX_CONF_OPT = \
+	--disable-examples \
+	--disable-docs \
+	--disable-unit-tests
+
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
-- 
1.7.9.5
