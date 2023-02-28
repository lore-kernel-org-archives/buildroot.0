Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B8DC64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 17:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7E064057A;
	Tue, 28 Feb 2023 17:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7E064057A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPb5aWjt1hni; Tue, 28 Feb 2023 17:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D12CA40543;
	Tue, 28 Feb 2023 17:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12CA40543
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8261C61F6
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 17:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15A0381EEC
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 17:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A0381EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hKRqra8gnZX for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 17:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CFC281EE6
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CFC281EE6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 17:10:28 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i5so9463031pla.2
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 09:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677604227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5Gm32GFtqBo1PF2afDy4kUHcagHKscUHFC2lfU1sgk=;
 b=5r3wunHAiaQbW3vvCcqys3+wYWfbsFJTokpTtFKS2fijsg7RBP6+0gXbIZuh5qUKaw
 udfoypMcpOK/T7EavE+cerysKoOgPIWGBg+6eGm0j/g5O/7xwAbSQRdiH0KcPa+/0yDw
 nFFsaSnUy4+7x30qjeex8hqLSjHwpd2LFC70ydKdd/fk3IyMX59lc4YGm2Rm1SilkDIH
 eaEirRAVE2C4Oe/3oPLjIKBhOAvk3D+08kmsE/WShzysT7br9Javw6gKdMauVnMzBL6i
 tdy+ldecONySmmr2ME0jbKFzJe14YjxhuUOuqEM2XZipTspQxNMeSejz5ISBm2x/ClUG
 IygA==
X-Gm-Message-State: AO0yUKWT5to7WyOqASQYSLbZiRLoxHqyl0w5e+2vy1S5q+wBEJ9J31R7
 KNfsro+xKGx0dLekuMMjklihrfj6QVgH9BhxyUJ9ZQ==
X-Google-Smtp-Source: AK7set+67ZiStPyTuyRDbRmnX0wY0Em2JQe3ogJDlVsQxGDmFxJjOer50KvXEkLbMi5yXxvwt+08aLOrqrZQm6yXVYo=
X-Received: by 2002:a17:902:ce87:b0:19a:7f9c:66e3 with SMTP id
 f7-20020a170902ce8700b0019a7f9c66e3mr2465821plg.5.1677604227628; Tue, 28 Feb
 2023 09:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
 <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
 <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
 <CANqv2T2r0sbnwdMinzdw7ryw9CUsx=jwCD0hvA3FT2mxVFQz8g@mail.gmail.com>
