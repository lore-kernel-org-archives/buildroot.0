Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8983FEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 05:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE38441E6D;
	Fri, 16 Jun 2023 05:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE38441E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5SqLcAhfHVGW; Fri, 16 Jun 2023 05:21:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B43141E64;
	Fri, 16 Jun 2023 05:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B43141E64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3529C1BF853
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 05:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19F3241E64
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 05:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19F3241E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a-CC7VYXR3j for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 05:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E6B41E5E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20E6B41E5E
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 05:21:27 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9827bd8e0afso39443266b.1
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 22:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686892886; x=1689484886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oo3i5poF00fAdO53NA3h6ZQFZq5zGBxzkgsMrXdp8+Y=;
 b=hpih+CbG9JzZN92rtaICBr5teojBU58T3UsffgnoHyuYkfAC4+w9kmN5+vF1twhNw5
 mP9ObYLQxdaKOY1rdxI8+SFGooOBNkEMTF1UfmbjcR99fR18/lHasb99ObA4JAD86B4s
 E2J4maCgyxNO4XrbwQJUP6h19WUkvkfjR3lBWBs6SONuJmiDGAAmWgFj3kvD9hMyPG5N
 WPcLmXVRqEchfhb7BdEkWelasHcnSWhO9v14G2BDhpf9tEkQLK2tikNUIWVrSgJ1b7zM
 /r8qTmsX08YpXbMzg6Zjh3WY3FoWadv8Vzik9xbXMrZf8rVgq0mLf0B6TG0/+OYC91Kq
 NdHg==
X-Gm-Message-State: AC+VfDx7MdlZYgInrGMHkYPgv2KIJ1y/jXbUO1Z+TbnsXcESA8TPmX3E
 a7TAMB1iMdvf+2XmkXho07+uvnjJQoyAehj1bbQ=
X-Google-Smtp-Source: ACHHUZ40679w97d0RFGLgcT1aUhbaHP1zEEjm3DuX2niYTTm2m3yqFNJSOChAqVpG6KWt1ymm8O1QUFGSPubgHxWl08=
X-Received: by 2002:a17:907:7245:b0:982:a454:6d24 with SMTP id
 ds5-20020a170907724500b00982a4546d24mr920928ejc.74.1686892885738; Thu, 15 Jun
 2023 22:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-5-laurent@vivier.eu>
 <CACPK8XfZL3j9AP-hkz3mNLW=6Ryy5TMo+o95DJNZ_vWBJxE2DQ@mail.gmail.com>
 <7031315e-4906-206e-8afc-f21784b4f822@vivier.eu>
In-Reply-To: <7031315e-4906-206e-8afc-f21784b4f822@vivier.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2023 05:21:11 +0000
Message-ID: <CACPK8Xfc7dKpb8KZfkO=QrnWzGmqFMEHE3zSBtcjXAJonAPTEA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686892886; x=1689484886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oo3i5poF00fAdO53NA3h6ZQFZq5zGBxzkgsMrXdp8+Y=;
 b=XhpaJ6SHX6qAufhSywjB6nY1NVo3CfSDDOrBiQ9jR93H0J7g0W1YQ4NeaqWPHDDo/h
 FSTqGGGN7sbBNY2EYvEVfN13kNZERw3pInH16qqIogCNfM9fMDJr6avaqU4SPMFurHl3
 AXl5fKzUjdcVuQZb0ThP8Li0vA71Ijt2dFO+s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=XhpaJ6SH
