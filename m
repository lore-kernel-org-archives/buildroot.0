Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C78AC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCAE181518;
	Mon,  6 Feb 2023 13:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAE181518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYRtWYxBdlAD; Mon,  6 Feb 2023 13:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3AC81BCB;
	Mon,  6 Feb 2023 13:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3AC81BCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 254561BF955
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C725408F7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C725408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QL_waBKTL9rf for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15C52408DD
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C52408DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01E5483C24; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ad3ae14c52ed0aac872875ca7f87cdcf6942128
X-Git-Newrev: e6ae82531928662764536cadbe2d6f3c558e7de2
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.01E5483C24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: use ifeq instead of ifdef
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
