From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:24:17 +0100
Subject: [Buildroot] [git commit] toolchain: post-pone evaluation of
 TOOLCHAIN_EXTERNAL_BIN
Message-ID: <20171231172424.AC0118395A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a69e33d57b344cfaee52c4cf995a1c3bdf0f40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upcoming per-package SDK functionality is heavily based on the
fact that HOST_DIR, STAGING_DIR and TARGET_DIR are evaluated during
the configure/build/install steps of the packages. Therefore, any
evaluation-during-assignment using := is going to cause problems, and
need to be turned into evaluation-during-use using =.

This patch fix up one such instance in the external toolchain code.

This change is independent from the per-package SDK functionality, and
could be applied separately.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index dc0588c..b9ad172 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -77,7 +77,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
+TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
 endif
 
 # If this is a buildroot toolchain, it already has a wrapper which we want to
