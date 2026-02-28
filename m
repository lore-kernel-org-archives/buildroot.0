Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ABBFEE4E8
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 10:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C5583D11;
	Sat, 28 Feb 2026 10:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQ5y8awGl1Gg; Sat, 28 Feb 2026 10:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E8C083D0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772273422;
	bh=kiiB43JMKtw3QQ+gw3xkufqHr0/2ROeIaVOhSKahnSU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nIXSJPZEwcQm+PVu5YwMfUr66PAH3/grlFWV+RZjQquQ0eeJ7t12C7zkCP/pjXeHo
	 BaSM0HOpxUA5wtCqff27LgFwcpdkuWfcpXHahrRI+WXrciQ22IVH1Fs23u2EPu3VW1
	 ux+s+aqFzvdb2jSSDZ4r1ROgKCpIYOGRrt029ibwHa8MmblMQS9MEo2IBaHI8jYzaP
	 z9QWHrfvLYnmhcNbJAH+7mL7aSmdimw+rdQykgBOVRsQh1Z4LkHEDiv2sei3hJ18cZ
	 M458RIfZQ4+VqKUEzSeikpPjkzIbBa3nkAYcHs1dhd5TIBuJs78Zr9fSMdmvgzTc8i
	 fzwDgo9vwDY2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8C083D0D;
	Sat, 28 Feb 2026 10:10:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC6E824E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9234A40177
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNGKiijAKrJo for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 10:10:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2AE340018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2AE340018
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2AE340018
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:10:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 78BF760136;
 Sat, 28 Feb 2026 11:10:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 11:10:15 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 11:10:15 +0100
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260228090327.1810619-1-lazzer@gmail.com>
References: <20260228090327.1810619-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <131f184ad43b2b4da21599e7c28e56b5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772273416;
 bh=nNP4+0TaQ0mTWUAqmESwBMkmoy7rHyW/3/6m2218fUw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Oid2ljkhb8OrCqzL0gpANHaYkFfYG1XvIl3oqbJRIUk3+X9N++rwCd7XGb9BUkl2p
 Epz+3CDEpEwZiCRvpoIrn95Cq5meXJZ8aJVjtRo695qawQCT3FXqHQFDrtxUIcSCNm
 hde5GE07qSOgbm6aj9/I18fCEBGo4TVJMGNqCnWIOGZXUxgTo2r+6HRGUUdn/pBTGR
 QqulsvIB5aqst2Qe6DwfpNZ5l+W/QjfwC8unQw5KvLZO2GsuWQLP3clNjHHq3w0iu5
 TcOf1cs9/WeViQExqmHCQ1eclrLz0oCjImIPAo/sF1oUgEo5Alltoq3dhaCujG5Nk2
 HhkjWSXa/K2gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Oid2ljkh
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: Security bump to 0.11.4
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

T24gMjgvMDIvMjAyNiAxMDowMywgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gQ1ZFLTIwMjUt
MTQ4MjE6IGxpYnNzaCBsb2FkcyBjb25maWd1cmF0aW9uIGZpbGVzIGZyb20gdGhlIEM6XGV0YyAK
PiBkaXJlY3RvcnkKPiBvbiBXaW5kb3dzCj4gQ1ZFLTIwMjYtMDk2NDogU0NQIFByb3RvY29sIFBh
dGggVHJhdmVyc2FsIGluIHNzaF9zY3BfcHVsbF9yZXF1ZXN0KCkKPiBDVkUtMjAyNi0wOTY1OiBQ
b3NzaWJsZSBEZW5pYWwgb2YgU2VydmljZSB3aGVuIHBhcnNpbmcgdW5leHBlY3RlZAo+IGNvbmZp
Z3VyYXRpb24gZmlsZXMKPiBDVkUtMjAyNi0wOTY2OiBCdWZmZXIgdW5kZXJmbG93IGluIHNzaF9n
ZXRfaGV4YSgpIG9uIGludmFsaWQgaW5wdXQKPiBDVkUtMjAyNi0wOTY3OiBTcGVjaWFsbHkgY3Jh
ZnRlZCBwYXR0ZXJucyBjb3VsZCBjYXVzZSBEb1MKPiBDVkUtMjAyNi0wOTY4OiBPT0IgUmVhZCBp
biBzZnRwX3BhcnNlX2xvbmduYW1lKCkKPiBsaWJzc2gtMjAyNi1zZnRwLWV4dGVuc2lvbnM6IFJl
YWQgYnVmZmVyIG92ZXJydW4gd2hlbiBoYW5kbGluZyBTRlRQCj4gZXh0ZW5zaW9ucwo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4gRm9yIGluZm8sIEkgZml4ZWQgdGhlIHNpZ25hdHVyZSBsaW5r
CmluIHRoZSBoYXNoIGZpbGUuIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vY29tbWl0L2Y1NGU3ZDcxMGM2ZGQ3ZDQ2NzAyMzA0ZWM4ZDdlYTllN2E4MjUy
ZWMKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
