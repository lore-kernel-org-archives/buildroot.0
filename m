Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C77C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A80860D6A;
	Thu, 30 Dec 2021 15:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejOWm3WWeSX0; Thu, 30 Dec 2021 15:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E6B60D53;
	Thu, 30 Dec 2021 15:36:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECCEB1BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC25A4151B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNl0OZILVXdH for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:36:03 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615A141514
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:36:03 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2xMPnJLV9LDgd2xMPnppSg; Thu, 30 Dec 2021 16:28:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640878138; bh=SSEc26X0XDrfbphJKeeZK1oDFOlplZtxYwqcnvLIK+A=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HeMNvV9cJ+yyHFhvE8FhiGUquyz720GHsx8iZD9nR3aSkP0EmUHMw9kW7cj3ydhvR
 keLHRm0ngGAQw4xg4rArsFq8AxTZOuVM6oEnRxyZKviFoNcSZz6xbyCT1kg7trFCW2
 vG2XBOQ9pTBEpwCkip3WhKU56dlaVd75YTZ6sV9ehAOoNp6kNWIiwp+txTv7IdkWPE
 r022y9IWIYg7Z2jRL0niqGvYEFDqF9ncDB8SJXPwDli3tAkEzmUJ361XWLJxDoP/i6
 aTNQEncrI15kSLg/oXZk27DhMU72ACFA9pGkyn29MxcOO4NDoV7FhNXtWkQaTNxgBq
 Viiewq/qzfX2w==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
 <20200306071440.30433-5-miquel.raynal@bootlin.com>
 <20211230151428.1a49b1bf@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <a9bed606-385d-137d-134f-71bdf9d20222@benettiengineering.com>
Date: Thu, 30 Dec 2021 16:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230151428.1a49b1bf@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIa9Tf5ujxkjlQQ6vT9BwZLjRqFjmWts/74h5Zr6+5p8NvlgiRxiSGvEMrMBtkCNgYGJAmOZsJ0pmJ4Aq1R8sdlioTUqgso0YXAKrGF1ZK61bfOEzf3l
 JmiqGmt5k8lT3LFrhqCsLgX7hQCRGZTsX9LqXWakpykfgQ5Gqml0UEb8H4UZOtwwj5h5/FvSZTAoYOwuCf7bNhafn0prfuRngTVEQegUsKYGQ0DW3ViRzW/G
 eHKl3i9RjGHVwvZYf7LJHEmg/lIL1tcuvECKhcrIT+M9Q4bQMWiKR3OMCVE9W331TYt1ix109baHfF9WVK+RMIk/IhwhVDI8UPYpEbY8+WlfVo5clS3bgxGB
 YXxhv/hgj7C03PEpdCpXGPYsC6GMN53faBi87HLJ//Apz/b3Q7+Vv2Q90z/y1BAxM91lHzGFg+31tG12mPh34Ur6CXzOCu80k9YwL+90pkaDUVgFifTNGrfF
 gP4y/KTTwDQKycWJpYGOIx4B3NzLTp+kfeV0PMY2BMXLDfuqHpa1BiGM/fk=
