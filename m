From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Nov 2011 20:57:23 +0100
Subject: [Buildroot] [git commit branch/next] transmission: add gtk support
Message-ID: <20111117200507.6B6678F5CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2211f63e79d9bc3057e94179fba22284b6b635a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/transmission/Config.in       |    7 +++++++
 package/transmission/transmission.mk |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 5284446..3fcf017 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -33,6 +33,13 @@ config BR2_PACKAGE_TRANSMISSION_REMOTE
 	bool "transmission-remote"
 	help
 	  Install transmission remote management tool.
+
+config BR2_PACKAGE_TRANSMISSION_GTK
+	bool "transmission-gtk"
+	depends on BR2_PACKAGE_LIBGTK2
+	help
+	  Install transmission GTK-based GUI interface.
+
 endif
 
 comment "Transmission requires a toolchain with IPv6 support"
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index db06692..c0d763b 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -14,7 +14,6 @@ TRANSMISSION_DEPENDENCIES = \
 	zlib
 
 TRANSMISSION_CONF_OPT = \
-	--disable-gtk \
 	--disable-libnotify \
 	--enable-lightweight
 
@@ -49,4 +48,11 @@ else
 	TRANSMISSION_CONF_OPT += --disable-remote
 endif
 
+ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
+	TRANSMISSION_CONF_OPT += --enable-gtk
+	TRANSMISSION_DEPENDENCIES += libgtk2
+else
+	TRANSMISSION_CONF_OPT += --disable-gtk
+endif
+
 $(eval $(call AUTOTARGETS))
