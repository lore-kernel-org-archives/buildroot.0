From: James Knight <james.d.knight@live.com>
Date: Sun, 18 Oct 2015 02:32:45 -0400
Subject: [Buildroot] [PATCH 1/1] coreutils: handle merged usr folder
Message-ID: <1445149965-15702-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For targets prepared with a usr-move, coreutils should not be attempting
to move binaries from `usr/bin` to `bin`.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/coreutils/coreutils.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index bb2ef96..60455ac 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -99,18 +99,24 @@ COREUTILS_CONF_OPTS += --with-openssl=yes
 COREUTILS_DEPENDENCIES += openssl
 endif
 
-define COREUTILS_POST_INSTALL
+ifeq ($(BR2_ROOTFS_MERGED_USR),)
+define COREUTILS_CLEANUP_BIN
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
 		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
 	done
+endef
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
+endif
+
+define COREUTILS_CLEANUP
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
 	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
 endef
 
-COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
 
 # If both coreutils and busybox are selected, the corresponding applets
 # may need to be reinstated by the clean targets.
-- 
1.9.5.msysgit.1
