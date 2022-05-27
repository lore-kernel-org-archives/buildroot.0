Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493C8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC3C64130A;
	Fri, 27 May 2022 08:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3g8fwvGrTByi; Fri, 27 May 2022 08:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C080C412FC;
	Fri, 27 May 2022 08:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 276F01BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 028E4412EE
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfSVfu25_KI0 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 393FF412E9
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:58:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6FEDF865B4; Fri, 27 May 2022 07:46:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 09:55:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c9306ba84c97f020fd20a6e56c0d2143750eac6a
X-Git-Newrev: 0d7ba2aa40612c0edaecae5cdc28407c46382478
X-Patchwork-Hint: ignore
Message-Id: <20220527074654.6FEDF865B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/adwaita-icon-theme: needs host gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d7ba2aa40612c0edaecae5cdc28407c46382478
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since bump of harfbuzz to version
3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-verify.cc:27:
../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
      hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/bbc48cb5232c617d4ff1d0bafd63bb3c9c72d556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9f0c67179e55d967ae54d000d8d58dbc52cb1de3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/adwaita-icon-theme/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index d200570e76..71b839d996 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
 	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	help
 	  Adwaita icon theme
+
+comment "adwaita icon theme needs host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
