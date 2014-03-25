From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Mar 2014 07:18:15 +0100
Subject: [Buildroot] [git commit] uboot: unbreak legal info for legacy
	versions
Message-ID: <20140325065509.4B4E69C323@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e628372d34d9e77727185aaf47c82a439a22244
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #6986

Prior to u-boot 2013.10, the GPL license text was stored in COPYING and not
Licenses/gpl-2.0.txt, breaking legal-info.

Work around it by simply copying the file from the old location to the new
if present.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2174584..da67706 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -75,6 +75,16 @@ $(if $(call qstrip,$(2)),
 	@echo '#define $(strip $(1)) $(call qstrip,$(2))' >> $(@D)/include/config.h)
 endef
 
+# prior to u-boot 2013.10 the license info was in COPYING. Copy it so
+# legal-info finds it
+define UBOOT_COPY_OLD_LICENSE_FILE
+	if [ -f $(@D)/COPYING ]; then \
+		$(INSTALL) -m 0644 -D $(@D)/COPYING $(@D)/Licenses/gpl-2.0.txt; \
+	fi
+endef
+
+UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
+
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 define UBOOT_APPLY_CUSTOM_PATCHES
 	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
