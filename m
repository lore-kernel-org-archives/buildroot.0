From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:03:54 +0200
Subject: [Buildroot] [git commit] package/coreutils: split COREUTILS_CLEANUP
 and use better names
Message-ID: <20190620192137.D176A814C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=840cda91152dd8f702de8e77af34cddfbe4c98c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COREUTILS_CLEANUP macro naming is a bit weird. In addition, it
does two unrelated things, and the introduction of support for
building coreutils as individual binaries will require splitting it
up.

So let's do this split as a preparation commit, and use better names
for both resulting macros.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 5e7e0c6ea0..c48dc235ac 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -110,14 +110,17 @@ ifeq ($(BR2_STATIC_LIBS),y)
 COREUTILS_CONF_OPTS += --enable-no-install-program=stdbuf
 endif
 
-define COREUTILS_CLEANUP
-	# link for archaic shells
+# link for archaic shells
+define COREUTILS_CREATE_TEST_SYMLINK
 	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
-	# gnu thinks chroot is in bin, debian thinks it's in sbin
+endef
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
+
+# gnu thinks chroot is in bin, debian thinks it's in sbin
+define COREUTILS_FIX_CHROOT_LOCATION
 	rm -f $(TARGET_DIR)/usr/bin/chroot
 	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
 endef
-
-COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
+COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
 
 $(eval $(autotools-package))
