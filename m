Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CFACCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8410661087;
	Fri, 16 Oct 2026 13:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhObZT8BsTl0; Fri, 16 Oct 2026 13:11:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7449261093
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156271;
	b=PlvkbmXSirzH9ZVJszo1O19cYXAas1SVt1+7rSt5A4ovYwuy7qlb2hn4us7XKPKcmpJu
	 fTlUgWYy6ZBvALgOsFnseTAr1kTJo4jaxdJum2BhAcMqb6ELlmgzYOyUjRctZ6Drk8PTG
	 wm7D4H+RyFqOgI0JJzccPM7aB2te4nCCsYyrPewoqB4+lrHlVpu5WQpQclQKdNYh5yeXQ
	 K2WJ3QOxVB5tFzJpQ9C9uMDC2yQS8VmE4vGBWICg/j1bMrAZ4/1yrFwLHxK4ITRLOhwgn
	 /y3BsUAnIx13gbNDGmrBr8Bvr3PdYPpPazcSjZMNSMRsK0MLBQPUlHFoDF52F3b/47w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5FdBWjSka07GT6LufoNnnRysAhoplaByNob73VQjp5Y=;
	b=lDGc1HWhwUCvdwDHECth2SERYMid3znnK2x++0QY3bATOJWGxslGF7qLHzwXawLYxLEF
	 GHsYEUifg6Daj1uJ+NoJlhUTLM/YU8OJS8rVbSdyBpk7BDvC38a4xaN3yd0lTiMod5ttO
	 vnb9SY4sh/JL2yrtJpLxOh053ohop1HvX9lqwdO9PnbUZ/yDLKx8EzJty2CnYhuG6yizJ
	 rqts/U0EHXCCRarlHEVXrAymHDhBaAfh68YMB/hYF8I1cEeLrXRdBLcY2TdmW8xdsUoml
	 A67K0jt1aEkmBbRL0Aug+Dvp7qxO/OjtlfXVg66ZGM0WRqkV583b2TXNajiH6bS0VXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156271;
	bh=5FdBWjSka07GT6LufoNnnRysAhoplaByNob73VQjp5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sf/vh/d2C+5gR9pA8D7q8BQbz+husc+K+mB5E3fLx7qd8rjtX6fWoKaTk2+4KLhG+
	 OMu9lzz+GWCOpt2vxy49iF8IXgHxl9BEjzaDlRhCeqx6SbRQdapPMN1U6j5xuClEfo
	 c6hZOUSp27x+xzuPqy28e6AlDU1SAuwaAmNDGzmOXOAyGzYJn24WDkgCkHDchRbGYu
	 ws94lyn65VQHPItsmf2PujblaAVAPeqUFkN+KZZJG17MM10cckvNdUXXZdfWc13NgX
	 5lFg0m2knni7erWzDBzZ0yBA8Nw7tBsXUVyKqcAXu4my49dmiE5WP+3kBiz8RV2+b3
	 77cR6CZeRJxmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7449261093;
	Fri, 16 Oct 2026 13:11:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EC1255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B055409F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQYT_d4TFZJv for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0982F40A0B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=lPXMGuoHY14jl6cx0WhaI/P0zA0sgzixyL6LXyMWTgz+2DNL+/m404h5AhleGsbtP0Vw
 2bsml4ujLV5o1czIxe9jIoH5zZSnCoTvF1xgSmKFg6c7sTkW9RrmG5RwBukT8xXN26tfP
 jYSOnrZvPxHcDLRyawGyDgSuegS5h3C2y6AjgLB6MrIXXsLXTa2JZxTrv9puAYUxcXpv5
 ecVBQijzjwDOXimBuIXyEa1K2puctJVfci+xh8fPfcykLmMolvJvcGXdWC9yfYvRKg8nh
 pC3jr1/Ex+pbAiHxF2BDYW5lEuG+OMMlEdTwTca8CMLNdXES/TashmwB/68qqVOF74A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qK4RJQeoHQyhDNbwHaw70JhGt84VLfFkK7V2FpIMnEk=;
 b=qN1RdSM4v6qXlezuCrPeNoY/7GKRM1Q85EjABoFdkGnNwd+7eqmtVjrLH1EoJs2alQAk
 ZBR+7MybSuIzfoYDlXTxFmpJqxNdXfHx8L9bOHZkg2/Jzg4/YpWz53x6Cv/XwViJlioTX
 J8vdOonLHVC+xPa7BjpyY8NgUpIo28ZeHOVcP3Hl2sfFVempK1QTIeFsYng/NX3mkiSqd
 ApTowBD/1IoxQ9cPbMUoifkzEg9QPJH8v9HL8dBCCW//uE3oGJGXbYlajZkwDA/MkJ5z7
 F/+cgyYwMkj6xB+BIdq0/TGpe+VTz/oAA6NztSb78OqN6oIBGwBNKuECLkFfzwdI9/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0982F40A0B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE84960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 053d80d4887ca20fdba3f87d24358495eda8bb16
X-Git-Newrev: e3f30e19caf112c3afd90cd46a93580fea487a4c
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.EEE84960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/seatd: add CPE
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
Content-Type: multipart/mixed; boundary="===============4760519743938112784=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4760519743938112784==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3f30e19caf112c3afd90cd46a93580fea487a4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:seatd_project:seatd:0.9.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2021-41387

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 763dcabf6d09605da81515562162ce7c595e85fd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/seatd/seatd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 69be691cf6..c317d50016 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -10,6 +10,7 @@ SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
 SEATD_LICENSE_FILES = LICENSE
 SEATD_INSTALL_STAGING = YES
+SEATD_CPE_ID_VALID = YES
 
 SEATD_CONF_OPTS += \
 	-Dman-pages=disabled \

--===============4760519743938112784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4760519743938112784==--
