From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:09 +0200
Subject: [Buildroot] [PATCH 09/31] package/systemd: add optional support for
	importd
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-9-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8a1c312..17f62a4 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -198,6 +198,20 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-machined.service.html
 
+config BR2_PACKAGE_SYSTEMD_IMPORTD
+	bool "enable import daemon"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_LZ4
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_ZLIB
+	help
+	  systemd-importd is a system service that manages virtual machine and
+	  container images for systemd-machined and machinectl.
+
+	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 44a22a9..8bcbcf8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -207,6 +207,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-machined
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_IMPORTD),y)
+SYSTEMD_CONF_OPTS += --enable-importd
+else
+SYSTEMD_CONF_OPTS += --disable-importd
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.8.1
