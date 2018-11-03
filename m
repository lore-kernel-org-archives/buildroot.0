From: Carlos Santos <casantos@datacom.com.br>
Date: Sat,  3 Nov 2018 13:42:42 -0300
Subject: [Buildroot] [PATCH 2/4] audit: ensure that it starts after the
 logging daemon
In-Reply-To: <20181103164244.10607-1-casantos@datacom.com.br>
References: <20181103164244.10607-1-casantos@datacom.com.br>
Message-ID: <20181103164244.10607-3-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

audit uses syslog(). Rename its init script to S02auditd to ensure that
it will start after syslogd. Otherwise the initial log messages will be
sent to the console (and probably lost, since almost nobody watches the
system console on embedded systems).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/audit/{S01auditd => S02auditd} | 0
 package/audit/audit.mk                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/audit/{S01auditd => S02auditd} (100%)

diff --git a/package/audit/S01auditd b/package/audit/S02auditd
similarity index 100%
rename from package/audit/S01auditd
rename to package/audit/S02auditd
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 2f6e6653b3..228ef9998c 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -38,7 +38,7 @@ AUDIT_CONF_OPTS += --disable-systemd
 endif
 
 define AUDIT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/audit/S01auditd $(TARGET_DIR)/etc/init.d/S01auditd
+	$(INSTALL) -D -m 755 package/audit/S02auditd $(TARGET_DIR)/etc/init.d/S02auditd
 endef
 
 define AUDIT_INSTALL_INIT_SYSTEMD
-- 
2.17.1
