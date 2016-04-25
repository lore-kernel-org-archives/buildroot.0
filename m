From: Sebastian Frias <sf84@laposte.net>
Date: Mon, 25 Apr 2016 16:52:17 +0200
Subject: [Buildroot] [PATCH v2] linux: use $(LINUX_INSTALL_IMAGE_CMDS)
 instead of plain 'cp'
In-Reply-To: <20160425140615.11e86412@free-electrons.com>
References: <571E0683.4080306@laposte.net>
 <20160425140615.11e86412@free-electrons.com>
Message-ID: <571E2F21.3040903@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - remove '-v' from cp (as suggested by thomas.petazzoni at free-electrons.com)
  - use LINUX_INSTALL_IMAGE instead of LINUX_INSTALL_IMAGES_CMDS (also suggested by thomas.petazzoni at free-electrons.com)
---
 linux/linux.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 317587f..1f93074 100644
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
-- 
1.7.11.2
