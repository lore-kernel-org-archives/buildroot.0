Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6CDC3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C48610CB;
	Thu, 11 Jul 2024 10:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R45Ljx-gamGx; Thu, 11 Jul 2024 10:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B816106B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B816106B;
	Thu, 11 Jul 2024 10:29:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1EA51BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF4DD610CC
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhMajfREb564 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:29:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1897C6060D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1897C6060D
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1897C6060D
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:29:09 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-650469f59d7so7025067b3.2
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 03:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720693749; x=1721298549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TODwo/Vi1EFkQmTWcsDHbbkbIfDY6g2ArvB+nlrJJrQ=;
 b=lO8oTyhmTRU1yFloADNlF+ZXVZgiO7XKTB9bQT0xkiNPVOMuVYwRuWD0XLzrA0DHCr
 UsiJetSVYuJQPlQzMrf6XJNLUy+yWG64NMy/4wuvzKtexKgbKUpkv/DHgoZ9b++MNjF2
 vymtoM1dXUbkAlzWFpgmGlqswmVdhk2gcPS5/R3qGu+Ywl7lo3YDNC1QwK9yukJfw9KK
 wBafliKppHleVNh5EZApigJp9SUzkQQBZ8+WReF5iVe1dkdTNeVbRQaGPZZvcOfPkgMu
 R2qKuRZ245DTOC11guj46iUN6oH2zo1CUBvv6ZiDTlCavngMKl9mLpAUBrId4HYCP8gk
 fntA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWoxLmXiccNSWO/VnMZ6PzWvFRqL9+03tzM1CSwRyUufsWTIYLbafqthROxWaFZjKcegAXSt1HElaR++83i46XevNWdYAlMw==
X-Gm-Message-State: AOJu0Yz/091gE2kB8e0y2Zv1Dp5ie90LamQHVXlDYrCXPv6uV8FcRDsz
 fe2A2IYCw0AN3uP6yOkFqOyNClZX/VVphBpSrvHhfeP9AglCx8qZUH7o6geDdb0ugk6F+HSYcR+
 u+Gm5L4yKtpzviSQ22HuJpHL8mydnDNr1jni6oe9ZvxpGU9xVVJdm3g==
X-Google-Smtp-Source: AGHT+IETJHI4owORPi1aa1gpKGp3d96KHiHLKft+8JpukI11aB61IZgzFmHXjUzz/rEsVNJuH5GP8rXxV70bHEIWpro=
X-Received: by 2002:a05:690c:4d82:b0:627:ddc5:eb5c with SMTP id
 00721157ae682-658f02f4be0mr107212127b3.34.1720693748842; Thu, 11 Jul 2024
 03:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240711070525.1406612-1-dario.binacchi@amarulasolutions.com>
 <20240711105200.292f5783@windsurf>
 <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
 <20240711120439.3c5eb010@windsurf>
