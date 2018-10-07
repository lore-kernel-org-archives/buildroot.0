From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:46:01 -0300
Subject: [Buildroot] [PATCH v3 4/8] rsyslog: add logging configuration file
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-5-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide a template to help users to customize rsyslog without editting
the startup script. Also warn about options that must not be used.

Add instructions on how to configure debugging, since it a bit tricky
when rsyslogd runs in background, requiring a separete log file.

This file is also useful as an example for init script authors.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2
- Document that "-n" command line option must not be used.
- Small improvements in comments.
Changes v2->v3
- Add reference to documentation, as suggested by Matt Weber.
---
 package/rsyslog/etc.default.logging | 24 ++++++++++++++++++++++++
 package/rsyslog/rsyslog.mk          |  2 ++
 2 files changed, 26 insertions(+)
 create mode 100644 package/rsyslog/etc.default.logging

diff --git a/package/rsyslog/etc.default.logging b/package/rsyslog/etc.default.logging
new file mode 100644
index 0000000000..12223eba21
--- /dev/null
+++ b/package/rsyslog/etc.default.logging
@@ -0,0 +1,24 @@
+#
+# /etc/default/logging (rsyslog version)
+#
+# Online documentation of rsyslog is available at
+#
+#    https://www.rsyslog.com/doc/
+#
+# Command line options are mostly undocumented in recent rsyslog versions, so
+# avoid using them. Only "-n" and "-d" are briefly described when rsyslogd is
+# invoked with the "-h" option. Other options are described on old versions of
+# the rsyslogd(8) manual page but they are certainly outdated.
+#
+
+# Use RSYSLOGD_ARGS to pass additional arguments to rsyslogd.
+# - Do NOT use "-i pid_file", "-n", nor "-v", since they will break the
+#   startup script.
+# - Use "-d" to enable debug (see below). Warning: log files may be HUGE!
+# RSYSLOGD_ARGS="" # (default value)
+
+# You will need this along with "-d".
+# RSYSLOG_DEBUGLOG="/var/log/rsyslogd"; export RSYSLOG_DEBUGLOG
+
+# Uncomment the line below to disable this service
+# ENABLED="no"
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 61e08ba765..c80d0696e2 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -74,6 +74,8 @@ endif
 define RSYSLOG_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rsyslog/S01logging \
 		$(TARGET_DIR)/etc/init.d/S01logging
+	$(INSTALL) -m 0644 -D package/rsyslog/etc.default.logging \
+		$(TARGET_DIR)/etc/default/logging
 endef
 
 # The rsyslog.service is installed by rsyslog, but the link is not created
-- 
2.17.1
