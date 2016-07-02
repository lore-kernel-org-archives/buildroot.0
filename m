From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:41:24 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	localed
Message-ID: <20160702110927.A39FD81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b663089078f1485c7649a6437ff24c0baabb0831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index e84a717..c2f6e98 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -235,6 +235,15 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-timedated.service.html
 
+config BR2_PACKAGE_SYSTEMD_LOCALED
+	bool "enable locale daemon"
+	help
+	  systemd-localed is a system service that may be used as
+	  mechanism to change the system locale settings, as well as
+	  the console key mapping and default X11 key mapping.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ad75315..ee7f74d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -225,6 +225,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-timedated
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_LOCALED),y)
+SYSTEMD_CONF_OPTS += --enable-localed
+else
+SYSTEMD_CONF_OPTS += --disable-localed
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