In-Reply-To: <20240711120439.3c5eb010@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 11 Jul 2024 12:28:57 +0200
Message-ID: <CABGWkvp8PHn5Tm8U4JJAvB5mWB9Nav7jijDaEh3fEO8xA+JgFA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720693749; x=1721298549;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TODwo/Vi1EFkQmTWcsDHbbkbIfDY6g2ArvB+nlrJJrQ=;
 b=FLqW6kRqCrC1A8msnNDR3705XgyN1w7GFOIfURw2rJRTTag/Kl9qr1kjMsnutFG3/h
 8lUdFDcomyuZtZE1ecP/9WypE6ryVhWBCB6hGkDedCPwvnd0No1wFW8rYk1JdscTPZP7
 /aYFAMturkag0oUsxS09QRmVfNeo8/hK42z34=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FLqW6kRq
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-mali-utgard-driver: fix
 patch fuzz
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
Cc: linux-amarula@amarulasolutions.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKT24gVGh1LCBKdWwgMTEsIDIwMjQgYXQgMTI6MDTigK9QTSBUaG9tYXMgUGV0YXp6
b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEFybm91
dCwKPgo+IE9uIFRodSwgMTEgSnVsIDIwMjQgMTE6NTE6MTEgKzAyMDAKPiBBcm5vdXQgVmFuZGVj
YXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4gPiA+IFRoYW5rcyBmb3IgdGhlIHBh
dGNoLCBidXQgSSdtIG5vdCBlbnRpcmVseSBzdXJlIHRoYXQncyBob3cgd2Ugd2FudCB0bwo+ID4g
PiBmaXggdGhpcyBpc3N1ZS4gSW5kZWVkLCBhcHBseS1wYXRjaGVzIGlzIHVzZWQgaW4gcXVpdGUg
YSBsb3Qgb2YKPiA+ID4gcGFja2FnZXMgdG8gYXBwbHkgcGF0Y2hlcyBmcm9tIERlYmlhbi4gRG8g
d2Ugd2FudCB0byBmaXggYWxsIHRob3NlCj4gPiA+IHBhdGNoZXMsIGxpa2UgeW91IGRpZCBmb3Ig
dGhlIHN1bnhpLW1hbGktdXRnYXJkLWRyaXZlcj8gSSdtIG5vdCBzdXJlLgo+ID4KPiA+ICAgQUZB
SUssIERlYmlhbiBwYXRjaGVzIHNob3VsZCBhcHBseSB3aXRob3V0IGZ1enogKHVubGVzcyB3ZSBk
byBzdHVwaWQgc3R1ZmYKPiA+IGxpa2UgYXBwbHlpbmcgb3VyIG93biBwYXRjaGVzIGZpcnN0KS4K
Pgo+IElzIHRoaXMgInNob3VsZCIgYmFzZWQgb24gYWN0dWFsIGV4cGVyaW1lbnRhdGlvbi92YWxp
ZGF0aW9uLCBvciBqdXN0Cj4gc29tZSBnZW5lcmFsIGFzc3VtcHRpb24/Cj4KPiA+ICAgSSB0aGlu
ayB0aGlzIGlzIHRoZSBvbmx5IGNhc2Ugd2hlcmUgd2UgYXJlIGRvd25sb2FkaW5nIHBhdGNoZXMg
dGhhdCBoYXZlCj4gPiBpbmNvcnJlY3QgZnV6eiAtIG9yIGRpZCB5b3UgZW5jb3VudGVyIGFueSBv
dGhlciBjYXNlLCBEYXJpbz8KClRoZXJlIHdhcyBhbHNvIHRoZSBsaWJtYWQgcGFja2FnZSB0aGF0
IHdhcyBmYWlsaW5nLCBidXQgZm9ydHVuYXRlbHkgaXQKd2Fzbid0IG5lY2Vzc2FyeQp0byBtb2Rp
ZnkgdGhlIGRvd25sb2FkZWQgcGF0Y2hlcy4gVGhlIGNvbW1pdApiMjExODRhODc3MzNmMmYyY2Nl
ZTY5Y2FkZTY4NzVjNTA3ZTQzOWRjCmhhcyBmaXhlZCB0aGUgaXNzdWUgYnkgcmV2ZXJzaW5nIHRo
ZSBvcmRlciBvZiBwYXRjaCBhcHBsaWNhdGlvbiBzdGVwczoKCi1MSUJNQURfUE9TVF9QQVRDSF9I
T09LUyArPSBMSUJNQURfQVBQTFlfREVCSUFOX1BBVENIRVMKK0xJQk1BRF9QUkVfUEFUQ0hfSE9P
S1MgKz0gTElCTUFEX0FQUExZX0RFQklBTl9QQVRDSEVTCgpUaGlzLCBhbG9uZyB3aXRoIHN1bnhp
LW1hbGktdXRnYXJkLWRyaXZlciwgd2VyZSB0aGUgb25seSB0d28gcGFja2FnZXMKd2l0aCBzdWNo
IGFuIGlzc3VlLgoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPiA+Cj4gPiAgIEFuZCBpbiB0
aGlzIHNwZWNpZmljIGNhc2UsIHVwc3RyZWFtIGlzIEdpdWxpbywgc28gSSBleHBlY3QgdGhhdCB0
aGUgUFIgd2lsbCBiZQo+ID4gYWNjZXB0ZWQgc29vbiBhbmQgd2UgY2FuIHNpbXBseSBidW1wLgo+
Cj4gQWgsIEkgZGlkbid0IHJlYWxpemUgd2UgaGFkIGFuIGFjdGl2ZSB1cHN0cmVhbSBmb3IgdGhp
cyBwYWNrYWdlLgo+IEluZGVlZCwgaXQgbWVhbnMgd2Ugd2lsbCBiZSBhYmxlIHRvIGRyb3Agb3Vy
IHBhdGNoLgo+Cj4gPiAgIEkgYWdyZWUsIGJ1dCBvbmx5IGlmIHdlIGFjdHVhbGx5IGVuY291bnRl
ciBhIHNpdHVhdGlvbiB3aGVyZSB0aGlzIGlzIHRoZSBjYXNlLgo+ID4gTm90ZSB0aGF0IHRoZSBp
bXBsZW1lbnRhdGlvbiB3aWxsIG5vdCBiZSBzdXBlciB0cml2aWFsICh3aWxsIHJlcXVpcmUgc29t
ZXRoaW5nCj4gPiBsaWtlIEZPT19BUFBMWV9QQVRDSEVTX0ZVWlopLgo+Cj4gV2VsbCwgbm8sIEkg
d2FzIGFzc3VtaW5nICQoQVBQTFlfUEFUQ0hFUykgdGhhdCBpcyB1c2VkIGluIHBhY2thZ2VzCj4g
d291bGQgZGVmYXVsdCB0byBhY2NlcHRpbmcgZnV6eiwgYW5kIG9ubHkgdGhlICQoQVBQTFlfUEFU
Q0hFUykgY2FsbCBpbgo+IG91ciBwYWNrYWdlIGluZnJhLCB3aGljaCBhcHBsaWVzIG91ciBwYXRj
aGVzLCB3b3VsZCBwYXNzIGFuIG9wdGlvbiB0bwo+IGRpc2FibGUgZnV6ei4KPgo+IFRob21hcwo+
IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9i
b290bGluLmNvbQoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXgg
RGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExl
IENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1
MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
