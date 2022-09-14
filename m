Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBD9ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 19:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5E6841794;
	Wed, 14 Sep 2022 19:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E6841794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQXCFFl0ICtK; Wed, 14 Sep 2022 19:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD09541708;
	Wed, 14 Sep 2022 19:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD09541708
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4194E1BF283
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B5741794
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B5741794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aniW1RjTF6_L for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 19:04:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2102C4177A
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 19:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2102C4177A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 105D383950; Wed, 14 Sep 2022 19:04:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 21:02:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 072a275a9aeb2a0a24507c2acec2f2fdb3788001
X-Git-Newrev: 578bc663c61af7be2e09c2cb69fd0cb6db98f226
X-Patchwork-Hint: ignore
Message-Id: <20220914190433.105D383950@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lshw: also uses
 hwdata's PNP IDs
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

commit: https://git.buildroot.net/buildroot/commit/?id=578bc663c61af7be2e09c2cb69fd0cb6db98f226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 29bccabdebff (lshw: use data files provided by hwdata) removed
the hardware info DBs installed by lshw, in favour of those provided by
hwdata, as the former are way out-dated while the latter are more
up-to-date.

However, it forgot to also select the PNP ID database, to replace the
one lshw would install.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c6241bc2ca335a405f1ccf387d5d77ad141277a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lshw/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 5e0e47b6e2..fb557aacff 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_HWDATA # runtime
 	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_HWDATA_USB_IDS
 	help
 	  lshw (Hardware Lister) is a small tool to provide
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
