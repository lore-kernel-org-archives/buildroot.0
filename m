From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:38:46 +0200
Subject: [Buildroot] [git commit] package/transmission: remove
 BR2_PACKAGE_TRANSMISSION_REMOTE
Message-ID: <20180520134322.84EE081320@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79a678d7745bc3f3b5f361a7e3f25f39c3f1568b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6e223241e1bb58a27eb890291f9f5c1fcc6a0818 ("Add Transmission
package"), which added the transmission package, introduced a
BR2_PACKAGE_TRANSMISSION_REMOTE Config.in option, supposedly matching
the --enable-remote/--disable-remote transmission option.

However, transmission as of version 2.33 packaged by this initial
commit, did not have a --enable-remote/--disable-remote option, and it
was apparently never part of transmission.

Therefore, this commit removes this useless option. Since the
transmission-remote tool is automatically built when the daemon is
enabled, the Config.in.legacy handling selects
BR2_PACKAGE_TRANSMISSION_DAEMON.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     | 11 +++++++++++
 package/transmission/Config.in       |  5 -----
 package/transmission/transmission.mk |  6 ------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 66d3a0c5a8..1494704221 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,17 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
+config BR2_PACKAGE_TRANSMISSION_REMOTE
+	bool "transmission remote tool option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_TRANSMISSION_DAEMON
+	help
+	  Upstream does not provide a separate configure option for
+	  the tool transmission-remote, it is built when the
+	  transmission daemon has been enabled. Therefore, Buildroot
+	  has automatically enabled BR2_PACKAGE_TRANSMISSION_DAEMON
+	  for you.
+
 config BR2_PACKAGE_LIBKCAPI_APPS
 	bool "libkcapi test applications removed"
 	select BR2_LEGACY
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 2110e52ac6..dac4d1b330 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -32,11 +32,6 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 	help
 	  Install transmission daemon.
 
-config BR2_PACKAGE_TRANSMISSION_REMOTE
-	bool "transmission-remote"
-	help
-	  Install transmission remote management tool.
-
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
 	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f10fa190c8..65add0d8c0 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -75,12 +75,6 @@ else
 TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
 
-ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
-TRANSMISSION_CONF_OPTS += --enable-remote
-else
-TRANSMISSION_CONF_OPTS += --disable-remote
-endif
-
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
 TRANSMISSION_CONF_OPTS += --with-gtk
 TRANSMISSION_DEPENDENCIES += libgtk3
