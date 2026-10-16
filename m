Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89606CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4657261044;
	Fri, 16 Oct 2026 13:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8bqUWnRrfRj; Fri, 16 Oct 2026 13:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 39A3061052
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156260;
	b=Iv2OBgtROLz8HRqF5RbtBepbUWybaz/EUakTsmA/RLFegSgIts3G9gDnqTE5NjTA9Yzj
	 RAheXj6x28qteZdqt+hyYAgfkY4uuIW4c4Y8LP5MsaU8FQfTPqtmR4jQz80wAMb9Xh6OL
	 Q4lx1jc3ZOkOT6f36tdcBkXU0947IZnn1d2nfmrJxIlOOBiH6obdiyP7ODLwiEzjHnlVr
	 dVsYTMKQ0PHDPEar9oX6xRF2A/kpEN3Njm6f7vqkeb4I9obbyh0YkpA2950TAkgs8rIi1
	 m8YUpzsp6o2RX+JAf1+TxKGzLv1zXi0QV5Lw4+p3uZciSLaaC6xk3d9DCbedQfHizOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=fsSOPDO7U9eOwLiABNQ+IG44xNe2kcqBu1MyLZWR/eM=;
	b=KI32kZhaG2ZDLEDYxFCweEePeV5Ioz2wNp/1CmRfCj19TIDw7nt2sJEJVXp/laHsajtz
	 kMcD+C0iinqnAIgpLI3cUdp/+qCOQyPpiLdMGFdNlFcbL8XP7azUUnZmOWWOss1PZJPVZ
	 O0Os5BQkkca2DwdyA4ipKhSw0QHKn11OA3BUFOpL2RzufLVGORGBhJ3JWj/5q4xIpZFVw
	 qIVAebZANibZa6gTPqEZLMEIgliBD165MJRAXYoc3iyaqJPdeo4HfejRlX4uXznGtt3Tn
	 tbAURaKSkbgUWfxMBeJlQyODulHRzT7K+IVpaS/IMg7l/LKUmtuzT/dA7FYqXs5PI7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156260;
	bh=fsSOPDO7U9eOwLiABNQ+IG44xNe2kcqBu1MyLZWR/eM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SCK/2EilhUr1+9oKVjb3YUZGdzjroT83zpNtPtza48OxsIqyxZ88CrdM0fH5JXgq6
	 4j64GaWrceNa2z8w4imPPUSqYz57UfmyYJVHzCwIW6XC1JByPuLK89n8PqXCcwR2nK
	 o2cxWXVc937SMEdJnv/9xTDu9LywWrjrdW3mjhkP69eDi/BZUuIwQBLW3cbclrxRpa
	 M9Wocya4Ko37lFT14aTKuSf8C8+EdKX4/SyEAiTiabRKkGSvScTKDXK9kSSgNCRtBN
	 nNYRwIlsLHBJ3nPcyfjWxvGHTdqSptzvckfp55rngt87KzSv8kV8/3p9oMmpXYy08K
	 0vGHot8G+bSeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A3061052;
	Fri, 16 Oct 2026 13:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C593920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420EB81489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnUYAB8LNg-e for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 213E2814D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=YSNGKsa/6GQ9MmiwXT/VsQakeaCAKFDpaUZa/eZpL+ynVU/UfxtyeL8mVTXFNjhU2x8s
 NYi4mnDoA1eJr9ied72GruYnAAYmoWUjHRBW+4TQhvB/o0NRmf4uTHMtpygmKmlwegn9O
 Oqern4ONPDf5wkxoajDlwGW5S5PXLNyIVj0wKqCz9orojxpyIkJbrrk5+ELOYNb+BExGS
 Z1xy+zjIs61AuXMO8Icp/14xgDWcBf5ftwWtn9cx0IThpUbp6ZIJ1o09FuV82GzrzSmoq
 EHOUBeYxgX6N8G+GCWeR75KPqURz2A8rYP2fnsGTx5O9iBSg1KJ4CMAYVgCDT9f+EVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EcSrn5qKc0t87Lyj4aY0HxbvIqJSCcAssa/OBI60lxE=;
 b=LCQQglJs/LGoc4sh9qOg6jbtW4hgcvvFkeTJ+92zho4u2mQA7QX9sEr7RaZUdE4Fo2jp
 sZ2nmCMEhGXk4hA5Xy2F7+hKsMxti0+J3LYtcLMX/C4dx0pAn9EOcGI6lPkL2Eea6G6AY
 L/IUXHsyo0wHbsX2+xp4we/OiOZxspi0wHltSCdo0URL9uuXOlE2UhRoKgcAiEF4+STmf
 c+sIDr5rFAZbMW5ISNwSvFUWdHECnJFxec9uA7l7OzjiSgdZ4Wc3fQxyS2FlQL+Kp1u9U
 AH746uZPZKg2UZeFS9UJMSVz7eMiDISDQSGkhchdoe4enxBd2LmKJUCb8PmONjG/gFA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213E2814D3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B9B960D5; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a2fdcaeb01264000a20716110a78bc961e8751e0
X-Git-Newrev: dc591fd5a9f1c6411b69d0cc9574c0f0e23016d7
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.11B9B960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 docs/manual/contribute.adoc: mention mailing list subscription requirement
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5280277012345151086=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5280277012345151086==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc591fd5a9f1c6411b69d0cc9574c0f0e23016d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The mail address used to contribute via buildroot mailing list
is required to be subscribed to the mailing list. Otherwise,
messages sent to the mailing list will be automatically rejected,
as server only accepts email from mailing list subscribers.

This behavior is not explicitly stated in the documentation
for contributors (aside from recommendation to subscribe
as the first thing for contributor to do). This may lead to an
unpleasant surprise to developers, who prefer reading mailing
lists using archives.

Add mention of mailing list subscription requirement to 'Preparing
a patch series' section of contribution manual.

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
(cherry picked from commit f350991abf13bce2a0d21a69b08f0e7a6a579b1d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 docs/manual/contribute.adoc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f82eb14303..6ac75fb66a 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -380,6 +380,9 @@ $ git send-email origin/master
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
 
+The mail account used has to be subscribed to the mailing list,
+otherwise your message will be automatically rejected.
+
 If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.

--===============5280277012345151086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5280277012345151086==--
