From: heiko at zuerker.org <heiko@zuerker.org>
Date: Fri, 24 Dec 2010 08:43:22 -0600
Subject: [Buildroot] [PATCH v2 3/3] add syslog-ng 3.0.9 (a more feature rich
	syslog daemon)
In-Reply-To: <68d89026bd8ffb144ab70206c02552c0b1084eec.1293201732.git.smiley73@users.sourceforge.net>
References: <68d89026bd8ffb144ab70206c02552c0b1084eec.1293201732.git.smiley73@users.sourceforge.net>
Message-ID: <8edef183c4981cf57280d828641864e00613df26.1293201732.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in              |    1 +
 package/syslog-ng/Config.in    |   22 ++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 package/syslog-ng/Config.in
 create mode 100644 package/syslog-ng/syslog-ng.mk

diff --git a/package/Config.in b/package/Config.in
index a127926..a59510b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -473,6 +473,7 @@ source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
 source "package/sysklogd/Config.in"
+source "package/syslog-ng/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
 endif
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
new file mode 100644
index 0000000..36666f3
--- /dev/null
+++ b/package/syslog-ng/Config.in
@@ -0,0 +1,22 @@
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
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
new file mode 100644
index 0000000..9c7db47
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
+SYSLOG_NG_DEPENDENCIES = eventlog libnet
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
