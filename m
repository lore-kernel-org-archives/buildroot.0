From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 16:41:20 +0200
Subject: [Buildroot] [git commit] coreutils: fix chroot installation
Message-ID: <20180716143659.4D494886C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5dec11d71ac7436892749b40394daead5752524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 256bb383fb7 (coreutils: use single binary in symlink
method) the chroot move command creates a dangling symlink, because the
symlink target is 'coreutils' which is not in the /usr/sbin/ directory.
Instead of moving, remove the coreutils installed symlink, and create a
new one in $(TARGET_DIR)/usr/sbin with the correct target.

Should also fix (busybox):
http://autobuild.buildroot.net/results/6b3/6b39648b466738162516aa50ab328d839ec85448/

Cc: Carlos Santos <casantos@datacom.ind.br>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 3cb96589f2..2fb4a32c79 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -114,7 +114,8 @@ define COREUTILS_CLEANUP
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
-	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
+	rm -f $(TARGET_DIR)/usr/bin/chroot
+	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
 endef
 
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
