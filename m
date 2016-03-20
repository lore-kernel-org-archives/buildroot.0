From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 20 Mar 2016 23:35:46 +0100
Subject: [Buildroot] [PATCH v4 2/7] barebox: friendly error on missing built
	image
In-Reply-To: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
Message-ID: <1458513351-6556-3-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gives the user a friendly error to help him troubleshoot missing built barebox
image.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/barebox.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 2a3b724..d0f28cf 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -94,8 +94,14 @@ endef
 define BAREBOX_INSTALL_IMAGES_CMDS
 	if test -e $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
 		cp -L $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
-	else \
+	elif test -e $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
 		cp $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
+	else \
+		echo "error: Specified built image file not found: $(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE))" >&2 ; \
+		echo "       in: $(@D)/" >&2 ; \
+		echo "       or: $(@D)/images/" >&2 ; \
+		echo "       Check your BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE setting." >&2 ; \
+		exit 1 ; \
 	fi
 	$(BAREBOX_INSTALL_CUSTOM_ENV)
 endef
-- 
2.5.0
