Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A63106F2F3
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 08:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C070740AFA;
	Thu, 26 Mar 2026 08:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCQ8CL1OGZtw; Thu, 26 Mar 2026 08:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955E740990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774512801;
	bh=SjjFsVCPUQXRnt4J2gwo4BkNR/RmPD+b1PNm4HS5C3c=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFAbkRqtyy+r3Gp2zA++P/Tutyj9GGzGDvqx4F92J0qT+FLRjN4ldx8m48qjIQ1Kc
	 jnHnXoay2ObtHrFpNqLOB2EBXtRBntQ1J0Xo/ijzI9LDKTLy5d1RfvVYx4C58UGyyQ
	 6B0+SeiW3S3YLAXm9v3cNAA8E0M9tFO1TCfgCV3HXZQ6s7LyEKIbFaHRNrBq3LAQ+7
	 iC+SreiISzAnSRZ5gN3XTRK27quAcUiWg4cX0JAl03pinhXBeTFxyEWwkHuL8k8hun
	 wdl2LiYXKD9hzkbNWSPfJgVsKQian0OOLm/H+Pq7lPUjHmyWPgtY58PMqgerbPOnsJ
	 3IRTwGSfhCRSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955E740990;
	Thu, 26 Mar 2026 08:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 218F0F5
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0728B8113C
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLrhqFjSCW1V for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 08:13:20 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43B8E81285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43B8E81285
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43B8E81285
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 08:13:17 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id AB5B3BDE0352;
 Thu, 26 Mar 2026 09:13:13 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 08:13:13 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <CABvxksxxG=fLhCYZBO3d0q5nuQNntY86_FPsLGpsnoguCT0-Yg@mail.gmail.com>
References: <dbd49ae98de7302e5a0cf5394e8c9b05@umbiko.net>
 <20260304065424.10023-1-chakrabortyshubham66@gmail.com>
 <CABvxkswzcvL4HRpjQzy9nHO8_TJBzSfO2L-hwqrRadMSfSmwiQ@mail.gmail.com>
 <CABvxksxxG=fLhCYZBO3d0q5nuQNntY86_FPsLGpsnoguCT0-Yg@mail.gmail.com>
Message-ID: <4bf2b1929396571923b5401f1b2fe608@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1774512793; bh=2OVpic5TjFZIdlHE/8XUwRkEy46azPLpn69roigdWiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JZo3XT2mfaIcNEj170MKC1YxTf25FUAvFroYma1y/U65TnMKwa3W8Cf3RgzmhKtj3
 sNP4sSnZ5iF+4uzpL816nEmb8zMtPOzh2RdDwHGpMzqXerKeR8ODh6EUS0oLm3rCd8
 Bz1o57K1WMWKHj8+1Pqqx4Afp0ocCfwBUfCDgyng=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=JZo3XT2m
Subject: Re: [Buildroot] [PATCH v2] package/icu: fix static linking with
 icu-uc for musl static toolchains
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2h1YmhhbSwKCk9uIDIwMjYtMDMtMjYgMDc6MDEsIFNodWJoYW0gQ2hha3JhYm9ydHkgd3Jv
dGU6Cj4gSGkgQW5kcmVhcywKPiAKPiBSb21haW4gZG9lc27igJl0IHNlZW0gdG8gYmUgYWN0aXZl
LCBzbyBJ4oCZZCBsaWtlIHlvdXIgZ3VpZGFuY2Ugb24gaG93IHRvCj4gcHJvY2VlZC4KPiAKPiBG
b3IgdjMsIHdvdWxkIHlvdSBwcmVmZXIgdGhhdCBJOgo+IAo+ICAgIDEuIHJlZ2VuZXJhdGUgYSBz
aW5nbGUgY29tYmluZWQgcGF0Y2ggKHJlcGxhY2luZyAwMDAzIGFuZCAwMDA0KSAKPiB1c2luZwo+
ICAgIGdpdCBmb3JtYXQtcGF0Y2gsIG9yCj4gICAgMi4ga2VlcCAwMDAzIGFuZCB1cGRhdGUgaXQg
YnkgZWRpdGluZyB0aGUgZXhpc3RpbmcgcGF0Y2ggdG8gaW5jbHVkZSAKPiBteQo+ICAgIGNoYW5n
ZXM/Cj4gCj4gQWxzbywgaW4gdGhpcyBjYXNlLCBzaG91bGQgSSBrZWVwIG9ubHkgbXkgU2lnbmVk
LW9mZi1ieSwgb3IgcmV0YWluIAo+IFJvbWFpbuKAmXMKPiBhdHRyaWJ1dGlvbiBpbiBzb21lIGZv
cm0/Cj4gCgpXaGF0IEkgd291bGQgZG8gaXMgdGhpczogQWRkIGEgY29tbWVudCBiZWxvdyB0aGUg
bGFzdCBTaWduZWQtb2ZmLWJ5LCBhZGQgCnlvdXIgU2lnbmVkLW9mZi1ieSwgYW5kIHRoZW4gbW9k
aWZ5IHRoZSBwYXRjaCBpdHNlbGYgYWNjb3JkaW5nbHkuCgo8ZXhhbXBsZT4KCkFkZCAtbHN0ZGMr
KyBpbiBMaWJzLnByaXZhdGUgb2YgaWN1LXVjLnBjLgoKRml4ZXM6Cmh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzLzIxMC8yMTA3ZjlkZmIzOWVlYjY1NTlmYjQyNzFjN2FmOGIz
OWFlZjUyMWNhLwoKU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAb3Bl
bndpZGUuZnI+Ci0tLQpUaGlzIHBhdGNoIGN1cnJlbnRseSBhZGRyZXNzZXMgbGlua2luZyBhZ2Fp
bnN0IHN0ZGMrKyBmb3Igc2hhcmVkLWxpYnJhcnkgCmJ1aWxkcy4gQWRkIC1sc3RkYysrIHRvIHRo
ZSBzdGF0aWMgYnVpbGQgZmxhZ3MgYWxzbywgdG8gZml4ICd1bmRlZmluZWQgCnJlZmVyZW5jZScg
ZXJyb3JzIHdoZW4gbGlua2luZyBwcm9ncmFtcyBsaWtlIHhtbGNhdGFsb2cgKGxpYnhtbDIpCndp
dGggbXVzbCBzdGF0aWMgdG9vbGNoYWlucy4KClVwc3RyZWFtOiBJbmFjdGl2ZS1VcHN0cmVhbSBb
QnVpbGRyb290IHNwZWNpZmljXQpTaWduZWQtb2ZmLWJ5OiBTaHViaGFtIENoYWtyYWJvcnR5IDxj
aGFrcmFib3J0eXNodWJoYW02NkBnbWFpbC5jb20+Ci0tLQogIHNvdXJjZS9NYWtlZmlsZS5pbiB8
IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLWdpdCBpY3Uub3JpZy9zb3VyY2UvTWFrZWZpbGUuaW4gaWN1L3NvdXJjZS9NYWtlZmlsZS5p
bgoKPC9leGFtcGxlPgoKPiBUaGFua3MgZm9yIHlvdXIgZ3VpZGFuY2UuCj4gCj4gQmVzdCByZWdh
cmRzLAo+IFNodWJoYW0KCjxjdXQ+CgpLaW5kIHJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
