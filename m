From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:26:54 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	tmpfiles
Message-ID: <20160702102710.D07CD80410@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=868de4fc4c885dab23a658690e25b7eeef8605f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Maxime: Add default y]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 324e884..df1a428 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -131,6 +131,17 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
 
+config BR2_PACKAGE_SYSTEMD_TMPFILES
+	bool "enable tmpfiles support"
+	default y
+	help
+	  systemd-tmpfiles creates, deletes, and cleans up volatile
+	  and temporary files and directories, based on the
+	  configuration file format and location specified in
+	  tmpfiles.d(5).
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c0503ae..779d7c5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -159,6 +159,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-quotacheck
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+SYSTEMD_CONF_OPTS += --enable-tmpfiles
+else
+SYSTEMD_CONF_OPTS += --disable-tmpfiles
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
