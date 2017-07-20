From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:47:04 +0200
Subject: [Buildroot] [git commit] core: sanitize RPATH in target tree before
	copying the overlay
Message-ID: <20170720204307.CBC3A7FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f4ca518094f7690536074246ab765f36a213783
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We sanitize the RPATH of ELF files in the target tree to deal
with stupid packages that don't correctly use --prefix/DESTDIR
and that end up putting the full absolute build-time directory
in the RPATH.

We do it before copying the overlay and calling the post-build
script. The user is completely responsible for what happens
in the last two steps, and it should never be touched by us.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
