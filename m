From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 14 Oct 2020 17:12:50 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: group all journal-remote
 tools
In-Reply-To: <20201014151249.18330-1-buildroot@heine.tech>
References: <20201014151249.18330-1-buildroot@heine.tech>
Message-ID: <20201014151249.18330-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -Dremote=true flag enables three tools.
systemd-journal-gatewayd, systemd-journal-remote and
systemd-journal-upload.

It is not possible with simple means to install them seperately. So use
the systemd-journal-remote option do enable or disable them all together.

Drop systemd-journal-gatewayd option and add it to legacy.

Fixes: #12301

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 Config.in.legacy           |  7 +++++++
 package/systemd/Config.in  | 28 ++++++++++++----------------
 package/systemd/systemd.mk | 13 ++++---------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 95c2fb33b3..f6c3c626e8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
+	bool "systemd-journal-gatewayd now in systemd-journal-remote"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  all system journal remote programs are now
+	  grouped in systemd-journal-remote
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
-- 
2.25.1