Subject: Re: [Buildroot] [PATCH 4/7] package/mali-bifrost-driver: new package
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBNaXF1w6hsLAoKT24gMzAvMTIvMjEgMTU6MTQsIFRob21hcyBQZXRhenpvbmkg
d3JvdGU6Cj4gSGVsbG8gTWlxdcOobCwKPiAKPiBPbiBGcmksICA2IE1hciAyMDIwIDA4OjE0OjM3
ICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gCj4+ICtNQUxJX0JJRlJPU1RfRFJJVkVSX1ZFUlNJT04gPSB2MC4xCj4+ICtNQUxJX0JJRlJP
U1RfRFJJVkVSX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGJvb3RsaW4sbWFsaS1iaWZyb3N0LCQoTUFM
SV9CSUZST1NUX0RSSVZFUl9WRVJTSU9OKSkKPj4gK01BTElfQklGUk9TVF9EUklWRVJfREVQRU5E
RU5DSUVTID0gbGludXgKPj4gK01BTElfQklGUk9TVF9EUklWRVJfTElDRU5TRSA9IEdQTC0yLjAK
Pj4gK01BTElfQklGUk9TVF9EUklWRVJfTElDRU5TRV9GSUxFID0gTElDRU5TRQo+PiArTUFMSV9C
SUZST1NUX0RSSVZFUl9NT0RVTEVfU1VCRElSUyA9IHI4cDAvZHJpdmVycy9ncHUvYXJtL21pZGdh
cmQKPiAKPiBUaGVyZSBpcyBzb21ldGhpbmcgcmVhbGx5IG9kZCBoZXJlOiB3aHkgaXMgdGhpcyBw
YWNrYWdlIG5hbWVkCj4gbWFsaS1iaXRmcm9zdC1kcml2ZXIgaWYgdGhlIHN1YmRpcmVjdG9yeSB5
b3UncmUgYnVpbGRpbmcgaXMKPiByOHAwL2RyaXZlcnMvZ3B1L2FybS9taWRnYXJkID8gYml0ZnJv
c3QgYW5kIG1pZGdhcmQgYXJlIHR3byBkaWZmZXJlbnQKPiBnZW5lcmF0aW9ucyBvZiB0aGUgQVJN
IE1hbGkgR1BVLCBhdCBsZWFzdCBhY2NvcmRpbmcgdG8KPiBodHRwczovL2VuLndpa2lwZWRpYS5v
cmcvd2lraS9NYWxpXyhHUFUpLgo+IAo+IENvdWxkIHlvdSBjbGFyaWZ5ICh5b3Ugb3Igc29tZWJv
ZHkgZWxzZSwgZm9yIHRoYXQgbWF0dGVyKSA/CgpJJ20gaW50ZXJlc3RlZCB0b28gdG8gdGhpcyBe
Xl4KCkkgaGFkIG5vIGNoYW5jZSB0byB0ZXN0IGl0IG9uIHJlYWwgaGFyZHdhcmUgZm9yIGxhY2sg
b2YgdGltZSA6LS8gc28gSSAKZG9uJ3Qga25vdyBpZiBpdCB3b3JrcywgYW5kIGl0IHNob3VsZCBu
b3QgYmUgZXhwZWN0ZWQgdG8gd29yay4gSSd2ZSAKY29tcGFyZWQgcjggdmVyc2lvbiBvZiBtaWRn
YXJkIGFnYWluc3QgYmlmcm9zdCBhbmQgdGhleSBhcmUgcHJldHR5IApkaWZmZXJlbnQuCgpJJ20g
d29ya2luZyBvbiB0aGlzIHBhdGNoc2V0IGluIHNwYXJlIHRpbWVbMV0gd2l0aCB0aGUgZ29hbCB0
byBjcmVhdGUgYSAKc2luZ2xlIG1hbGktZHJpdmVyIHBhY2thZ2UgdG8gZGVhbCB3aXRoIFV0Z2Fy
ZCwgTWlkZ2FyZCBhbmQgQmlmcm9zdC4KSSd2ZSBhbHJlYWR5IHJlcXVlc3RlZCB0byBjaGFuZ2Ug
cmVwb3NpdG9yeSBuYW1lIGZyb20gCm1hbGktYmlmcm9zdC1kcml2ZXIgdG8gbWFsaS1kcml2ZXIg
YW5kIGl0J3MgYmVlbiBkb25lIHBsdXMgbWVyZ2luZyAKcGF0Y2hlcyB0byBhbGxvdyBidWlsZGlu
ZyB3aXRoIHVwIHRvIExpbnV4IDUuMTVbMl0uCgpUaG9tYXMsIGRvIHlvdSB3YW50IG1lIHRvIHNl
bmQgdGhlIHYyIHBhdGNoc2V0IGluWzFdIHRvIEJ1aWxkcm9vdCAKbWFpbGluZyBsaXN0PyBJdCdz
IG5vdCBjb21wbGV0ZSBhdCBhbGwsIGJ1dCBpdCdzIHNvbWUgc3RlcCBmb3J3YXJkLgoKWzFdOiBo
dHRwczovL2dpdGh1Yi5jb20vZ2l1bGlvYmVuZXR0aS9idWlsZHJvb3QvY29tbWl0cy9kZXYvbWFs
aS1yZWJhc2UKWzJdOiBodHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi9tYWxpLWRyaXZlcgoKQmVz
dCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
