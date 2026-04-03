Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEEBD73094
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 12:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2811F40DC8;
	Fri,  3 Apr 2026 12:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGRweggEdVT1; Fri,  3 Apr 2026 12:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14FBF40DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775219491;
	bh=vU0AI3oKFM2kY6hHBht25qd6JcJyeWCuqC/zTnWW3Ms=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gl5lAlWm8FvItc7JGmKagFkTHTaIH3Nm1iWpdKqNtCoF8v7AolzrDzo32BYUDQqHP
	 /JQEOzxqU3znGd0ifM7A+ww/wgb8TMAvZHdR2AEYeaQFam6Mko1fJG1NmxfFEtJ8ua
	 dlh+ToRB5JipSYqa5SUd1p4XzE2HM/eBzKb0b7aLN24Yanv9omAXJk/rE/oOMn/D6U
	 XtudNpxcD7vkbuYA+yjx7C8dKIniCeljx8DZYlwbtcJvDpeG3Q+xb3w63Frngfon47
	 Sr5tRFk2Q2uOVSLce1jhO/GY4sFTPAJ0OE/vzOne+982RF3Qv/p2NphCqjqaeu4njc
	 naF25jCs/HPNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14FBF40DBD;
	Fri,  3 Apr 2026 12:31:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 652781F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40372813BA
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvwSmP6KMovA for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 12:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CDB081339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CDB081339
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CDB081339
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:31:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5A8164E428D1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:31:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 318A6603C1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:31:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C01B104500C4; 
 Fri,  3 Apr 2026 14:31:18 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 03 Apr 2026 14:31:18 +0200
Message-Id: <DHJIS9QZJI3W.1YCJAHU33FESO@bootlin.com>
Cc: <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-openscap_bump-v1-1-20f99c3c9429@bootlin.com>
 <ac-pu604QIA40Sf3@windsurf>
In-Reply-To: <ac-pu604QIA40Sf3@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775219479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cFud8PM3Vk2axaGK6172duAOn+jK2LLUpHHcG4AFk7Q=;
 b=ZimGX8mgk4Okk75JItrIEzyO+UA3UNRs/uh5dnR9efIe82yLy3BMSSSc0Iti9msrtkvCJC
 1OUKT3p9j6QD8FYzgHHkDqQvNyQJGJsJ0+CQHn6zegLXzD7WCo0rbwt+NUmkS5IPFcOXYE
 fxzbFpdbNVLYFAeZBjXKUxrU5XW4Gdqb2U21LRNGbYc598Sw+6/GXkgHN2tULZ9ZTUHM62
 7TO8edKN+ZNzvnIk8t5wX0/ZM1WOdV9/MtbF0KrB5r6uHkBVZhIUO0z7YiWjKQuKZ2tpHN
 oGtJie4nV4jDMC5tib7yPeoPHHjkx2BvDHsPxnLiwpg5PmtMAfwLOzf13k1hsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZimGX8mg
Subject: Re: [Buildroot] [PATCH] package/openscap: bump to version 1.4.3
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gRnJpIEFwciAzLCAyMDI2IGF0IDE6NTIgUE0gQ0VTVCwgVGhvbWFz
IFBldGF6em9uaSB3cm90ZToKPiBIZWxsbywKPgo+IE9uIEZyaSwgQXByIDAzLCAyMDI2IGF0IDEx
OjUxOjUyQU0gKzAyMDAsIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPj4gVGhlIGN1c3RvbSBwYXRj
aCB0byBlbmZvcmNlIHByb2plY3QgYXMgQyBwcm9qZWN0IGFzIGJlZW4gbWVyZ2VkIHVwc3RyZWFt
Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
Xl4gaGFzCj4KPiAbW08+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbiBi
L3BhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluCj4+IGluZGV4IDMxNzA1NWM3NTMyNy4uODI3NTkw
NTk4ZTQxIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgo+PiArKysg
Yi9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgo+PiBAQCAtMTAsNyArMTAsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfT1BFTlNDQVAKPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWFNMVAo+PiAg
CXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJYTUxTRUMxCj4+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01V
U0xfRlRTIGlmICFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPj4gLQlzZWxlY3QgQlIyX1BBQ0tB
R0VfUENSRQo+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9QQ1JFMgo+PiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9QQ1JFX1VURgo+Cj4gU2luY2UgeW91J3JlIG5vdyBzZWxlY3RpbmcgUENSRTIsIGl0IG5v
IGxvbmdlciBtYWtlcyBzZW5zZSB0byBzZWxlY3QKPiBCUjJfUEFDS0FHRV9QQ1JFX1VURiwgd2hp
Y2ggaXMgYSBzdWJvcHRpb24gb2YgQlIyX1BBQ0tBR0VfUENSRS4KClRoYW5rcyBmb3IgdGhlIHBy
b21wdCByZXZpZXcuIFRydWUgYW5kIHRydWUsIHdpbGwgYmUgZml4ZWQgb24gdjIuIAoKQWxleGlz
Cgo+IFRoYW5rcyEKPgo+IFRob21hcwoKCgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
