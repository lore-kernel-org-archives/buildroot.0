Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E68EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA9540B71;
	Mon, 21 Aug 2023 20:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA9540B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3p9sK8G_-zC; Mon, 21 Aug 2023 20:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C075C40B56;
	Mon, 21 Aug 2023 20:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C075C40B56
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58DC1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77B0F40B26
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77B0F40B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s87UHvvxK9l1 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA9CF40B2F
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA9CF40B2F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB3BB85FEB; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 19:45:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 503252d8b0951af306189b63ea852723c6540f5a
X-Git-Newrev: a845276757085692601933541e510e1f02dae575
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.BB3BB85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/genradconfig: drop
 legacy lpc32xxcdl exclusion
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

commit: https://git.buildroot.net/buildroot/commit/?id=a845276757085692601933541e510e1f02dae575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 503252d8b095 (boot/lpc32xxcdl: remove package) forgot to remove
the special handling in genrandconfig. Since the package no longer
exists, we don't need to special-case its symbol anymore, so drop it
now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 60922e871c..b6154db344 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -496,10 +496,6 @@ def fixup_config(sysinfo, configfile):
        'BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS=""\n' in configlines:
         return False
 
-    if 'BR2_TARGET_LPC32XXCDL=y\n' in configlines and \
-       'BR2_TARGET_LPC32XXCDL_BOARDNAME=""\n' in configlines:
-        return False
-
     if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
