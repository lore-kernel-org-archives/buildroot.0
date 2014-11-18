From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:49:30 +0100
Subject: [Buildroot] [git commit] coreutils: avoid prompt on rebuild
Message-ID: <20141118205136.6E290B5A81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c7151792024d1d05f00ee8a95e9dd4282510a3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mode bits of coreutils installed binaries are 555. As a result, on
rebuild mv prompts the user to confirm overwrite of non writable binaries.
Force overwrite to skip this prompt.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e06510e..db0d8a9 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -102,12 +102,12 @@ endif
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
-		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
+		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
 	done
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
-	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
+	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
 endef
 
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
