From: Chris Lesiak <chris.lesiak@licor.com>
Date: Mon, 16 Apr 2018 10:33:39 -0500
Subject: [Buildroot] [PATCH] Makefile: Update mtime of $(TARGET_DIR)/usr
Message-ID: <20180416153339.23002-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the systemd-update-done.service to function, updates to /usr
must be followed by an update of the modification time of /usr.
If updates were always created with a clean build, the mtime of
/usr would automatically be newer than in the old build; but
especially during development, that may not always be the case.
So touch $(TARGET_DIR)/usr as the last step of target-finalize.

For more details, see:
http://0pointer.de/public/systemd-man/systemd-update-done.service.html

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 957ba6634a..12a53840c0 100644
--- a/Makefile
+++ b/Makefile
@@ -761,6 +761,8 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	touch $(TARGET_DIR)/usr
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
-- 
2.14.3
