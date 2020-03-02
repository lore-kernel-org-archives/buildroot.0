From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon,  2 Mar 2020 11:19:02 +0100
Subject: [Buildroot] [PATCH] package/exim: fix log and pid file paths
Message-ID: <20200302101902.8285-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

both the logs and pid should not be placed in /var/spool

we place the log in /var/log/exim and
we place the pid in /var/run/exim

using binary name subdirectory in both cases allows for the
use of systemd's LogsDirectory and RuntimeDirectory statements

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

diff --git a/package/exim/S86exim b/package/exim/S86exim
index bec88fc222..0d09361f65 100644
--- a/package/exim/S86exim
+++ b/package/exim/S86exim
@@ -3,11 +3,19 @@
 # Start/stop exim
 #
 
-PIDFILE=/var/lock/exim/exim-daemon.pid
+PIDFILE=/var/run/exim/exim.pid
 
 case "$1" in
   start)
 	echo "Starting exim..."
+	if [ ! -d /var/log/exim ]; then
+	  mkdir -p /var/log/exim
+	  chown exim:mail /var/log/exim
+	fi
+	if [ ! -d /var/run/exim ]; then
+	  mkdir -p /var/run/exim
+	  chown root:mail /var/run/exim
+	fi
 	start-stop-daemon -S -x exim -- -bd
 	;;
   stop)
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e4b0bfc1b4..0e74bdd8e0 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -39,6 +39,8 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(INSTALL) -m 0644 $(@D)/src/EDITME $(@D)/Local/Makefile
 	$(call exim-config-change,BIN_DIRECTORY,/usr/sbin)
 	$(call exim-config-change,CONFIGURE_FILE,/etc/exim/configure)
+	$(call exim-config-change,LOG_FILE_PATH,/var/log/exim/exim_%slog)
+	$(call exim-config-change,PID_FILE_PATH,/var/run/exim/exim.pid)
 	$(call exim-config-change,EXIM_USER,ref:exim)
 	$(call exim-config-change,EXIM_GROUP,mail)
 	$(call exim-config-change,TRANSPORT_LMTP,yes)
diff --git a/package/exim/exim.service b/package/exim/exim.service
index fe97727ab5..ac3f067de4 100644
--- a/package/exim/exim.service
+++ b/package/exim/exim.service
@@ -3,6 +3,10 @@ Description=Exim MTA
 After=syslog.target network.target
 
 [Service]
+User=exim
+Group=mail
+LogsDirectory=exim
+RuntimeDirectory=exim
 ExecStart=/usr/sbin/exim -bdf
 Restart=always
 
-- 
2.17.1
