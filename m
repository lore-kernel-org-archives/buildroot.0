Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC23C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 11:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C756081ECC;
	Sun, 16 Jun 2024 11:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDmbktyga1IP; Sun, 16 Jun 2024 11:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD9C82003
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBD9C82003;
	Sun, 16 Jun 2024 11:56:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6E8F1BF2CF
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B455340275
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imPeB6i1Zp4H for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 11:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53DEA400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DEA400DA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53DEA400DA
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 11:55:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8797E13F8AD;
 Sun, 16 Jun 2024 13:55:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 13:55:55 +0200
Date: Sun, 16 Jun 2024 13:55:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <Zm7Syz8a9T09RrRf@landeda>
References: <20240613113924.3778837-1-yegorslists@googlemail.com>
 <Zm7K9fkXOlLrekgS@landeda>
 <CAGm1_ktfU00dOE7n7SdnK25-1AB0ca5KSYYtQPKUaOy+1vob5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ktfU00dOE7n7SdnK25-1AB0ca5KSYYtQPKUaOy+1vob5A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718538957;
 bh=Dwl1fsiEj/fMolz5vmUa+Zpd+9XnkglTV6MOX146KAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rTIYZkTbpY6lhTEha5Gte1NT2A4/tXVDNmIzpIO3qOXMdPtr6PdmmdLG/dor78PZE
 CurqnQj1qOrG5qJyQWY2HNtodwfMoQw+OQTC2mwwBZD3TFinprKrAZTXi1Y+Klk/8v
 qAAKhhkJRmR+UYhLqXebBUtQ4zjD2HTm0C5UITpqVC3JhIdDXZkrTvi2ZorcrUJEZ9
 T059JQ3HJdmyVHocjDy8X3wwvWO5iNBl6gIlA41jJN+Fn1L80LYMzaJIL3sO0cFqEg
 dIcsMI+a4whTZY344sbeQWHuh8+FNuVw/vMYtKSdohB3cX6jQA6xGsrEmzI8wL1v0w
 RHscyFSuOD07A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rTIYZkTb
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix GCC 14.x related build
 errors
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

WWVnb3IsIEFsbCwKCk9uIDIwMjQtMDYtMTYgMTM6NDIgKzAyMDAsIFllZ29yIFllZnJlbW92IHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIEp1biAxNiwgMjAyNCBhdCAxOjIy4oCvUE0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgpbLS1TTklQLS1dCj4gPiA+IGRp
ZmYgLS1naXQgYS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+ID4g
PiBpbmRleCBkZDFmZDMxZTg2Li41MmI1MDkwMDM0IDEwMDY0NAo+ID4gPiAtLS0gYS8uY2hlY2tw
YWNrYWdlaWdub3JlCj4gPiA+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiA+ID4gQEAgLTEw
NjcsNiArMTA2Nyw4IEBAIHBhY2thZ2UvbXVzbC8wMDAxLWF2b2lkLWtlcm5lbC1pZl9ldGhlci5o
LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4gPiAgcGFja2FnZS9tdXNsLzAwMDItcGFja2Fn
ZS1tdXNsLU1ha2Utc2NoZWR1bGVyLWZ1bmN0aW9ucy1MaW51eC1jb21wYXRpYi5wYXRjaCBsaWJf
cGF0Y2guVXBzdHJlYW0KPiA+ID4gIHBhY2thZ2UvbmFuby8wMDAxLWxpYi1nZXRyYW5kb20uYy1m
aXgtYnVpbGQtd2l0aC11Y2xpYmMtMS4wLjM1LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ID4g
PiAgcGFja2FnZS9uYW5vY29tLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTEwLnBhdGNoIGxpYl9w
YXRjaC5VcHN0cmVhbQo+ID4gPiArcGFja2FnZS9uY2Z0cC8wMDAxLW5jZnRwLTMuMi43LWZpeC1n
Y2MxNC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiA+ID4gK3BhY2thZ2UvbmNmdHAvMDAwMi1u
Y2Z0cC0zLjIuNy1maXgtY2xhbmcucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gPgo+ID4gRG8g
bm90IGFkZCBhbiBleGNsdXNpb24gZm9yIG5ldyBwYXRjaGVzOyBpbnN0ZWFkLCBhZGQgYW4gVXBz
dHJlYW0gdGFnLgpbLS1TTklQLS1dCj4gVGhlIHJlYXNvbiBmb3IgdGhlIG1pc3NpbmcgVXBzdHJl
YW0gdGFnIGlzIHRoYXQgdGhlcmUgaXMgbmVpdGhlciBidWcKPiB0cmFja2VyIG5vciBtYWlsaW5n
IGxpc3QuIFRoZSBvbmx5IGNvbW11bmljYXRpb24gY2hhbm5lbCBpcyBhbiBlLW1haWwKPiBhZGRy
ZXNzLiBJIGhhdmUgYWxyZWFkeSBzZW50IGJvdGggcGF0Y2hlcyBhbmQgYXNrZWQgZ2F6aWxsaW9u
cyBvZgo+IHF1ZXN0aW9ucyBidXQgYWxsIHdhcyBpbiB2YWluIDotKAoKQWgsIG5vdyB0aGF0IEkg
bG9va2VkLCBpdCBpbmRlZWRzIGxvb2sgYmxlYWsuLi4gOi0oCgpJbiB0aGF0IGNhc2UsIHN0YXRl
IGJyaWVmbHkgc286CgogICAgVXBzdHJlYW06IE4vQSwgdW5yZXNwb25zaXZlIGNvbnRhY3QgZW1h
aWwgYWRkcmVzcwoKVGhhbmtzIGZvciB0cnlpbmchIDotKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJ
Ti4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
