From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Oct 2011 00:14:27 +0200
Subject: [Buildroot] [git commit] lrzsz: fix repeated target install
Message-ID: <20111009221637.E5D7F8E2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54bcf87b452c7a7738009fb808d19610fdb31df8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #4165

Use ln -sf in case destination already exists from an earlier install,
and use install -D rather than cp while we're at it.

Based on patch by Hector Oron <hector.oron@gmail.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    1 +
 package/lrzsz/lrzsz.mk |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6dc8789..6345210 100644
--- a/CHANGES
+++ b/CHANGES
@@ -60,6 +60,7 @@
 	#3631: Error while compiling with Xorg
 	#3925: midori not getting compile
 	#4045: Add support for downloading i386 toolchains from codesourcery
+	#4165: lrzsz-fix-symlink-at-rebuild.patch
 	#4171: makedevs-unused-but-set-variable.patch
 	#4183: Codesourcery toolchain download site has changed
 
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 0d3347f..314f46a 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -36,10 +36,10 @@ define LRZSZ_BUILD_HOOKS
 endef
 
 define LRZSZ_INSTALL_TARGET_CMDS
-	cp $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
-	cp $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
-	ln -s rz $(TARGET_DIR)/usr/bin/lrz
-	ln -s sz $(TARGET_DIR)/usr/bin/lsz
+	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
+	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
+	ln -sf rz $(TARGET_DIR)/usr/bin/lrz
+	ln -sf sz $(TARGET_DIR)/usr/bin/lsz
 endef
 
 define LRZSZ_CLEAN_CMDS
