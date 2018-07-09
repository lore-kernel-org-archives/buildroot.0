From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:34 -0300
Subject: [Buildroot] [PATCH 8/8] syslog-ng: add logging configuration file
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-9-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide a template to help users to customize syslog-ng without editting
the startup script. Mostly warn about options that must not be used.

This file is also useful as an example for init script authors.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/syslog-ng/etc.default.logging | 14 ++++++++++++++
 package/syslog-ng/syslog-ng.mk        |  2 ++
 2 files changed, 16 insertions(+)
 create mode 100644 package/syslog-ng/etc.default.logging

diff --git a/package/syslog-ng/etc.default.logging b/package/syslog-ng/etc.default.logging
new file mode 100644
index 0000000000..6160bfee9d
--- /dev/null
+++ b/package/syslog-ng/etc.default.logging
@@ -0,0 +1,14 @@
+#
+# /etc/default/logging (syslog-ng version)
+#
+
+# Use SYSLOG_NG_ARGS to pass additional arguments to rsyslogd.
+# - Do NOT use "--help"/"-h", "--version"/"-V", "--stderr"/"-e",
+#   "--syntax-only"/"-s", or "--process-mode=<background|safe-background>",
+#   since they will break the startup script.
+# - Do NOT use "--debug"/"-d", since debugging does not work when running in
+#   background.
+# SYSLOG_NG_ARGS="" # (default value)
+
+# Uncomment the line below to disable this service
+# ENABLED="no"
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 793fea0972..a837dad841 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -95,6 +95,8 @@ endif
 define SYSLOG_NG_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/syslog-ng/S01logging \
 		$(TARGET_DIR)/etc/init.d/S01logging
+	$(INSTALL) -m 0644 -D package/syslog-ng/etc.default.logging \
+		$(TARGET_DIR)/etc/default/logging
 endef
 
 # By default syslog-ng installs a number of sample configuration
-- 
2.17.1
