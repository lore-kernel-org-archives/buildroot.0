From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 08 Dec 2008 14:58:17 +1100
Subject: [Buildroot] [PATCH 3/4] target/initramfs: actually build initramfs
	target
In-Reply-To: <1228708697.392615.378550596058.1.gpush@pingu>
Message-ID: <1228708697.394335.203742513427.3.gpush@pingu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, BR2_TARGET_ROOTFS_INITRAMFS doesn't actually do anything,
as it doesn't alter $(TARGETS)

This change hooks up the TARGETS variable to INITRAMFS_TARGET (which
is only set if BR2_TARGET_ROOTFS_INITRAMFS=y), so that the initramfs
list is built.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 target/initramfs/initramfs.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/initramfs/initramfs.mk b/target/initramfs/initramfs.mk
index 07f5ec3..015d879 100644
--- a/target/initramfs/initramfs.mk
+++ b/target/initramfs/initramfs.mk
@@ -12,6 +12,8 @@ else
 INITRAMFS_TARGET:= #nothing
 endif
 
+TARGETS+=$(INITRAMFS_TARGET)
+
 $(INITRAMFS_TARGET) initramfs: host-fakeroot makedevs
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
