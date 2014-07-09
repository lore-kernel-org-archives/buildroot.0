From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 16:00:28 +0200
Subject: [Buildroot] [git commit] Fixing ntpd time syncing problem
Message-ID: <20140709140118.B1F879D1E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35692bb5e5d189c9c7f7bd1f8fb77192c125382c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add ntp.conf file to make ntpd syncing.
Starting ntpd daemon with -g to sync time also with big offsets.
Removes the use of deprecated ntpdate command for initial time sync.

[Peter: drop unused NTPDATE_BIN variable]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/S49ntp           |    9 +--------
 package/ntp/ntp.mk           |    1 +
 package/ntp/ntpd.etc.conf    |    8 ++++++++
 package/ntp/ntpd.etc.default |    7 -------
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 7b929e9..6f9ec75 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -7,7 +7,6 @@ PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 DESC="network time protocol daemon"
 NAME=ntpd
 DAEMON=/usr/sbin/$NAME
-NTPDATE_BIN=/usr/bin/ntpdate
 
 # Gracefully exit if the package has been removed.
 test -x $DAEMON || exit 0
@@ -20,14 +19,8 @@ fi
 
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
