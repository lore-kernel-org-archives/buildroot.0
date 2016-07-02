From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:35:55 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	logind
Message-ID: <20160702110927.2986681D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61bb79192cce7cf76a83c0f5217c73c0893f565c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 7 +++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c3a1d00..c2499e6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -185,6 +185,13 @@ config BR2_PACKAGE_SYSTEMD_RFKILL
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-rfkill at .service.html
 
+config BR2_PACKAGE_SYSTEMD_LOGIND
+	bool "enable login daemon"
+	help
+	  systemd-logind is a system service that manages user logins.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index edd72c1..93b56fc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -195,6 +195,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-rfkill
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
+SYSTEMD_CONF_OPTS += --enable-logind
+else
+SYSTEMD_CONF_OPTS += --disable-logind
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
