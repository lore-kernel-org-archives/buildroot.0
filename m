From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Jun 2014 14:58:40 +0200
Subject: [Buildroot] [PATCH] Fixing ntpd time syncing problem
Message-ID: <1402405120-3695-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ntp.conf file to make ntpd syncing.
Starting ntpd daemon with -g to sync time also with big offsets.
Removes the use of deprecated ntpdate command for initial time sync.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/ntp/S49ntp           | 8 +-------
 package/ntp/ntp.mk           | 1 +
 package/ntp/ntpd.etc.conf    | 8 ++++++++
 package/ntp/ntpd.etc.default | 7 -------
 4 files changed, 10 insertions(+), 14 deletions(-)
 create mode 100644 package/ntp/ntpd.etc.conf

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 7b929e9..05cb1ff 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -20,14 +20,8 @@ fi
 
 case "$1" in
   start)
-	if [ -x $NTPDATE_BIN ] ; then
-		echo -n "Getting initial time via ntp"
-		$NTPDATE_BIN $NTPDATE_OPTS $NTPSERVERS > /dev/null 2>&1
-		echo "."
-	fi
-
 	echo -n "Starting $DESC: $NAME"
-	start-stop-daemon -S -q -x $DAEMON
+	start-stop-daemon -S -q -x $DAEMON -- -g
 	echo "."
 	;;
   stop) echo -n "Stopping $DESC: $NAME"
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index fe6b04b..b60e623 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -52,6 +52,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 define NTP_INSTALL_TARGET_CMDS
 	$(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd)
 	test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
 	@if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
 		$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/default ; \
 		$(INSTALL) -m 644 package/ntp/ntpd.etc.default $(TARGET_DIR)/etc/default/ntpd ; \
diff --git a/package/ntp/ntpd.etc.conf b/package/ntp/ntpd.etc.conf
new file mode 100644
index 0000000..6a2b88c
--- /dev/null
+++ b/package/ntp/ntpd.etc.conf
@@ -0,0 +1,8 @@
+server 0.pool.ntp.org iburst
+server 1.pool.ntp.org iburst
+
+restrict default kod nomodify notrap nopeer noquery
+restrict -6 default kod nomodify notrap nopeer noquery
+
+restrict 127.0.0.1
+restrict -6 ::1
diff --git a/package/ntp/ntpd.etc.default b/package/ntp/ntpd.etc.default
index d329228..94e2bc2 100644
--- a/package/ntp/ntpd.etc.default
+++ b/package/ntp/ntpd.etc.default
@@ -1,9 +1,2 @@
-# NTP Servers to use for ntpdate
-NTPSERVERS="pool.ntp.org"
-
-# Get initial time via ntpdate?
-NTPDATE=no
-NTPDATE_OPTS="-t 5"
-
 # Start the ntp daemon?
 NTPD=yes
-- 
2.0.0
