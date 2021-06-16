Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F00C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:01:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D676600CD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D676600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13FC5607BC;
	Tue,  3 Aug 2021 22:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZ2ax-Ys2u37; Tue,  3 Aug 2021 22:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B3860862;
	Tue,  3 Aug 2021 22:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9A951BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB35E608B8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gdmtafDH9O9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 413646067E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 99383876CF; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Jun 2021 21:06:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7bf844813e2527267cb0a98eb73a0e4bdf04f99
X-Git-Newrev: 6d758f59e65c33b067076cdb89a8404d5471c7ae
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.99383876CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: default standard
 install to y
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6d758f59e65c33b067076cdb89a8404d5471c7ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Until commit 5c07dfcc1a52e2804011574a3e022523a20546c8
BR2_PACKAGE_LVM2_STANDARD_INSTALL would default to y. Indeed, the
default read:

      default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11

Since the legacy symbol is normally not selected, this defaults to y.

Commit 5c07dfcc1a52e2804011574a3e022523a20546c8 inadvertedly removed the
entire line instead of just the condition.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=13846
For-stable: 2021.02, 2021.05
Cc: dominique.tronche@atos.net
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lvm2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 317027929e..cc740dd40c 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -26,6 +26,7 @@ if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
+	default y
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
