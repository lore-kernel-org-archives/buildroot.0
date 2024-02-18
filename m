Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7003C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 19:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3758E402AF;
	Sun, 18 Feb 2024 19:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqXI6AUxZ6p4; Sun, 18 Feb 2024 19:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B9E402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B9E402BC;
	Sun, 18 Feb 2024 19:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A07B1BF83B
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7770F81E5C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXQ37kB3Is_m for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 19:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7655181E5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7655181E5B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7655181E5B
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 19:50:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6684A13F861;
 Sun, 18 Feb 2024 20:50:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 20:50:29 +0100
Date: Sun, 18 Feb 2024 20:50:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Message-ID: <ZdJfha-psWo-bUZk@landeda>
References: <20240218193112.1048370-1-nunog@fr24.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218193112.1048370-1-nunog@fr24.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708285831;
 bh=YnAcvBXp27u5pmEgxRacaiMhVopTNU62OG3pw6lUKDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nrI6NEA7rIZgKH1nw6sAg1JDlUBuqzxU42SQpW/iFkcgahfwB7FkcZtoRTArUAX8N
 i+r3wfjXn2sEGoM0lw1knetv9DxIMMWRvXQKSProFXWsHmmUrW/6KVcwWj3T64rIFi
 5ZKKmo7sJsy9V1V2WslZz8LIXnsqWBRGPiZGnJHPaWfVZXrvrpQ7+SU3WYEkUfdecf
 uRDmYni/4zdTmlbJ98HB6u89z6anpeiWlzkFqhr9u+X1osnx3/nnDUxH8Ud7DKvshH
 Tjhj5ew2fFV8gwunwIS+dCDtfeIgJ7IOjXmtKKQq7jbpOODkvB3UBvAnqB79Eg/6v9
 U5uf/HrXLd4fA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nrI6NEA7
Subject: Re: [Buildroot] [PATCH] package/google-breakpad: fix tools option
 identation in menuconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TnVubywgQWxsLAoKT24gMjAyNC0wMi0xOCAxOTozMCArMDAwMCwgTnVubyBHb27Dp2FsdmVzIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE1vdmUgY29tbWVudCBpbiBDb25maWcuaW4gdG8g
ZW5kIG9mIGZpbGUgc28gdGhhdAo+IEJSMl9QQUNLQUdFX0dPT0dMRV9CUkVBS1BBRF9UT09MUyBp
cyBwcm9wZXJseSBpZGVudGVkLgoKQWggeWVzLCBpdCB3YXMgYm90aGVyaW5nIG1lIHRoZSBvdGhl
ciBkYXksIGJ1dCBJIGRpZCBub3QgZ2V0IHRvIGl0Li4uCgo+IFNpZ25lZC1vZmYtYnk6IE51bm8g
R29uw6dhbHZlcyA8bnVub2dAZnIyNC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFk
L0NvbmZpZy5pbiB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nb29n
bGUtYnJlYWtwYWQvQ29uZmlnLmluIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvQ29uZmlnLmlu
Cj4gaW5kZXggMGQyMWZkMmU1Yy4uNWM3ZjRiYjdiYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dv
b2dsZS1icmVha3BhZC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC9D
b25maWcuaW4KPiBAQCAtMzUsMTQgKzM1LDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0dPT0dMRV9C
UkVBS1BBRAo+ICAKPiAgCSAgaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2JyZWFr
cGFkL2JyZWFrcGFkCj4gIAo+IC1jb21tZW50ICJnb29nbGUtYnJlYWtwYWQgcmVxdWlyZXMgYSBn
bGliYyB0b29sY2hhaW4gdy8gd2NoYXIsIHRocmVhZCwgQysrLCBnY2MgPj0gNC44Igo+IC0JZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9HT09HTEVfQlJFQUtQQURfQVJDSF9TVVBQT1JUUwo+IC0JZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPT0dMRV9CUkVBS1BBRF9BUkNIX1NVUFBPUlRTCj4g
LQlkZXBlbmRzIG9uICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9VU0VfV0NIQVIgfHwg
XAo+IC0JCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IFwKPiAtCQkhQlIyX1RPT0xDSEFJ
Tl9VU0VTX0dMSUJDIHx8IFwKPiAtCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF84Cj4g
LQo+ICBpZiBCUjJfUEFDS0FHRV9HT09HTEVfQlJFQUtQQUQKPiAgCj4gIGNvbmZpZyBCUjJfUEFD
S0FHRV9HT09HTEVfQlJFQUtQQURfVE9PTFMKPiBAQCAtNTIsMyArNDQsMTEgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0dPT0dMRV9CUkVBS1BBRF9UT09MUwo+ICAJICBtaW5pZHVtcF9zdGFja3dhbGsg
YW5kIG1pY3JvZHVtcF9zdGFja3dhbGsuCj4gIAo+ICBlbmRpZgo+ICsKPiArY29tbWVudCAiZ29v
Z2xlLWJyZWFrcGFkIHJlcXVpcmVzIGEgZ2xpYmMgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWQs
IEMrKywgZ2NjID49IDQuOCIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFL
UEFEX0FSQ0hfU1VQUE9SVFMKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT09HTEVf
QlJFQUtQQURfQVJDSF9TVVBQT1JUUwo+ICsJZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1RE
Q1BQIHx8ICFCUjJfVVNFX1dDSEFSIHx8IFwKPiArCQkhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFE
UyB8fCBcCj4gKwkJIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyB8fCBcCj4gKwkJIUJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzRfOAo+IC0tIAo+IDIuNDMuMgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
