From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:38:51 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	hostnamed
Message-ID: <20160702110927.7A99081D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13baa1c7008f72ed94d20a7db8426250e7ca5d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Maxime: add default y]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d8e6eba..1be0a96 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -216,6 +216,15 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+config BR2_PACKAGE_SYSTEMD_HOSTNAMED
+	bool "enable hostname daemon"
+	default y
+	help
+	  systemd-hostnamed is a system service that may be used as a
+	  mechanism to change the system's hostname.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8bcbcf8..5e58017 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -213,6 +213,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-importd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HOSTNAMED),y)
+SYSTEMD_CONF_OPTS += --enable-hostnamed
+else
+SYSTEMD_CONF_OPTS += --disable-hostnamed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
