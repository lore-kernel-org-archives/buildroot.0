Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608AFC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F26820CA;
	Wed,  1 May 2024 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvPJd5qBxlgp; Wed,  1 May 2024 19:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170CF820D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 170CF820D0;
	Wed,  1 May 2024 19:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE4B1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25E60820D0
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDGspYNZdPOe for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD725820CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD725820CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD725820CA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:46:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2658513FA38;
 Wed,  1 May 2024 21:46:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 21:46:27 +0200
Date: Wed, 1 May 2024 21:46:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZjKcE_htYN1j5io2@landeda>
References: <20220917205253.3737d1c6@windsurf>
 <6338e428-df6e-40db-8a99-9390d150131d@newtesc.com.br>
 <0e92066e-ce6f-4d69-9f43-979c62a4d40c@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e92066e-ce6f-4d69-9f43-979c62a4d40c@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714592791;
 bh=vJ+6kE8yx12ZIgwa1QG9CBG3jk2I1ua0e3QuLnYNL2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLCwkpg7CRfSIY2VwXKNdCr4RQfRlTMMxDc2gOR3PUegBXjp6ayxY+2VaWzHMeg9L
 qltoztwussSzvMTbOx8f959GkEXOyT8pJDrc0sisQzgbIyyTp96J98cfj5IkWhQVL1
 2pRjKTTftVLharOmZQkFKtzGsXTxbxlo7r/XlMKtheihYYMcRh+QjpJpBGtxOKATzW
 +TdwhaCUUi2/wWvDwD+a6LviJFpEA032LElwpvy8gsgOnwnt13dXDjlXgV6uWd+iHP
 3OZiZ7/JnuzO//BmBvPdJLGEmhfzl0avsWZ5sTHHYlm5ffnD5vb1bK9cdlF16MJQwb
 yzaudQjnAk9xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PLCwkpg7
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
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
Cc: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBBbGwsCgpPbiAyMDI0LTA1LTAxIDIxOjA5ICswMjAwLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBPbiAzMC8wNC8yMDI0IDE5OjU2LCBG
bMOhdmlvIFRhcGFqw7NzIHdyb3RlOgo+ID4gU29ycnkgdG8gbmVjcm9idW1wLCBidXQgc3VjaCBh
IGZlYXR1cmUgd291bGQgYmUgaGFuZHkgd2hlbiB1c2luZwo+ID4gRk9PX0RMX09QVFMgdG8gZW5z
dXJlIGh0dHAgYXV0aGVudGljYXRpb24uCj4gPiAKPiA+IFRva2VucywgdXNlcm5hbWVzIG9yIHBh
c3N3b3JkcyB3aWxsIGJlIGxlYWtlZCB0byB0aGUgZmFsbGJhY2sgc2VydmVyIGluCj4gPiBjYXNl
IG9mIGZhaWx1cmUgb2YgdGhlIHByaW1hcnkgc291cmNlLiBUaGlzIGNvdWxkIGJlIHNvbWUgc291
cmNlIG9mCj4gPiB2dWxuZXJhYmlsaXR5Cj4gCj4gIEkgZG9uJ3Qgc2VlIGhvdyBhbnkgb2YgdGhl
c2Ugd291bGQgYmUgbGVha2VkLi4uCj4gCj4gIEEgdG9rZW4gaXMgcGFzc2VkIGVpdGhlciBhcyBh
IHBhc3N3b3JkIG9yIGFzIGEgaGVhZGVyLiBUaGVyZSdzIG5vIHdheSB0bwo+IHNwZWNpZnkgcGVy
LXBhY2thZ2Ugd2dldCBvcHRpb25zIGFueXdheSwKCkl0ICppcyogcG9zc2libGUgdG8gcGFzcyBw
ZXItcGFja2FnZSBkb3dubG9hZCBvcHRpb25zOgoKICAgIEZPT19ETF9PUFRTID0gLS1oZWFkZXIg
J0F1dGgtVG9rZW46IG15LXNlY3JldCcKCkFuZCB0aG9zZSBvcHRpb25zIGFyZSBwYXNzZWQgdG8g
YWxsIHRoZSBkb3dubG9hZHMgdGVudGF0aXZlcy4gVGhpcyBvZgpjb3Vyc2Ugb25seSB3b3JrcyBw
cm9wZXJseSB3aGVuIHRoZSBtYWluIGRvd25sb2FkIGlzIGRvbmUgd2l0aCB3Z2V0LAp0aG91Z2gs
IGFzIG9wdGlvbnMgZm9yIGdpdC1hcy1tYWluIGFyZSBub3QgdmFsaWQgZm9yIHdnZXQtYXMtcHJp
bWFyeSBvcgp3Z2V0LWFzLWJhY2t1cC4KCk5vdGUgdGhhdCB3ZSB1c2VkIHRvIGhhdmUgc3VjaCBh
IHBhY2thZ2UgaW4gQnVpbGRyb290LCBhbWQtY2F0YWx5c3QsIGJ1dAppdCB3YXMgcmVtb3ZlZCBh
IHdoaWxlIGFnby4gU3RpbGwsIHdlJ3JlIHRlc3RpbmcgdGhhdCBpbiBvdXRyIGRvd25sb2FkCnJ1
bnRpbWUgdGVzdHMsIGZvciBzZnRwIGFuZCBzY3AsIHNvIHdlIGtub3cgaXQgd29ya3MuLi4KClJl
Z2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IHNvIEkgZ3Vlc3MgaXQgd2lsbCBiZSBwYXNzZWQgYXMg
YQo+IHBhc3N3b3JkLgo+IAo+ICBBIHBhc3N3b3JkIGNhbiBlaXRoZXIgYmUgcGFzc2VkIGluIC5u
ZXRyYyBvciAud2dldHJjIChpbiB3aGljaCBjYXNlIGl0IGlzCj4gc2l0ZS1zcGVjaWZpYyBzbyB3
b24ndCBiZSBzZW50IHRvIFBSSU1BUllfU0lURSBvciBCQUNLVVBfU0lURSksIG9yIGl0IGNhbiBi
ZQo+IHBhc3NlZCBpbiB0aGUgVVJMLCBhcyBodHRwczovL3VzZXI6cGFzc0BzZXJ2ZXIuY29tL3Bh
dGgvc291cmNlLnRhci5nego+IFRoZSB3aG9sZSB1c2VyOnBhc3MgcGFydCBhbHNvIGRvZXNuJ3Qg
Z2V0IHVzZWQgaW4gUFJJTUFSWV9TSVRFIG9yIEJBQ0tVUF9TSVRFLgo+IAo+ICBUaGUgYWJvdmUg
YXBwbGllcyB0byBodHRwIGRvd25sb2Fkcy4gRm9yIG90aGVyIGRvd25sb2FkcywgaXQgZG9lc24n
dCBldmVuCj4gbWF0dGVyIGF0IGFsbCwgYmVjYXVzZSB0aGF0IGRvd25sb2FkIG1ldGhvZCB3b24n
dCBiZSB1c2VkIGZvciBQUklNQVJZX1NJVEUKPiBhbmQgU0VDT05EQVJZX1NJVEUgc28gYW55IGF1
dGhlbnRpY2F0aW9uIHN0dWZmIHdvbid0IGJlIHVzZWQgZWl0aGVyLgo+IAo+ICBTbyBob3cgZG9l
cyBsZWFraW5nIHRha2UgcGxhY2U/Cj4gCj4gIFJlZ2FyZHMsCj4gIEFybm91dAo+IAo+ID4gCj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwg
Xy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
