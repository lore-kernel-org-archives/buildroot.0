Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB575C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:26:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EC2610CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6EC2610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43DB40301;
	Mon, 13 Sep 2021 20:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQuqdH4fsp_9; Mon, 13 Sep 2021 20:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AB8402F7;
	Mon, 13 Sep 2021 20:26:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5ED01BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B46402F7
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ll-pbEpZjje2 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:26:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23AF6402E2
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:26:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C23CF8A623; Mon, 13 Sep 2021 20:24:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:24:11 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 0fb8ff9729ea730127b32b0bb35afb47aef9cc47
X-Git-Newrev: aa93de5400c014fcae465079f685fbe119a57b82
X-Patchwork-Hint: ignore
Message-Id: <20210913202436.C23CF8A623@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/uhd: needs boost
 math
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa93de5400c014fcae465079f685fbe119a57b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Lots of uhd components (e.g. examples, USRP1, USRP2) needs boost math
(i.e. https://github.com/EttusResearch/uhd/search?q=boost%3A%3Amath)
resulting in build failures since commit
c577eac16eaae515973faf3013da197516bfd391

Fixes:
 - http://autobuild.buildroot.org/results/70f6db101c9d35cdd88da602a863ddf35706fd7d
 - http://autobuild.buildroot.org/results/5b28591b4c4a7ae4cc6d428c42d96db138ef3ee7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d5eb075d55c038ac26acaaed9781cf4589180539)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uhd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index f61bbf0e8f..541799b01f 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_UHD
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SERIALIZATION
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
