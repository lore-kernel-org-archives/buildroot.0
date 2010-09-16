From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Sep 2010 15:35:23 +0200
Subject: [Buildroot] [git commit master 1/1] dmraid: misc cleanup
Message-ID: <20100916133819.232228B3A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a5ec788662b9b18aa65806a706904bf9860b837
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix install into staging (YES instead of yes), fix uninstall target,
use default target-install handling, install headers/lib/man pages into
target if requested.

A small patch is needed for 'make remove' to work.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmraid/dmraid-fix-make-remove.patch |   22 ++++++++++++++++++++++
 package/dmraid/dmraid.mk                    |   15 ++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)
 create mode 100644 package/dmraid/dmraid-fix-make-remove.patch

diff --git a/package/dmraid/dmraid-fix-make-remove.patch b/package/dmraid/dmraid-fix-make-remove.patch
new file mode 100644
index 0000000..0d6ae75
--- /dev/null
+++ b/package/dmraid/dmraid-fix-make-remove.patch
@@ -0,0 +1,22 @@
+[PATCH]: dmraid: fix make remove for header files
+
+prefix/include/dmraid is not empty, so we need rm -rf
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ 1.0.0.rc15/include/Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: dmraid/1.0.0.rc15/include/Makefile.in
+===================================================================
+--- dmraid.orig/1.0.0.rc15/include/Makefile.in
++++ dmraid/1.0.0.rc15/include/Makefile.in
+@@ -24,7 +24,7 @@ install: install_dmraid_headers
+ 
+ remove_dmraid_headers:
+ 	@echo "Removing $(HEADERS) from $(includedir)/dmraid"
+-	rm -f $(includedir)/dmraid
++	rm -rf $(includedir)/dmraid
+ 
+ remove:        remove_dmraid_headers
+ 
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index f3e58c1..e98161c 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -9,16 +9,21 @@ DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_SUBDIR:=$(DMRAID_VERSION)
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
-DMRAID_DEPENDENCIES:=lvm2
-DMRAID_INSTALL_STAGING:=yes
+DMRAID_INSTALL_STAGING = YES
+DMRAID_UNINSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) remove
+DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-define DMRAID_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/$(DMRAID_SUBDIR)/tools/dmraid $(TARGET_DIR)/usr/sbin
+DMRAID_DEPENDENCIES = lvm2
+
+define DMRAID_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
+DMRAID_POST_INSTALL_TARGET_HOOKS += DMRAID_INSTALL_INITSCRIPT
+
 define DMRAID_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/sbin/dmraid $(TARGET_DIR)/etc/init.d/S20dmraid
+	$(MAKE) DESTDIR=$(TARGET_DIR) remove -C $(@D)/$(DMRAID_SUBDIR)
+	rm -f $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
 $(eval $(call AUTOTARGETS,package,dmraid))
-- 
1.7.1
