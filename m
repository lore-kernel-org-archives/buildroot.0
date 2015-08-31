From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 09:04:09 +0200
Subject: [Buildroot] [git commit] x264: unbreak x86 build after version bump
Message-ID: <20150831070943.8A8B181E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d29b105318b985752e4ab56984689f8c1f21a155
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3ec/3ec54f722d6008fc422540d3a5462b306d16e84c/

The recent x264 version bump broke the configure step on x86/x86-64 as x264
ends up using gas instead of yasm as assembler.  The reason for this is the
recent upstream commit to optionally use nasm instead of yasm if AS= is
passed:

commit b568a256b9bc6c500d7b1ffe4b9c3311ee5ff337
Author: Henrik Gramner <henrik@gramner.com>
Date:   Sat May 23 19:44:16 2015 +0200

    x86: Experimental nasm support

    Enables the use of nasm as an alternative to yasm.

    Note that nasm cannot assemble x264 with PIC enabled since it currently doesn't
    support [symbol-$$] addressing which is used extensively by x264's PIC code.
    This includes all 64-bit Windows and 64-bit OS X builds, even non-shared.

    For the above reason nasm is currently intentionally not auto-detected, instead
    the assembler must be explicitly specified using "AS=nasm ./configure".

    Also drop -O2 from ASFLAGS since it's simply ignored anyway.

But as we pass AS=$(TARGET_AS) it ends up using gas instead. Fix it by
explicitly passing AS=yasm instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index d24cf20..7e7e597 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -13,7 +13,9 @@ X264_INSTALL_STAGING = YES
 X264_CONF_OPTS = --disable-avs
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
+# yasm needed for assembly files
 X264_DEPENDENCIES += host-yasm
+X264_CONF_ENV += AS="$(HOST_DIR)/usr/bin/yasm"
 else ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_aarch64),y)
 # We need to pass gcc as AS, because the ARM assembly files have to be
 # preprocessed
