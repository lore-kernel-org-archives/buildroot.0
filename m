From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:56:51 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	coredump
Message-ID: <20160702110927.BFB2781D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08e672fff3a057d515d76d93be449e80505b3a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c2f6e98..441a80a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -244,6 +244,15 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
 
+config BR2_PACKAGE_SYSTEMD_COREDUMP
+	bool "enable coredump hook"
+	help
+	  systemd-coredump can be used as a helper binary by the
+	  kernel when a user space program receives a fatal signal and
+	  dumps core.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-coredump.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ee7f74d..4a2654c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -231,6 +231,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-localed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
+SYSTEMD_CONF_OPTS += --enable-coredump
+else
+SYSTEMD_CONF_OPTS += --disable-coredump
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
@@ -289,6 +295,7 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 define SYSTEMD_USERS
+	systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
