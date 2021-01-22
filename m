From: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 22 Jan 2021 16:43:32 +0100
Subject: [Buildroot] [PATCH 2/3] package/sysklogd: add menuconfig support
 for enabling native logger
In-Reply-To: <20210122154333.1927190-1-troglobit@gmail.com>
References: <20210122154333.1927190-1-troglobit@gmail.com>
Message-ID: <20210122154333.1927190-3-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Installs to /usr/bin and thus replaces the BusyBox logger if enabled.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/Config.in   | 17 +++++++++++++++++
 package/sysklogd/sysklogd.mk |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 90649caa83..52bed0cc18 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -13,7 +13,24 @@ config BR2_PACKAGE_SYSKLOGD
 
 	  https://github.com/troglobit/sysklogd/
 
+if BR2_PACKAGE_SYSKLOGD
+
+config BR2_PACKAGE_SYSKLOGD_LOGGER
+	bool "logger tool"
+	help
+	  Generate log messages from scripts or from the command line.
+
+	  This version of logger is receommended for use with sysklogd.
+	  It makes use of the new syslogp() API for RFC5424 style logs,
+	  e.g. MSGID, strucutred data (SD), etc.
+
+	  The BusyBox, or util-linux, logger tools can also be used, but
+	  are limited to RFC3164 style messages.
+
+endif
+
 comment "sysklogd needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index fc54ab6936..235219c4fc 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -11,6 +11,10 @@ SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_CPE_ID_VALID = YES
 SYSKLOGD_CONF_OPTS =  --prefix=/usr --sysconfdir=/etc --localstatedir=/var
 
+# Disable/Enable utilities
+SYSKLOGD_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_SYSKLOGD_LOGGER),--with-logger,--without-logger)
+
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
 		$(TARGET_DIR)/etc/syslog.conf
-- 
2.25.1
