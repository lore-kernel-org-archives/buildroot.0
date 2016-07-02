From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:40:58 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	timedated
Message-ID: <20160702110927.9019F81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f52f685d4358760df73d77a6a07a6b7b5d28068f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
[Maxime: Add default y]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 1be0a96..e84a717 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -225,6 +225,16 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-hostnamed.service.html
 
+config BR2_PACKAGE_SYSTEMD_TIMEDATED
+	bool "enable timedate daemon"
+	default y
+	help
+	  systemd-timedated is a system service that may be used as a
+	  mechanism to change the system clock and timezone, as well
+	  as to enable/disable NTP time synchronization.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5e58017..ad75315 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -219,6 +219,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-hostnamed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TIMEDATED),y)
+SYSTEMD_CONF_OPTS += --enable-timedated
+else
+SYSTEMD_CONF_OPTS += --disable-timedated
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
