From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Tue, 18 Nov 2014 15:54:46 +0100
Subject: [Buildroot] [PATCH V3 4/5] c-icap: new package
In-Reply-To: <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <1416322487-14247-5-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in        |  1 +
 package/c-icap/Config.in | 15 ++++++++++++
 package/c-icap/S96cicap  | 35 ++++++++++++++++++++++++++
 package/c-icap/c-icap.mk | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+)
 create mode 100644 package/c-icap/Config.in
 create mode 100644 package/c-icap/S96cicap
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
index 0000000..71ab470
--- /dev/null
+++ b/package/c-icap/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_C_ICAP
+	bool "c-icap"
+	depends on !BR2_PREFER_STATIC_LIB 
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  c-icap is an implementation of an ICAP server. It can be used with 
+	  HTTP proxies that support the ICAP protocol to implement content 
+	  adaptation and filtering services.
+	  Most of the commercial HTTP proxies must support the ICAP protocol.
+	  The open source Squid 3.x proxy server supports it.
+
+	  http://c-icap.sourceforge.net/
+
+comment "c-icap needs a toolchain w/ threads and libdl library"
+	depends on BR2_PREFER_STATIC_LIB  || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/c-icap/S96cicap b/package/c-icap/S96cicap
new file mode 100644
index 0000000..f176d9e
--- /dev/null
+++ b/package/c-icap/S96cicap
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+CICAP_BIN="/usr/bin/c-icap"
+CICAP_DIR="/var/run/c-icap"
+CICAP_LOG_DIR="/var/log/c-icap/"
+# (Re)create directories
+if [ ! -d $CICAP_DIR ]; then
+	mkdir -p $CICAP_DIR 
+fi
+if [ ! -d $CICAP_LOG_DIR ]; then
+	mkdir -p $CICAP_LOG_DIR 
+fi
+
+case "$1" in
+    start)
+	echo -n "Starting c-icap server "
+	start-stop-daemon -S -x $CICAP_BIN
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	;;
+    stop)
+	echo -n "Shutting down c-icap server "
+	start-stop-daemon -K -x $CICAP_BIN
+	;;
+    restart | force-reload)
+	$0 stop
+	sleep 2
+	$0 start
+	if [ "$?" != "0" ]; then
+		exit 1
+	fi
+	;;
+     *)
+	echo "Usage: /etc/init.d/S96cicap {start|stop|restart|force-reload}"
+	exit 1
+esac
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
new file mode 100644
index 0000000..05e2f6a
--- /dev/null
+++ b/package/c-icap/c-icap.mk
@@ -0,0 +1,64 @@
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
+C_ICAP_CONF_OPTS = --with-process-mutexes=posix --without-ldap
+
+ifeq ($(BR2_LARGEFILE),y)
+C_ICAP_CONF_OPTS += --enable-large-files
+else
+C_ICAP_CONF_OPTS += --disable-large-files
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+C_ICAP_CONF_OPTS += --enable-ipv6
+else
+C_ICAP_CONF_OPTS += --disable-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+C_ICAP_CONF_OPTS += --with-berkeleydb
+C_ICAP_DEPENDENCIES += berkeleydb
+else
+C_ICAP_CONF_OPTS += --without-berkeleydb
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+C_ICAP_CONF_OPTS += --with-bzip2
+C_ICAP_DEPENDENCIES += bzip2
+else
+C_ICAP_CONF_OPTS += --without-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_PERL),y)
+C_ICAP_CONF_OPTS += --with-perl
+C_ICAP_DEPENDENCIES += perl
+else
+C_ICAP_CONF_OPTS += --without-perl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+C_ICAP_CONF_OPTS += --with-zlib
+C_ICAP_DEPENDENCIES += zlib
+else
+C_ICAP_CONF_OPTS += --without-zlib
+endif
+
+C_ICAP_POST_INSTALL_TARGET_HOOKS = C_ICAP_INSTALL_TARGET_CONFIGS
+
+define C_ICAP_INSTALL_INIT_SYSV
+        # install start/stop script
+        @if [ ! -f $(TARGET_DIR)/etc/init.d/S96cicap ]; then \
+                $(INSTALL) -m 0755 -D package/c-icap/S96cicap $(TARGET_DIR)/etc/init.d/S96cicap; \
+        fi
+endef
+
+$(eval $(autotools-package))
-- 
1.8.4.5
