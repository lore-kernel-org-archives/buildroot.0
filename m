Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AABC5B559
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC1F8201B;
	Tue,  3 Jun 2025 06:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfJ_ObHP8nUI; Tue,  3 Jun 2025 06:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F8B681328
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F8B681328;
	Tue,  3 Jun 2025 06:22:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8FBDA
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94497400B8
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2wrOR5B1dPO for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 06:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABACE41132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABACE41132
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABACE41132
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 06:22:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC3991C140E; Tue,  3 Jun 2025 08:22:00 +0200 (CEST)
Message-ID: <073a3bc3-9cd0-4e18-98e1-f9bee18299cf@rnout.be>
Date: Sat, 31 May 2025 18:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250517143508.A879E82884@busybox.osuosl.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517143508.A879E82884@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748931721; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lomE35cjUjDKv87ve0GxRbjT/6Vv+9tt9vupnRrFkmA=;
 b=P3yu8XLvUyxPA+LoBlBMQNu4DO0EAMn3kQNBsN1TiaY84BLzcRgj5sb/7d6LmSK4dnoChM
 YssReSJnEOOeO4E074gB1r37yQfTipgmkoNrQQavP9uvRJmZFupthiCojOnmyWC0mEH8Pk
 8kMM8Jdm6VEr4hNQobTp+u8q50Hu3jMENwfneMNyp1M3EzIC2mt7Ojsin8g2tlxNFJzFo7
 R7pANLD7q6P+kd5Haas8nHsRQd9LiDot0XwomRkusIftjjp/sHzFpG3d1o4qguQ7fUtJ+9
 7ycz5fmtMb6M8jQcRtcC9qXL45jXSkGeGG5FJfFYgBCCJ/SoSm32xjmZM9nuFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=P3yu8XLv
Subject: Re: [Buildroot] [git commit] package/rpm: fix build issue with musl
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8wNS8yMDI1IDE2OjM0LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gY29tbWl0OiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQv
P2lkPTc0NWFhNGQwNjA2N2NhM2Y2YWM2ZjkwZWM5OTViNTdjNzA0YzUzNmEKPiBicmFuY2g6IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9cmVmcy9oZWFkcy9t
YXN0ZXIKPiAKPiBTaW5jZSB0aGUgYnVtcCBvZiBycG0gZnJvbSA0LjE3LjAgdG8gNC4xOC4wIGlu
IEJ1aWxkcm9vdCBjb21taXQKPiA0YjQwNDZlOTE5Yjk5YzYxYjU0NTM5NjE0OWJmMWRjYmNmN2U5
ZTQxLCB0b29scy9ycG11bmNvbXByZXNzLmMgdXNlcwo+IGJhc2VuYW1lKCkgd2l0aG91dCBpbmNs
dWRpbmcgPGxpYmdlbi5oPiB3aGljaCBjYXVzZXMgYSBidWlsZCBmYWlsdXJlCj4gd2l0aCB0aGUg
bXVzbCBDIGxpYnJhcnk6Cj4gCj4gdG9vbHMvcnBtdW5jb21wcmVzcy5jOiBJbiBmdW5jdGlvbiDi
gJhkb1VudGFy4oCZOgo+IHRvb2xzL3JwbXVuY29tcHJlc3MuYzoxMDA6MzA6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhiYXNlbmFtZeKAmSBbLVdpbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgICAxMDAgfCAgICAgICAgICAgICBjb25zdCBjaGFyICpi
biA9IGJhc2VuYW1lKGZuKTsKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+Cj4gdG9vbHMvcnBtdW5jb21wcmVzcy5jOjEwMDozMDogZXJyb3I6IGluaXRpYWxp
emF0aW9uIG9mIOKAmGNvbnN0IGNoYXIgKuKAmSBmcm9tIOKAmGludOKAmSBtYWtlcyBwb2ludGVy
IGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KPiBtYWtlWzRd
OiAqKiogW01ha2VmaWxlOjEwODI6IHRvb2xzL3JwbXVuY29tcHJlc3Mub10gRXJyb3IgMQo+IAo+
IFRoaXMgaXNzdWUgd2FzIG5vdCBmb3VuZCBieSB0aGUgYXV0b2J1aWxkZXJzLCBidXQgaXQgY2Fu
IGJlIHJlcHJvZHVjZWQKPiB3aXRoOgo+IAo+IEJSMl9hcm09eQo+IEJSMl9jb3J0ZXhfYTk9eQo+
IEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RM
SU5fQVJNVjdfRUFCSUhGX01VU0xfQkxFRURJTkdfRURHRT15Cj4gQlIyX1BBQ0tBR0VfTFVBPXkK
PiBCUjJfUEFDS0FHRV9SUE09eQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0
aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgLi4uMDAzLUZpeC1taXNzaW5n
LWJhc2VuYW1lLWluY2x1ZGUtb24tbWFjT1MucGF0Y2ggfCAyNiArKysrKysrKysrKysrKysrKysr
KysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3JwbS8wMDAzLUZpeC1taXNzaW5nLWJhc2VuYW1lLWluY2x1ZGUtb24tbWFjT1Mu
cGF0Y2ggYi9wYWNrYWdlL3JwbS8wMDAzLUZpeC1taXNzaW5nLWJhc2VuYW1lLWluY2x1ZGUtb24t
bWFjT1MucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmVj
OTIwNjEyZTIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ycG0vMDAwMy1GaXgtbWlz
c2luZy1iYXNlbmFtZS1pbmNsdWRlLW9uLW1hY09TLnBhdGNoCj4gQEAgLTAsMCArMSwyNiBAQAo+
ICtGcm9tIGY1MTA3NzBhMjE0YmQyZTgxNDRhMzk4NjhjMzRjZDU2ODE3OTU5OWUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gK0Zyb206IENhbHZpbiBCdWNrbGV5IDxjYWx2aW5AY21wY3QuaW5m
bz4KPiArRGF0ZTogVHVlLCAxMSBKdWwgMjAyMyAxOToyMjo0MSAtMDMwMAo+ICtTdWJqZWN0OiBb
UEFUQ0hdIEZpeCBtaXNzaW5nIGJhc2VuYW1lIGluY2x1ZGUgb24gbWFjT1MKPiArCj4gK1Vwc3Ry
ZWFtOiBiMmU2NzY0MmZkOGNiNjRkOGNiMWNjYTllNzU5Mzk2YzFjMTA4MDdkCj4gK1NpZ25lZC1v
ZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4g
Ky0tLQo+ICsgdG9vbHMvcnBtdW5jb21wcmVzcy5jIHwgMSArCj4gKyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiArCj4gK2RpZmYgLS1naXQgYS90b29scy9ycG11bmNvbXByZXNzLmMg
Yi90b29scy9ycG11bmNvbXByZXNzLmMKPiAraW5kZXggYmQ0MTQ2ZDU0Li41OGRkZjU2ODMgMTAw
NjQ0Cj4gKy0tLSBhL3Rvb2xzL3JwbXVuY29tcHJlc3MuYwo+ICsrKysgYi90b29scy9ycG11bmNv
bXByZXNzLmMKPiArQEAgLTEsNiArMSw3IEBACj4gKyAjaW5jbHVkZSAic3lzdGVtLmgiCj4gKwo+
ICsgI2luY2x1ZGUgPHBvcHQuaD4KPiArKyNpbmNsdWRlIDxsaWJnZW4uaD4KPiArICNpbmNsdWRl
IDxlcnJuby5oPgo+ICsgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gKyAjaW5jbHVkZSA8c3RyaW5nLmg+
Cj4gKy0tCj4gKzIuNDkuMAo+ICsKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
