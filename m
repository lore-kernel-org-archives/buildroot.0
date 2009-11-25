From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Nov 2009 10:22:42 +0100
Subject: [Buildroot] [git commit master] dbus: fix rebuild for boards where
	/var/lib isn't a symlink
Message-ID: <20091125101013.83566777DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1c416bed621e4e494410bcd6db214745ca829c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Sagaert Johan <sagaert.johan@skynet.be>

Dbus rebuilds fails if /var/lib/dbus is a symlink (which it will be),
and the existing workaround only worked if /var/lib is a symlink to
/tmp, which isn't always the case.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/dbus/dbus.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a3d6533..cf623e3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2009.11, Not released yet:
 
-	Updated/fixed packages: gvfs
+	Updated/fixed packages: dbus, gvfs
 
 2009.11-rc1, Released November 23rd, 2009:
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 158aeb5..eb97e76 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -51,9 +51,9 @@ endif
 
 $(eval $(call AUTOTARGETS,package,dbus))
 
-# fix rebuild if /var/lib is a symlink to /tmp
+# fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
 $(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
-	rm -rf /tmp/dbus
+	rm -rf $(TARGET_DIR)/var/lib/dbus
 	touch $@
 
 $(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
-- 
1.6.3.3
