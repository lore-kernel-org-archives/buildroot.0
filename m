Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBD8CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A50417D4;
	Wed,  3 Apr 2024 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcmMoI7XyAnR; Wed,  3 Apr 2024 21:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C422641880
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C422641880;
	Wed,  3 Apr 2024 21:12:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9998A1BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83B3182268
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7y5S4VzphhDf for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84E1D82267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E1D82267
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84E1D82267
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 21:12:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B43F613F86A;
 Wed,  3 Apr 2024 23:12:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 23:12:03 +0200
Date: Wed, 3 Apr 2024 23:12:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zg3GI3q2nTcbBIPM@landeda>
References: <20240403085424.1650628-1-francois.perrad@gadz.org>
 <20240403085424.1650628-3-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403085424.1650628-3-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712178725;
 bh=vZtm3ZQoq+oF84gwQZvubUrOH5fPQ7HS1uHPq07OVB4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=slzc+reUUUUZr0fjhWi//5AuyXkouUPQlsfh4w8BROGro883FvnXJplG9llyAEW9Y
 qULPfr5GrXS7Lhkh9MJ1fqpXb7tLB2sW4VwfVCpnO23v7JGuclOWZ8KSwSf1UsgPxp
 R5LeVJ910Q+Y3kJ8+CSSdfNHtCKfH52lbBdD7i5fuF5ekjYbNAO/B1ciH/Ra1W/dvn
 HMUvfXQco/+7hmqPxM3IYJQxiW9R+/V3w5kXCBa2Jogtwj9NxPh/sL4UJmrY53VXaY
 PrVcc+nTp3lqH0BtnUKe4BIrEWtpj6Gb1fdiQOqHpCl9/9hB50+683QK1HyXNhZoHu
 NhzWWeWbtBnQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=slzc+reU
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lgdbm: new package
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

RnJhw6dvaXMsIEFsbAoKT24gMjAyNC0wNC0wMyAxMDo1NCArMDIwMCwgRnJhbmNvaXMgUGVycmFk
IHNwYWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lz
LnBlcnJhZEBnYWR6Lm9yZz4KPiAtLS0KWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2x1YS1sZ2RibS9Db25maWcuaW4gYi9wYWNrYWdlL2x1YS1sZ2RibS9Db25maWcuaW4KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmFjNWM2NGNjNzkKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9sdWEtbGdkYm0vQ29uZmlnLmluCj4gQEAgLTAsMCArMSwx
MiBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfTFVBX0xHREJNCj4gKwlib29sICJsdWEtbGdkYm0i
Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xVQV81XzMgfHwgQlIyX1BBQ0tBR0VfTFVBXzVf
NAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0dEQk0KCllvdSBuZWVkIHRvIHByb3BhZ2F0ZSB0aGUg
ZGVwZW5kZW5jaWVzIG9mIGdkYm0gaGVyZTogTU1VIGFuZCBXQ0hBUi4KCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5iMjE1NjVmYjZlCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHVhX2xnZGJtLnB5Cj4g
QEAgLTAsMCArMSwxNCBAQAo+ICtmcm9tIHRlc3RzLnBhY2thZ2UudGVzdF9sdWEgaW1wb3J0IFRl
c3RMdWFCYXNlCj4gKwo+ICsKPiArY2xhc3MgVGVzdEx1YUxnZGJtKFRlc3RMdWFCYXNlKToKPiAr
ICAgIGNvbmZpZyA9IFRlc3RMdWFCYXNlLmNvbmZpZyArIFwKPiArICAgICAgICAiIiIKPiArICAg
ICAgICBCUjJfUEFDS0FHRV9MVUE9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0xVQV9MR0RCTT15
Cj4gKyAgICAgICAgIiIiCj4gKwo+ICsgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICsgICAgICAg
IHNlbGYubG9naW4oKQo+ICsgICAgICAgIHNlbGYubW9kdWxlX3Rlc3QoImdkYm0iKQo+ICsKClJ1
bnRpbWUgdGVzdCwgd2VlISA6LSkKCkJ1dDoKCiAgICAkIC4vdXRpbHMvZG9ja2VyLXJ1biBtYWtl
IGNoZWNrLXBhY2thZ2UKICAgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHVh
X2xnZGJtLnB5OjA6IHJ1biAnZmxha2U4JyBhbmQgZml4IHRoZSB3YXJuaW5ncwoKICAgICQgLi91
dGlscy9kb2NrZXItcnVuIHB5dGhvbjMgLW0gZmxha2U4IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfbHVhX2xnZGJtLnB5CiAgICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2x1YV9sZ2RibS5weToxNDoxOiBXMzkxIGJsYW5rIGxpbmUgYXQgZW5kIG9mIGZpbGUK
CkFwcGxpZWQgdG8gbWFzdGVyLCB3aXRoIHRoZSBnZGJtIGRlcGVuZGVuY2llcyBwcm9wYWdhdGVk
IGFuZCB0aGUKY2hlY2stcGFja2FnZS9mbGFrZTggaXNzdWUgZml4ZWQsIHRoYW5rcyEKClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
