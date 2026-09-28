Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D68CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC8360607;
	Mon, 28 Sep 2026 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf44yGyRWWPd; Mon, 28 Sep 2026 21:22:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD13960625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630532;
	b=or29u93Ka6Q+X7ZR1xm0whLQ6ODfvQ4AVtOG3qjgI3KyTlpH32zLtx/r3TC0fSlSJBKk
	 dOQEd83A+2TPAux/uNqu2m0YjbFxyYGoNoLH6AmfD+czyc84KuF5YUhKACH3QjS5/IX5i
	 5ox8KwcVLrABvmDUV0oy0SPd3Wyd3YOQWK65awJ1tJ0NnvS7UJAiefl9OIrJ2/oOVyYY5
	 HOcvQZHSoPOSeU+V4kBZ6ZQyo4VZIhqxUoWDAwHa45xnP/Y3AwQjXWF2HNUGjS7tRWV3P
	 0krM6uZZOARwGBzRB8sqT2Fp99VO5iCiJhmkocCObQGopRRONOuQeooWIh3mqrhNVNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630532;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BknDru2OGrDjJcauOpl0BHZSP4YU46TLujNqlnnN0EE=;
	b=CoxKxVvoCOtMG8rbCNJe2Ocui+zUJqQFDI5r08W6kb6uzfy6svvSSXMq8Eyx+KJzYfme
	 pn1wRQ2T05cSZv/zCwtxqm7lXF4GwrZy8ePwqVm1RgiDG71B36jOoBNwZWqcYZgvj939a
	 Rjpr/oI9k9fxW09lmFfTWWMgyqx5XwB2pLX+4VZYW9ltm7nlRp4U1aGh0pjbGD8p5WqQo
	 u6y5H9e7mXClKd8E79sXSO/cY7J50PJQr3Uelj58ERGBQyw4hzh1fLpv1t/prfkNafkLm
	 YUCOPtOtF5q2BET/48fh0tE/Qz3mCQzlqNN6zg61Wh94982TiA8uCpvyGK75B9YAmHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630532;
	bh=BknDru2OGrDjJcauOpl0BHZSP4YU46TLujNqlnnN0EE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V+O9rNfncLOfAASWm1GF6tyrxgV5Co6lRPX8evA3p3PkuFQTJEpefhpxRFiMwhaE2
	 dae/gGW9koo7r/bBjMGJ0MPfK1CDCbF1hty1lt933DkMgkPoZ5HmZr2jqSw4MlYzLf
	 MIb7I4bnTbg/HfEN0Ee6mc1ZpHi2wGC/NskJdKkJcstSLL5QB+kN66x5FR1l9hkSDW
	 Hqk6EVCSBwBVoDunoiXzAwiQL5+o3m4M04mxb1pPJkzMt9RsDMYTMH9cGb3DdQTzuq
	 xuFzvg40kYuhkgGZgf52X0z6YZ4UBXv/SYoavir3WxJY4WnCFu0m/quLz3WIiqcvNh
	 Cd8DpNN3bUcpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD13960625;
	Mon, 28 Sep 2026 21:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6A93D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CDF960625
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epSlYIfbs2wH for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:22:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E35CE60607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630529;
 b=OJKW9u6kfLGDXWoloOWVCVJ+66lG5T7yFRfghhhpM81oJ9k/2RkBKKFeVH43ZZSZrHUY
 5P+5nigyAbgio3a+0BR+1hEhtdAFIf6+UXFK9NpfEmZF0xlWY9bFN/OpOkezcadIlTo7j
 q97cpUQbvUa6hV/BARY0XjdkC86auhX93h5l3bc6QSxBgjjcpU0h3iSiG/XF6juHsplJj
 wwJwAqmxzXaFPSbW8Q1xafmxZxIUSli3LeluooKHJlV61VBiJhlf8Za8KqE7gv+/jN1J0
 oShxIdDdD5nw8Bz78VuA5ie0tcNi1Osx26pcC3zSv4zQweCUU80fb2YsOX0SUjgsjDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630529;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tj2z6sqwTiVthvyTrQxgYPntLXc4idebfkkEmw0v1Ms=;
 b=dhEjWCehG3pGcWGml3dnoCDw5w/UexRkoFXngUnz/8pUW1JxJjbgJk/aDzQIeTxT8QMW
 nDu2Tt6bWEaHJz/1zqLm5I8MIQMVEQSsfUiI6uBabNmvtgxEoLD4fGJESyXA2s2lRajZL
 zWszrXpn+GjXBmSGOhurY1WhS/Dic7ucC6svml41X+jzHTEwmRVjzQbPPM7p4/PEcRVoi
 7ItXJChBp56v6asEPg2tMREl/o14A7KY/uauGY0PUcg4BwAmJI6C9mv686RrNekdGZ4hH
 du5NSpih6dFvQFYzQ5MuqbuTS9ROZwlikrNSqonF+qerWS0x4xoLAIC9U5MSCwkdRTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E35CE60607
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:22:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79890983F5; Mon, 28 Sep 2026 21:20:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:21:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2b5b7371b4ae5460bbaf0ca8c2cfb523f865556
X-Git-Newrev: af7fca093e3a0e6e9cd2061f3023f86e4bfaabf8
X-Patchwork-Hint: ignore
Message-Id: <20260928212057.79890983F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atf: bump to version 0.26
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af7fca093e3a0e6e9cd2061f3023f86e4bfaabf8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/freebsd/atf/releases/tag/atf-0.26

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atf/atf.hash | 2 +-
 package/atf/atf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atf/atf.hash b/package/atf/atf.hash
index f979b8b052..ac6fbcd3b1 100644
--- a/package/atf/atf.hash
+++ b/package/atf/atf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a52be96b5565733e71df8d0ecc8a4255a495e45183de7e3657491e0a8069423f  atf-0.25.tar.gz
+sha256  bae70930bef565faacb95b10e5673601df0d7f25db720cc735060d115c92ee73  atf-0.26.tar.gz
 sha256  2a15172ddf6386297734c9800c899e6e8dc16c5a03931dcf95a9ab321a24cfe4  COPYING
diff --git a/package/atf/atf.mk b/package/atf/atf.mk
index a49d32692d..8db1f92d59 100644
--- a/package/atf/atf.mk
+++ b/package/atf/atf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATF_VERSION = 0.25
+ATF_VERSION = 0.26
 ATF_SITE = https://github.com/freebsd/atf/releases/download/atf-$(ATF_VERSION)
 ATF_INSTALL_STAGING = YES
 ATF_LICENSE = BSD-2-Clause, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
