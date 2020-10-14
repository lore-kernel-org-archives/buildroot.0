From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 20:41:32 +0200
Subject: [Buildroot] [git commit] package/systemd: group all journal-remote
 tools under a single option
Message-ID: <20201014183045.1B8C681E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e46fe9a6f2b7cef9789f5172332067cac5ff03bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -Dremote=true flag enables three tools: systemd-journal-gatewayd,
systemd-journal-remote and systemd-journal-upload.

It is not possible with simple means to install them seperately. So use
the systemd-journal-remote option to enable or disable them all together.

Drop systemd-journal-gatewayd option and add it to legacy.

Fixes: #12301

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           |  8 ++++++++
 package/systemd/Config.in  | 28 ++++++++++++----------------
 package/systemd/systemd.mk | 13 ++++---------
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 95c2fb33b3..f535b49809 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
+	bool "systemd-journal-gatewayd now in systemd-journal-remote"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
+	help
+	  All system journal remote programs are now enabled using
+	  BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE.
+
 config BR2_TARGET_UBOOT_BOOT_SCRIPT
 	bool "u-boot script generation was moved"
 	select BR2_LEGACY
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7956370b83..ec34478e3d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -141,29 +141,25 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	default "x64"   if BR2_x86_64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
-config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
-	bool "HTTP server for journal events"
+config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
+	bool "enable journal remote tools"
+	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
-	  systemd-journal-gatewayd serves journal events over the
-	  network. Clients must connect using HTTP. The server
-	  listens on port 19531 by default.
+	  journal remote functionality adds three tools:
 
-	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
+	  systemd-journal-gatewayd serves journal events over the
+	  network.
 
-config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
-	bool "enable systemd-journal-remote"
-	depends on BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
-	select BR2_PACKAGE_LIBCURL
-	help
 	  systemd-journal-remote is a command to receive serialized
-	  journal events and store them to journal files. Input
-	  streams are in the Journal Export Format[1], i.e. like the
-	  output from journalctl --output=export. For transport over
-	  the network, this serialized stream is usually carried over
-	  an HTTPS connection.
+	  journal events and store them to journal files.
+
+	  systemd-journal-upload will upload journal entries to the
+	  URL specified with --url=.
 
+	  https://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 	  https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
+	  https://www.freedesktop.org/software/systemd/man/systemd-journal-upload.html
 
 config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 	bool "enable backlight support"
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b684f538a8..6f04283bdc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -240,18 +240,13 @@ else
 SYSTEMD_CONF_OPTS += -Danalyze=false
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
-SYSTEMD_DEPENDENCIES += libmicrohttpd
-SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
-else
-SYSTEMD_CONF_OPTS += -Dmicrohttpd=false
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
-SYSTEMD_CONF_OPTS += -Dremote=true
+# remote also depends on libcurl, this is already added above.
+SYSTEMD_DEPENDENCIES += libmicrohttpd
+SYSTEMD_CONF_OPTS += -Dremote=true -Dmicrohttpd=true
 SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * - - - systemd Journal Remote
 else
-SYSTEMD_CONF_OPTS += -Dremote=false
+SYSTEMD_CONF_OPTS += -Dremote=false -Dmicrohttpd=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
