From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Wed, 12 Nov 2014 17:16:32 +0100
Subject: [Buildroot] [PATCH V2 3/4] c-icap: new package
In-Reply-To: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1415808993-2394-4-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in        |  1 +
 package/c-icap/Config.in | 10 ++++++++++
 package/c-icap/c-icap.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/c-icap/Config.in
 create mode 100644 package/c-icap/c-icap.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..fe0af07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -983,6 +983,7 @@ menu "Networking applications"
 	source "package/boa/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
+	source "package/c-icap/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
new file mode 100644
index 0000000..e8ac241
--- /dev/null
+++ b/package/c-icap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_C_ICAP
+	bool "c-icap"
+	help
+	  c-icap is an implementation of an ICAP server. It can be used with 
+	  HTTP proxies that support the ICAP protocol to implement content 
+	  adaptation and filtering services.
+	  Most of the commercial HTTP proxies must support the ICAP protocol.
+	  The open source Squid 3.x proxy server supports it.
+
+	  http://c-icap.sourceforge.net/
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
new file mode 100644
index 0000000..8f93638
--- /dev/null
+++ b/package/c-icap/c-icap.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# c-icap
+#
+################################################################################
+
+C_ICAP_VERSION = 0.3.5
+C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
+C_ICAP_SITE = http://downloads.sourceforge.net/c-icap/
+C_ICAP_LICENSE = LGPLv2.1+
+C_ICAP_LICENSE_FILES = COPYING
+C_ICAP_INSTALL_STAGING = YES
+C_ICAP_CONF_OPTS = --sysconfdir=/etc --with-process-mutexes=posix
+ifeq ($(BR2_LARGEFILE),y)
+C_ICAP_CONF_OPTS += --enable-large-files
+else
+C_ICAP_CONF_OPTS += --disable-large-files
+endif
+
+define C_ICAP_INSTALL_TARGET_CONFIGS
+	mkdir -p $(TARGET_DIR)/var/run/c-icap/
+	mkdir -p $(TARGET_DIR)/tmp/c-icap/
+endef
+
+C_ICAP_POST_INSTALL_TARGET_HOOKS = C_ICAP_INSTALL_TARGET_CONFIGS
+
+$(eval $(autotools-package))
-- 
1.8.4.5
