From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 23:00:37 +0200
Subject: [Buildroot] [git commit] coreutils: handle merged usr folder
Message-ID: <20151020210107.0AAC4817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c943477f6c5fad59c4dc3be1e4a0b113384c60a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For targets prepared with a usr-move, coreutils should not be attempting
to move binaries from `usr/bin` to `bin`.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

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
