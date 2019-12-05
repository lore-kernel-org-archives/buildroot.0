From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:17 +0000
Subject: [Buildroot] [PATCH v1 30/30] package/libcef: Add v8 Snapshot option.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-31-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is an optimisation for JavaScript context creation
(e.g. opening new tabs).

Coauthored-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 31 +++++++++++++++++++++++++++++++
 package/libcef/libcef.mk | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index bab584df30..0dedd062e9 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -95,6 +95,37 @@ config BR2_PACKAGE_LIBCEF_CEFSIMPLE
 	help
 	  Enables libcef example application cefsimple.
 
+comment "libcef v8 snapshots depends on a 64-bit target arch"
+	depends on !BR2_aarch64 && !BR2_x86_64
+
+config BR2_PACKAGE_LIBCEF_V8_SNAPSHOTS
+	bool "Enable v8 snapshots in libcef"
+	depends on BR2_aarch64 || BR2_x86_64
+	select BR2_PACKAGE_HOST_DBUS
+	select BR2_PACKAGE_HOST_FFMPEG
+	select BR2_PACKAGE_HOST_LIBXCB
+	select BR2_PACKAGE_HOST_PCIUTILS
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
+
+	  Note that since this requires building a browser for
+	  the host, it requires a lot of extra host packages
+	  to be built.  These host library packages need to have
+	  the same memory architecture (32 vs. 64 bit) as the
+	  target, because for the captured heap snapshot to be
+	  valid for the target, it must be captured with a binary
+	  which shares the same memory architecture.
+
 config BR2_PACKAGE_LIBCEF_WIDEVINE
 	bool "Enable Widevine support in libcef."
 	select BR2_PACKAGE_WIDEVINE
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 9d3b305451..e5a60e74ee 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -220,6 +220,30 @@ else
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
+	host-libxcb \
+	host-mesa3d \
+	host-pciutils \
+	host-xcb-util \
+	host-xlib_libXcomposite \
+	host-xlib_libXcursor \
+	host-xlib_libXdamage \
+	host-xlib_libXrandr \
+	host-xlib_libXScrnSaver \
+	host-xlib_libXtst
+else
+LIBCEF_GN_DEFINES += \
+	v8_snapshot_toolchain=\"//build/toolchain/linux/unbundle:host\" \
+	v8_use_snapshot=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCEF_WIDEVINE),y)
 LIBCEF_GN_DEFINES += enable_widevine=true
 LIBCEF_DEPENDENCIES += widevine
@@ -243,6 +267,17 @@ endef
 LIBCEF_POST_INSTALL_TARGET_HOOKS += LIBCEF_INSTALL_CEFSIMPLE
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
 # To build libcef, the CEF project source must be extracted in a
 # `cef` directory inside the Chromium source tree.  We override
 # the buildroot default extract commands to get the desired source
-- 
2.20.1
