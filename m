From: Joachim Wiberg <troglobit@gmail.com>
Date: Sat, 30 Jan 2021 14:52:03 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/sysklogd: update default
 syslog.conf to match upstream
In-Reply-To: <20210130135203.159451-1-troglobit@gmail.com>
References: <20210130135203.159451-1-troglobit@gmail.com>
Message-ID: <20210130135203.159451-2-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/syslog.conf | 69 +++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/package/sysklogd/syslog.conf b/package/sysklogd/syslog.conf
index 411bd645ff..8e4f9e2059 100644
--- a/package/sysklogd/syslog.conf
+++ b/package/sysklogd/syslog.conf
@@ -1,9 +1,68 @@
-# /etc/syslog.conf - Configuration file for syslogd
+# /etc/syslog.conf - Configuration file for syslogd(8)
+#
+# For information about the format of this file, see syslog.conf(5)
+#
 
-auth,authpriv.*		/var/log/auth.log
-*.*;auth,authpriv.none	/var/log/messages
-user.*			/var/log/user.log
+#
+# First some standard log files.  Log by facility.
+#
+auth,authpriv.*			 /var/log/auth.log
+*.*;auth,authpriv.none		-/var/log/syslog
 
-*.emerg			*
+#cron.*				/var/log/cron.log
+#daemon.*			-/var/log/daemon.log
+kern.*				-/var/log/kern.log
+#lpr.*				-/var/log/lpr.log
+mail.*				-/var/log/mail.log
+#user.*				-/var/log/user.log
 
+#
+# Logging for the mail system.  Split it up so that
+# it is easy to write scripts to parse these files.
+#
+#mail.info			-/var/log/mail.info
+#mail.warn			-/var/log/mail.warn
+mail.err			 /var/log/mail.err
+#mail.*;mail.!=info		-/var/log/mail
+#mail,news.=info 		-/var/log/info
+
+# The tcp wrapper loggs with mail.info, we display all
+# the connections on tty12
+#
+#mail.=info			/dev/tty12
+
+#
+# Some "catch-all" log files.
+#
+#*.=debug;\
+#	auth,authpriv.none;\
+#	news.none;mail.none	-/var/log/debug
+*.=info;*.=notice;*.=warn;\
+	auth,authpriv.none;\
+	cron,daemon.none;\
+	mail,news.none		-/var/log/messages
+
+# Store all critical eventes, except kernel logs in critical
+#
+#*.=crit;kern.none		/var/log/critical
+
+# Example of sending events to remote syslog server.
+# All events from notice and above, except auth, authpriv
+# and any kernel message are sent to server finlandia in
+# RFC5424 formatted output.
+#
+#*.notice;auth,authpriv.none;
+#	kern.none\		@finlandia	;RFC5424
+
+# Emergencies are sent to anyone logged in
+#
+*.=emerg			*
+
+# Priority alert and above are sent to the operator
+#
+#*.alert				root,joey
+
+#
+# Include all config files in /etc/syslog.d/
+#
 include /etc/syslog.d/*.conf
-- 
2.25.1
