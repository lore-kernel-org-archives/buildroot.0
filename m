From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:54:42 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
	support for quotacheck
Message-ID: <20160229215455.A351180359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6149e121727acde3d54c528153c7c25baeaf925a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 85dcf07..97d48c4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -110,6 +110,16 @@ config BR2_PACKAGE_SYSTEMD_BOOTCHART
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-bootchart.html
 
+config BR2_PACKAGE_SYSTEMD_QUOTACHECK
+	bool "enable quotacheck tools"
+	help
+	  systemd-quotacheck is a service responsible for file system
+	  quota checks. It is run once at boot after all necessary
+	  file systems are mounted. It is pulled in only if at least
+	  one file system has quotas enabled.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6266388..b1d347d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -149,6 +149,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-bootchart
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
+SYSTEMD_CONF_OPTS += --enable-quotacheck
+else
+SYSTEMD_CONF_OPTS += --disable-quotacheck
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
