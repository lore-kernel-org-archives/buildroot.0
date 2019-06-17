From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:28:36 +0200
Subject: [Buildroot] [git commit] package/systemd: add option to enable
 systemd-journal-remote
Message-ID: <20190617193821.1570F8F544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dbce34b3a2c8fc1a854395f6c33df658371eae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd-journal-remote was added in systemd v211, so add a new option
to enable or disable it.

Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 92ffc7cc5a..ad72a269ef 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -122,6 +122,20 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
+config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
+	bool "enable systemd-journal-remote"
+	depends on BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
+	select BR2_PACKAGE_LIBCURL
+	help
+	  systemd-journal-remote is a command to receive serialized
+	  journal events and store them to journal files. Input
+	  streams are in the Journal Export Format[1], i.e. like the
+	  output from journalctl --output=export. For transport over
+	  the network, this serialized stream is usually carried over
+	  an HTTPS connection.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
+
 config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 	bool "enable backlight support"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index edc4a9ecc1..e8fd7967bd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -178,6 +178,12 @@ else
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=false -Dqrencode=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
+SYSTEMD_CONF_OPTS += -Dremote=true
+else
+SYSTEMD_CONF_OPTS += -Dremote=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSTEMD_DEPENDENCIES += libselinux
 SYSTEMD_CONF_OPTS += -Dselinux=true
