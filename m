From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Sep 2010 15:35:23 +0200
Subject: [Buildroot] [git commit master 1/1] dmraid: fix init script
Message-ID: <20100916133818.EAFCD8B3A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=78e7c0b642a0decf6dad37026b3f70bb480f645b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Init scripts are only run if they are prefixed with S??, and dmraid gets
installed into /usr/sbin, not /sbin.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmraid/dmraid.init |    6 +++---
 package/dmraid/dmraid.mk   |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dmraid/dmraid.init b/package/dmraid/dmraid.init
index 970d47d..fd2ad9e 100644
--- a/package/dmraid/dmraid.init
+++ b/package/dmraid/dmraid.init
@@ -2,7 +2,7 @@
 
 set -e
 
-[ -x /sbin/dmraid ] || exit 0
+[ -x /usr/sbin/dmraid ] || exit 0
 
 # try to load module in case that hasn't been done yet
 modprobe dm-mod >/dev/null 2>&1
@@ -10,12 +10,12 @@ modprobe dm-mod >/dev/null 2>&1
 case "$1" in
 	start|"")
 		echo "Setting up DMRAID devices..."
-		/sbin/dmraid --activate yes --ignorelocking --verbose
+		/usr/sbin/dmraid --activate yes --ignorelocking --verbose
 		;;
 
 	stop)
 		echo "Shutting down DMRAID devices... "
-		/sbin/dmraid --activate no --ignorelocking --verbose
+		/usr/sbin/dmraid --activate no --ignorelocking --verbose
 		;;
 
 	restart|force-reload)
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index ccd6a36..f3e58c1 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -14,11 +14,11 @@ DMRAID_INSTALL_STAGING:=yes
 
 define DMRAID_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/$(DMRAID_SUBDIR)/tools/dmraid $(TARGET_DIR)/usr/sbin
-	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid
+	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
 define DMRAID_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/dmraid $(TARGET_DIR)/etc/init.d/dmraid
+	rm -f $(TARGET_DIR)/usr/sbin/dmraid $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
 $(eval $(call AUTOTARGETS,package,dmraid))
-- 
1.7.1
