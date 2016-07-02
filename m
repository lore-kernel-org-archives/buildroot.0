From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:37:28 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	machined
Message-ID: <20160702110927.4281F81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3651fc5feaaa8843d0ddafb741719a14faa90a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c2499e6..d9f31b6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -192,6 +192,15 @@ config BR2_PACKAGE_SYSTEMD_LOGIND
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-logind.service.html
 
+config BR2_PACKAGE_SYSTEMD_MACHINED
+	bool "enable machine daemon"
+	help
+	  systemd-machined is a system service that keeps track of
+	  virtual machines and containers, and processes belonging to
+	  them.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 93b56fc..44a22a9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -201,6 +201,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-logind
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINED),y)
+SYSTEMD_CONF_OPTS += --enable-machined
+else
+SYSTEMD_CONF_OPTS += --disable-machined
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