In-Reply-To: <CANqv2T2r0sbnwdMinzdw7ryw9CUsx=jwCD0hvA3FT2mxVFQz8g@mail.gmail.com>
From: stephane gonauer <stephane.gonauer@6wind.com>
Date: Tue, 28 Feb 2023 18:10:17 +0100
Message-ID: <CANqv2T0Riojve2sNUNky28Vt8A=sMwVuZEsTZv66Zace1JnRWA@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=6wind.com; s=google; t=1677604227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5Gm32GFtqBo1PF2afDy4kUHcagHKscUHFC2lfU1sgk=;
 b=Z0icx9U6vnXs+f4ByOZGZUTX5ZSlg42lje3EeTcqqS/R5oMNYh2TXMCkZnDtnWRbT2
 ZrYDuT8Zx4Uvo6x3dWSWgJ9gAfSFnhQnIYgiZjvLJZJ9tng3XmSW6M7McMEv8ZEII0lD
 TKpqTmXj1fj+Ymy5hNMeEb1FscTc2OKo4mWGvDT/gTVIVa+xDjwABruidSr2ZelCfKLe
 kxGzIx1DtNLXd2zVLLl6yr1fxhCcMHooTAIo3z3XQx7AP1xRw+Qd8CP8oeuYnXASsGWz
 Y6sdyGSZL5cf9rhFm+mkv5iFwo49yTWJElOjhXP/oVB37NUTNHU/uDnJ4o7ktxnGflHy
 mQwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com
 header.a=rsa-sha256 header.s=google header.b=Z0icx9U6
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJZiBteSBwcmV2aW91cyBlbWFpbCBpcyBub3QgY2xlYXIgOgoKLSBxZW11X3g4Nl82NF9k
ZWZjb25maWcgKyBCUjJfUEFDS0FHRV9TSEFET1cgLT4gd29ya3MKLSBxZW11X3g4Nl82NF9kZWZj
b25maWcgKyBCUjJfUEFDS0FHRV9TSEFET1cgICsgQlIyX1BBQ0tBR0VfTElOVVhfUEFNCi0+IGZh
aWxzIGFuZCB0aGVyZSBpcyBubyAic3lzdGVtLWF1dGgiIGZpbGUgYW55d2hlcmUgaW4gdGhlIGJ1
aWxkCi0gcWVtdV94ODZfNjRfZGVmY29uZmlnICsgQlIyX1BBQ0tBR0VfU0hBRE9XICArIEJSMl9Q
QUNLQUdFX0xJTlVYX1BBTQorIEJSMl9JTklUX1NZU1RFTUQtPiBmYWlscywgc3lzdGVtLWF1dGgg
aXMgbm90IGluIC9ldGMvcGFtLmQgaW4gdGhlCnRhcmdldCBmb2xkZXIuIEkgZG9uJ3Qga25vdyB3
aGF0IGhhcHBlbiBhdCBydW50aW1lIChiZWNhdXNlIEkgY2Fubm90CmxvZ2luKSAgaW4gdGhhdCBj
YXNlIEkgYWxzbyBmaW5kCnRhcmdldC91c3Ivc2hhcmUvZmFjdG9yeS9ldGMvcGFtLmQvc3lzdGVt
LWF1dGgKCkRvIHlvdSB0aGluayB3aXRoL3dpdGhvdXQgc3lzdGVtZCBjYXNlIHNob3VsZCBiZSBm
aXhlZCBkaWZmZXJlbnRseSA/CkluIGFueSBjYXNlIHRoZSBtaXNzaW5nIGZpbGUgc2VlbXMgdG8g
YmUgL2V0Yy9wYW0uZC9zeXN0ZW0tYXV0aC4KClN0w6lwaGFuZQoKTGUgbWFyLiAyOCBmw6l2ci4g
MjAyMyDDoCAxODowMywgc3RlcGhhbmUgZ29uYXVlcgo8c3RlcGhhbmUuZ29uYXVlckA2d2luZC5j
b20+IGEgw6ljcml0IDoKPgo+IEhpLAo+Cj4gWWVzIGl0IGFsc28gb2NjdXJzIHdpdGggIEJSMl9Q
QUNLQUdFX0xJTlVYX1BBTSAqKmFuZCoqIEJSMl9QQUNLQUdFX1NIQURPVwo+IHNoYWRvdyBkb2Vz
bid0IGluc3RhbGwgL2V0Yy9wYW0uZC9zeXN0ZW0tYXV0aAo+Cj4gTWFudWFsbHkgYWRkaW5nIHRo
ZSBvbmUgaXNzdWVkIGZyb20gc3lzdGVtZCBpbnRvIHRoZSB0YXJnZXQgZm9sZGVyCj4gc29sdmVz
IHRoZSBpc3N1ZS4KPgo+IFdoYXQgd291bGQgYmUgdGhlIGdvb2Qgd2F5IHRvIGdvID8KPiBBZGRp
bmcgYSBwYXRjaCB0aGF0IGluc3RhbGxzIGEgc3lzdGVtLWF1dGggdG8gdGhlIHNoYWRvdyBwYWNr
YWdlID8gQW5kCj4gdGhlbiB3aGF0IHNob3VsZCBiZSBpdHMgY29udGVudCA/IFRoZSBzYW1lIGFz
IHRoZSBzeXN0ZW1kIGZpbGUgPwo+Cj4gU3TDqXBoYW5lCj4KPiBMZSBtYXIuIDI4IGbDqXZyLiAy
MDIzIMOgIDE3OjUxLCBSYXBoYWVsIFBhdmxpZGlzCj4gPHJhcGhhZWwucGF2bGlkaXNAZ21haWwu
Y29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gSGkgU3RlcGhhbmUsCj4gPgo+ID4gT24gMjguMDIuMjMg
MTU6MzgsIHN0ZXBoYW5lIGdvbmF1ZXIgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPgo+ID4gW1NOSVBd
Cj4gPiA+Cj4gPiA+IFRoZSBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlIHdpdGggYSBzaW1wbGVyIGNv
bmZpZ3VyYXRpb24uIEVuYWJsaW5nIGJvdGgKPiA+ID4gQlIyX1BBQ0tBR0VfTElOVVhfUEFNIGFu
ZCBCUjJfUEFDS0FHRV9TSEFET1cgYnJlYWtzIHRoZSBsb2dpbi4KPiA+ID4gSGVyZSBmb2xsb3cg
YSBkZWZjb25maWcgdGhhdCByZXByb2R1Y2VzIHRoZSBpc3N1ZSA6Cj4gPgo+ID4gRG9lcyBpdCBv
bmx5IGhhcHBlbnMgaWYgQlIyX1BBQ0tBR0VfTElOVVhfUEFNICoqYW5kKiogQlIyX1BBQ0tBR0Vf
U0hBRE9XCj4gPiBpcyBlbmFibGVkPwo+ID4KPiA+ID4KPiA+ID4gL2V0Yy9wYW0uZCByZWZlcmVu
Y2UgYSBzeXN0ZW0tYXV0aCB0aGF0IGlzIG5vdCBwcmVzZW50IGFueXdoZXJlIGluIHRoZQo+ID4g
PiBidWlsZCBkaXJlY3RvcnkuIFRoaXMgbWlnaHQgYmUgdGhlIHJvb3QgY2F1c2UgYnV0IEknbSBu
b3Qgc3VyZSBob3cgdG8KPiA+ID4gcHJvcGVybHkgdGVzdC4KPiA+Cj4gPiBJZiBzeXN0ZW0tYXV0
aCBpcyBvbmx5IGxvY2F0ZWQgaW4gL3Vzci9zaGFyZS9mYWN0b3J5L2V0Yy9wYW0uZC8gYW5kIG5v
dAo+ID4gYWxzbyBpbiAvZXRjL3BhbS5kLyBkdXJpbmcgYm9vdCB0aGVuIHNvbWV0aGluZyBpcyB3
cm9uZyB3aXRoIHRoZQo+ID4gc3lzdGVtZC10bXBmaWxlcyBzZXJ2aWNlLgo+ID4KPiA+ID4KPiA+
ID4gLS0tLS0tLS0tLS0tLS0tCj4gPiA+IHVpbGRyb290L2NvbmZpZ3MkIGNhdCBxZW11X3g4Nl82
NF9kZWZjb25maWcKPiA+ID4gQlIyX3g4Nl82ND15Cj4gPiBbU05JUF0KPiA+Cj4gPiBJIGFtIG5v
dCBzbyBmaXQgaW4gcWVtdS4gQ2FuIHlvdSBwcm92aWRlIG1lIHRoZSBxZW11IGNvbW1hbmQsIHNv
IEkgY2FuCj4gPiByZXByb2R1Y2UgaXQsIHBsZWFzZT8KPiA+Cj4gPgo+ID4gVGhhbmtzLAo+ID4g
UmFwaGFlbCBQYXZsaWRpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
