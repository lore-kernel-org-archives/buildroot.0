From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Jun 2014 08:33:17 +0200
Subject: [Buildroot] [git commit] fs/common.mk: unbreak .xz compression when
	host-xz isn't built
Message-ID: <20140604063859.EF6DC9CE96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28b514a569ee839bbda6597b330e9759a67cfbe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #7160

Since f46f81de1315 (Don't build host-xz needlessly), host-xz is no longer
unconditionally built when xz fs compression is requested, so don't
explicitly refer to it.

Instead, rely on our check-host-xzcat logic to ensure xz is available and
set the path to ensure our host variant gets picked up if not available on
the build machine.

While we're at it, get rid of the now unused XZ variable.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/common.mk     |    4 ++--
 package/xz/xz.mk |    2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 919db25..2adaf8c 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -61,7 +61,7 @@ ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
 ROOTFS_$(2)_COMPRESS_EXT = .xz
-ROOTFS_$(2)_COMPRESS_CMD = $$(XZ) -9 -C crc32 -c
+ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
@@ -90,7 +90,7 @@ endif
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
-	$$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
+	PATH=$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
 
 rootfs-$(1)-show-depends:
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index af90f05..0ecd049 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -14,5 +14,3 @@ XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
-XZ = $(HOST_DIR)/usr/bin/xz
