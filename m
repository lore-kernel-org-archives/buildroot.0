Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A63AECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6992A41E34;
	Sun, 11 Sep 2022 19:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6992A41E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3BGaAfvBiOn; Sun, 11 Sep 2022 19:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2947941E05;
	Sun, 11 Sep 2022 19:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2947941E05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D775F1BF591
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C011783F19
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C011783F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnB9V9Rv4-Gf for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:16:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3778683EEB
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3778683EEB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 24136836DF; Sun, 11 Sep 2022 19:16:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 21:09:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95c2493a8e52c32ce97f0a1348bfc71dcb2b28b9
X-Git-Newrev: dd8a8cfa9a584934bb2707c197c43073d6c03436
X-Patchwork-Hint: ignore
Message-Id: <20220911191604.24136836DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sox: work around gcc bug 68485
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd8a8cfa9a584934bb2707c197c43073d6c03436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sox is impacted by the microblaze-specific gcc bug #68485 [0], which is
still unfixed as of gcc 12.x.

As for all other impacted packages, force no optimisation when using a
toolchain riddled with that bug.

Fixes:
   http://autobuild.buildroot.net/results/ac4/ac4fbd55529ac7b4e635a11766f842cd25a833a1/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
