Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6391C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:09:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E262600EF
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E262600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5311480F1B;
	Thu, 26 Aug 2021 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vXDyFMwWX_oT; Thu, 26 Aug 2021 21:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD5278100A;
	Thu, 26 Aug 2021 21:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28DA21BF2A6
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 189636149C
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2F7OYU9ipXcl for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:08:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AED46149B
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A232E8D3C2; Thu, 26 Aug 2021 21:07:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 23:07:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2
X-Git-Newrev: 42a3fee35e67d8d946f52a82bfa88ee6fd9f04b6
X-Patchwork-Hint: ignore
Message-Id: <20210826210744.A232E8D3C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: ubihealthd needs kernel 3.17+
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

commit: https://git.buildroot.net/buildroot/commit/?id=42a3fee35e67d8d946f52a82bfa88ee6fd9f04b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ubihealthd requires getrandom(2) that was introduced in kernel version
3.17. ubihealthd does not build when getrandom(2) is not detected, so
the following installation step fails.

Technically the dependency should also be on glibc version 2.25+. But we
have no way to depend on glibc versions of external toolchains.
Toolchain built with kernel headers older than 3.17 can build
ubihealthd, but it will fail at run-time. So this is a pretty close
approximation of the actual dependency.

Fixes:
http://autobuild.buildroot.net/results/2d42b0a626367e4051d0e2aadcce39e974fe09d4/
http://autobuild.buildroot.net/results/a2b6dbf707275e3f8262479c0650cfc7cb9abc8d/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index abfe806661..57ad01971d 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_MTD_UBIHEALTHD
 	bool "ubihealthd"
 	default y
 	depends on BR2_PACKAGE_MTD_UBIFS_UTILS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
