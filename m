From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 00:27:34 -0500
Subject: [Buildroot] [PATCH] lrzsz: add lrz/lsz symlinks
Message-ID: <1290230854-10961-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many systems support automatic zmodem transfers without needing to first
manually run the zmodem utils.  But the expectation is to run `lrz` and
not `rz`.  So install symlinks for lrz->rz and lsz->sz to support this.

This also includes a small fix to also remove sz when cleaning.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/lrzsz/lrzsz.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 0b7f4e6..5897916 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -39,10 +39,12 @@ endef
 define LRZSZ_INSTALL_TARGET_CMDS
 	cp $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	cp $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
+	ln -s rz $(TARGET_DIR)/usr/bin/lrz
+	ln -s sz $(TARGET_DIR)/usr/bin/lsz
 endef
 
 define LRZSZ_CLEAN_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/rz
+	rm -f $(patsubst %,$(TARGET_DIR)/usr/bin/%,rz sz lrz lsz)
 	-$(MAKE) -C $(@D) clean
 endef
 
-- 
1.7.3.2
