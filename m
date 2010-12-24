From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu, 23 Dec 2010 19:26:22 -0600
Subject: [Buildroot] [PATCH] add syslog-ng 3.0.9,
	including required eventlog lib
In-Reply-To: <7c61f61e277949a18b471ee5297d03062ced6083.1293153003.git.smiley73@users.sourceforge.net>
References: <7c61f61e277949a18b471ee5297d03062ced6083.1293153003.git.smiley73@users.sourceforge.net>
Message-ID: <73a045889e438229d8d9dd10da05a8585acb46d6.1293153206.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in              |    1 +
 package/eventlog/eventlog.mk   |   13 +++++++++++++
 package/syslog-ng/Config.in    |   19 +++++++++++++++++++
 package/syslog-ng/syslog-ng.mk |   36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 package/eventlog/eventlog.mk
 create mode 100644 package/syslog-ng/Config.in
 create mode 100644 package/syslog-ng/syslog-ng.mk

diff --git a/package/Config.in b/package/Config.in
index 6e7970b..296387f 100644
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
diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
new file mode 100644
index 0000000..ef52400
--- /dev/null
+++ b/package/eventlog/eventlog.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# EVENTLOG
+#
+#############################################################
+EVENTLOG_MAIN_VERSION = 0.2
+EVENTLOG_VERSION = $(EVENTLOG_MAIN_VERSION).12
+EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
+EVENTLOG_SITE = http://www.balabit.com/downloads/files/eventlog/$(EVENTLOG_MAIN_VERSION)
+
+EVENTLOG_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,eventlog))
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
new file mode 100644
index 0000000..921c25e
--- /dev/null
+++ b/package/syslog-ng/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SYSLOG_NG
+    bool "syslog-ng"
+    depends on BR2_PACKAGE_LIBNET
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
+config BR2_PACKAGE_SYSLOG_NG_LINK_DYN
+    bool "dynamic linking"
+    depends on BR2_PACKAGE_SYSLOG_NG
+      
+comment "syslog-ng depends on libnet"
+	depends on !BR2_PACKAGE_LIBNET
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
new file mode 100644
index 0000000..1ef44d7
--- /dev/null
+++ b/package/syslog-ng/syslog-ng.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# SYSLOG_NG-tools
+#
+#############################################################
+SYSLOG_NG_VERSION = 3.0.9
+SYSLOG_NG_SOURCE = syslog-ng_$(SYSLOG_NG_VERSION).tar.gz
+SYSLOG_NG_SITE = http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/$(SYSLOG_NG_VERSION)/source
+
+SYSLOG_NG_CONF_OPT = --sysconfdir=/etc/syslog-ng --with-pidfile-dir=/var/run --enable-spoof-source
+SYSLOG_NG_DEPENDENCIES = eventlog
+
+ifeq ($(BR2_PACKAGE_SYSLOG_NG_LINK_DYN),y)
+    SYSLOG_NG_CONF_OPT += --enable-dynamic-linking
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
