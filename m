Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED81ACCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD583841AB;
	Wed, 25 Sep 2024 17:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeVZDRboSu-L; Wed, 25 Sep 2024 17:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E4C8436C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E4C8436C;
	Wed, 25 Sep 2024 17:39:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 448041BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33B118436C
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qg4V3vvFLyKu for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00794841AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00794841AB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00794841AB
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 17:39:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 462215FF3F;
 Wed, 25 Sep 2024 19:39:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Sep 2024 19:39:00 +0200
Date: Wed, 25 Sep 2024 19:39:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <ZvRKtOxCF2r2V6iA@landeda>
References: <20240925133721.3899846-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925133721.3899846-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727285942;
 bh=DI9Rs4+8HrzHiBNy7V+PuhyNfad1XoEHLhU8pHH5bG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qbln86/3C2TtTUWrRE3imDEVnwsM24coUL+WHWKabUaEziJZa/lLN+stJ5n+ZiEiu
 mMNvLuBeomA5ppmb4o6ewA+MXdWgzDLnQ+5rRlCDjelEK5CLxjC1Y958gALxA2/jBl
 /RielvLVfsrs4Ebsdi6Umj/xePpWUAdAfsgAx3dfgvHTZjSja82t5E9x6/+At1zo0u
 iShpI1w3nBLOAuo6ZTkY8DT7b1MC/dTzeXoqpdKDeW6fwYVwR9/tg0rosiG+KabqsD
 pX1ShA71jNXubOh0vIZ79K4yOIkl2VBdvppFPLr026vh5r8jKaQ3t1BLy0eFFMF0vZ
 om/9T8fL7OprQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qbln86/3
Subject: Re: [Buildroot] [PATCH] package/hicolor-icon-theme: bump to version
 0.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA5LTI1IDE1OjM3ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IHN3aXRjaCB0byBtZXNvbiBidWlsZAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNr
YWdlL2hpY29sb3ItaWNvbi10aGVtZS9oaWNvbG9yLWljb24tdGhlbWUuaGFzaCB8IDIgKy0KPiAg
cGFja2FnZS9oaWNvbG9yLWljb24tdGhlbWUvaGljb2xvci1pY29uLXRoZW1lLm1rICAgfCA0ICsr
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaGljb2xvci1pY29uLXRoZW1lL2hpY29sb3ItaWNvbi10
aGVtZS5oYXNoIGIvcGFja2FnZS9oaWNvbG9yLWljb24tdGhlbWUvaGljb2xvci1pY29uLXRoZW1l
Lmhhc2gKPiBpbmRleCBlYzk2MzVmMDUuLjViZmYwM2ZlNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2hpY29sb3ItaWNvbi10aGVtZS9oaWNvbG9yLWljb24tdGhlbWUuaGFzaAo+ICsrKyBiL3BhY2th
Z2UvaGljb2xvci1pY29uLXRoZW1lL2hpY29sb3ItaWNvbi10aGVtZS5oYXNoCj4gQEAgLTEsMyAr
MSwzIEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgMzE3NDg0MzUyMjcxZDE4
Y2JiY2ZhYzM4NjhlYWI3OThkNjdmZmYxYjg0MDJlNzQwYmFhNmZmNDFkNTg4YTlkOCAgaGljb2xv
ci1pY29uLXRoZW1lLTAuMTcudGFyLnh6Cj4gK3NoYTI1NiAgZGIwZTUwYTgwYWEzYmY2NGJiNDVj
YmNhNWNmOWY3NWVmZDkzNDhjZjJhYzY5MGI5MDc0MzUyMzhjM2NmODFkNyAgaGljb2xvci1pY29u
LXRoZW1lLTAuMTgudGFyLnh6Cj4gIHNoYTI1NiAgYjBhNjQzNzdkNGVlODdiN2RiY2Y0MThjZTRm
YjMzZWMzYjJkNzA4MWI2NzMyODkwZTRhZjA2YjgxMThjNDUyNiAgQ09QWUlORwo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2hpY29sb3ItaWNvbi10aGVtZS9oaWNvbG9yLWljb24tdGhlbWUubWsgYi9w
YWNrYWdlL2hpY29sb3ItaWNvbi10aGVtZS9oaWNvbG9yLWljb24tdGhlbWUubWsKPiBpbmRleCAw
ODhhZWNmMzEuLmYzMzY4YTI5MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2hpY29sb3ItaWNvbi10
aGVtZS9oaWNvbG9yLWljb24tdGhlbWUubWsKPiArKysgYi9wYWNrYWdlL2hpY29sb3ItaWNvbi10
aGVtZS9oaWNvbG9yLWljb24tdGhlbWUubWsKPiBAQCAtNCwxMCArNCwxMCBAQAo+ICAjCj4gICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1ISUNPTE9SX0lDT05fVEhFTUVfVkVSU0lPTiA9
IDAuMTcKPiArSElDT0xPUl9JQ09OX1RIRU1FX1ZFUlNJT04gPSAwLjE4Cj4gIEhJQ09MT1JfSUNP
Tl9USEVNRV9TSVRFID0gaHR0cDovL2ljb24tdGhlbWUuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2Vz
Cj4gIEhJQ09MT1JfSUNPTl9USEVNRV9TT1VSQ0UgPSBoaWNvbG9yLWljb24tdGhlbWUtJChISUNP
TE9SX0lDT05fVEhFTUVfVkVSU0lPTikudGFyLnh6Cj4gIEhJQ09MT1JfSUNPTl9USEVNRV9MSUNF
TlNFID0gR1BMLTIuMAo+ICBISUNPTE9SX0lDT05fVEhFTUVfTElDRU5TRV9GSUxFUyA9IENPUFlJ
TkcKPiAgCj4gLSQoZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKPiArJChldmFsICQobWVzb24t
cGFja2FnZSkpCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
