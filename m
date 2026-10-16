Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B3CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DEBB60B36;
	Fri, 16 Oct 2026 13:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Pwghw76gfLp; Fri, 16 Oct 2026 13:10:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3E19D60F08
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156205;
	b=SGuSHtiRcQvkyq3Z40ZjkYcMJwS30fueAnfe0R7e3FWqhihMeIA1/Jsa5zkCD0xSO8jj
	 z6geXtbTSciyn62ZGSSf0OrC63Km8Qiyumwi0O5HWcF68JC7mbewAc/zrmNfYiPaVEDtg
	 OOyN5hFA6MYkPgqM6z+uRrw/PU2wMkOYxAJVg8Fatnz4bs9RwaCD1RIh89sMLtl6XSb9W
	 K/eZTBg2pRNQFPC4KGN5UlV4du5A1gcjhYt90G3cDpLdJCpCrvJMOSP7mi4NxR6XdNxrJ
	 q6hcE+SaE22wqVE7U/Lt4dFiVYxVKPJetW23sOf8RCoK1ckO8Pz38fjfADJ3N08dVXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=eTNdL/aoYeNMsZAV9cSe9Ro+vTtTq+r/XLzCzxYc8vo=;
	b=hZCTL9mC8pCR81o6SWpAWzJSFyHhlaxFBFrReT2Nk7s+okjI7iBFN7OIQl1H66B0iz04
	 H4ooHstk3KtmZhjU1j5rQVaMEZZjyu/igAWhd96ESEO7tZ49mWKIUB0svW1yuGgOh996L
	 3jSMComDtkJTLX5xHcVLIVtZVF4yu1kvClfXMqfNO2/uFf0CCswMkqa7muIJI6Df7nAB6
	 yslbEQEeAtd34CMqEUuqGPOHSb/PdVG/km7osmjFImM6Sc6kvFqT8/RqW95v/LiVSyazh
	 ztkC7w5GuVMbT2kjGdAahUMzVlm94HhVgW6aSdvzwu9CDEY1eAbFG9hVEssBv49mSwg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156205;
	bh=eTNdL/aoYeNMsZAV9cSe9Ro+vTtTq+r/XLzCzxYc8vo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gQSa3QUDkBQt8QLYvyDb20YsfIw6GAV/ZmFuySHe4gkL9qIZ9E7nMgrbiJ4e5B1YX
	 NeTP9x9YdTLAhGOMA1eljIINrT4crj0K8S2kPvvt4SGkXIh8SaV9p2hVofQnnb0l/7
	 4WnV1G4FKDlFQj2w+3DbRcOOdD3nujht4AP9Rflnp5jYPNrxqa4x4gLUFQKcZL4Xg/
	 3MhJILsm0VAWRqQkMYyhLraEVOojiLmyNrDCw9dR8O6spXii1ohAWSHF7/XN0FlTpC
	 pccNwioaLbSYC6BnkJ/tp+K35LnijScySp0OXFC5YI/RhuJ4JUyaLMHVcvb/yk9YZ7
	 26WmR+gPGEZVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E19D60F08;
	Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B7F1EE3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A6D814D6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3YoTjDq5OeZ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31C5C814AB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=hSF781A6FqX2lge8zebUXW/mfVBNE1P9yoCFkbYsmjmyR3jRPLo8BzparWtl5BO//Yqm
 4IsUhVgydBFC0krARZEPl+MVNdNLjNMlvmFuiHHSNqhJF6f/RHwJzhOjj+YYh5bFHwL5c
 pZ30UeZwm9lMEc8PLw8ptHfakrKs7IcBhUPhqXNQ8/1/miY4B5VAXbCo0OKPbhGZSulQK
 op9hAG0jCRyTgU1ib+9qpFqydY6ichiYYi5bDXWyiPwPZAdXBFnn2KipEY6pmKI0bZ7xc
 I8PbTBj6X3QYqQPUyOfanKkL1x3p36xBfdLTjWNF5l0F8TbMtx4Tjd37tffKb344r/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IH1bXxiyni8gBN3Pvi3nP754c+z/wh6J2oLXIvIC9n0=;
 b=CkJPTYcQvGlAdUPtY3ZWFtD+jaHDuwbi3+/2MTngBOTMQ2obpDcsq1s1PEBfcDmV5Hk2
 egqGyVL7ZKzc4tYTnubp/Dk8Za3aOdVDrjGacPUhMrTMTYPPt2aDi1P2UxVn7HjzbdUrb
 IP0PrLoWbr7bgrvVkeYoDrxr0XsJuC/Yn8w5I08/ye0wD1ZnbYyA9qsBoxvWh+6z9M/rn
 lRvFRwPZlMJVNQhgptiuQUB2D8w4gnASodRe6WB0pplOpvlPbGw9An0BuZ1xxwMMvwdF1
 vCSE3F9dLLnBxLufVSIS7ikq6htzcv0SKfM1jmjDeXzjbRxidorrgQAjEr3frtnjnBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C5C814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22D0E960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 12d1ac304ff5703f2f3d97dd0b1de3fdd0a85b42
X-Git-Newrev: e554e3378573667b03193e712c2bee89fa5e9c94
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.22D0E960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-generic.mk:
 drop PKGDIR variable for patch step
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
Content-Type: multipart/mixed; boundary="===============3457914255220644520=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3457914255220644520==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e554e3378573667b03193e712c2bee89fa5e9c94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This was added in commit 604d261fb0 ("infra: remove variable
FOO_DIR_PREFIX") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_PKGDIR, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c668c42e2bfff3d71a39d340350ff0d28bd82d2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ab47721e66..57514bc415 100644
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

--===============3457914255220644520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3457914255220644520==--
