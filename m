From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu, 18 Sep 2014 11:27:05 +0200
Subject: [Buildroot] [PATCH 2/3] New package: c-icap c-icap is an
	implementation of an ICAP server. Squid 3.x proxy server
	supports it.
In-Reply-To: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1411032426-11463-3-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds c-icap server, a free ICAP server. It can be used with squid server.

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in        |  1 +
 package/c-icap/Config.in | 10 ++++++++++
 package/c-icap/c-icap.mk | 24 ++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/c-icap/Config.in
 create mode 100644 package/c-icap/c-icap.mk

diff --git a/package/Config.in b/package/Config.in
index 73ba86a..24a0a8e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -950,6 +950,7 @@ menu "Networking applications"
 	source "package/boa/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
+	source "package/c-icap/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
new file mode 100644
index 0000000..827bfbf
--- /dev/null
+++ b/package/c-icap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_C_ICAP
+        bool "c-icap"
+        help
+          c-icap is an implementation of an ICAP server. It can be used with 
+          HTTP proxies that support the ICAP protocol to implement content 
+          adaptation and filtering services.
+          Most of the commercial HTTP proxies must support the ICAP protocol.
+          The open source Squid 3.x proxy server supports it.
+
+          http://c-icap.sourceforge.net/
\ No newline at end of file
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
new file mode 100644
index 0000000..d35d958
--- /dev/null
+++ b/package/c-icap/c-icap.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# c-icap
+#
+################################################################################
+
+C_ICAP_VERSION = 0.3.4
+C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
+C_ICAP_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_INSTALL_STAGING = YES
+C_ICAP_INSTALL_TARGET = YES
+C_ICAP_CONF_OPT = --sysconfdir=/etc --with-process-mutexes=posix --enable-large-files
+C_ICAP_DEPENDENCIES = 
+
+define C_ICAP_INSTALL_TARGET_CONFIGS
+	mkdir -p $(TARGET_DIR)/var/run/c-icap/
+	mkdir -p $(TARGET_DIR)/tmp/c-icap/
+	mkdir -p $(STAGING_DIR)/var/run/c-icap/
+	mkdir -p $(STAGING_DIR)/tmp/c-icap/
+endef
+
+C_ICAP_POST_INSTALL_TARGET_HOOKS = C_ICAP_INSTALL_TARGET_CONFIGS
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.8.4.5
