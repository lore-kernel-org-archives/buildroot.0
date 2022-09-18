Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA06ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F6783EE4;
	Sun, 18 Sep 2022 21:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F6783EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSvvjVe9F96e; Sun, 18 Sep 2022 21:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2D083ED2;
	Sun, 18 Sep 2022 21:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC2D083ED2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 788011BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DFD14246D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFD14246D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ez5434fOu9u5 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41BD842468
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41BD842468
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30FC1854C8; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:11:05 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 8e606e44d8b2381bad180a70247dae9998a5854c
X-Git-Newrev: 5913c02656220b6c79207f03ebc7e7c50a8f073d
X-Patchwork-Hint: ignore
Message-Id: <20220918211221.30FC1854C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/sox: work around
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

commit: https://git.buildroot.net/buildroot/commit/?id=5913c02656220b6c79207f03ebc7e7c50a8f073d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
