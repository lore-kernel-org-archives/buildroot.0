From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun, 26 Dec 2010 09:22:25 -0600
Subject: [Buildroot] [PATCH v3 3/3] add syslog-ng 3.0.9 (a more feature rich
	syslog daemon)
In-Reply-To: <2b69360e32ed380ece014772502a6e5d3f1b6575.1293376253.git.smiley73@users.sourceforge.net>
References: <2b69360e32ed380ece014772502a6e5d3f1b6575.1293376253.git.smiley73@users.sourceforge.net>
Message-ID: <c5b5d2014fa8aaa23221495310fe890dd9931693.1293376253.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in              |    1 +
 package/syslog-ng/Config.in    |   23 ++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk |   41 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 package/syslog-ng/Config.in
 create mode 100644 package/syslog-ng/syslog-ng.mk

diff --git a/package/Config.in b/package/Config.in
index a57e686..7510e00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -472,6 +472,7 @@ source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
 source "package/sysklogd/Config.in"
+source "package/syslog-ng/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
 endif
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
new file mode 100644
index 0000000..f7a0ee1
--- /dev/null
+++ b/package/syslog-ng/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_SYSLOG_NG
+    bool "syslog-ng"
+    select BR2_PACKAGE_EVENTLOG
+    select BR2_PACKAGE_LIBGLIB2
+    select BR2_PACKAGE_LIBNET
+    help
+      The syslog-ng application supports reliable and encrypted transport 
+      using TCP and TLS, and offers powerful message filtering, sorting, 
+      pre-processing and log normalization capabilities. Utilizing message 
+      parsing and classification, syslog-ng is able to correlate log messages 
+      both real-time and offline, making it especially suited to implement the 
+      artificial ignorance principle. This high-performance tool handles 
+      extreme loads easily, and is extensible with various plug-ins to best 
+      suit your requirements. 
+      
+      http://www.balabit.com/network-security/syslog-ng/opensource-logging-system
+
+config BR2_PACKAGE_SYSLOG_NG_LINK_DYN
+    bool "dynamic linking"
+    depends on BR2_PACKAGE_SYSLOG_NG
+    help
+      Link glib and eventlog dynamically instead of statically.
+
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
new file mode 100644
index 0000000..c776e05
--- /dev/null
+++ b/package/syslog-ng/syslog-ng.mk
@@ -0,0 +1,41 @@
+#############################################################
+#
+# SYSLOG_NG-tools
+#
+#############################################################
+SYSLOG_NG_VERSION = 3.0.9
+SYSLOG_NG_SOURCE = syslog-ng_$(SYSLOG_NG_VERSION).tar.gz
+SYSLOG_NG_SITE = http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/$(SYSLOG_NG_VERSION)/source
+
+SYSLOG_NG_CONF_OPT = --sysconfdir=/etc/syslog-ng --with-pidfile-dir=/var/run
+SYSLOG_NG_DEPENDENCIES = eventlog
+
+ifeq ($(BR2_PACKAGE_SYSLOG_NG_LINK_DYN),y)
+    SYSLOG_NG_CONF_OPT += --enable-dynamic-linking
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNET),y)
+    SYSLOG_NG_CONF_OPT += --enable-spoof-source --with-libnet=$(STAGING_DIR)/usr/bin
+    SYSLOG_NG_DEPENDENCIES += libnet
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+    SYSLOG_NG_CONF_OPT += --enable-ssl
+    SYSLOG_NG_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+    SYSLOG_NG_CONF_OPT += --enable-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+    SYSLOG_NG_CONF_OPT += --enable-pcre
+    SYSLOG_NG_DEPENDENCIES += pcre
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+    SYSLOG_NG_CONF_OPT += --enable-linux-caps
+    SYSLOG_NG_DEPENDENCIES += libcap
+endif
+
+$(eval $(call AUTOTARGETS,package,syslog-ng))
-- 
1.7.3.2
