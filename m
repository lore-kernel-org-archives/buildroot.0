Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFD7845DF;
	Fri, 29 May 2026 18:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wTt7RCGvzlw; Fri, 29 May 2026 18:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 790B2845D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079540;
	bh=9zaGVOcvO2y/wIBfKXePo4HgqIIYF/iIUirMlL6y3iI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=iNKPEurhUk6JnFtjd1Dv4Oq85eU89W9Jw3+LIx9oLNNeLyPPAfGgt2ZBd5DpVhZOg
	 jm+AQsOv+Snh4cf0pdv4MjCgDKL74HTW2qkdaIiGJWCCGW7WFRjfjlQnkYesOp5Ufh
	 KFfOiyKbSP4BUWpdUJcFpCHC63XGSduemzl0ov0Kl3AU8JNStpA913/pxf0i/AalZy
	 b4jKodvZAbUIirT592rs3B938V1lsRHKhVbqm4PMuun6kQJyjHeOalPrJdc2kZ2ilE
	 Ahwf2IBsDU7bPr9v8Oq62BY2pRLyywJZ6kOpRcSwV8xC1KNtGcFmpsPwtr33/PxfYJ
	 vMnOJrKX13eqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 790B2845D4;
	Fri, 29 May 2026 18:32:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7EFED3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D67FE42212
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_OnPASxJ34g for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F07F4404A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07F4404A2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F07F4404A2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BC3FB97C44C; Fri, 29 May 2026 20:32:15 +0200 (CEST)
Message-ID: <62237613-6844-4c5d-8c14-0a8660f654fd@rnout.be>
Date: Fri, 29 May 2026 20:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20260519065710.324849-1-neal.frager@amd.com>
 <194ccb18-9d29-4851-9aeb-55b0cb6eb213@rnout.be>
 <BL1PR12MB50321FD4A2BB80590984A6A2F0162@BL1PR12MB5032.namprd12.prod.outlook.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <BL1PR12MB50321FD4A2BB80590984A6A2F0162@BL1PR12MB5032.namprd12.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780079536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=F4NuUuGAU85rFuPkig2SD0N6Xm7I5zssxDts02ixs9M=;
 b=IgBYiBjWnmEbaUMwKANw0P6o8GG79wrMAtmqRoVxVRM3sPGJjWoy9VecN0YDLP9P9QB3pw
 lP8bwBc72ceZRXZfQ5mIFdE9QJ0Y0MxSHJh1iY5sgAI0WHa8tBZySZ8EefmzLpUgQY+F8h
 NGD+CsCdprHQGKAJddkMBcePY651YwEiSj1DAzVcr5V+l8zgWJ/tqVPVZ2cRiQWsawQ+iN
 JIHdDz7nGFwN1tYmDD+WmIRNqm4OxVzqy3RR7Zvo3w4ZBj6TwFT85Iu8b1HEFZq36/nb0L
 AngKZ2hlfPB62Vxqe/6GybBXhz00Bs3Rp/9FWzgU5dQv9a15W9HgdYdZM6J9Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IgBYiBjW
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wNS8yMDI2IDIwOjI1LCBGcmFnZXIsIE5lYWwgd3JvdGU6Cj4gQU1EIEdlbmVyYWwK
PiAKPiAKPiBIaSBBcm5vdXQsCj4gCj4gID4gQnVtcCBnY2MtYmFyZS1tZXRhbCB0byBnY2MgMTYu
MS4wLgo+ICA+Cj4gID4gU2VlIGhlcmUgZm9yIGNoYW5nZXM6Cj4gID4gaHR0cHM6Ly9nY2MuZ251
Lm9yZy9nY2MtMTYvY2hhbmdlcy5odG1sIDxodHRwczovL2djYy5nbnUub3JnL2djYy0xNi9jaGFu
Z2VzLmh0bWw+Cj4gID4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFn
ZXJAYW1kLmNvbT4KPiAKPiAgPiDCoFdlJ2xsIGhhdmUgdG8gdGFrZSBjYXJlIHdpdGggYXBwbHlp
bmcgdGhpcywgYmVjYXVzZSBJIGp1c3QgYXBwbGllZCBhIGNvbW1pdAo+PiB0aGF0IGludHJvZHVj
ZXMgYSBwYXRjaCBbMV0gdGhhdCBoYXMgdG8gYmUgcmV2ZXJ0ZWQuIEFuZCBJIGNhbid0IGFwcGx5
IHRoaXMKPiAgPiBjb21taXQgdG8gbWFzdGVyIGJlY2F1c2UgaXQgc2hvdWxkIGdvIHRvIG5leHQu
Cj4gCj4gID4gwqBSZWdhcmRzLAo+ICA+IMKgQXJub3V0Cj4gCj4gSSB3aWxsIG1ha2UgdGhpcyBl
YXNpZXIgYnkgbWFraW5nIGEgdjIgdGhhdCByZW1vdmVzIHRoZSBhZGRlZCBwYXRjaAo+IHRoYXQg
aXMgYWxyZWFkeSBpbmNsdWRlZCB3aXRoIGdjYyAxNi4xLjAuCj4gCj4gVGhpcyB3YXksIHlvdSBq
dXN0IG5lZWQgdG8gYXBwbHkgdGhlIHYyIHRvIG5leHQuCgogIEJ1dCB0aGF0IGRvZXNuJ3Qgd29y
ayBiZWNhdXNlIHRoZSBwYXRjaCBpcyBub3QgaW4gbmV4dCA6LSkKCiAgUGV0ZXIgc2hvdWxkIHJl
bGVhc2UgUmVhbCBTb29uIE5vdyBzbyB3ZSdsbCBqdXN0IGFwcGx5IHRoaXMgYWZ0ZXIgdGhlIG1l
cmdlLgoKICBSRWdhcmRzLAogIEFybm91dAoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTmVhbCBGcmFn
ZXIKPiBBTUQKPiAKPiAKPiAKPiAgPiAtLS0KPiAgPsKgwqAgcGFja2FnZS9nY2MtYmFyZS1tZXRh
bC9nY2MtYmFyZS1tZXRhbC5oYXNoIHwgMiArLQo+ICA+wqDCoCBwYWNrYWdlL2djYy1iYXJlLW1l
dGFsL2djYy1iYXJlLW1ldGFsLm1rwqDCoCB8IDIgKy0KPiAgPsKgwqAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gID4KPiAgPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5oYXNoIGIvcGFja2FnZS9nY2Mt
YmFyZS0gCj4gbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaAo+ICA+IGluZGV4IDE5Njc4ZGVjMzAu
LjYxMDQ5NjJhMjIgMTAwNjQ0Cj4gID4gLS0tIGEvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2Mt
YmFyZS1tZXRhbC5oYXNoCj4gID4gKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFy
ZS1tZXRhbC5oYXNoCj4gID4gQEAgLTEsNSArMSw1IEBACj4gID7CoMKgICMgRnJvbSBodHRwczov
L2djYy5nbnUub3JnL3B1Yi9nY2MvcmVsZWFzZXMvZ2NjLTE1LjIuMC9zaGE1MTIuc3VtIDxodHRw
czovLyAKPiBnY2MuZ251Lm9yZy9wdWIvZ2NjL3JlbGVhc2VzL2djYy0xNS4yLjAvc2hhNTEyLnN1
bT4KPiAgPiAtc2hhNTEyICAKPiA4OTA0N2EyZTA3YmQ5ZGEyNjViNTA3YjUxNmVkMzYzNWFkYjE3
NDkxYzdmNGY2N2NmMDkwZjBiZDViM2ZjN2YyZWU2ZTRjYzQwMDhiZWVmN2NhODg0YjZiNzFkZmZl
MmJiNjUyYjIxZjAxYTcwMmUxN2I0NjhjY2EyZDEwYjJkZcKgIGdjYy0xNS4yLjAudGFyLnh6Cj4g
ID4gK3NoYTUxMiAgCj4gYjM0NTQ5NTg4OTFhYjQ3ZTFlNWI2Y2I5Mzk2YzBhZDNiMDRmMzJmZTJh
N2JmMTE1M2ExNDNmMjEwMTNmZGI2YjI5NWNhOTRjOTg5NjQ2OThhNjg4ZTRjMWQ3NTU1ZmZkOGZm
YmMyMDE4NzUwN2NjZTZiMWMzMmNiY2MwOTg5N2HCoCBnY2MtMTYuMS4wLnRhci54ego+ICA+Cj4g
ID7CoMKgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gID7CoMKgIHNoYTI1NsKgIDIzMWY3ZWRjYzcz
NTJkNzczNGE5NmVlZjBiODAzMGY3Nzk4MjY3OGM1MTY4NzZmY2I4MWUyNWIzMmQ2ODU2NGMgIAo+
IENPUFlJTkcKPiAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFy
ZS1tZXRhbC5tayBiL3BhY2thZ2UvZ2NjLWJhcmUtIAo+IG1ldGFsL2djYy1iYXJlLW1ldGFsLm1r
Cj4gID4gaW5kZXggNmMyYzhhNWUyNi4uZDRmMDExYzJmYSAxMDA2NDQKPiAgPiAtLS0gYS9wYWNr
YWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCj4gID4gKysrIGIvcGFja2FnZS9n
Y2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5tawo+ICA+IEBAIC00LDcgKzQsNyBAQAo+ICA+
wqDCoCAjCj4gID4gICAKPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICA+Cj4gID4gLUdDQ19C
QVJFX01FVEFMX1ZFUlNJT04gPSAxNS4yLjAKPiAgPiArR0NDX0JBUkVfTUVUQUxfVkVSU0lPTiA9
IDE2LjEuMAo+ICA+wqDCoCBHQ0NfQkFSRV9NRVRBTF9TSVRFID0gJChCUjJfR05VX01JUlJPUikv
Z2NjL2djYy0kKEdDQ19CQVJFX01FVEFMX1ZFUlNJT04pCj4gID7CoMKgIEdDQ19CQVJFX01FVEFM
X1NPVVJDRSA9IGdjYy0kKEdDQ19CQVJFX01FVEFMX1ZFUlNJT04pLnRhci54ego+ICA+Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
