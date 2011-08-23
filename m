From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:11 +0200
Subject: [Buildroot] [PATCH 7/9] cyrus-imapd: add new package
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in                                  |    1 +
 package/cyrus-imapd/Config.in                      |   31 ++++++++++
 package/cyrus-imapd/S85cyrus                       |   27 +++++++++
 .../cyrus-imapd-disable-guid-assert.patch          |   30 ++++++++++
 .../cyrus-imapd/cyrus-imapd-disable-imtest.patch   |   36 ++++++++++++
 package/cyrus-imapd/cyrus-imapd.mk                 |   59 ++++++++++++++++++++
 package/cyrus-imapd/cyrus.conf                     |   33 +++++++++++
 package/cyrus-imapd/imapd.conf                     |    6 ++
 8 files changed, 223 insertions(+), 0 deletions(-)
 create mode 100644 package/cyrus-imapd/Config.in
 create mode 100755 package/cyrus-imapd/S85cyrus
 create mode 100644 package/cyrus-imapd/cyrus-imapd-disable-guid-assert.patch
 create mode 100644 package/cyrus-imapd/cyrus-imapd-disable-imtest.patch
 create mode 100644 package/cyrus-imapd/cyrus-imapd.mk
 create mode 100644 package/cyrus-imapd/cyrus.conf
 create mode 100644 package/cyrus-imapd/imapd.conf

diff --git a/package/Config.in b/package/Config.in
index 397e9c1..4a8c120 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cups/Config.in"
+source "package/cyrus-imapd/Config.in"
 source "package/cyrus-sasl/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/cyrus-imapd/Config.in b/package/cyrus-imapd/Config.in
