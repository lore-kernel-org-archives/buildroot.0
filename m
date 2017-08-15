From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Aug 2017 17:03:40 +0200
Subject: [Buildroot] [PATCH] core/pkg-toolchain-external: quiesce spurious
	stderr
Message-ID: <20170815150340.16983-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 392b0a26f5 (toolchain-external: default BR2_TOOLCHAIN_EXTERNAL_PATH
to empty), calling 'make clean' or similar can yield a spurious stderr
message:
    dirname: missing operand
    Try 'dirname --help' for more information.

Which is definitely baffling and unsettling...

It truns out that it is pretty trivial to reproduce, and this defconfig
is just enough:

    $ cat my-defconfig
    BR2_TOOLCHAIN_EXTERNAL=y

    $ make BR2_DEFCONFIG=$(pwd)/my-defconfig defconfig

    $ make clean
    dirname: missing operand
    Try 'dirname --help' for more information.
    [--snip--]

This is because the cross-compiler is not found in the PATH (and for
good reasons, I don't have it in the PATH, not even at all).

So, when the cross-compiler is not found in the path, we simply
continue as if all was good, and postpone the check to much later,
when we try to copy the toolchain libs...

We just quiesce the spurious message by consigning stderr to oblivion.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Note: it would be good to error out at this point, but as explained in
the commit log, we already error out a bit later when copying the
toolchain libs, and the check is easier done then than what we could
do here, because we'd have to guard with BR_BUILDING, and for good
measure, we'd also have to do the check when the tooolchain dir is
actually specified. But then this would duplicate the existing (but
later) checks, so we just don't bother...
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 23cdf30b9f..b139638100 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -74,7 +74,7 @@ endif
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc) 2>/dev/null)
 endif
 else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
-- 
2.11.0
