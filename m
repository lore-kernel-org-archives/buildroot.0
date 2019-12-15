From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 21:33:56 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: add option to enable
 sandboxing support
Message-ID: <20191215202817.862798B535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a19afecb428bae6e323baf4178baacc2f545649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an option to enable WebKit's sandbox, which uses kernel
namespaces to isolate the processes used for Web content rendering
(WebKitWebProcess) and network/disk access (WebKitNetworkProcess).

The reason to have an option is that it needs additional dependencies
(bubblewrap, xdg-dbus-proxy, libseccomp), and that some users may
choose to deploy alternative solution (for example: putting all
of WebKit inside its own container, using systemd-nspawn or the
like).

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Peter: select libseccomp]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/Config.in    | 15 +++++++++++++++
 package/wpewebkit/wpewebkit.mk | 14 ++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f1460db20e..cc73cce324 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -63,6 +63,21 @@ config BR2_PACKAGE_WPEWEBKIT
 
 if BR2_PACKAGE_WPEWEBKIT
 
+config BR2_PACKAGE_WPEWEBKIT_SANDBOX
+	bool "sandboxing support"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	select BR2_PACKAGE_BUBBLEWRAP # runtime
+	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
+	select BR2_PACKAGE_LIBSECCOMP
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