new file mode 100644
index 0000000..f6fec50
--- /dev/null
+++ b/package/cyrus-imapd/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_CYRUS_IMAPD
+	bool "cyrus-imapd"
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_CYRUS_SASL
+	help
+	  Cyrus IMAP is an IMAP (and POP3) mail server.
+
+	  http://www.cyrusimap.org/
+
+if BR2_PACKAGE_CYRUS_IMAPD
+
+config BR2_PACKAGE_CYRUS_IMAPD_CONFIG_DIR
+	string "Custom config directory"
+	help
+	  This is the directory where cyrus-imapd stores information about the
+	  IMAP server as a whole.
+	  Leave empty to use the default.
+
+config BR2_PACKAGE_CYRUS_IMAPD_SPOOL_DIR
+	string "Custom spool directory"
+	help
+	  This is the directory where the mailboxes are stored.
+	  Leave empty to use the default.
+
+config BR2_PACKAGE_CYRUS_IMAPD_LMTP_SOCKET
+	string "Custom LMTP socket file"
+	help
+	  This is the socket used for delivering incoming e-mail to cyrus-imapd.
+	  Leave empty to use the default.
+
+endif
diff --git a/package/cyrus-imapd/S85cyrus b/package/cyrus-imapd/S85cyrus
new file mode 100755
index 0000000..84df708
--- /dev/null
+++ b/package/cyrus-imapd/S85cyrus
@@ -0,0 +1,27 @@
+#!/bin/sh
+#
+# Start/stop cyrus master
+#
+
+MASTER=/usr/cyrus/bin/master
+
+case "$1" in
+  start)
+	echo "Starting cyrus..."
+	start-stop-daemon -S -b -x $MASTER
+	;;
+  stop)
+	echo -n "Stopping cyrus..."
+	start-stop-daemon -K -x $MASTER
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/cyrus-imapd/cyrus-imapd-disable-guid-assert.patch b/package/cyrus-imapd/cyrus-imapd-disable-guid-assert.patch
new file mode 100644
index 0000000..509447e
--- /dev/null
+++ b/package/cyrus-imapd/cyrus-imapd-disable-guid-assert.patch
@@ -0,0 +1,30 @@
+Fix message reception when built without openssl
+
+Revert commit
+
+  commit e88cfbdbe442cb10c71ae93a64610d505e57f05d
+  Author: Bron Gondwana <brong@opera.com>
+  Date:   Thu Jun 23 15:27:08 2011 +0200
+
+  mailbox: ensure appended GUID is not all zeros
+
+which raised unwanted assertion failures when cyrus-imapd is built without
+openssl, whus blocking mail reception. Fix suggested by Bron Gondwana:
+http://lists.andrew.cmu.edu/pipermail/info-cyrus/2011-July/035133.html
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+
+diff --git a/imap/mailbox.c b/imap/mailbox.c
+index 45c5656..dfc2f3a 100644
+--- a/imap/mailbox.c
++++ b/imap/mailbox.c
+@@ -2140,9 +2140,6 @@ int mailbox_append_index_record(struct mailbox *mailbox,
+     /* Append MUST have a message with data */
+     assert(record->size);
+ 
+-    /* GUID must not be null */
+-    assert(!message_guid_isnull(&record->guid));
+-
+     /* belt AND suspenders - check the previous record too */
+     if (mailbox->i.num_records) {
+ 	struct index_record prev;
diff --git a/package/cyrus-imapd/cyrus-imapd-disable-imtest.patch b/package/cyrus-imapd/cyrus-imapd-disable-imtest.patch
new file mode 100644
index 0000000..68d5f69
--- /dev/null
+++ b/package/cyrus-imapd/cyrus-imapd-disable-imtest.patch
@@ -0,0 +1,36 @@
+imtest does not cross-compile correctly, and cannot be disabled with configure
+parameters, so disable it manually.
+
+diff -r -u cyrus-imapd-2.4.9-orig/configure cyrus-imapd-2.4.9/configure
+--- cyrus-imapd-2.4.9-orig/configure	2011-04-13 16:53:15.000000000 +0200
++++ cyrus-imapd-2.4.9/configure	2011-05-05 15:56:23.840843998 +0200
+@@ -10906,7 +10906,7 @@
+ 
+ 
+ 
+-ac_config_files="$ac_config_files man/Makefile master/Makefile lib/Makefile imap/Makefile imtest/Makefile netnews/Makefile perl/Makefile $EXTRA_OUTPUT Makefile"
++ac_config_files="$ac_config_files man/Makefile master/Makefile lib/Makefile imap/Makefile netnews/Makefile perl/Makefile $EXTRA_OUTPUT Makefile"
+ 
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
+diff -r -u cyrus-imapd-2.4.9-orig/configure.in cyrus-imapd-2.4.9/configure.in
+--- cyrus-imapd-2.4.9-orig/configure.in	2011-04-13 16:35:22.000000000 +0200
++++ cyrus-imapd-2.4.9/configure.in	2011-05-05 15:58:31.316844009 +0200
+@@ -1465,4 +1465,4 @@
+ ])
+ 
+ dnl make sure that Makefile is the last thing output
+-AC_OUTPUT(man/Makefile master/Makefile lib/Makefile imap/Makefile imtest/Makefile netnews/Makefile perl/Makefile $EXTRA_OUTPUT Makefile)
++AC_OUTPUT(man/Makefile master/Makefile lib/Makefile imap/Makefile netnews/Makefile perl/Makefile $EXTRA_OUTPUT Makefile)
+diff -r -u cyrus-imapd-2.4.9-orig/Makefile.in cyrus-imapd-2.4.9/Makefile.in
+--- cyrus-imapd-2.4.9-orig/Makefile.in	2011-04-13 16:35:22.000000000 +0200
++++ cyrus-imapd-2.4.9/Makefile.in	2011-05-05 15:58:31.616843997 +0200
+@@ -42,7 +42,7 @@
+ #
+ 
+ SUBDIRS = man @PRE_SUBDIRS@ lib @SIEVE_SUBDIRS@ @SERVER_SUBDIRS@ \
+-	imtest @SNMP_SUBDIRS@ @EXTRA_SUBDIRS@
++	@SNMP_SUBDIRS@ @EXTRA_SUBDIRS@
+ DISTSUBDIRS = doc
+ 
+ srcdir = @srcdir@
diff --git a/package/cyrus-imapd/cyrus-imapd.mk b/package/cyrus-imapd/cyrus-imapd.mk
new file mode 100644
index 0000000..6919781
--- /dev/null
+++ b/package/cyrus-imapd/cyrus-imapd.mk
@@ -0,0 +1,59 @@
+#############################################################
+#
+# cyrus-imapd
+#
+#############################################################
+
+CYRUS_IMAPD_VERSION = 2.4.10
+CYRUS_IMAPD_SOURCE = cyrus-imapd-$(CYRUS_IMAPD_VERSION).tar.gz
+CYRUS_IMAPD_SITE = ftp://ftp.cyrusimap.org/cyrus-imapd
+CYRUS_IMAPD_DEPENDENCIES = berkeleydb cyrus-sasl
+CYRUS_IMAPD_CONF_OPT = \
+	--disable-gssapi \
+	--disable-sieve \
+	--without-perl \
+	--without-krb \
+	--without-krbdes \
+	--without-openssl \
+	--without-snmp
+
+define CYRUS_IMAPD_INSTALL_TARGET_INIT_SCRIPT
+	$(INSTALL) -m 755 package/cyrus-imapd/S85cyrus \
+	           $(TARGET_DIR)/etc/init.d/
+endef
+
+define CYRUS_IMAPD_INSTALL_TARGET_CONF_FILES
+	$(INSTALL) -m 644 -D package/cyrus-imapd/imapd.conf \
+		$(TARGET_DIR)/etc/imapd.conf
+	$(INSTALL) -m 644 -D package/cyrus-imapd/cyrus.conf \
+		$(TARGET_DIR)/etc/cyrus.conf
+endef
+
+CYRUS_IMAPD_POST_INSTALL_TARGET_HOOKS += CYRUS_IMAPD_INSTALL_TARGET_INIT_SCRIPT
+CYRUS_IMAPD_POST_INSTALL_TARGET_HOOKS += CYRUS_IMAPD_INSTALL_TARGET_CONF_FILES
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_CONFIG_DIR)),)
+define CYRUS_IMAPD_TWEAK_CONFIG_DIR
+	$(SED) '/^configdirectory:/s~^.*~configdirectory: $(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_CONFIG_DIR))~' \
+		$(TARGET_DIR)/etc/imapd.conf
+endef
+CYRUS_IMAPD_POST_INSTALL_TARGET_HOOKS += CYRUS_IMAPD_TWEAK_CONFIG_DIR
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_SPOOL_DIR)),)
+define CYRUS_IMAPD_TWEAK_SPOOL_DIR
+	$(SED) '/^partition-default:/s~^.*$$~partition-default: $(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_SPOOL_DIR))~' \
+		$(TARGET_DIR)/etc/imapd.conf
+endef
+CYRUS_IMAPD_POST_INSTALL_TARGET_HOOKS += CYRUS_IMAPD_TWEAK_SPOOL_DIR
+endif
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_LMTP_SOCKET)),)
+define CYRUS_IMAPD_TWEAK_LMTP_SOCKET
+	$(SED) '/lmtpunix/s~listen="[^"]*"~listen="$(call qstrip,$(BR2_PACKAGE_CYRUS_IMAPD_LMTP_SOCKET))"~' \
+		${TARGET_DIR}/etc/cyrus.conf
+endef
+CYRUS_IMAPD_POST_INSTALL_TARGET_HOOKS += CYRUS_IMAPD_TWEAK_LMTP_SOCKET
+endif
+
+$(eval $(call AUTOTARGETS,package,cyrus-imapd))
diff --git a/package/cyrus-imapd/cyrus.conf b/package/cyrus-imapd/cyrus.conf
new file mode 100644
index 0000000..047997c
--- /dev/null
+++ b/package/cyrus-imapd/cyrus.conf
@@ -0,0 +1,33 @@
+# standard standalone server implementation
+
+START {
+  # do not delete this entry!
+  recover	cmd="ctl_cyrusdb -r"
+
+  # this is only necessary if using idled for IMAP IDLE
+#  idled		cmd="idled"
+}
+
+# UNIX sockets start with a slash and are put into /var/imap/sockets
+SERVICES {
+  # add or remove based on preferences
+  imap		cmd="imapd" listen="imap" prefork=0
+  pop3		cmd="pop3d" listen="pop3" prefork=0
+
+  # LMTP is required for delivery
+  lmtpunix	cmd="lmtpd" listen="/var/imap/socket/lmtp" prefork=0
+
+  # this is only necessary if using notifications
+#  notify	cmd="notifyd" listen="/var/imap/socket/notify" proto="udp" prefork=1
+}
+
+EVENTS {
+  # this is required
+  checkpoint	cmd="ctl_cyrusdb -c" period=30
+
+  # this is only necessary if using duplicate delivery suppression
+  delprune	cmd="ctl_deliver -E 3" at=0400
+
+  # this is only necessary if caching TLS sessions
+  tlsprune	cmd="tls_prune" at=0400
+}
diff --git a/package/cyrus-imapd/imapd.conf b/package/cyrus-imapd/imapd.conf
new file mode 100644
index 0000000..2cc2f31
--- /dev/null
+++ b/package/cyrus-imapd/imapd.conf
@@ -0,0 +1,6 @@
+configdirectory: /var/imap
+partition-default: /var/imap-spool
+admins: cyradm
+allowplaintext: yes
+allowplainwithouttls: yes
+plaintextloginpause: 0
-- 
1.7.4.1
