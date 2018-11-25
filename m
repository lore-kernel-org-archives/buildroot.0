From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:37:27 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/audit: ensure
 that it starts after the logging daemon
Message-ID: <20181125203425.99E35882DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3fb49ffe124b58a4df8740ef4a886684e5a5a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

audit uses syslog(). Rename its init script to S02auditd to ensure that
it will start after syslogd. Otherwise the initial log messages will be
sent to the console (and probably lost, since almost nobody watches the
system console on embedded systems).

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6fe5fe4c4d034bd471a9ed28e5fba81475ae09ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/{S01auditd => S02auditd} | 0
 package/audit/audit.mk                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

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
