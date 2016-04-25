From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 21:40:47 +0200
Subject: [Buildroot] [git commit] linux: properly install all images in the
	initramfs case
Message-ID: <20160425194204.5C01281E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1f0212af66e374f2a5f88edd8d3f4b2b8a90d9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target "$(LINUX_DIR)/.stamp_initramfs_rebuilt" uses its own
'cp' command, instead of LINUX_INSTALL_IMAGE/LINUX_INSTALL_IMAGES_CMDS
provided by (or updated with) commit 055e6162bba7 ("linux: don't build
appended DTB image in place and support multiple images") and thus is
not operating properly when APPENDED_DTB is used.

Indeed, it copies a single image, and does not copy the one with the DTB
appended.

This patch replaces the 'cp' command with LINUX_INSTALL_IMAGE which
handles APPENDED_DTB.

Fixes: 055e6162bba7 ("linux: don't build appended DTB image in place and
support multiple images")

Signed-off-by: Sebastian Frias <sf84@laposte.net>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 317587f..d88060e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -447,8 +447,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 	# Build the kernel.
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
-	# Copy the kernel image to its final destination
-	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	# Copy the kernel image(s) to its(their) final destination
+	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
 	# If there is a .ub file copy it to the final destination
 	test ! -f $(LINUX_IMAGE_PATH).ub || cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
 	$(Q)touch $@
