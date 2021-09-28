Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E80BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:35:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8604260FC2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 05:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8604260FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33ED360ACB;
	Tue, 28 Sep 2021 05:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fD66KeRHfG-d; Tue, 28 Sep 2021 05:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C7A60896;
	Tue, 28 Sep 2021 05:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3041BF847
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98E4460896
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 05:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Le_nUROac4l for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 05:35:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5AE56078B
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 05:35:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9ded:7cc8:164a:d8a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EBDDB780306;
 Tue, 28 Sep 2021 07:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632807335;
 bh=UTHxPzt9WmQXsh2eUOUa8KbEJXmi+/aC8qpd6i3HyP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N8a2cfKsBmr3zyvxhl95Zn0wdNbX7k3PlOWZxHFWBKCki5DSbdB+MfzqcECW0/Tbs
 kMV9Ph/nQcxvPrDr0t4O5OSmZzlH+kJ2O8+S38sy1HfG+N/qYZRgyahyLeEluKdDWi
 WsXXd/Fawm3zEUiOrQUg0rpZB3nDkRuer/Gxgg/rBVwkul9OwsAEgYQSnUZMFMI62+
 8nKyRqJ3zjejsoKdBBL+69tUraN5qX/ph+fZEPbA2pV/Dbod7tzk72ERGaFq/WUaMf
 z8KynDCxAzq1mpxZvqo0jMVtL3n/8Po1Qy0o8EdU0xxmnaN2rEDiaAP3/cZSNlRQn7
 CuhOlP5Mw+eSg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Sep 2021 07:35:28 +0200
Date: Tue, 28 Sep 2021 07:35:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210928053528.GH1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-4-kory.maincent@bootlin.com>
 <20210927204355.GE1504958@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927204355.GE1504958@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 3/7] fs/iso9660: add support to Grub EFI
 bootloader in the image
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

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjcgMjI6NDMgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IE9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+ID4gQWRkIHN1cHBvcnQgdG8gYm9vdCB0aGUgR3J1YiBib290bG9hZGVyIGZy
b20gYW4gRUZJIEJJT1MgaW4gdGhlIElTTzk2NjAKPiA+IGltYWdlLgpbLS1TTklQLS1dCj4gPiAt
aWZlcSAoJChCUjJfVEFSR0VUX1JPT1RGU19JU085NjYwX0dSVUIyKSx5KQo+ID4gK2lmZXEgKCQo
QlIyX1JFUFJPRFVDSUJMRSkseSkKPiA+ICtST09URlNfSVNPOTY2MF9WRkFUX09QVFMgPSAtLWlu
dmFyaWFudAo+ID4gK1JPT1RGU19JU085NjYwX0ZJWF9USU1FID0gdG91Y2ggJChTT1VSQ0VfREFU
RV9FUE9DSCkKWy0tU05JUC0tXQo+IFNvIEkndmUgY2hhbmdlZCB0bzoKPiAgICAgaWZlcSAoJChC
UjJfUkVQUk9EVUNJQkxFKSx5KQo+ICAgICBST09URlNfSVNPOTY2MF9WRkFUX09QVFMgPSAtLWlu
dmFyaWFudAo+ICAgICBST09URlNfSVNPOTY2MF9GSVhfVElNRSA9IHRvdWNoIC1kIEAkKFNPVVJD
RV9EQVRFX0VQT0NIKQo+ICAgICBlbHNlCj4gICAgIFJPT1RGU19JU085NjYwX0ZJWF9USU1FID0g
QDoKCkFyZywgSSBtYWRlIGEgbWlzdGFrZTogdGhlIGNvbW1hbmRzIGZpciBmaWxlc3lzdGVtcyBh
cmUgZXhlY3V0ZWQgYXMgYQpzdGFkbmFyZCBNYWtlZmlsZSBydWxlOyBpbnN0ZWFkLCB0aGV5IGFy
ZSBzdGFzaGVkIGludG8gYSBzY3JpcHQgYW5kCmV4ZWN1dGVkIGJ5IHRoZSBzaGVsbCAodW5kZXIg
ZmFrZXJvb3QpLgoKU28sIHdlIGNhbiBxdWllc2NlIGEgY29tbWFuZCBieSBwcmVmaXhpbmcgaXQg
d2l0aCAnQCcuCgpJJ3ZlIHB1c2hlZCBhIGZpeC4KClNvcnJ5IGZvciB0aGUgbWVzcy4uLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
