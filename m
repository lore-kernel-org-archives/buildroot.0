From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  4 Jun 2018 22:35:07 -0300
Subject: [Buildroot] [PATCH] audit: do not remove file installed by netplug
Message-ID: <20180605013507.9672-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package recipe uses a post-install hook to remove useless files from
$(TARGET_DIR)/etc/rc.d/init.d and $(TARGET_DIR)/etc/sysconfig. This may
damage packages that install useful files on those directories (such as
netplug, which installs $(TARGET_DIR)/etc/rc.d/init.d/netplugd).

In the future[1] we will reorganize the init scripts and possibly get
rid of /etc/rc.d and /etc/sysconfig but for the moment let's restrict
the file removal to those installed by audit.

1. http://lists.busybox.net/pipermail/buildroot/2018-May/221549.html

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/audit/audit.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index f5aa00d2f0..067490d607 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -51,8 +51,8 @@ define AUDIT_INSTALL_INIT_SYSTEMD
 endef
 
 define AUDIT_INSTALL_CLEANUP
-	$(RM) -rf $(TARGET_DIR)/etc/rc.d
-	$(RM) -rf $(TARGET_DIR)/etc/sysconfig
+	$(RM) $(TARGET_DIR)/etc/rc.d/auditd
+	$(RM) $(TARGET_DIR)/etc/sysconfig/auditd
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
-- 
2.17.0
