From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:48:43 +0200
Subject: [Buildroot] [git commit] package/coreutils: simplify the [ -> test
 symlink
Message-ID: <20190622154813.0A2AB8293F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79c4659853ff7f8c1b4dba6090ec8711f905008f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wheter we are mutli-call or multi-binaries, test is either a symlink to
coreutils or a standalone binary.

Consequently, test always exists, and so we can simplify the [ symlink.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Markus Mayer <mmayer@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6b8f3ba4b8..55aa92e753 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -130,15 +130,9 @@ COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
 endif
 
 # link for archaic shells
-ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
 define COREUTILS_CREATE_TEST_SYMLINK
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 endef
-else
-define COREUTILS_CREATE_TEST_SYMLINK
-	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
-endef
-endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
 
 # gnu thinks chroot is in bin, debian thinks it's in sbin
