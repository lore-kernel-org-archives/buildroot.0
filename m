From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 14 Dec 2019 16:22:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 sandboxing support
Message-ID: <20191214142216.2609541-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to enable WebKit's sandbox, which uses kernel
namespaces to isolate the processes used for Web content rendering
(WebKitWebProcess) and network/disk access (WebKitNetworkProcess).

The reason to have an option is that it needs additional dependencies
(bubblewrap, xdg-dbus-proxy, libseccomp), and that some users may
choose to deploy alternative solution (for example: putting all
of WebKit inside its own container, using systemd-nspawn or the
like).

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in    | 14 ++++++++++++++
 package/wpewebkit/wpewebkit.mk | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f1460db20e..37a3065761 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -63,6 +63,20 @@ config BR2_PACKAGE_WPEWEBKIT
 
 if BR2_PACKAGE_WPEWEBKIT
 
+config BR2_PACKAGE_WPEWEBKIT_SANDBOX
+	bool "sandboxing support"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	select BR2_PACKAGE_BUBBLEWRAP # runtime
+	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
+	help
+	  Enable sandboxing of the processes used for network operation,
+	  disk asccess, and Web content rendering.
+
+comment "sandboxing supports needs a toolchain w/ headers >= 3.12"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c90e2d1421..d732938b57 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -20,8 +20,18 @@ WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \
 	-DENABLE_ACCESSIBILITY=OFF \
 	-DENABLE_API_TESTS=OFF \
-	-DENABLE_BUBBLEWRAP_SANDBOX=OFF \
-	-DENABLE_MINIBROWSER=OFF
+	-DENABLE_MINIBROWSER=OFF \
+	-DSILENCE_CROSS_COMPILATION_NOTICES=ON
+
+ifeq ($(BR2_PACKAGE_WPEWEBKIT_SANDBOX),y)
+WPEWEBKIT_CONF_OPTS += \
+	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
+	-DBWRAP_EXECUTABLE=/usr/bin/bwrap \
+	-DDBUS_PROXY_EXECUTABLE=/usr/bin/xdg-dbus-proxy
+WPEWEBKIT_DEPENDENCIES += libseccomp
+else
+WPEWEBKIT_CONF_OPTS += -DENABLE_BUBBLEWRAP_SANDBOX=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 WPEWEBKIT_CONF_OPTS += \
-- 
2.24.1
