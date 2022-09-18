Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8385C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B1B815CC;
	Sun, 18 Sep 2022 21:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B1B815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tt_WR1_KVGn4; Sun, 18 Sep 2022 21:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79A4813F0;
	Sun, 18 Sep 2022 21:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79A4813F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B84D1BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 682E660AE8
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 682E660AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJkfrPHSAql8 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:13:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73AA160F5E
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73AA160F5E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6388F85536; Sun, 18 Sep 2022 21:13:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:10:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f3074146401ebe749a6b93492a107780e0314202
X-Git-Newrev: 84555edc4ecb0e2e8f87bfdd9f0595366646745a
X-Patchwork-Hint: ignore
Message-Id: <20220918211332.6388F85536@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sox: work around
 gcc bug 68485
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

commit: https://git.buildroot.net/buildroot/commit/?id=84555edc4ecb0e2e8f87bfdd9f0595366646745a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

sox is impacted by the microblaze-specific gcc bug #68485 [0], which is
still unfixed as of gcc 12.x.

As for all other impacted packages, force no optimisation when using a
toolchain riddled with that bug.

Fixes:
   http://autobuild.buildroot.net/results/ac4/ac4fbd55529ac7b4e635a11766f842cd25a833a1/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dd8a8cfa9a584934bb2707c197c43073d6c03436)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sox/sox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 1896437ad4..d0329bf50d 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -26,6 +26,14 @@ SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
 
+SOX_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+SOX_CFLAGS += -O0
+endif
+
+SOX_CONF_ENV += CFLAGS="$(SOX_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 SOX_DEPENDENCIES += alsa-lib
 SOX_CONF_OPTS += --enable-alsa
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
