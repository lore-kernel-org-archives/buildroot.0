Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E770EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 07:49:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273D761175
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 07:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 273D761175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A4D40298;
	Tue,  9 Nov 2021 07:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4KTSTmy2_9I; Tue,  9 Nov 2021 07:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8CB40291;
	Tue,  9 Nov 2021 07:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07EA41BF34A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 07:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E527960603
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 07:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiM85pr9TJ5E for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 07:49:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62058605FC
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 07:49:28 +0000 (UTC)
Received: from smtpclient.apple ([151.68.167.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id kLshmkCH3DBs2kLshm2X0G; Tue, 09 Nov 2021 08:49:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636444165; bh=x29czv+O6gqAWuCIuWlJecHzfRRqXOkofsmsjYsO7fI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Ue29/UYuosnja47naNILs2lPdAZ48SODMsZCDWNPvrciPDbETa7NpvHUOHv0ACp0+
 vZtpMcIEYaGiwbopdrqOke2K0HWz7rcWSihMAj8yvpCE38sv2x7nuO6Xbawg1HiXjI
 hfFTObW1029y4t+th5Gg9BmYdcx1dsDsGV9MjNOumjgC6U7qUrAwiiGuCjOkXNuRSG
 sh7bhACxSiaSI7TI/pLbdAVU3WuBEb0JkqmoXN/lXFeFsFDTm/rOJw2QIDwh3sE3Oq
 NZ42Tlz6uTNV3GD3jVPEptT7rQ7BjGKjr171ckGMxWJF9PdJIyjNAn8pgn6BEPJ2dq
 crKoV57VfHEbw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 9 Nov 2021 08:49:22 +0100
Message-Id: <CED41E68-52A7-465C-874E-1991C9320A5D@benettiengineering.com>
References: <CAEyMn7byVtNQjGB3uEnsitCCTsnn3LBxFoxErRAFOkUXqEasVQ@mail.gmail.com>
In-Reply-To: <CAEyMn7byVtNQjGB3uEnsitCCTsnn3LBxFoxErRAFOkUXqEasVQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfOP5QpK9cJEg9DlPnAcx0dwia9HV0UgqBFcabCPrlwHZ4txAvt/F2zjiRjWb1IyWhcVTi2iCw9wUyUDUJOH+N9Kv5T/S2lVqVgT7oMDjGh5boWR/kKAg
 8HZ6dVWiSbc0U76RWA6aJBOFcY6pCCMeWXhgA+asVqb+3alNsZ8YqvfU/XQkklQtiRMZll/YMfA4Ly+Pjv/uBpwUl1HvVB/KFJkMwLpvGmhVvqC2k0Qk4Gzz
 MZX8UQYDfiUjKnMjazLQXauUW67IgaxWujI2R/vmuXwEFz1kkPo8GuyvkTa7tyDtHX8Zs7fECjuPHAuEi5tLxMrDZhr8Z03B+iMFEFOEWdDzlAGkw0C4PRsw
 r4UBVWeeZ90ocg5WapqFk5xOXu44ngY2oIA3NbAmVasaG9sTKz5Zw3pgKwZgnjMzC+mkwGuEtgvqz6YZSLT2M67mwXj3cxWqey22opb0gEffycw+8AQR/NJh
 +A6qSLt/yFPy0YvEQ1ZNAbeltN44f48a4HEkKw==
Subject: Re: [Buildroot] [PATCH 6/7] board/kontron/pitx-imx8m/genimage.cfg:
 fix option suffix
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
Cc: Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?utf-8?Q?Micha=C5=82_=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSGVpa28sCgo+IElsIGdpb3JubyA5IG5vdiAyMDIxLCBhbGxlIG9yZSAwODozOCwgSGVpa28g
VGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hpIEd1
aWxpbywKPiAKPiAKPj4gQW0gRGkuLCA5LiBOb3YuIDIwMjEgdW0gMDA6MDUgVWhyIHNjaHJpZWIg
R2l1bGlvIEJlbmV0dGkKPj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Ogo+PiAKPj4gT3B0aW9uICdvZmZzZXQgPSA0aycgbXVzdCBiZSAnb3B0aW9uID0gNEsnLgo+IAo+
IElzIGl0IHJlYWxseSBhIG11c3QgdGhhdCB0aGUga2lsb2J5dGUgdmFsdWUgaGFzIGFuIHVwcGVy
Y2FzZSAnayc/IEZyb20KPiB0aGUgY29kZSBJIHNlZSB0aGF0IGJvdGggayBhbmQgSyBhcmUgYWxs
b3dlZCBmb3IgdGhhdC4gQnV0IEkgaGF2ZQo+IG5vdGhpbmcgYWdhaW5zdCB1bmlmeWluZyBpdC4K
ClllcywgaXTigJlzIGZvciB1bmlmeWluZywgSSBoYXZlIHRvIGFkZCBpdCB0byB0aGUgbWFudWFs
LgoKPiAKPiBTbWFsbCBuaXRwaWNrIGhlcmU6IHMvJ29wdGlvbiA9IDRLJy9vcHRpb24gJ29mZnNl
dCA9IDRLJy8KCk9oLCB5ZXMsIHRoYW5rIHlvdS4gSSByZXdvcmQgYW5kIHNlbmQgYSB2MiB0b25p
Z2h0LgoKVGhhbmsgeW91CkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+
IAo+PiAKPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+PiBib2FyZC9rb250cm9uL3BpdHgtaW14OG0v
Z2VuaW1hZ2UuY2ZnIHwgMiArLQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9ib2FyZC9rb250cm9uL3BpdHgtaW14OG0v
Z2VuaW1hZ2UuY2ZnIGIvYm9hcmQva29udHJvbi9waXR4LWlteDhtL2dlbmltYWdlLmNmZwo+PiBp
bmRleCBjMzM1YjBjMDI2Li5jNzhlZjBmOTEwIDEwMDY0NAo+PiAtLS0gYS9ib2FyZC9rb250cm9u
L3BpdHgtaW14OG0vZ2VuaW1hZ2UuY2ZnCj4+ICsrKyBiL2JvYXJkL2tvbnRyb24vcGl0eC1pbXg4
bS9nZW5pbWFnZS5jZmcKPj4gQEAgLTUsNyArNSw3IEBAIGltYWdlIHNkY2FyZC5pbWcgewo+PiAg
ICAgICAgcGFydGl0aW9uIGlteC1ib290IHsKPj4gICAgICAgICAgICAgICAgaW4tcGFydGl0aW9u
LXRhYmxlID0gIm5vIgo+PiAgICAgICAgICAgICAgICBpbWFnZSA9ICJpbXg4LWJvb3Qtc2QuYmlu
Igo+PiAtICAgICAgICAgICAgICAgb2Zmc2V0ID0gMzNrCj4+ICsgICAgICAgICAgICAgICBvZmZz
ZXQgPSAzM0sKPj4gICAgICAgIH0KPj4gCj4+ICAgICAgICBwYXJ0aXRpb24gcm9vdGZzIHsKPj4g
LS0KPj4gMi4yNS4xCj4gCj4gQWNrZWQtYnk6IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdt
YWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
