From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:31 +0000
Subject: [Buildroot] [PATCH 22/32] package/systemd: add optional support for
	importd
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-23-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 41c02a6..601281c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -183,6 +183,20 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
 
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
index 6d6a15e..5369b8a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -199,6 +199,12 @@ else
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
1.9.1
