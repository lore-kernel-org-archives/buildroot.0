From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:16 +0200
Subject: [Buildroot] [PATCH v8 05/10] core: sanitize RPATH in target tree
	before copying the overlay
In-Reply-To: <1500561321-6623-1-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
Message-ID: <1500561321-6623-6-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We sanitize the RPATH of ELF files in the target tree to deal
with stupid packages that don't correctly use --prefix/DESTDIR
and that end up putting the full absolute build-time directory
in the RPATH.

We do it before copying the overlay and calling the post-build
script. The user is completely responsible for what happens
in the last two steps, and it should never be touched by us.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 188ce9a..d4faa02 100644
--- a/Makefile
+++ b/Makefile
@@ -709,6 +709,9 @@ endif
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 	) >  $(TARGET_DIR)/etc/os-release
 
+	@$(call MESSAGE,"Sanitizing RPATH in target tree")
+	$(TOPDIR)/support/scripts/fix-rpath target
+
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
-- 
2.7.4
