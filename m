From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sun,  5 Apr 2015 17:10:10 -0500
Subject: [Buildroot] [PATCH v2 1/2] systemd: add option to enable kdbus
	support
Message-ID: <1428271811-27530-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the future when the kernel offically supports kdbus, this option
should automatically enable the kernel kdbus config option(s).

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/systemd/Config.in  | 5 +++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d00ac9d..0543b76 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -71,6 +71,11 @@ config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
 	  Enable extra features for Systemd: journal compression and
 	  signing.
 
+config BR2_PACKAGE_SYSTEMD_KDBUS
+	bool "enable kdbus support"
+	help
+	  Enable kdbus support for Systemd.
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 	bool "HTTP server for journal events"
 	select BR2_PACKAGE_LIBMICROHTTPD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 98bda02..81fe434 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -77,6 +77,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_KDBUS),y)
+SYSTEMD_CONF_OPTS += --enable-kdbus
+else
+SYSTEMD_CONF_OPTS += --disable-kdbus
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += \
 	xz 		\
-- 
1.9.1
