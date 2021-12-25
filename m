Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F96DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6777402AD;
	Sat, 25 Dec 2021 16:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPVvcrusBz6D; Sat, 25 Dec 2021 16:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1883D40271;
	Sat, 25 Dec 2021 16:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0161BF20F
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 16:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60BB340584
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 16:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQt-q8zr5rFx for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 16:17:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EF9140110
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 16:17:05 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id d10so34179054ybn.0
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 08:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=how2k/wdyrUtgWuRLmaaC06RF2+MzSUuEKAvfjgNy0o=;
 b=ff2KTKWnfdir6SMRj9xxj6TgEyDDrB7CQeJOIoVRM8xxOuoa10/OSf9dzwH5pt5K5x
 8FTG+RHryFQUStzpYhHqG1aaALvzhp1cRAXWL9VDgHDEqspBAOhFYAR1zD42oXVHW2yU
 wCtuZTh/HfFwrw/LC12TKVE10RvQ391XDs3ejoEv+SVzTalGjLpGPGFl8blPEgBN+6Gl
 C89cwEw0YzF5+KEBrzJN0M7bHbr9Fk2pbz08iJw5HyIrqL9B6WKDFfySsVuxt/8L0stW
 I4nqaD1mu13S/ISR81SaqWpcWvjNrKn2xOLDIhET2VRsowPezcLcqi9oXS661CZ8fMpr
 V78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=how2k/wdyrUtgWuRLmaaC06RF2+MzSUuEKAvfjgNy0o=;
 b=n59iMKz/oE5BYISMDZK6+IdinR6Vs8/3OzF2c2r3N8b70NIwoWwISIqp7GhNIrFDFN
 bfWGaCZ/A2spCKjb8odqgl3eapbNfCFGZBF4Z8qK2PV9KOe8IrptOxxXRAoyvDamt8a8
 5P50fu0Kqf9HfV7str46ARo+fjvyRVDM4Le48nxLFnx6Z7DvGTIVhIwWL/SyxOQHnWZb
 aIiygSQMJ1Rgq8fzh1fXRq6ys7SeEMpFxR4INW58DaZ1r2SNERATtchoL/jIO+wZEdIA
 uZ44Sjg0uYAt9z2RGepJof/hrd0PepZGXOuTEJjIL2iBH4krJna5ZXhcPw6zYjTq/nee
 6hjQ==
X-Gm-Message-State: AOAM531OlXfKI2xcv7GktfcgTUOEMeFGxpxVfWsvof49K3o1lJQCx6l2
 INnAGfiuKsL7SW0JUCBd5qS1hu6mT9aNPNBMsdu3EjD/aHseiQ==
X-Google-Smtp-Source: ABdhPJwX9UH0CCQtoblKJVum0B1mXGUCc72F4j8PPkUCqQQt/VfHSYf1EqblWar70ih938v5cvqF0JmK3Th2mpZ4o4k=
X-Received: by 2002:a25:28c:: with SMTP id 134mr10115233ybc.221.1640449024386; 
 Sat, 25 Dec 2021 08:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20211225050854.1138268-1-t123yh.xyz@gmail.com>
 <20211225153124.GS2603@scaer>
In-Reply-To: <20211225153124.GS2603@scaer>
From: Yunhao Tian <t123yh.xyz@gmail.com>
Date: Sun, 26 Dec 2021 00:16:53 +0800
Message-ID: <CAFQXTv3gAjSN7ZL-anmAuFsQeL4qqbZ-1d78ejOj=vmpcH-sNA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/cage: only enable XWayland if
 wlroots has X11
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKSSdtIHN0aWxsIG5vdCBhYmxlIHRvIGdldCBYV2F5bGFuZCB3b3JraW5nIHVuZGVy
IGNhZ2UsIGJlY2F1c2UKL3Vzci9iaW4vWFdheWxhbmQgaXMgbm90IGZvdW5kLiBJIGNvdWxkbid0
IGZpbmQgYW4gb3B0aW9uIGluIEJ1aWxkcm9vdAp0byBidWlsZCB0aGlzIGJpbmFyeS4gSSB3b3Vs
ZCBsaWtlIHRvIGFzayBpZiB0aGVyZSdzIGFueSB0aGluZyBJJ20gbWlzc2luZz8KClJlZ2FyZHMs
Cll1bmhhbwoKCllhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiDkuo4yMDIx
5bm0MTLmnIgyNeaXpeWRqOWFrSAyMzozMeWGmemBk++8mgo+Cj4gWXVuaGFvLCBBbGwsCj4KPiBP
biAyMDIxLTEyLTI1IDEzOjA4ICswODAwLCBZdW5oYW8gVGlhbiBzcGFrZSB0aHVzbHk6Cj4gPiBD
YWdlIHJlcXVpcmVzIHdscm9vdHMgdG8gYmUgYnVpbHQgd2l0aCBYMTEgZW5hYmxlZAo+ID4gaW4g
b3JkZXIgdG8gZW5hYmxlIFhXYXlsYW5kLCBvdGhlcndpc2UgaXQgd2lsbCBmYWlsCj4gPiB3aXRo
IGVycm9yOgo+ID4KPiA+ICJFUlJPUjogUHJvYmxlbSBlbmNvdW50ZXJlZDogQ2Fubm90IGJ1aWxk
IENhZ2Ugd2l0aAo+ID4gWFdheWxhbmQgc3VwcG9ydDogd2xyb290cyBoYXMgYmVlbiBidWlsdCB3
aXRob3V0IGl0Igo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmhhbyBUaWFuIDx0MTIzeWgueHl6
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvY2FnZS9jYWdlLm1rIHwgMiArLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2NhZ2UvY2FnZS5tayBiL3BhY2thZ2UvY2FnZS9jYWdlLm1rCj4g
PiBpbmRleCBhNjYxODU3YTk1Li42ZjEwNDZlYjJmIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9j
YWdlL2NhZ2UubWsKPiA+ICsrKyBiL3BhY2thZ2UvY2FnZS9jYWdlLm1rCj4gPiBAQCAtMTEsNyAr
MTEsNyBAQCBDQUdFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiAgQ0FHRV9ERVBFTkRFTkNJ
RVMgPSBob3N0LXBrZ2NvbmYgd2xyb290cwo+ID4gIENBR0VfQ09ORl9PUFRTID0gLURtYW4tcGFn
ZXM9ZGlzYWJsZWQKPiA+Cj4gPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9YT1JHNykseSkKPiA+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX1hPUkc3KSQoQlIyX1BBQ0tBR0VfV0xST09UU19YMTEpLHl5KQo+
Cj4gQlIyX1BBQ0tBR0VfV0xST09UU19YMTEgYWxyZWFkeSBkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X1hPUkc3LCBzbyBrZWVwaW5nCj4gQlIyX1BBQ0tBR0VfWE9SRzcgaW4gdGhpcyBjb2RpdGlvbiBp
cyByZWR1bmRhbnQsIHNvIEkgZHJvcHBlZCBpdC4KPgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICBDQUdFX0NPTkZfT1BUUyAr
PSAtRHh3YXlsYW5kPXRydWUKPiA+ICBlbHNlCj4gPiAgQ0FHRV9DT05GX09QVFMgKz0gLUR4d2F5
bGFuZD1mYWxzZQo+ID4gLS0KPiA+IDIuMjUuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+
IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
