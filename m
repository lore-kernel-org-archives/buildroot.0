From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:59:20 +0100
Subject: [Buildroot] [RFC PATCH v1 25/25] package/libcef: Add v8 Snapshot
 option.
In-Reply-To: <20191010165920.72050-1-michael.drake@codethink.co.uk>
References: <20191010165920.72050-1-michael.drake@codethink.co.uk>
Message-ID: <20191010165920.72050-26-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Coauthored-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 22 ++++++++++++++++++++++
 package/libcef/libcef.mk | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index 5ab5049a59..9bd33c9ffa 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -67,6 +67,28 @@ config BR2_PACKAGE_LIBCEF_CEFCLIENT
 	help
 	  Enables libcef example application cefclient.
 
+config BR2_PACKAGE_LIBCEF_V8_SNAPSHOTS
+	bool "Enable v8 snapshots in libcef"
+	select BR2_PACKAGE_HOST_DBUS
+	select BR2_PACKAGE_HOST_FFMPEG
+	select BR2_PACKAGE_HOST_LIBVPX
+	select BR2_PACKAGE_HOST_LIBXCB
+	select BR2_PACKAGE_HOST_XCB_UTIL
+	select BR2_PACKAGE_HOST_XLIB_LIBXTST
+	help
+	  Enables V8 snapshots.  This is an optimisation for
+	  JavaScript context creation (e.g. opening new tabs).
+	  It avoids needing to execute a whole load of JavaScript
+	  code that gets run on context initialisation.
+	  It works by building a browser for the host, creating
+	  a JavaScript context, and saving the JavaScript heap
+	  to file.  The target browser can then load the recorded
+	  JavaScript heap from file, instead of executing the
+	  JavaScript code.
+	  Note that since this requires building a browser for
+	  the host, it requires a lot of extra host packages
+	  to be built.
+
 config BR2_PACKAGE_LIBCEF_WIDEVINE
 	bool "Enable Widevine support in libcef."
 	help
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 18ac6493b8..9d103cb771 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -199,6 +199,27 @@ else
 LIBCEF_GN_DEFINES += use_pulseaudio=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEF_V8_SNAPSHOTS),y)
+LIBCEF_GN_DEFINES += \
+	v8_snapshot_toolchain=\"//build/toolchain/linux/unbundle:host\" \
+	v8_use_snapshot=true
+LIBCEF_DEPENDENCIES += \
+	host-alsa-lib \
+	host-dbus \
+	host-ffmpeg \
+	host-libvpx \
+	host-libxcb \
+	host-xcb-util \
+	host-xlib_libXcomposite \
+	host-xlib_libXcursor \
+	host-xlib_libXrandr \
+	host-xlib_libXScrnSaver \
+	host-xlib_libXtst
+else
+LIBCEF_GN_DEFINES += \
+	v8_use_snapshot=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCEF_WIDEVINE),y)
 LIBCEF_GN_DEFINES += enable_widevine=true
 else
@@ -360,4 +381,15 @@ endef
 LIBCEF_POST_INSTALL_TARGET_HOOKS += LIBCEF_INSTALL_CEFCLIENT
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCEF_V8_SNAPSHOTS),y)
+define LIBCEF_INSTALL_V8_SNAPSHOT_BINARIES
+	# v8 snapshot binaries
+	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/lib \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/natives_blob.bin \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/snapshot_blob.bin \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/v8_context_snapshot.bin
+endef
+LIBCEF_POST_INSTALL_TARGET_HOOKS += LIBCEF_INSTALL_V8_SNAPSHOT_BINARIES
+endif
+
 $(eval $(generic-package))
-- 
2.20.1
