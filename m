Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D812C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C453E60F94
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C453E60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6714E40132;
	Mon, 27 Sep 2021 19:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNw32T5vH-ig; Mon, 27 Sep 2021 19:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B8F34053A;
	Mon, 27 Sep 2021 19:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 217FB1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 111D3403B8
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVDMc60wo9zd for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:42:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4A0140270
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:42:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 663A6780357;
 Mon, 27 Sep 2021 21:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632771776;
 bh=4Wuz+9LADeVDzTUCD1m1+2chv4matfFNhK1xDSd9DU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GXeO/GSPdmfJgTZ0dN1mktTilJKJ52mHp+LfdSIgLLN7uLvrXMqqkCBtYpJGvjyII
 HtUh9yUTyRWIwgXC+m40V08xenFpaWl9qzWf8OQeS19UnH6BaaO3xZ6ogi2AZWyd9D
 etF1TYLYrKSmxhHiRJY1xr8epF4f49WDDzwkk+QsJVUaV92H9fHrumwrJY8So6qTlI
 nt4iwBG8Df/hLQyHKy5wIDVE4s7uYw76ROg85FvBSfuOmmarfUx1qpoUsucP7WdGQE
 1WFIsZOHmu3mTnCjF4qxzMTm6GKzSckyYOSYAy1Sx7Y1fLZLOet7XM0p+42F2QlA3H
 IiP4AcpKR3T0A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 21:42:50 +0200
