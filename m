Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E38C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D11B60EC0
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 13:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D11B60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B329606A6;
	Sun, 14 Nov 2021 13:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhvNX6UoxdZn; Sun, 14 Nov 2021 13:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7725660699;
	Sun, 14 Nov 2021 13:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1B2D1BF3E0
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E6C760699
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 13:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ia2EkCWDH_tb for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 13:27:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82CD860692
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 13:27:33 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y26so35712850lfa.11
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 05:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JPj3MvRG72k5SOlfAJDrynMVrdxP1u/q8qImj0L6tHc=;
 b=fhBBi+5J/KYik17Z7IWsu0YjvS2bNC+Ki9ixcUHCD7fAMNDQJQ8SY0QTmeRhpg6J9D
 OzkV0VCdaSFxZyOgFF58SlbLfV5O9HLjZxIs4PjF1r2QZLHsWp8o5r2e9pDDJL7jxC0c
 +QAng+5glD+KHMhbGMBUph2TVVKTbqpPun/8mdru640yCe3jL/mwPMaR5ZhNPishmrPa
 1zCihnjZ41td8EmCW5KaysREF+7ucxYNZY4mRk034yh5zys00oZvFFYHI23A2pmNp7KH
 /1kNBLaW5q6+TB6H4w761L4SJXo0BNc1QrbMcbuT5YCpirC630sc/z8PygbkF1uaWKdZ
 XMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JPj3MvRG72k5SOlfAJDrynMVrdxP1u/q8qImj0L6tHc=;
 b=fvVcgzRzQLi7VkS3POgcIhSmOAtpAYohQz2TD9KM42Swr722737dSa76/mKnwlRoiU
 fGgpXaV86mjMzD7N4mwEUmM8GNPxCIxK9+WNaTKIu4RmjhtDTu/PbD6/x0PG+KjXKLxd
 c01njW0HOywRslCP308a0aDL9QmnQY9I9bs5H+pOlPrJOskj5uc8OJTwwgNWO4bwHUzR
 Gd0kybtS/6wHQ78/PiqT8SVAEbvceY4sJFm/yPYStPLgxNzJx1zIHUyyZZIAbx0c5Txk
 w5FfZvISxBT+ypPVoEg8CYugmSdPHr2r6FRP000vyk9Z/kSJahF4lpqT3hjLbvXAcYk/
 gbzg==
X-Gm-Message-State: AOAM532Qk9LdiMShIRhgrMh4OJvRr4DueVwQAoZSy+QnVF6ikHpIARyY
 ZazwACLeIhm8FM6wkPvVF3E7Y2orIW61Q2y7vCk=
X-Google-Smtp-Source: ABdhPJxmUDJDolyKp5rsbzLGqqCCvJr46/Uoi+LuEeMtye2DlFhX0XUHMhjzwqLeeJCzT3Z6CwHYQ5411J4ahc9sD7o=
X-Received: by 2002:a05:6512:30d:: with SMTP id
 t13mr27564011lfp.322.1636896451060; 
 Sun, 14 Nov 2021 05:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20211114103349.962611-1-fontaine.fabrice@gmail.com>
 <20211114133217.068c6c87@gmx.net>
