From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:46:05 -0300
Subject: [Buildroot] [PATCH v3 8/8] syslog-ng: add logging configuration file
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-9-casantos@datacom.com.br>
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
Changes v1->v2
- Document that -F/--foreground must not be used
Changes v2->v3:
- Add reference to documentation, as suggested by Matt Weber.
- Fix copy/paste error spotted by Chris Packham (s/rsyslog/syslog-ng/).
---
 package/syslog-ng/etc.default.logging | 21 +++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk        |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 package/syslog-ng/etc.default.logging

diff --git a/package/syslog-ng/etc.default.logging b/package/syslog-ng/etc.default.logging
new file mode 100644
index 0000000000..f0f4d52b02
--- /dev/null
+++ b/package/syslog-ng/etc.default.logging
@@ -0,0 +1,21 @@
+#
+# /etc/default/logging (syslog-ng version)
+#
+# Documentation is available in the syslog-ng.8 and syslog-ng.conf.5 manual
+# pages distributed along with the source code, in the doc/man subdirectory.
+#
+# Online documentation of syslog-ng is available at
+#
+#    https://www.syslog-ng.com/technical-documents/
+#
+
+# Use SYSLOG_NG_ARGS to pass additional arguments to syslog-ng.
+# - Do NOT use "-F/--foreground", "--help"/"-h", "--version"/"-V", "--stderr"/"-e",
+#   "--syntax-only"/"-s", or "--process-mode=<background|safe-background>", since
+#   they will break the startup script.
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
