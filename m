From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:46:03 -0300
Subject: [Buildroot] [PATCH v3 6/8] sysklogd: add logging configuration file
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-7-casantos@datacom.com.br>
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
Changes v1->v2:
- Document that the "-n" command line option must not be used.
- Going against the request from Arnout Vandecappelle, keep the klogd reload
  configuration. Add a comment explainig why it is still useful. BTW, I work
  on a project which requires dynamic installation of kernel modules.
Changes v2->v3
- Add reference to documentation, as suggested by Matt Weber.
---
 package/sysklogd/etc.default.logging | 33 ++++++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk         |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/sysklogd/etc.default.logging

diff --git a/package/sysklogd/etc.default.logging b/package/sysklogd/etc.default.logging
new file mode 100644
index 0000000000..a655e7ad42
--- /dev/null
+++ b/package/sysklogd/etc.default.logging
@@ -0,0 +1,33 @@
+#
+# /etc/default/logging (sysklogd version)
+#
+# Documentation is available in the klogd.8 and sysklogd.8 manual pages
+# distributed along with the source code.
+#
+
+# Use SYSLOGD_ARGS to pass additional arguments to syslogd.
+# - Do NOT use "-n", "-v", since they will break the startup script.
+# - Do NOT use "-d", since debugging does not work when running in background.
+# SYSLOGD_ARGS="-m 0" # (default value)
+
+# Use KLOGD_ARGS to pass additional arguments to klogd.
+# - Do NOT use "-n", "-o" nor "-v", since they will break the startup script.
+# - Do NOT use "-d", since debugging does not work when running in background.
+# KLOGD_ARGS="-m 0" # (default value)
+
+# KLOGD_RELOAD selects the "S01logging reload" behavior.
+# - "USR1" will cause the kernel module symbols to be reloaded.
+# - "USR2" will cause both the static kernel symbols and the kernel module
+#   symbols to be reloaded.
+# - "0" will do nothing.
+# - Do not use any other value here. Use kill(1) for fine-grained control of
+#   klogd, as documented in its manual page.
+#
+# Most users will never need to reload klogd in buildroot context because they
+# are not going to dynamically install kernel modules. In the rare cases that
+# this does happen, the user should be smart enough to send a SIGUSR1/2 but
+# let's keep this configurable for documentation purposes.
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
