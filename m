From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:28:29 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	firstboot
Message-ID: <20160702110926.BDCDA81D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dd9a00109070f62d7c99e369cc929f70f67ea45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Maxime: Add default y]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 20b4e28..a2cf4be 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -150,6 +150,15 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-sysusers.html
 
+config BR2_PACKAGE_SYSTEMD_FIRSTBOOT
+	bool "enable firstboot support"
+	default y
+	help
+	  systemd-firstboot initializes the most basic system settings
+	  interactively on the first boot.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-firstboot.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0520ced..c5d6478 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -171,6 +171,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-sysusers
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_FIRSTBOOT),y)
+SYSTEMD_CONF_OPTS += --enable-firstboot
+else
+SYSTEMD_CONF_OPTS += --disable-firstboot
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
