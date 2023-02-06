Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCA6C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC54B436C3;
	Tue, 21 Feb 2023 00:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC54B436C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1Y0D_7fQi9j; Tue, 21 Feb 2023 00:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E480942D32;
	Tue, 21 Feb 2023 00:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E480942D32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41CFB1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D7F417C0
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D7F417C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Vkr32uY0gcA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2D8415A4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2D8415A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F20C8648F; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ad3ae14c52ed0aac872875ca7f87cdcf6942128
X-Git-Newrev: e6ae82531928662764536cadbe2d6f3c558e7de2
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.0F20C8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fwts: use ifeq instead
 of ifdef
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6ae82531928662764536cadbe2d6f3c558e7de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The conditional code using ifdef was added in 2018 and works as
expected.
But there is no reason to use ifdef instead of ifeq.

For consistence, switch to use ifeq like almost all packages already do.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/fwts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index b208aa0c14..f04c7a848f 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -15,7 +15,7 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
-ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+ifeq ($(BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE),y)
 FWTS_MODULE_SUBDIRS = efi_runtime
 $(eval $(kernel-module))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
