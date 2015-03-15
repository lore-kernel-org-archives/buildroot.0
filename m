From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 15:40:30 +0100
Subject: [Buildroot] [git commit] toolchain-external: fix support for
	non-ADI Blackfin external toolchains
Message-ID: <20150315153355.92EAA80780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23ecfd04e6987879b5b4fce8f89b1e6501d011f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The computation of TOOLCHAIN_EXTERNAL_BIN has a special case for
Blackfin, where it's set to
$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
instead of $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin for other
architectures.

However, this is actually only true for Analog Devices pre-built
toolchains. Other Blackfin external toolchains (such as ones built by
Buildroot) do not have this special organization.

Therefore, in order to make those non-ADI Blackfin toolchains work, we
need to change the condition from BR2_bfin to testing specifically for
the ADI toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 44b8c83..9aa8123 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -141,7 +141,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-ifeq ($(BR2_bfin),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
 else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
