Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8AACCF9E8
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 17:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D7F48116F;
	Wed, 25 Sep 2024 17:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mexNpJwuEcDh; Wed, 25 Sep 2024 17:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33852841AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33852841AB;
	Wed, 25 Sep 2024 17:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B15F1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A27F841AB
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 17:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNLIiztjKxGr for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 17:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 872488116F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 872488116F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 872488116F
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 17:39:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 442B560142;
 Wed, 25 Sep 2024 19:39:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 Sep 2024 19:39:35 +0200
Date: Wed, 25 Sep 2024 19:39:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <ZvRK19IbemhDJays@landeda>
References: <20240925133807.3899910-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925133807.3899910-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727285977;
 bh=zyE+kjv/tXrNOwtV2UN2C6OMiXqIOKxZn7kjwvzKAzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aRnixZI7hDsMHR3ze64roc5q4/YNPHZixJfL8EeaLRrnORXuMikAT8gF1IF8bmYZw
 jlCTWEVYXKIjEnj+GdV/mnUhU4EZ2x5btHrSydaoWSkAC1s8DwZjahZhbNNeYv+ceZ
 /b5Jd6pk7utW6JZ1ibAJL7GfYeYEPSyq9aOQTDr2AVbc/1dtY6j4nOlmCkcdGw4RTk
 pesnB9/vCxnHu+bVfkGlKxERGnH5pELsjXryG2YSTZByu9KBizG4D1mVApKiujhR6A
 MFOVHTiDQcZdQsUgBZ1hHPKY8pXuol6Df88n+s2pSashOXopARhOXG0fSUGAtQQrJj
 SN4r16d6x+Qjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aRnixZI7
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 8.2
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
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL25hbm8vbmFuby5oYXNoIHwgNCArKy0t
Cj4gIHBhY2thZ2UvbmFuby9uYW5vLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25h
bm8vbmFuby5oYXNoIGIvcGFja2FnZS9uYW5vL25hbm8uaGFzaAo+IGluZGV4IDA0ZTNjNjI5MC4u
NGYzMWVlZGVmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmFuby9uYW5vLmhhc2gKPiArKysgYi9w
YWNrYWdlL25hbm8vbmFuby5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgTG9jYWxseSBjYWxj
dWxhdGVkIGFmdGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUKPiAtIyBodHRwczovL3d3dy5uYW5v
LWVkaXRvci5vcmcvZGlzdC92OC9uYW5vLTguMS50YXIueHouYXNjCj4gKyMgaHR0cHM6Ly93d3cu
bmFuby1lZGl0b3Iub3JnL2Rpc3QvdjgvbmFuby04LjIudGFyLnh6LmFzYwo+ICAjIHVzaW5nIGtl
eSAxNjhFNkY0Mjk3QkZEN0E3OUFGRDQ0OTY1MTRCQkUyRUI4RTE5NjFGCj4gLXNoYTI1NiAgOTNi
M2UzZTkxNTVhZTM4OWZlOWNjZjljYjdhYjM4MGVhYzI5NjAyODM1YmEzMDc3YjIyZjY0ZDBmMGNi
ZThjYiAgbmFuby04LjEudGFyLnh6Cj4gK3NoYTI1NiAgZDVhZDA3ZGQ4NjJmYWNhZTAzMDUxYzU0
YzY1MzVlNTRjN2VkNzQwNzMxODc4M2ZjYWQxYWQyZDcwNzZmZmZlYiAgbmFuby04LjIudGFyLnh6
Cj4gIHNoYTI1NiAgZmM4MmNhOGI2ZmRiMThkNGUzZTg1Y2ZkOGFiNThkMWJjZDNmMWIyOWFiZTc4
Mjg5NWFiZDkxZDY0NzYzZjhlNyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25hbm8v
bmFuby5tayBiL3BhY2thZ2UvbmFuby9uYW5vLm1rCj4gaW5kZXggZGI2MTRmZWI3Li5hMWI5NGM5
MGQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uYW5vL25hbm8ubWsKPiArKysgYi9wYWNrYWdlL25h
bm8vbmFuby5tawo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ICAKPiAgTkFOT19WRVJTSU9OX01BSk9SID0gOAo+IC1OQU5PX1ZFUlNJT04gPSAkKE5BTk9fVkVS
U0lPTl9NQUpPUikuMQo+ICtOQU5PX1ZFUlNJT04gPSAkKE5BTk9fVkVSU0lPTl9NQUpPUikuMgo+
ICBOQU5PX1NJVEUgPSBodHRwczovL3d3dy5uYW5vLWVkaXRvci5vcmcvZGlzdC92JChOQU5PX1ZF
UlNJT05fTUFKT1IpCj4gIE5BTk9fU09VUkNFID0gbmFuby0kKE5BTk9fVkVSU0lPTikudGFyLnh6
Cj4gIE5BTk9fTElDRU5TRSA9IEdQTC0zLjArCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBS
SUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJl
ICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypc
XyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
