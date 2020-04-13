From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 23:05:44 +0200
Subject: [Buildroot] [git commit] package/exim: fix log and pid file paths
Message-ID: <20200413205143.2E2838EB7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=754341460b7aa751164d7d7ec9b67908c2792fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, exim stores its PID file in /var/spool/exim, and its log
file in /var/spool/exim/log, but it makes a lot more sense to have the
logs in /var/log/exim and the PID file in /var/run/exim.

Using binary name subdirectory in both cases allows for the use of
systemd's LogsDirectory and RuntimeDirectory statements

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/S86exim      | 10 +++++++++-
 package/exim/exim.mk      |  2 ++
 package/exim/exim.service |  4 ++++
 3 files changed, 15 insertions(+), 1 deletion(-)

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
index e4b0bfc1b4..8d5b6e415b 100644
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
 
