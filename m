From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:00:56 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	hibernation
Message-ID: <20160702110927.E8ADB81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3df9c47d73530c4d9e187fb17e1cb11e09ff631b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 80796d2..dcabf3b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -314,4 +314,12 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
 	  When this feature is enabled, Systemd mounts smackfs and manages
 	  security labels for sockets.
 
+config BR2_PACKAGE_SYSTEMD_HIBERNATE
+	bool "enable hibernation support"
+	help
+	  When this features is enabled, additional tools and services
+	  are built to support suspending and resuming the system.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5b0aa01..96c34a4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -277,6 +277,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-smack
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HIBERNATE),y)
+SYSTEMD_CONF_OPTS += --enable-hibernate
+else
+SYSTEMD_CONF_OPTS += --disable-hibernate
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPTS += LIBS=-lrt
 SYSTEMD_MAKE_OPTS += LDFLAGS+=-ldl
