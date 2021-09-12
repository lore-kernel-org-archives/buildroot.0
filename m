Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DE3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3BD61209
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B3BD61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD03B4026C;
	Sun, 12 Sep 2021 12:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFIxZyOlc56E; Sun, 12 Sep 2021 12:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4885B40218;
	Sun, 12 Sep 2021 12:43:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06E2A1BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA7B3402A2
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXDra-9almyv for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CE3040119
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B99F08A405; Sun, 12 Sep 2021 12:41:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:32:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cae9e692b1e2f9a299af148a8358674930d3429b
X-Git-Newrev: d5eb075d55c038ac26acaaed9781cf4589180539
X-Patchwork-Hint: ignore
Message-Id: <20210912124145.B99F08A405@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: needs boost math
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5eb075d55c038ac26acaaed9781cf4589180539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lots of uhd components (e.g. examples, USRP1, USRP2) needs boost math
(i.e. https://github.com/EttusResearch/uhd/search?q=boost%3A%3Amath)
resulting in build failures since commit
c577eac16eaae515973faf3013da197516bfd391

Fixes:
 - http://autobuild.buildroot.org/results/70f6db101c9d35cdd88da602a863ddf35706fd7d
 - http://autobuild.buildroot.org/results/5b28591b4c4a7ae4cc6d428c42d96db138ef3ee7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uhd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 0d68fda171..248e309dd5 100644
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
