From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:36:56 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] coreutils: fix chroot
 installation
Message-ID: <20180719214017.8C1B5890A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58ba8fb9d2e2eb6bd3bd3dfb978d9f8b468763f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

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
(cherry picked from commit c5dec11d71ac7436892749b40394daead5752524)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 4ef888829f..81d3b0476f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -120,7 +120,8 @@ define COREUTILS_CLEANUP
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
-	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
+	rm -f $(TARGET_DIR)/usr/bin/chroot
+	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
 endef
 
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP
