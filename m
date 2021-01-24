From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:37:42 +0100
Subject: [Buildroot] [git commit] package/sysklogd: add option to enable
 native logger
Message-ID: <20210124091901.127BD8344A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99cff5ef7405de5b587b05f3ca21a494e428cd1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Installs to /usr/bin and thus replaces the BusyBox logger if enabled.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr: use usual ifeq-else-endif block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/Config.in   | 16 ++++++++++++++++
 package/sysklogd/sysklogd.mk |  9 ++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 90649caa83..e9ee7f9321 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -13,6 +13,22 @@ config BR2_PACKAGE_SYSKLOGD
 
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
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 417b5dc68e..a07af9e91e 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -9,7 +9,14 @@ SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKL
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_CPE_ID_VALID = YES
-SYSKLOGD_CONF_OPTS = --exec-prefix=/ --without-logger
+SYSKLOGD_CONF_OPTS = --exec-prefix=/
+
+# Disable/Enable utilities
+ifeq ($(BR2_PACKAGE_SYSKLOGD_LOGGER),y)
+SYSKLOGD_CONF_OPTS += --with-logger
+else
+SYSKLOGD_CONF_OPTS += --without-logger
+endif
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
