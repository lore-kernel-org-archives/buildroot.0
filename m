Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940CEC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B2E40A76;
	Tue, 23 Aug 2022 21:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B2E40A76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xHOb9iT75p6; Tue, 23 Aug 2022 21:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45743403C2;
	Tue, 23 Aug 2022 21:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45743403C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32CCC1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 077DC60BB9
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 077DC60BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tt7hZAfe7r5s for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F09260B91
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F09260B91
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCE7C87C27; Tue, 23 Aug 2022 21:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:51:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81aa9e7b8b1650462719889717caa67c99bef0f8
X-Git-Newrev: 5e52c28397b79f8c4c99552217cbe95202166626
X-Patchwork-Hint: ignore
Message-Id: <20220823213813.BCE7C87C27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: set ld's common-page-size explicitly
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e52c28397b79f8c4c99552217cbe95202166626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some CPU architecures it's possible to use MMU pages of different
sizes, for example on ARC or ARM. And while for user-space
applications the page size is supposed to be transparent, there's
still some use of that extra information. In particular it's possible
to align data structures or code/data sections on page boundary, etc.

For these tricks to become possible tools which pack data (think of
the linker, like GNU "ld") need to be informed of the page size to
be considered.

Obviously, there're some sane defaults which are being used most of
the time, so we even think about that peculiarity, but when non-default
value needs to be used, GNU "ld" accepts 2 properties related to page
size:

 -z common-page-size=XXX
 -z max-page-size=YYY

And while in thery those might be different (but always "common" <= "max"),
and that might make sense if we build for some unknown platfrom,
in case of Buildroot when we build entire target's filesystem and so
know exactly the configuration we're targeting to, we may safely assume
"common-page-size"="max-page-size".

See a lengthy discussion in this thread [1].

Fixes:

  http://autobuild.buildroot.net/results/c8b2f331c98453670cd982558144c4fd84674a3d/ (uclibc)
  http://autobuild.buildroot.net/results/3a22f7aac38145b26c549254b819f87329e7a77e/ (glibc)

And while at it, recover use of "XX-page-size" for ARC, as with [2]
moving page size selection in the generic code we've got unexpected
override for ARC (note "=", but not "+="):
--------------------->8--------------------
ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
--------------------->8--------------------

[1] https://lists.buildroot.org/pipermail/buildroot/2022-July/646176.html
[2] https://git.buildroot.net/buildroot/commit/?id=dcb74db89e74e512e36b32cea6f574a1a1ca84c4

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/arch.mk     | 8 ++++----
 arch/arch.mk.arc | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arch.mk b/arch/arch.mk
index 96f11eba42..2e737b92ac 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -20,13 +20,13 @@ GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
 # Explicitly set LD's "max-page-size" instead of relying on some defaults
 ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
 else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192 -Wl,-z,common-page-size=8192
 else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384
 else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536 -Wl,-z,common-page-size=65536
 endif
 
 # Include any architecture specific makefiles.
diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
index a6b56a869f..42037626a6 100644
--- a/arch/arch.mk.arc
+++ b/arch/arch.mk.arc
@@ -2,7 +2,7 @@ ifeq ($(BR2_arc),y)
 
 # -matomic is always required when the ARC core has the atomic extensions
 ifeq ($(BR2_ARC_ATOMIC_EXT),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -matomic
 endif
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
