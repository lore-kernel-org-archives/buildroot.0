From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:35:16 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	rfkill
Message-ID: <20160702110927.13E5881D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac148898134f5e2554d359e9f02626b1dcb0a863
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 46bbd13..c3a1d00 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -177,6 +177,14 @@ config BR2_PACKAGE_SYSTEMD_BACKLIGHT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-backlight at .service.html
 
+config BR2_PACKAGE_SYSTEMD_RFKILL
+	bool "enable rfkill tools"
+	help
+	  systemd-rfkill is a service that restores the RF kill switch
+	  state at early boot and saves it at shutdown.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 98c97c3..edd72c1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -189,6 +189,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-backlight
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RFKILL),y)
+SYSTEMD_CONF_OPTS += --enable-rfkill
+else
+SYSTEMD_CONF_OPTS += --disable-rfkill
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
