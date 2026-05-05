Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F846FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 18:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A5360AC9;
	Tue,  5 May 2026 18:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5m9pd93id0t; Tue,  5 May 2026 18:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A3660AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778007305;
	bh=tedLc+dBN6vlgPQhVks1o2zD9f8rOkm7mOdyvBqkcPY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ToO/zpdQ/4TgkXOK6mmGotSgKAwK1RuVVHwJ0Bzt34M9TotMr2AIJsRLV0XS4WWk+
	 GBNQwAhl7z/HNmGWksPYpsBbBnXS3zRP7Pfo6esDXn0mEiPJzxmTRs5a84gPqMh+At
	 mAECclgS3T4yCnUUNtZqYAHJ8PIFmTNEI6yGUNzBviNOoHQvjM+ivmSneas/5SLWpc
	 J6BAtVM853yj2jisfBHE2K3ZYZWLTijb1IfuUDToYNJ1K3tPbo17Bg3TBwLcKwk2So
	 ABRLEOGz2kxP/NRmZYvnMf2SKKM3DtbL2oclM1DtQfbY93wCHsAOk8qgikXMhL8Dxm
	 WZS45Ei6Vf72A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A3660AB6;
	Tue,  5 May 2026 18:55:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60D9C315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45C2540B6C
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcMoeoQlVprB for <buildroot@buildroot.org>;
 Tue,  5 May 2026 18:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1F8A40B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F8A40B6B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1F8A40B6B
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:55:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AD2AB13F89C;
 Tue,  5 May 2026 20:54:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 May 2026 20:54:59 +0200
MIME-Version: 1.0
Date: Tue, 05 May 2026 20:54:59 +0200
To: =?UTF-8?Q?Martin_Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260505124607.327055-1-martink@posteo.de>
References: <20260505124607.327055-1-martink@posteo.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <6c5865598ca48c8c69c3a856f96b00e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778007300;
 bh=p3RhoA/RKm0lwGZRwEv+PVwkPr7o6DkZa68HtCgdS1U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UUSG45afpjFh/QdqwBohdJMysb3BHpGLrNcptLcQfGQjHQKVvrDFXuJNiYZp0+pF5
 U2WL4tpar61sokUi29wqOR0gdtZxUnfDDQ6wWpp+g/Zc8IDTlaMAHwguwHjrK2lYsY
 ZSxfRkV5DVzI8hg7nEtRQBRe6rv5WTHq1Th/QsPTEG8gPczKGHpJ1fLsy96lqwk00T
 /hnt2OpDz7jS5MG+ll8HuQ1q1+SdbcBsMTRhNt4hoP9tOGsPB7wNLtaEaLjPDXL8qH
 6HgWrxzGs/kh5zgI0TCbGq74bAJaEDtrwB+dMGkbUS96gtTerftSEW6saqGOUtaJJE
 yK6WFSiXXtjQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UUSG45af
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Martin from x11vnc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDUvMDUvMjAyNiAxNDo0NiwgTWFydGluIEtlcHBsaW5nZXItTm92YWtvdmnEhyB3cm90ZToK
PiBJIGRvbid0IHVzZSBtYWludGFpbiB4MTF2bmMgaW4gYnVpbGRyb290IGFueW1vcmUgYW5kIGNh
bid0IGVhc2lseSB0ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLZXBwbGluZ2VyLU5v
dmFrb3ZpxIcgPG1hcnRpbmtAcG9zdGVvLmRlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
