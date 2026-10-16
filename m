Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C003FCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1BC60B99;
	Fri, 16 Oct 2026 13:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82yhH3ww3eVX; Fri, 16 Oct 2026 13:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B0C660B9A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156144;
	b=idyURkXAWEvgRSB4UtdSgWm7WFs0rpmzSJar2uCPeH2g/6doTccJNNO0+ejWaMhYt5Ja
	 CVukTvddk2DmsYk5DFUsNgAFWuJptGlnJTkmyhm623Leru6JvHFP2uvDYDbpMFG6yFOR5
	 292aFcnNWBKG9/PMTB94dRfMK+MtMpsvC+9oNhQu8xJoAH99HuTLulrYrjXmkLoZHzp7p
	 nB1s0JbLZG7V4EN73x5vspZv4JFNnBOdU/BOHbkAlTE8uXeXhs0qxx8O29eOSZySg2GGB
	 PLSOrBpPLpgABFTgnAkAkIVXktNCyArU/qkuuJnv7Bl1rF9EgyR3K1cmzb0db6SGtcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PEikXdbv9+kjN747waiCv1X6Oe63L2ZDDoCVCseobtg=;
	b=PrmupB+xcL7Qfu78mMgfvNM7qqiq5luAvyMdm8E1RW07t/za4wqr0CiwvLp7FU7cSWgH
	 8NdPQ06S5jhclsZaPBJH0lswkl3SH2mL2FzYTx9SFQysqNQqPxp7iEAzYkTwiUkYuh207
	 TjFtF7X9KA++DwzDv3dd9RD0P0pm28Mx45OHRW/aAYfZvk3NZM76QGp99sEv9Qu5ZIGDM
	 1ZGYRm5mY7bWflg5t+DYuAGsQMqJF3DUkRW8+4yfpcVxb4C9K5zh0nXTzIRgHTlkZm0C+
	 hBIYacsPBdLSQcvXMcRBujilyt8OEMK2BxgnS6MY4Av1l4Sa3YM0KP8I0ifujub242g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156144;
	bh=PEikXdbv9+kjN747waiCv1X6Oe63L2ZDDoCVCseobtg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PRJf3XU+UbduErntcz5V/tK+8hdGeAcbg7NbeknnSmaq2zvj2yqikOyP9kc5j8qgI
	 EFMj4NASTjI3sSKulT23kC8WpBEeRXJ0rrdNZwcSmxFsVy/N9SgFzGcrEbRHNZfvQl
	 /lVsdWfu1v0U3eamK6w0w/pwOKIBEOFaB/MKPcJpruukv2vdWPlkJlH3JHhdN1g5Ja
	 szk3+MMGZ/baFuA11/L8LEbVFvVZM5AtGCjtgu/KEP5NyADtYuOCwCiU4MqSxNjMLI
	 1Lk3yx0/X/xLOGn+BTVMw9RR7mkSC7AkU9YYu7qi4WDr3IcG3fcxxBxSXiVVFtqpNi
	 6MMY3IPLPPrcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0C660B9A;
	Fri, 16 Oct 2026 13:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B87A0F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B68C08150F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dtM9ILNLJ_H for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 185AC814BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=dLX+GMJrk/mjYXrr52dp+fiH71JNmJ0tWXNWAfa7O/cRPKr1VRxc7Op6ms/p6VVlBv23
 402NxQM1IWdhYNYFiV8INEXzZEOrjVhKXLTW2tmeQ0UFZoxV3ua8YrX7tfPDBwpKGOzF3
 ULl7Y0XVhdwXr2EkhniIRmYFLWeZgwtx55O+xJM7kSWM6jGR/zAvyxu6ogXbETVcCQiEl
 76chFY8aHXahwRh5lUXcr5i9pHLJyP42L0KtymayGDEIdHsxLcV4zxfD6xswhG/N+QsBI
 HfTZ7NiCyBnkZZQraWdWzup0ucmOFrq++kI6GYbx63BsfvfzAXiwVsMl2qKTldqBKXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MXu1g+OE7XLHxyKan27FV7VHQVC5tMvMtWeZDBbh9N4=;
 b=ni71PAZNHh47skh/B1j/rQ1TIt9JdWlpFt8zH39n3lG1HIR2DR1AdSmotAD+XT78MvnI
 OiDyfm1TmEcedTUHibK2ppZnaGrSRT8JSByyW30BoNHmN+B15PPUhAwQGZhH9Fa37lRTA
 N6nOvtJxH9jVs2Kb91b5nxwjCWwjdpPVY+4nO1WXNT4z6b/6HLtCoHVxj2Azv/aEJCAFC
 ZoSf7g8/bG3/eG34Sjz2gbFcaR75TgvIcPOyScWYXbSuKb441WdTgP3fK0HBhBkFgk01Y
 707oWtjNv0/QiNOHo1hq1+XRsP08bVyu7UKV5APSfIP5f+y5NdeKlo/Z9M5fkVJAItA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 185AC814BD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0968A960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8a1a335df106add2b18e7cf0fe7a4e964fa7d663
X-Git-Newrev: 4e603a6ddc212b2c50810871ff97a7206e287f3f
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.0968A960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/expat: security
 bump version to 2.9.0
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
Content-Type: multipart/mixed; boundary="===============4711639264952752929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4711639264952752929==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e603a6ddc212b2c50810871ff97a7206e287f3f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libexpat/libexpat/blob/R_2_9_0/expat/Changes
https://blog.hartwork.org/posts/expat-2-9-0-released/

Fixes CVE-2026-77214 & CVE-2026-102633.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6525e9cf89394d45e1c74085d0d1d039bd890d0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 262ad4bf0d..41778fc536 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
-sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_9_0
+sha256  1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051  expat-2.9.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index be4180992f..be5d8ae0b8 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.5
+EXPAT_VERSION = 2.9.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============4711639264952752929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4711639264952752929==--
