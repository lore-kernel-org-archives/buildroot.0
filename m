From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 09:49:15 +0200
Subject: [Buildroot] [git commit] audit: do not remove file installed by
 netplug
Message-ID: <20180605075721.EB8C6837ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49844baf2f4c0d89954ccd0c138aea39f23c51f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package recipe uses a post-install hook to remove useless files from
$(TARGET_DIR)/etc/rc.d/init.d and $(TARGET_DIR)/etc/sysconfig. This may
damage packages that install useful files on those directories (such as
netplug, which installs $(TARGET_DIR)/etc/rc.d/init.d/netplugd).

In the future[1] we will reorganize the init scripts and possibly get
rid of /etc/rc.d and /etc/sysconfig but for the moment let's restrict
the file removal to those installed by audit.

1. http://lists.busybox.net/pipermail/buildroot/2018-May/221549.html

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/audit/audit.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index f5aa00d2f0..2f6e6653b3 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -51,8 +51,8 @@ define AUDIT_INSTALL_INIT_SYSTEMD
 endef
 
 define AUDIT_INSTALL_CLEANUP
-	$(RM) -rf $(TARGET_DIR)/etc/rc.d
-	$(RM) -rf $(TARGET_DIR)/etc/sysconfig
+	$(RM) $(TARGET_DIR)/etc/rc.d/init.d/auditd
+	$(RM) $(TARGET_DIR)/etc/sysconfig/auditd
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
