From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Aug 2017 15:06:45 +0200
Subject: [Buildroot] [git commit] core/pkg-toolchain-external: quiesce
	spurious stderr
Message-ID: <20170819130053.15FE28182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4ebf9b0beae85e65eeb05106c1fce0e1379d1db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 392b0a26f5 (toolchain-external: default BR2_TOOLCHAIN_EXTERNAL_PATH
to empty), calling 'make clean' or similar can yield a spurious stderr
message:
    dirname: missing operand
    Try 'dirname --help' for more information.

Which is definitely baffling and unsettling...

It turns out that it is pretty trivial to reproduce, and this defconfig
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

So, use a make construct rather than calling to the shell: $(dir ...)
does not whine if passed nothing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 23cdf30..dc0588c 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -74,7 +74,7 @@ endif
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
 TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
