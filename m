Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202DBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:17:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E92561241
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E92561241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB16407B7;
	Fri, 17 Sep 2021 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKbgVZQJvGgQ; Fri, 17 Sep 2021 20:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC25407BC;
	Fri, 17 Sep 2021 20:17:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65AAC1BF48D
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54B0D61BFC
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwkOrfm05mkC for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 20:17:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B2E661BEE
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 20:17:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 544535FF67;
 Fri, 17 Sep 2021 22:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631909837;
 bh=redVLmUhMCndpXYcGca7ex13YSXWzaOXG0uQeOK72vM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dXStbVrS+KQhQeXiuOTajagpntKTR5EuOeDOgn9vtjMsr94mQWAYk+hzTURl5Zo9e
 4VishLwx/50M7iepLXFMuV8YB3aHuQ4pqI5NJenfC5rpAMK5S4PIlpI6Y3q1bHX2FJ
 /Z9ujv0U66k5GhPQ00Dhn/ukD8sDEceNNARd3Mw96aqd/ji7NoPotvaxvGJlsfMCe8
 6gQnYdJSNW+3+Vl6bEJyCG6SlxKUjW6MbJL7hzJnahnyg93HgtraY19kqgScajvCpg
 C32UW46vUJ748R+bpftjy74AjwtCA5s9soD4mIKmdvcK2BDsGq2v8G8IoYrWByghTY
 ash1pWOYlQg6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 22:17:11 +0200
Date: Fri, 17 Sep 2021 22:17:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210917201711.GX1053080@scaer>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-4-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914093457.1389174-4-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/8] fs/iso9660: switch from cdrkit to
 xorriso to build ISO9660 images
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMTQgMTE6MzQgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IEluIG9yZGVyIHRvIGFkZCBzdXBwb3J0IGZvciBFRkktY29tcGF0aWJsZSBJ
U085NjYwIGltYWdlcyBpbiBmdXR1cmUKPiBwYXRjaGVzLCB0aGlzIGNvbW1pdCBzd2l0Y2ggdGhl
IElTTzk2NjAgbG9naWMgdG8gdXNlIHhvcnJpc28gaW5zdGVhZCBvZgo+IGNkcmtpdC4gSW5kZWVk
IHRoZSBnZW5pbWFnZWlzbyB0b29sIGZyb20gY2Rya2l0IGRvZXNuJ3QgaGF2ZSB0aGUKPiAtLWVm
aS1ib290IG9wdGlvbiBuZWVkZWQgdG8gZ2VuZXJhdGUgYW4gaW1hZ2UgY29tcGF0aWJsZSB3aXRo
IEVGSSBCSU9TLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNl
bnRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGZzL2lzbzk2NjAvaXNvOTY2MC5tayB8IDggKysrKy0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZnMvaXNvOTY2MC9pc285NjYwLm1rIGIvZnMvaXNvOTY2MC9pc285NjYw
Lm1rCj4gaW5kZXggYTEyOTY1NWNlMy4uZjgwYjczNTg1OCAxMDA2NDQKPiAtLS0gYS9mcy9pc285
NjYwL2lzbzk2NjAubWsKPiArKysgYi9mcy9pc285NjYwL2lzbzk2NjAubWsKPiBAQCAtMjQsNyAr
MjQsNyBAQAo+ICAKPiAgUk9PVEZTX0lTTzk2NjBfQk9PVF9NRU5VID0gJChjYWxsIHFzdHJpcCwk
KEJSMl9UQVJHRVRfUk9PVEZTX0lTTzk2NjBfQk9PVF9NRU5VKSkKPiAgCj4gLVJPT1RGU19JU085
NjYwX0RFUEVOREVOQ0lFUyA9IGhvc3QtY2Rya2l0IGxpbnV4Cj4gK1JPT1RGU19JU085NjYwX0RF
UEVOREVOQ0lFUyA9IGhvc3QteG9ycmlzbyBsaW51eAo+ICAKPiAgaWZlcSAoJChCUjJfVEFSR0VU
X1JPT1RGU19JTklUUkFNRlMpLHkpCj4gIFJPT1RGU19JU085NjYwX1VTRV9JTklUUkQgPSBZRVMK
PiBAQCAtNTIsNyArNTIsNyBAQCBkZWZpbmUgUk9PVEZTX0lTTzk2NjBfTUtaRlRSRUUKPiAgCQkk
KFJPT1RGU19JU085NjYwX1RNUF9UQVJHRVRfRElSKQo+ICBlbmRlZgo+ICBST09URlNfSVNPOTY2
MF9QUkVfR0VOX0hPT0tTICs9IFJPT1RGU19JU085NjYwX01LWkZUUkVFCj4gLVJPT1RGU19JU085
NjYwX0dFTklTT0lNQUdFX09QVFMgKz0gLXoKPiArUk9PVEZTX0lTTzk2NjBfWE9SUklTT19PUFRT
ICs9IC16CgpIYXZpbmcgdGhlIHRvb2wgbmFtZSBpbiB0aGUgdmFyaWFibGUgbmFtZSBpcyB0b3Rh
bGx5IHN1cGVyZmx1b3VzOyBmb3IKZXhhbXBsZS4gc3F1YXNoZnMgb3IgZXh0MiBkbyBub3QgaGF2
ZSBpdC4gU28sIEkndmUgZHJvcHBlZCB0aGF0IHdoZW4KYXBwbHlpbmcuCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKTm90ZTogZXh0MiBpcyBob3dldmVyIGEgYmFkIGV4YW1wbGU6IGl0cyB2
YXJpYWJsZXMgYXJlIG5vdCBwcm9wZXJseQpuYW1lc3BhY2UtcHJlZml4ZWQgd2l0aCBST09URlNf
Li4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgZWxzZQo+ICBST09URlNfSVNPOTY2MF9U
TVBfVEFSR0VUX0RJUiA9ICQoVEFSR0VUX0RJUikKPiAgZW5kaWYKPiBAQCAtMTI5LDkgKzEyOSw5
IEBAIFJPT1RGU19JU085NjYwX1BSRV9HRU5fSE9PS1MgKz0gUk9PVEZTX0lTTzk2NjBfRElTQUJM
RV9FWFRFUk5BTF9JTklUUkQKPiAgZW5kaWYgIyBST09URlNfSVNPOTY2MF9VU0VfSU5JVFJECj4g
IAo+ICBkZWZpbmUgUk9PVEZTX0lTTzk2NjBfQ01ECj4gLQkkKEhPU1RfRElSKS9iaW4vZ2VuaXNv
aW1hZ2UgLUogLVIgLWIgJChST09URlNfSVNPOTY2MF9CT09UX0lNQUdFKSBcCj4gKwkkKEhPU1Rf
RElSKS9iaW4veG9ycmlzbyAtYXMgbWtpc29mcyAtSiAtUiAtYiAkKFJPT1RGU19JU085NjYwX0JP
T1RfSU1BR0UpIFwKPiAgCQktbm8tZW11bC1ib290IC1ib290LWxvYWQtc2l6ZSA0IC1ib290LWlu
Zm8tdGFibGUgXAo+IC0JCSQoUk9PVEZTX0lTTzk2NjBfR0VOSVNPSU1BR0VfT1BUUykgXAo+ICsJ
CSQoUk9PVEZTX0lTTzk2NjBfWE9SUklTT19PUFRTKSBcCj4gIAkJLW8gJEAgJChST09URlNfSVNP
OTY2MF9UTVBfVEFSR0VUX0RJUikKPiAgZW5kZWYKPiAgCj4gLS0gCj4gMi4yNS4xCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
