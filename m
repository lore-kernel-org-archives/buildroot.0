From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:34:47 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	backlight
Message-ID: <20160702110926.EAF9881D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722a24e175b754767d7547f7042ff06d603d3176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 959154e..46bbd13 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -169,6 +169,14 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
+config BR2_PACKAGE_SYSTEMD_BACKLIGHT
+	bool "enable backlight support"
+	help
+	  systemd-backlight is a service that restores the display
+	  backlight brightness at early boot and saves it at shutdown.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5672f00..98c97c3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -183,6 +183,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-randomseed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BACKLIGHT),y)
+SYSTEMD_CONF_OPTS += --enable-backlight
+else
+SYSTEMD_CONF_OPTS += --disable-backlight
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
