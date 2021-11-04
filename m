Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9919C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 01:05:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3786961106
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 01:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3786961106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F330180F24;
	Thu,  4 Nov 2021 01:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mp00dL_fOFTR; Thu,  4 Nov 2021 01:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B21380F1A;
	Thu,  4 Nov 2021 01:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4A571BF30A
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 01:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0191400E7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 01:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ruFRKkPPo2km for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 01:05:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4C7B400DF
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 01:05:06 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id iRBhmwE11umo4iRBhmmApk; Thu, 04 Nov 2021 02:05:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635987905; bh=stTzB3NapoRzVsGckCKzAkwpyxqwuHyFMfH4e9RAvA4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=GwUfT4NwuYpXG0LFbDB7b/U4Q0Z7WcdTxohEib9kuOPjHwZ0Ri2HBCCJl2T1DXgHy
 ZKRHneDACeIE5C+a1V4Sb/fSYrN19xpEj3r4UEqiKXc0DRx7AM0cCVu0OqTVLoPLo5
 hggxC57+MkzGxto8APrts0N7XocsLuwH8wCjfKvYnqutwFNePuJJhQwZo1k0cyleKa
 z8rMHNeJTLuAogBPUjw7KUP061t97e21QgRF6jUKFnsx7NRDa7zNzdjkqI7CFciX5E
 WoCK4+nAhlUBtjhwLg5iZ3rwO7fIudWOF2X23DO1XzknHWOa7OoK8q2Hbt92zSfTTH
 O07xYvimZTbhQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 4 Nov 2021 02:05:04 +0100
Message-Id: <30694DE8-5371-4D48-9FF2-550A1D34C097@benettiengineering.com>
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
In-Reply-To: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
To: stsp <stsp2@yandex.ru>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfNIEK02mk7q6HombKeCII9WQ2zguz8i0MHwO895uuV6r3XtDY1VyyTgYSC/0CY532leRwqOONlQCado8Jh6nvpwuetTwgx3+kHlHKSIp6GBnK9mnf3Do
 8N6t4kEYdX9UZmRBxWTjTt/sJX6ZZa7VZHXb1LFsakQf6Ene4hbp2xc7HDoIpTwjaPPMl8LacCvZ/wTPCNcHv/Yo2hj/y0LZrSa1wRXu/bJ2NaaSuXlX7Dd+
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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

SGksCgo+IElsIGdpb3JubyAzIG5vdiAyMDIxLCBhbGxlIG9yZSAyMTowNCwgc3RzcCA8c3RzcDJA
eWFuZGV4LnJ1PiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hlbGxvLgo+IAo+IEkgY29uZmlndXJlZCBi
dWlsZHJvb3QgZm9yCj4gY29yZWk3IENQVSB0byB1c2UgdGhlIGJvb3RsaW4KPiB0b29sLWNoYWlu
LiBBcyBleHBlY3RlZCwgbm90aGluZwo+IHdvcmtlZCwgYXMgSSBoYXZlIHRoZSAodmVyeSBvbGQp
Cj4gQU1EIENQVS4KPiBUaGVuIEkgZGlkIHRoZSBmb2xsb3dpbmc6Cj4gQlIyX1RBUkdFVF9PUFRJ
TUlaQVRJT049Ii1tYXJjaD14ODYtNjQgLW10dW5lPWdlbmVyaWMiCj4gCj4gbWFrZSBjbGVhbgo+
IGFuZCBmdWxsIHJlYnVpbGQuCj4gQWZ0ZXIgdGhhdCBJJ3ZlIGdvdCB3b3JraW5nCj4ga2VybmVs
IGFuZCB0aGUgdXNlci1zcGFjZQo+IHN0YXJ0cyBib290aW5nLCBidXQgc3RpbGwgbWFueQo+IHVz
ZXItc3BhY2UgYXBwcyBvciBsaWJzIGNyYXNoCj4gd2l0aCBhbiBpbGxlZ2FsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbi4KPiBJIGV2ZW4gY2hlY2tlZCB0aGF0IHRoZSB0b29sY2hhaW4td3JhcHBlcgo+
IGdlbmVyYXRlZCBieSBidWlsZHJvb3QsIGhhcyB0aGVzZQo+IHN0cmluZ3MgZW1iZWRkZWQsIHNv
IG15IGNoYW5nZQo+IGNlcnRhaW5seSBoYWQgc29tZSBlZmZlY3QuIEJ1dAo+IGl0IHdhcyBub3Qg
ZW5vdWdoLgo+IAo+IFNvIGl0IGxvb2tzIGxpa2UgdGhlCj4gQlIyX1RBUkdFVF9PUFRJTUlaQVRJ
T04KPiBpcyBzb21laG93IGFwcGxpZWQgbm90IHRvIGFsbAo+IGJ1aWx0IHBhY2thZ2VzPyBXaHkg
Y2FuIHRoYXQgYmU/CgpVbmZvcnR1bmF0ZWx5IHNvbWUgcGFja2FnZShJIHdvdWxkIHNheSBtYW55
KSBoYXMgdGhlaXJzZWxmIGEgYnJva2VuIHdheSB0byBjb3JyZWN0bHkgcGFzcyBleHRlcm5hbCBD
L0NYWC9MREZMQUdTLiAKVXN1YWxseSB0aGV5IGludGVybmFsbHkgb3ZlcnJpZGUgc29tZSBmbGFn
IHRoYXQgbWFrZXMgbnVsbCB3aGF0IHdlIHBhc3Mgb3Igd29yc2UgdGhleSBjb21wbGV0ZWx5IGln
bm9yZSB0aGVtIGJ5IHVzaW5nIGhhcmQgY29kZWQgZmxhZ3MuClRvIGZpeCB0aGlzIHNwZWNpZmlj
IHByb2JsZW0gd2Ugc2hvdWxkIGdvIHRocm91Z2ggZXZlcnkgcGFja2FnZSBhbmQgZml4IHRoZSBw
YWNrYWdlIGJ1aWxkIHN5c3RlbSBpdHNlbGYoYSBodWdlIHdvcmspLgoKPiBJcyB0aGVyZSBhbnkg
b3RoZXIgd2F5IEkgY2FuCj4gdXRpbGl6ZSBib290bGluIHRvb2wtY2hhaW4gZm9yIHNvbWUKPiAi
Z2VuZXJpYyIgKG5vbi1TU0UzLzQpIENQVT8KCkhlcmUgSSBsZWF2ZSB0aGUgYW5zd2VyIHRvIG1v
cmUgZXhwZXJpZW5jZWQgcGVvcGxlLgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
