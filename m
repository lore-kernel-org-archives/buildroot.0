From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:58:12 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	polkit
Message-ID: <20160702110927.DBCF281D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a9e440b8ecd90a63766c7ab795b58cf5619ddaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 441a80a..80796d2 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -253,6 +253,17 @@ config BR2_PACKAGE_SYSTEMD_COREDUMP
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
 
+config BR2_PACKAGE_SYSTEMD_POLKIT
+	bool "enable polkit support"
+	select BR2_PACKAGE_POLKIT
+	help
+	  If enabled, systemd is built with polkit support and policy
+	  files for its services are generated and installed. It is
+	  useful for allowing unprivileged processes to speak to
+	  systemd's many privileged processes.
+
+	  http://wiki.freedesktop.org/www/Software/polkit/
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4a2654c..5b0aa01 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -237,6 +237,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-coredump
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
+SYSTEMD_CONF_OPTS += --enable-polkit
+else
+SYSTEMD_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
