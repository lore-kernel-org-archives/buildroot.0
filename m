From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:59:37 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Makefile: ensure
 $BINARIES_DIR exist before post-image scripts
Message-ID: <20190831075536.532AF88597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f04aa58e80c966d3ef40ef41b7f90387b2b208a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When no filesystem is enabled, the $BINARIES_DIR is not created. Yet,
the post-image scripts are still run. When those want to generate an
image in there, they may fail as the dirctory does not exist (it did
exist before we started applying preparatory changes for top-level
parallel build, so scripts got to rely on that assumption).

Do in target-post-image as we do in the sdk rule: create the directory
before calling the scripts.

Signed-off-by: Brent Generous <bgenerous@impinj.com>
[yann.morin.1998 at free.fr:
  - create the directory before calling the scripts
  - don't drop the creation in the sdk rule
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit d57e73078a315eb7419173d7e0503ce66c1df238)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index ace6e5c3e4..a54544f87c 100644
--- a/Makefile
+++ b/Makefile
@@ -810,6 +810,7 @@ endif # merged /usr
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
+	$(Q)mkdir -p $(BINARIES_DIR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
