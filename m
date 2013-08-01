From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 17:38:44 +0200
Subject: [Buildroot] [git commit] Fix building initramfs kernel with
	appended dtb
Message-ID: <20130801155755.D709D99C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ac04c321f892f6b93c0fb548b34be85f8426dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target for building the kernel with a cpio initramfs is not
calling the append dtb commands, creating a final kernel image
without an appended dtb. Instead it needs to call kernel make on
the intermediate target, then call the append dtb commands
to produce the final image as the primary kernel build target
does.

Signed-off-by: Nathan Ford <nford@westpond.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 780d6d5..fc379ec 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -313,6 +313,7 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
+	$(LINUX_APPEND_DTB)
 	# Copy the kernel image to its final destination
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
 	# If there is a .ub file copy it to the final destination
