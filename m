From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:54:37 +0200
Subject: [Buildroot] [git commit] toolchain-external: make ext-tool.mk
	includable in all cases
Message-ID: <20131006194411.6E9339B8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c58a80b4cd6b620622e567218ded34104c6d46b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ext-tool.mk logic uses the TOOLCHAIN_EXTERNAL_PREFIX variable
unconditionally, even if the external toolchain is not used. Until now
this wasn't a problem since ext-tool.mk was only included when the
external toolchain backend was selected, but the next patches are
going to include this file unconditionally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/ext-tool.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index db2a99e..8cfd1b1 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -1,4 +1,3 @@
-
 #
 # This file implements the support for external toolchains, i.e
 # toolchains that have not been produced by Buildroot itself and that
@@ -112,8 +111,10 @@ TOOLCHAIN_EXTERNAL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_DIR),)
+ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
 TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+endif
 else
 ifeq ($(BR2_bfin),y)
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
