From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:32 -0300
Subject: [Buildroot] [PATCH 6/8] sysklogd: add logging configuration file
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-7-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide a template to help users to customize syslogd and klogd without
editting the startup script. Also warn about options that must not be
used.

syslogd options worth to configure are mark interval (-m), remote log
support (-r) and domain list (-s).

Give example of how to configure klogd re-initialization signal.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/sysklogd/etc.default.logging | 25 +++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk         |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 package/sysklogd/etc.default.logging

diff --git a/package/sysklogd/etc.default.logging b/package/sysklogd/etc.default.logging
new file mode 100644
index 0000000000..d6e4410028
--- /dev/null
+++ b/package/sysklogd/etc.default.logging
@@ -0,0 +1,25 @@
+#
+# /etc/default/logging (sysklog version)
+#
+
+# Use SYSLOGD_ARGS to pass additional arguments to syslogd.
+# - Do NOT use "-v", since it will break the startup script.
+# - Do NOT use "-d", since debugging does not work when running in background.
+# SYSLOGD_ARGS="-m 0" # (default value)
+
+# Use KLOGD_ARGS to pass additional arguments to klogd.
+# - Do NOT use "-o" nor "-v", since they will break the startup script.
+# - Do NOT use "-d", since debugging does not work when running in background.
+# KLOGD_ARGS="-m 0" # (default value)
+
+# Use KLOGD_RELOAD to select the "S01logging reload" behavior.
+# - "USR1" will cause the kernel module symbols to be reloaded.
+# - "USR2" will cause both the static kernel symbols and the kernel module
+#   symbols to be reloaded.
+# - "0" will do nothing.
+# - Do not use any other value here. Use kill(1) for fine-grained control of
+#   klogd, as documented in its manual page.
+# KLOGD_RELOAD="0" # (default value)
+
+# Uncomment the line below to disable this service
+# ENABLED="no"
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index c4f064c10b..b7e67ffee3 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -25,6 +25,8 @@ endef
 define SYSKLOGD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysklogd/S01logging \
 		$(TARGET_DIR)/etc/init.d/S01logging
+	$(INSTALL) -m 0644 -D package/sysklogd/etc.default.logging \
+		$(TARGET_DIR)/etc/default/logging
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSTEMD
-- 
2.17.1
