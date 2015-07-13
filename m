From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:35:20 +0200
Subject: [Buildroot] [git commit] systemd: add option to enable kdbus support
Message-ID: <20150713153603.E1151818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93ee95b4f0d392ad395acc1a2329bb26d4612992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the future when the kernel offically supports kdbus, this option
should automatically enable the kernel kdbus config option(s).

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  |    5 +++++
 package/systemd/systemd.mk |    6 ++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 303cf22..510badd 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -73,6 +73,11 @@ config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
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
index 5c9effa..b62fc08 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -71,6 +71,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_KDBUS),y)
+SYSTEMD_CONF_OPTS += --enable-kdbus
+else
+SYSTEMD_CONF_OPTS += --disable-kdbus
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += xz libgcrypt
 SYSTEMD_CONF_OPTS += \
