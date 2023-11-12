Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CECC4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 13:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD42841526;
	Sun, 12 Nov 2023 13:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD42841526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyjoS665YdpM; Sun, 12 Nov 2023 13:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B66E941555;
	Sun, 12 Nov 2023 13:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66E941555
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0C361BF377
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F5D40512
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F5D40512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJ5AWohbAymx for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 13:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A50644037A
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 13:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50644037A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9239487067; Sun, 12 Nov 2023 13:10:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 14:09:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d23bcbd2bb76fb157624d18e88ce33fd9a964fbe
X-Git-Newrev: 01932fec171d2d548d20e64e0236e8f6161d689b
X-Patchwork-Hint: ignore
Message-Id: <20231112131015.9239487067@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: Fix gcc finale library
 installation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01932fec171d2d548d20e64e0236e8f6161d689b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/98f/98fedf4969c260f73a01b937b9625e66dcd86b3c

When BR2_TOOLCHAIN_HAS_LIBATOMIC is "n", there is no gcc libatomic.so
library to install. For configurations with such settings, compilation
fails as gcc-final.mk unconditionally adds libatomic as an installation
target. This error, for instance, shows for all Canaan K210 riscv
configs, as they all use uclibc flat binary format which disabled
libatomic:

Fix this by modifying package/gcc/gcc-final/gcc-final.mk to add
libatomic to GCC_FINAL_LIBS only for configurations that have
BR2_TOOLCHAIN_HAS_LIBATOMIC set to "y".

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index edb9b2f73a..99d7047b5f 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -144,7 +144,11 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-GCC_FINAL_LIBS = libatomic
+GCC_FINAL_LIBS =
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GCC_FINAL_LIBS += libatomic
+endif
 
 ifeq ($(BR2_STATIC_LIBS),)
 GCC_FINAL_LIBS += libgcc_s
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
