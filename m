From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 20 Apr 2014 20:54:04 +0200
Subject: [Buildroot] [PATCH 2/2] systemd: add SMACK support option.
In-Reply-To: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1398020044-21021-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new configuration option is available in systemd menu, to enable
support for SMACK.

For this feature to properly work, systemd requires attr (build
dependency, also used for other features) and smack (runtime dependency).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk | 13 +++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f10637a..0c8ecd8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -105,4 +105,18 @@ config BR2_PACKAGE_SYSTEMD_COMPAT
 
 	  This option enables the installation of compatibility *.pc files.
 
+config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
+	bool "enable SMACK support"
+	select BR2_PACKAGE_ATTR
+	select BR2_PACKAGE_SMACK
+	help
+	  Enable support for SMACK, the Simple Mandatory Access Control
+	  Kernel, a minimal approach to Access Control implemented as a kernel
+	  LSM.
+
+	  This feature requires a kernel >= 3.8.
+
+	  When this feature is enabled, Systemd mounts smackfs and manages
+	  security labels for sockets.
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f7661ab..0dfd0c0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -59,6 +59,13 @@ else
 SYSTEMD_CONF_OPT += --disable-acl
 endif
 
+ifeq ($(BR2_PACKAGE_ATTR),y)
+SYSTEMD_CONF_OPT += --enable-attr
+SYSTEMD_DEPENDENCIES += attr
+else
+SYSTEMD_CONF_OPT += --disable-attr
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SYSTEMD_CONF_OPT += --enable-gudev
 SYSTEMD_DEPENDENCIES += libglib2
@@ -92,6 +99,12 @@ else
 SYSTEMD_CONF_OPT += --disable-networkd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT),y)
+SYSTEMD_CONF_OPT += --enable-smack
+else
+SYSTEMD_CONF_OPT += --disable-smack
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPT += LIBS=-lrt
 SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
-- 
1.9.0