Subject: Re: [Buildroot] [PATCH v14 4/4] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxNCBKdW4gMjAyMyBhdCAwNjoyMiwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1PiB3cm90ZToKPgo+IExlIDE0LzA2LzIwMjMgw6AgMDQ6MDUsIEpvZWwgU3RhbmxleSBh
IMOpY3JpdCA6Cj4gPiBPbiBUdWUsIDEzIEp1biAyMDIzIGF0IDEwOjUxLCBMYXVyZW50IFZpdmll
ciA8bGF1cmVudEB2aXZpZXIuZXU+IHdyb3RlOgo+ID4+Cj4gPj4gUGV0aXRib290IGRvZXNuJ3Qg
c3RhcnQgYSBzaGVsbCBidXQgYSBHVUkuCj4gPj4gTWFuYWdlIHRoZSBtZW51IHRvIHN3aXRjaCB0
byB0aGUgc2hlbGwuCj4gPj4KPiA+PiBFbmFibGUgdGhlIHRlc3QgZm9yIHFlbXVfbTY4S192aXJ0
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVy
LmV1Pgo+ID4+IC0tLQo+ID4+ICAgc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVtdS1pbWFnZS5weSB8
IDggKysrKysrLS0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2Jvb3QtcWVt
dS1pbWFnZS5weSBiL3N1cHBvcnQvc2NyaXB0cy9ib290LXFlbXUtaW1hZ2UucHkKPiA+PiBpbmRl
eCBiYTUwZWE2OWVlOWEuLmM5NGI3YTVjOTY5ZCAxMDA3NTUKPiA+PiAtLS0gYS9zdXBwb3J0L3Nj
cmlwdHMvYm9vdC1xZW11LWltYWdlLnB5Cj4gPj4gKysrIGIvc3VwcG9ydC9zY3JpcHRzL2Jvb3Qt
cWVtdS1pbWFnZS5weQo+ID4+IEBAIC0zNiw3ICszNiw3IEBAIGRlZiBtYWluKCk6Cj4gPj4gICAg
ICAgdGltZS5zbGVlcCgxKQo+ID4+Cj4gPj4gICAgICAgdHJ5Ogo+ID4+IC0gICAgICAgIGNoaWxk
LmV4cGVjdChbImJ1aWxkcm9vdCBsb2dpbjoiXSwgdGltZW91dD02MDApCj4gPj4gKyAgICAgICAg
aWR4ID0gY2hpbGQuZXhwZWN0KFsiYnVpbGRyb290IGxvZ2luOiIsICJFeGl0IHRvIHNoZWxsIl0s
IHRpbWVvdXQ9NjAwKQo+ID4KPiA+IFdoYXQncyBpZHggZ29pbmcgdG8gY29udGFpbiBpbiB0aGUg
cGV0aXRib290IHZzIGdldHR5IGNhc2VzPwo+Cj4gc2VlIGh0dHBzOi8vcGV4cGVjdC5yZWFkdGhl
ZG9jcy5pby9lbi9zdGFibGUvYXBpL3BleHBlY3QuaHRtbCNwZXhwZWN0LnNwYXduLmV4cGVjdAo+
Cj4gIlRoaXMgcmV0dXJucyB0aGUgaW5kZXggaW50byB0aGUgcGF0dGVybiBsaXN0LiIKPgo+ICJi
dWlsZHJvb3QgbG9naW46IiAtPiBpZHggPSAwCj4gIkV4aXQgdG8gc2hlbGwiIC0+IGlkeCA9IDEK
ClRoYW5rcy4gUGVyaGFwcyBhIGNvbW1lbnQgd2hlcmUgeW91IHRlc3QgdGhlIHJlc3VsdHMgdG8g
ZXhwbGFpbiB3aHkgd2UgdGVzdCAwLzEuCgo+ID4+IC0gICAgY2hpbGQuc2VuZGxpbmUoInJvb3Rc
ciIpCj4gPj4gKyAgICBpZiBpZHggPT0gMDoKPiA+PiArICAgICAgICBjaGlsZC5zZW5kbGluZSgi
cm9vdFxyIikKPiA+PiArICAgIGVsaWYgaWR4ID09IDE6Cj4gPj4gKyAgICAgICAgdGltZS5zbGVl
cCgxKQo+ID4+ICsgICAgICAgIGNoaWxkLnNlbmRsaW5lKCJcciIpCj4gPj4KPiA+PiAgICAgICB0
cnk6Cj4gPj4gICAgICAgICAgIGNoaWxkLmV4cGVjdChbIiMgIl0sIHRpbWVvdXQ9NjAwKQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
