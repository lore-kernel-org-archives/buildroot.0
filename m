From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 14 Apr 2014 11:25:36 +0200
Subject: [Buildroot] [PATCH 1/2] systemd: add option to enable compatibility
	libs
In-Reply-To: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1397467537-22766-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since systemd 209, some libraries have been merged into libsystemd.so:

 - libsystemd-daemon.so
 - libsystemd-id128.so
 - libsystemd-journal.so
 - libsystemd-login.so

A new configuration menu entry has been added to enable the installation
of compatibility pkg-config files, so that programs that depend on them
can still be built.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/Config.in  | 13 +++++++++++++
 package/systemd/systemd.mk |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 095fee0..f10637a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -92,4 +92,17 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_COMPAT
+	bool "enable compatibility libraries"
+	help
+	  Since systemd 209, the following libraries have been merged into
+	  libsystemd.so:
+
+	  - libsystemd-daemon
+	  - libsystemd-id128
+	  - libsystemd-journal
+	  - libsystemd-login
+
+	  This option enables the installation of compatibility *.pc files.
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ecedfce..4fa0e89 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -46,6 +46,10 @@ SYSTEMD_CONF_OPT += \
 	--disable-dbus \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
+SYSTEMD_CONF_OPT += --enable-compat-libs
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_CONF_OPT += --enable-acl
 SYSTEMD_DEPENDENCIES += acl
-- 
1.9.1
