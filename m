Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1276ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 739C040138;
	Sun, 18 Sep 2022 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 739C040138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3RkhO9VNmO9; Sun, 18 Sep 2022 21:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30CA6400EF;
	Sun, 18 Sep 2022 21:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30CA6400EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 819651BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6631B40150
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6631B40150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XbhrA_3rowO for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A565D400EF
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A565D400EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EBB7854C8; Sun, 18 Sep 2022 21:12:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:10:54 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c867e437e2cdc6ddb4f83c66dcae4b4b46881555
X-Git-Newrev: 5dc3ee86c360038e49b50544717f6c5eac44cd45
X-Patchwork-Hint: ignore
Message-Id: <20220918211220.8EBB7854C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/sox: work around
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dc3ee86c360038e49b50544717f6c5eac44cd45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
