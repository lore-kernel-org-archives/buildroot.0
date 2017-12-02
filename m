From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:37:53 +0100
Subject: [Buildroot] [git commit] fs: prepare temp directory before running
 PRE_GEN hooks
Message-ID: <20171202133034.888A3803E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=423b01ecc24d787ceb84e4d56d7a9558febb25b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some filesystems have PRE_GEN hooks that create a directory structure
under the temporary directory.

For example, iso9660 will create a sub-directory where it stores the
kernel (in case of initramfs or initrd).

So, we must run the PRE_GEN hooks after we cleanup/create the temporary
directory.

Fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/42835965
    https://gitlab.com/buildroot.org/buildroot/-/jobs/42835967

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index c17c458..b06e9b5 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -69,9 +69,9 @@ endif
 
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
-	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -rf $(FS_DIR)
 	mkdir -p $(FS_DIR)
+	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
 	echo "set -e" >> $$(FAKEROOT_SCRIPT)
 	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
