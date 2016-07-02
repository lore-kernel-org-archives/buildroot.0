From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:38:29 +0200
Subject: [Buildroot] [git commit] package/systemd: add optional support for
	importd
Message-ID: <20160702110927.61B4F81D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c3b23f441954c4b51e8d97ccd461154a0265fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  | 15 +++++++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d9f31b6..d8e6eba 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -201,6 +201,21 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
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
+	  systemd-importd is a system service that manages virtual
+	  machine and container images for systemd-machined and
+	  machinectl.
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