Date: Mon, 27 Sep 2021 21:42:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210927194250.GD1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923155726.87851-3-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IFRoaXMgcGF0Y2ggYWxsb3dzIHRvIGJ1aWxkIEdydWIyIGZvciBkaWZmZXJl
bnQgY29uZmlndXJhdGlvbnMgc2ltdWx0YW5lb3VzbHkuCj4gVG8gY292ZXIgR3J1YjIgY29uZmln
dXJhdGlvbiBvZiBsZWdhY3kgQklPUyBwbGF0Zm9ybXMgKDMyLWJpdCksIDMyLWJpdCBFRkkKPiBC
SU9TIGFuZCA2NC1iaXQgRUZJIEJJT1MgaW4gdGhlIHNhbWUgYnVpbGQsIG11bHRpLWJ1aWxkIHN5
c3RlbSBmZWx0IG11Y2ggbW9yZQo+IHJlYXNvbmFibGUgdG8ganVzdCBleHRlbmQgdGhlIGdydWIy
IHBhY2thZ2UgaW50byAzIHBhY2thZ2VzLgpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL0NvbmZp
Zy5pbi5sZWdhY3kgYi9Db25maWcuaW4ubGVnYWN5Cj4gaW5kZXggMzVhMTFmNGRjNi4uMzNjZWUw
MjAyYiAxMDA2NDQKPiAtLS0gYS9Db25maWcuaW4ubGVnYWN5Cj4gKysrIGIvQ29uZmlnLmluLmxl
Z2FjeQo+IEBAIC0xNjgsNiArMTY4LDMwIEBAIGNvbmZpZyBCUjJfS0VSTkVMX0hFQURFUlNfNV8x
Mgo+ICAKPiAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDIxLjA4Igo+ICAK
PiArY29uZmlnIEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RVTEVTCj4gKwlzdHJpbmcgInRo
ZSBncnViMiBidWlsdGluIG1vZHVsZXMgaGFzIGJlZW4gcmVuYW1lZCIKPiArCWhlbHAKPiArCSAg
VGhpcyBvcHRpb24gaGFzIGJlZW4gc3BsaXQgdG8gc2VwYXJhdGUgdGhlIGJ1aWx0aW4gbW9kdWxl
cwo+ICsJICBiZXR3ZWVuIEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RVTEVTX1BDIGFuZAo+
ICsJICBCUjJfVEFSR0VUX0dSVUIyX0JVSUxUSU5fTU9EVUxFU19FRkkuCj4gKwo+ICtjb25maWcg
QlIyX1RBUkdFVF9HUlVCMl9CVUlMVElOX01PRFVMRVNfV1JBUAo+ICsJYm9vbAo+ICsJZGVmYXVs
dCB5IGlmIEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RVTEVTICE9ICIiCj4gKwlzZWxlY3Qg
QlIyX0xFR0FDWQo+ICsKPiArY29uZmlnIEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9DT05GSUcK
PiArCXN0cmluZyAidGhlIGdydWIyIGJ1aWx0aW4gY29uZmlndXJhdGlvbiBoYXMgYmVlbiByZW5h
bWVkIgo+ICsJaGVscAo+ICsJICBUaGlzIG9wdGlvbiBoYXMgYmVlbiBzcGxpdCB0byBzZXBhcmF0
ZSB0aGUgYnVpbHRpbiBjb25maWd1cmF0aW9uCgogICAgJCBtYWtlIGNoZWNrLXBhY2thZ2UKICAg
IENvbmZpZy5pbi5sZWdhY3k6MTg2OiBoZWxwIHRleHQ6IDx0YWI+PDIgc3BhY2VzPjw2MiBjaGFy
cz4KICAgIChodHRwOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyN3cml0aW5nLXJ1bGVzLWNvbmZp
Zy1pbikKClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEvYm9vdC9ncnViMi9Db25maWcuaW4gYi9i
b290L2dydWIyL0NvbmZpZy5pbgo+IGluZGV4IGU0NTEzMzk5OWUuLjEwYmJhNmM1ZTQgMTAwNjQ0
Cj4gLS0tIGEvYm9vdC9ncnViMi9Db25maWcuaW4KPiArKysgYi9ib290L2dydWIyL0NvbmZpZy5p
bgo+IEBAIC0xMCw2ICsxMCwxMyBAQCBjb25maWcgQlIyX1RBUkdFVF9HUlVCMgo+ICAJYm9vbCAi
Z3J1YjIiCj4gIAlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfR1JVQjJfQVJDSF9TVVBQT1JUUwo+ICAJ
ZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9HUlVCMl9JMzg2
X1BDIGlmIFwKPiArCQkhQlIyX1RBUkdFVF9HUlVCMl9IQVNfUFRGICYmIFwKPiArCQkoQlIyX2kz
ODYgfHwgQlIyX3g4Nl82NCkKPiArCXNlbGVjdCBCUjJfVEFSR0VUX0dSVUIyX0FSTV9VQk9PVCBp
ZiBcCj4gKwkJIUJSMl9UQVJHRVRfR1JVQjJfSEFTX1BURiAmJiBcCj4gKwkJQlIyX2FybQo+ICsJ
c2VsZWN0IEJSMl9UQVJHRVRfR1JVQjJfQVJNNjRfRUZJIGlmIEJSMl9hYXJjaDY0Cj4gIAloZWxw
Cj4gIAkgIEdOVSBHUlVCIGlzIGEgTXVsdGlib290IGJvb3QgbG9hZGVyLiBJdCB3YXMgZGVyaXZl
ZCBmcm9tCj4gIAkgIEdSVUIsIHRoZSBHUmFuZCBVbmlmaWVkIEJvb3Rsb2FkZXIsIHdoaWNoIHdh
cyBvcmlnaW5hbGx5Cj4gQEAgLTI1LDEwICszMiwxMCBAQCBjb25maWcgQlIyX1RBUkdFVF9HUlVC
Mgo+ICAKPiAgCSAgaHR0cDovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2dydWIvCj4gIAo+IC1pZiBC
UjJfVEFSR0VUX0dSVUIyCj4gK2NvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0hBU19QVEYKPiArCWJv
b2wKCkkndmUgbW92ZWQgdGhpcyBvcHRpb24gaW5zaWRlIHRoZSAnaWYnIGNvbmRpdGlvbmFsLCBv
dGhlcndpc2UgdGhlCnN1Ym9wdGlvbnMgYXJlIG5vdCBwcm9wZXJseSBpbmRlbnRlZC4KCkFwcGxp
ZWQgdG8gbWFzdGVyIHdpdGggdGhlIGFib3ZlIHR3byBmaXhlZCwgdGhhbmtzLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
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