In-Reply-To: <20211114133217.068c6c87@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Nov 2021 14:25:20 +0100
Message-ID: <CAPi7W81uk_pHoSFn_qRyeybHfdOiC7XUvgxbbPcKMb3-PvrprA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add libkrb5
 optional dependency
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSBkaW0uIDE0IG5vdi4gMjAyMSDDoCAxMzozMiwgUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNlLAo+Cj4g
T24gU3VuLCAxNCBOb3YgMjAyMSAxMTozMzo0OSArMDEwMCwgRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBsaWJrcmI1IGlzIGFuIG9wdGlv
bmFsIGRlcGVuZGVuY3kgd2hpY2ggaXMgZW5hYmxlZCBieSBkZWZhdWx0ICh3aXRoIG5vCj4gPiB1
c2VyIG9wdGlvbikgc2luY2UgdmVyc2lvbiA1LjE0LjAgYW5kCj4gPiBodHRwczovL2dpdGh1Yi5j
b20vcXQvcXRiYXNlL2NvbW1pdC85M2I3YjBlYzc2NTcyNDI3MjkxZDhlMmVlZjlhMTBlYjQ5OTQx
N2E5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFi
cmljZUBnbWFpbC5jb20+Cj4KPgo+IC0tLSBidWlsZC9xdDViYXNlLTUuMTUuMl9vcmlnL2NvbmZp
Zy5zdW1tYXJ5ICAgICAyMDIxLTExLTE0IDAwOjAwOjMzLjY5ODM3ODQ2NiArMDEwMAo+ICsrKyBi
dWlsZC9xdDViYXNlLTUuMTUuMi9jb25maWcuc3VtbWFyeSAyMDIxLTExLTE0IDEzOjE2OjQyLjgx
ODEzOTE5NCArMDEwMAo+IFsuLi5dCj4gQEAgLTU3LDcgKzU3LDcgQEAKPiAgICBPQ1NQLXN0YXBs
aW5nIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uIG5vCj4gICAgU0NUUCAuLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLiBubwo+ICAgIFVzZSBzeXN0ZW0gcHJveGllcyAuLi4uLi4u
Li4uLi4uLi4uLi4uLi4geWVzCj4gLSAgR1NTQVBJIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLiBubwo+ICsgIEdTU0FQSSAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4g
eWVzCj4gIFF0IEd1aToKPiAgICBBY2Nlc3NpYmlsaXR5IC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uIHllcwo+ICAgIEZyZWVUeXBlIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gbm8K
Pgo+Cj4gUmV2aWV3ZWQtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPgo+
IE91dCBvZiBpbnRlcmVzdCwgaG93IGRpZCB5b3Ugc3R1bWJsZSBvdmVyIHRoaXMgYW5kIHRoZSB6
c3RkIG9uZT8KSSBmb3VuZCBvdXQgdGhvc2UgaXNzdWVzIHdoZW4gaW52ZXN0aWdhdGluZyB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzL2EwYy9hMGNlMTFjMTk4NGEyYjUzNDRhMWQ2NTk0MDBkMGIwOGNkODg0NTEzL2J1aWxk
LWVuZC5sb2cKPgo+IFJlZ2FyZHMsCj4gUGV0ZXIKPgo+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3F0
NS9xdDViYXNlL3F0NWJhc2UubWsgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDViYXNlL3F0NWJhc2Uu
bWsgYi9wYWNrYWdlL3F0NS9xdDViYXNlL3F0NWJhc2UubWsKPiA+IGluZGV4IGIwNGQ3MTBkNzgu
LmJhMjk3MWRjMDggMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3F0NS9xdDViYXNlL3F0NWJhc2Uu
bWsKPiA+ICsrKyBiL3BhY2thZ2UvcXQ1L3F0NWJhc2UvcXQ1YmFzZS5tawo+ID4gQEAgLTIzMyw2
ICsyMzMsOCBAQCBRVDVCQVNFX0RFUEVOREVOQ0lFUyAgICs9ICQoaWYgJChCUjJfUEFDS0FHRV9R
VDVCQVNFX1RTTElCKSx0c2xpYikKPiA+ICBRVDVCQVNFX0NPTkZJR1VSRV9PUFRTICs9ICQoaWYg
JChCUjJfUEFDS0FHRV9MSUJHTElCMiksLWdsaWIsLW5vLWdsaWIpCj4gPiAgUVQ1QkFTRV9ERVBF
TkRFTkNJRVMgICArPSAkKGlmICQoQlIyX1BBQ0tBR0VfTElCR0xJQjIpLGxpYmdsaWIyKQo+ID4K
PiA+ICtRVDVCQVNFX0RFUEVOREVOQ0lFUyAgICs9ICQoaWYgJChCUjJfUEFDS0FHRV9MSUJLUkI1
KSxsaWJrcmI1KQo+ID4gKwo+ID4gIFFUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gJChpZiAkKEJS
Ml9QQUNLQUdFX1FUNUJBU0VfSUNVKSwtaWN1LC1uby1pY3UpCj4gPiAgUVQ1QkFTRV9ERVBFTkRF
TkNJRVMgICArPSAkKGlmICQoQlIyX1BBQ0tBR0VfUVQ1QkFTRV9JQ1UpLGljdSkKPiA+Cj4KQmVz
dCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
