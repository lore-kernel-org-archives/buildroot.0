From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 27 Nov 2010 17:43:12 -0500
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
Message-ID: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attempt to fix libthread_db for some targets broke others.  If you
want to match more libs, you shouldn't do so by breaking others.  The
correct SONAME is libthread_db.so.#.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 921630e..3798905 100644
--- a/Makefile
+++ b/Makefile
@@ -426,7 +426,7 @@ endif
 ifeq ($(BR2_INSTALL_ELF_CLEANUP),y)
 	PATH="$(HOST_PATH)" toolchain/trim-libs.sh "$(TARGET_DIR)"
 endif
-	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so' | \
+	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db*.so*' | \
 		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
-- 
1.7.3.2
