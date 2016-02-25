From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:20 +0000
Subject: [Buildroot] [PATCH 11/32] package/systemd: add optional support for
	vconsole
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-12-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in  | 8 ++++++++
 package/systemd/systemd.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 31a2eb6..b4b844f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -92,6 +92,14 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
 
+config BR2_PACKAGE_SYSTEMD_VCONSOLE
+	bool "enable vconsole tool"
+	help
+	  systemd-vconsole-setup is an early boot service that configures the virtual
+	  console font and console keymap.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-vconsole-setup.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 095bd74..75e2739 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -133,6 +133,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-binfmt
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_VCONSOLE),y)
+SYSTEMD_CONF_OPTS += --enable-vconsole
+else
+SYSTEMD_CONF_OPTS += --disable-vconsole
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
