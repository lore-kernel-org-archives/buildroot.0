From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:29 +0100
Subject: [Buildroot] [RFC PATCH v2 30/30] package/libcef: Add v8 Snapshot
 option.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-31-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Coauthored-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 22 ++++++++++++++++++++++
 package/libcef/libcef.mk | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index c06fc094d3..9e0fa22ad5 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -69,6 +69,28 @@ config BR2_PACKAGE_LIBCEF_CEFCLIENT
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
 	select BR2_PACKAGE_WIDEVINE
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 0fa9c61315..63e2e3a767 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -210,6 +210,27 @@ else
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
 LIBCEF_DEPENDENCIES += widevine
@@ -242,6 +263,17 @@ endef
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
 define LIBCEF_EXTRACT_CMDS
 	# Extract Chromium source code
 	tar -C $(@D) \
-- 
2.20.1
