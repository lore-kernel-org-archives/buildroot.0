From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:49:10 +0200
Subject: [Buildroot] [git commit] uclibc: fixup config before calling
	menuconfig
Message-ID: <20140804075840.029F89D379@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7e862d539196d9036cad694f3594c17160a1dcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uclibc-menuconfig command is currently run based on the user-specified
config file, while the fixup of the config file is done afterwards.
However, it makes more sense to do an initial fixup _before_ running
menuconfig, so that the options presented to the user are consistent with
the final configuration.

This patch changes the dependency of the menuconfig target from .config to
.stamp_config_fixup_done to achieve this.

Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index e7749af..80a88a4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -542,7 +542,7 @@ $(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
 
 $(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
 
-uclibc-menuconfig: $(UCLIBC_DIR)/.config
+uclibc-menuconfig: $(UCLIBC_DIR)/.stamp_config_fixup_done
 	$(MAKE) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
