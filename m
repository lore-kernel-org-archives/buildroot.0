From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:30:48 +0100
Subject: [Buildroot] [git commit] dmraid: rename init script and use
	FOO_INSTALL_INIT_SYSV
Message-ID: <20140302153402.B77789039E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c06c05a4a36190292ee69e88d889a59b0b0d08d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the init script to use the correct
FOO_INSTALL_INIT_SYSV hook.

[Thomas: slightly reword commit log.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmraid/{dmraid.init => S20dmraid} |    0
 package/dmraid/dmraid.mk                  |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dmraid/dmraid.init b/package/dmraid/S20dmraid
similarity index 100%
rename from package/dmraid/dmraid.init
rename to package/dmraid/S20dmraid
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 089e33a..412c903 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -15,10 +15,10 @@ DMRAID_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 DMRAID_DEPENDENCIES = lvm2
 
-define DMRAID_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/S20dmraid
+define DMRAID_INSTALL_INIT_SYSV
+    [ -f $(TARGET_DIR)/etc/init.d/S20dmraid ] || \
+        $(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
+            $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
-DMRAID_POST_INSTALL_TARGET_HOOKS += DMRAID_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
