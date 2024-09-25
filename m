Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45358CCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED69841AB;
	Wed, 25 Sep 2024 17:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcAY-O5_HlmQ; Wed, 25 Sep 2024 17:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA078436C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA078436C;
	Wed, 25 Sep 2024 17:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D05301BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFDC78436C
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrisqVLjxfnM for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFB38841AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB38841AB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB38841AB
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 17:39:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0F8B860148;
 Wed, 25 Sep 2024 19:39:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Sep 2024 19:39:14 +0200
Date: Wed, 25 Sep 2024 19:39:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <ZvRKwoNTsfX8LALZ@landeda>
References: <20240925133800.3899888-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925133800.3899888-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727285957;
 bh=ff8BsHY04eZgIEbRTnifL6e01FcZtudNj9dlEsrR+qY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q9SycCSt2CwETdnkI6CT7A0rj6fzPrnHmbw7VXiADQh1c8zlbenez8+1JJIIAHITH
 QrzM2HyOqbU6VT0JBkRDGWsIKDKJbUq5YdZpfCrQWuB1rLTTWYXKx8rbZ/9GOuysG/
 2YHh9p9B9tFu/dmX1w1Cx/9nVi9bRb7b6m/hgZ7Gqk7YGpPRNgOCYGZoeIxp4sQ9Gg
 8wbPGbWzMEUM60zHXFSbRitHJMgO8IGJcqwTPD938zXPZNy5Agc5A5R2rnk+Y2FH0i
 nNnp/ERqend45u4rorORSw13Zu6QoJBA1351l0WWz/IQE/M7xgLyXUSoWagEVgZe2d
 qlph52IrCPCsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q9SycCSt
Subject: Re: [Buildroot] [PATCH] package/mc: bump to version 4.8.32
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA5LTI1IDE1OjM4ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL21jL21jLmhhc2ggfCA0ICsrLS0KPiAg
cGFja2FnZS9tYy9tYy5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tYy9tYy5oYXNo
IGIvcGFja2FnZS9tYy9tYy5oYXNoCj4gaW5kZXggODRlYTRiMmFjLi4wMWMwZjYxYjQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9tYy9tYy5oYXNoCj4gKysrIGIvcGFja2FnZS9tYy9tYy5oYXNoCj4g
QEAgLTEsNCArMSw0IEBACj4gLSMgSGFzaCBmcm9tIGh0dHA6Ly9mdHAubWlkbmlnaHQtY29tbWFu
ZGVyLm9yZy9tYy00LjguMzEuc2hhMjU2Cj4gLXNoYTI1NiAgMjQxOTFjZjg2Njc2NzViOGUzMWZj
NGE5ZDE4YTBhNjViZGMwNTk4YzJjNWM0ZWEwOTI0OTRjZDEzYWI0YWIxYSAgbWMtNC44LjMxLnRh
ci54ego+ICsjIEhhc2ggZnJvbSBodHRwOi8vZnRwLm1pZG5pZ2h0LWNvbW1hbmRlci5vcmcvbWMt
NC44LjMyLnNoYTI1Ngo+ICtzaGEyNTYgIDRkZGM4M2QxZWRlOWFmMjM2M2IzZWFiOTg3ZjU0Yjg3
Y2Y2NjE5MzI0MTEwY2UyZDNhMGU3MDk0NGQxMzU5ZmUgIG1jLTQuOC4zMi50YXIueHoKPiAgIyBz
aGEyNTYgbG9jYWxseSBjb21wdXRlZDoKPiAgc2hhMjU2ICA1NTc2YmJlYzc2Mjk2ZTFjOGUwODFm
NzAzN2ViZDAxYmRhZGEzODg2MzVmNThkODQ0YTJmMjBkMzdiYmU0Mjg0ICBDT1BZSU5HCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbWMvbWMubWsgYi9wYWNrYWdlL21jL21jLm1rCj4gaW5kZXggYTZj
M2UwYmM4Li5iN2U3ZTEwN2MgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tYy9tYy5tawo+ICsrKyBi
L3BhY2thZ2UvbWMvbWMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICAKPiAtTUNfVkVSU0lPTiA9IDQuOC4zMQo+ICtNQ19WRVJTSU9OID0gNC44
LjMyCj4gIE1DX1NPVVJDRSA9IG1jLSQoTUNfVkVSU0lPTikudGFyLnh6Cj4gIE1DX1NJVEUgPSBo
dHRwOi8vZnRwLm1pZG5pZ2h0LWNvbW1hbmRlci5vcmcKPiAgTUNfTElDRU5TRSA9IEdQTC0zLjAr
Cj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
