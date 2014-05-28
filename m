From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 21:19:58 +0200
Subject: [Buildroot] [git commit] fs/tar: use qstrip to clean up build output
Message-ID: <20140528200724.3C2709CE11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5512dfc493817cdcb57ef2fe0c856c31fc5f847
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the tar filesystem method, the build output shows at the end:

echo " tar -c""f <br>/output/images/rootfs.tar -C <br>/output/target ." >>
                                    <br>/output/build/_fakeroot.fs

The inner set of quotes can be easily removed by properly stripping the tar
options (coming from the buildroot configuration).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/tar/tar.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index c93888c..f876d03 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_OPTS := $(BR2_TARGET_ROOTFS_TAR_OPTIONS)
+TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 define ROOTFS_TAR_CMD
  tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
