From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:19 +0000
Subject: [Buildroot] [PATCH 10/32] package/systemd: add optional support for
	binfmt
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-11-git-send-email-gabe@hashrabbit.co>
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
index 5d74383..31a2eb6 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -84,6 +84,14 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
 
+config BR2_PACKAGE_SYSTEMD_BINFMT
+	bool "enable binfmt tool"
+	help
+	  systemd-binfmt is an early boot service that registers additional binary
+	  formats for executables in the kernel.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
+
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 32bf41b..095bd74 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -127,6 +127,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-microhttpd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_BINFMT),y)
+SYSTEMD_CONF_OPTS += --enable-binfmt
+else
+SYSTEMD_CONF_OPTS += --disable-binfmt
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
1.9.1
