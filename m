From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:59:21 +0100
Subject: [Buildroot] [git commit branch/next] fs/common: lock modification
	times in $TARGET_DIR
Message-ID: <20161123215938.DC987817FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68db7210fd8e76120c27cdc4a1fe591de67c06c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Make sure all files in $TARGET_DIR have a defined modification time
before to generate filesystems.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2dbef4d..981dcb1 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -95,6 +95,9 @@ endif
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
 		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+ifeq ($$(BR2_REPRODUCIBLE),y)
+	echo "find $$(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$$(SOURCE_DATE_EPOCH)" >> $$(FAKEROOT_SCRIPT)
+endif
 	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/pseudo -- $$(FAKEROOT_SCRIPT)
