From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 19:21:49 +0100
Subject: [Buildroot] [git commit] Makefile: fix target-finalize rule
Message-ID: <20140228133415.8477B9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4c0c642de85489a536e89d252ef6e19ecbbd6a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a bug introduced by the commit a24877586a566e052897e50e6a0c2f53cfb029f5
(Makefile: add support for top-level parallel make).

That commit put a new rule inside the target-finalize rule so it was
erroneously splitted in two parts.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 20aabd6..de568e3 100644
--- a/Makefile
+++ b/Makefile
@@ -507,6 +507,8 @@ endif
 STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
 STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
 
+$(TARGETS_ROOTFS): target-finalize
+
 target-finalize: $(TARGETS)
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
@@ -534,8 +536,6 @@ endif
 		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(KSTRIPCMD); fi
 
-$(TARGETS_ROOTFS): target-finalize
-
 # See http://sourceware.org/gdb/wiki/FAQ, "GDB does not see any threads
 # besides the one in which crash occurred; or SIGTRAP kills my program when
 # I set a breakpoint"
