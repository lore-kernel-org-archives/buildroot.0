From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:28:56 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	random-seed
Message-ID: <20160702110926.D561C81D8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bab978a09bd48e587c110390618def91cf9507be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index a2cf4be..959154e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -159,6 +159,16 @@ config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
 
+config BR2_PACKAGE_SYSTEMD_RANDOMSEED
+	bool "enable random-seed support"
+	help
+	  systemd-random-seed is a service that restores the random
+	  seed of the system at early boot and saves it at
+	  shutdown. Saving/restoring the random seed across boots
+	  increases the amount of available entropy early at boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c5d6478..5672f00 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -177,6 +177,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-firstboot
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RANDOMSEED),y)
+SYSTEMD_CONF_OPTS += --enable-randomseed
+else
+SYSTEMD_CONF_OPTS += --disable-randomseed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
