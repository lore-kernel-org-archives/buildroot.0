Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BFBCA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841A16064F;
	Sat, 10 Oct 2026 15:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XErwAyXRqHtL; Sat, 10 Oct 2026 15:31:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9272660668
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791646296;
	b=Cdd7XVQ6ugbMPe6+68KHFSFf1vePlJMOkajUFVsKHti2pd15ds64OEkfaCNm0mjUCXz/
	 9ewV2HbcUy+w46UbZLnM3atikQSZK6pj+wI6vUeeIHL0x2TbAHI3jW8uAwZYf1iyqQOLK
	 1Pgv6buOebHjszNs38jM3coU7W4ci7JQ31IfxP7dnCniJAjWhCrXlYB5XuypZhJ3jyVaM
	 HH1tq295gweU+ioxjKBE03MHHMlcSpw5l3nMn5BVZJI8oaaEPhHIAJ9Plf3uEBcRgqqHT
	 pYG+ol5zpVwC9v1N15xS3aNIBFLWYCxNAkO3lUs8YMVc+cc+dhTFPIOKt+78jsb7lCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791646296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JeoJsY8tffCiWQKsj9rpvhQwd5fnqXm3LjdpSWiU5OQ=;
	b=XrP0fU6B8GzYPjkdkeoNSzd5hbaAGbC68GgbWt/ecFPzL1BbUeAOdpZQ9mCT56LL+yrk
	 DtQCkeQphAQbSlhvmfMA9RbYxDDf5TfgUIsPfIq9mko2x09k8HHGkmfu9hqCgW5WbC+4z
	 Qcx5dvh68fadhwUQYV/vFfc1ifoO/bt+5aKjj2lSCbjgL8JWdXtKcTM6YDCFoKafSjiQ8
	 m7YikYzYRkV5dqGOWNtSaiVMNghoHlNlpisqVujODKkfmHeoiK8+PRHnyIZPKnFu6lqo2
	 VMuQR/sjke/InESaZ3ZBTBUWDZ1/xqe+B0yLhGSc6LPapfo0HmPdqT7s2ZY4Xo/4t7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791646296;
	bh=JeoJsY8tffCiWQKsj9rpvhQwd5fnqXm3LjdpSWiU5OQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sy5KP54z+0kaM77hU7D6xHfmctZIyRbcqHN5gYLGzogq18y9KJHsF31YKheRAtcg9
	 MkTMgFCvYZ5/TKZZ8yks36SiN6m6pfytOSifz6hXWqbhQcIDNuNDzSBYEr/4gzdZ85
	 o49rdnvFJl1no7z6+Yc4rozTEvYoDMeZSzhwH7cNplBcmRDFusrBmsLqPfAq5f8IAH
	 i4YzSsjtwdHXGNh5SQ/C8XaIid19PrxjD96IvSaSpc3l57ZdqyQ2d8tIfdYrICIUAV
	 lds73XO5pQis46bhm4jEygrx4B5XloRh8+fNQ8E2KuSGBJc+ZicVu9y+CUAs5HOfWk
	 ptooYVIO9mDTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9272660668;
	Sat, 10 Oct 2026 15:31:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BED0F9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F4D060672
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9mNK-VjIzD6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06A5B6064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791646293;
 b=l2SzTseiF6s5cRMCku/ssygeYm2r7GDPGYEBfjXbMfpfa9oWk/I9m7woAuFlw7veRbib
 2W1yqwVh2eHHV9O24UIE+4WrKMeD+eBJi2lz0UQAlLTdeNslzNYVNz3iFr33SCwKeB0QL
 AUsVFaWg4kmApmTrEJgJ1in04H+Mya3XPh3Bh48mngifRAT1kSAFrI9994ssXLLUfQk/p
 e03dBwxAs9vTVuB5NGZd9l6KUVsgv1m9rgrA8r6ndmRlwNboOXHuUgRyx6a2exqAk0tYc
 6kI2V8Ao9LC893UJONkfPiPbJVxx4g+WI/j6b15gwxKvXyxJbcKpHR7FRnvC7naZOMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791646293;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gBATt6T//3YGEBsa3/rZVy5NV/z4H4PuguauLoiuapQ=;
 b=FdAtD0l/Eg4q5QqRmofNShc4vT3grnxWRgITBH8KpjGSVt3yJxb588q5u8xZUvA+9tF4
 J0k2vxil5WPWowZoyixqAbw3n9fWsG7Rq25N9PkatuNN6/qP1BO//EmHrOPLmy2qOxqHL
 NvZnPiD4Bu3Q8sbRqKxXK+/Zg+BNIIOmBpmNnwyMyRJEZwtxhA259ls4dMwHqeysKNfFc
 BJd6ESXvXMoTzTl4SDgh4racbrpnzk1KvUbDk2XJsGLgAaOl3RS1W2nC4WX/7GOxssCxw
 fr4crmV+zCxuMQj08pfmekeJNOdNcNAXUWZXoDQ4sN1mYT16Fi3CJ0nhVuxmV4vnGEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A5B6064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C41A492286; Sat, 10 Oct 2026 15:30:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:31:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ade0757d7f26314b421719e12e3f51b04d53fb3f
X-Git-Newrev: 5c668c42e2bfff3d71a39d340350ff0d28bd82d2
X-Patchwork-Hint: ignore
Message-Id: <20261010153014.C41A492286@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: drop PKGDIR
 variable for patch step
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c668c42e2bfff3d71a39d340350ff0d28bd82d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This was added in commit 604d261fb0 ("infra: remove variable
FOO_DIR_PREFIX") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_PKGDIR, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f8ffaa21c7..c69bc96237 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
