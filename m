Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0417BC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 19:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90EA260F46;
	Mon, 27 Nov 2023 19:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90EA260F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzWxyuEZmSVP; Mon, 27 Nov 2023 19:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5F5560F41;
	Mon, 27 Nov 2023 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F5560F41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 384B31BF479
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10FD060F3C
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10FD060F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IuaQi0lR_xvx for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 19:44:17 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5557860F44
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 19:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5557860F44
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b3e2f8ec5so19919215e9.1
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 11:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701114255; x=1701719055;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dxAZbD2g0x90uf5F7dpBxSu/wzCeBIeNMOBdHvqtxm8=;
 b=PiNv5ti9KBCEAYQjCtnA2Qi3uF9ThvbhGWBQ8GA078KDYbGzzos5zrOWFQijSZwiam
 Ne7erWLMPvP6BnkZuwY3ydMwb6WWGPFVsAwZoqhcU7IocZzi5ZL4no/NgMx98fRoicdW
 CP4vVzzigan52m1TAm5QG/R900Ugb8DcePPZ0szg719k3BN5bjkMSY0n2k9kMgTA0ujD
 o/D5OwnEXnNGd1Xcfs/m7aKQRWrRiIM4a81C095JGf+62pkn3YzhEyRFFJnBRm9Xa6hk
 XyeD0KaD33zAx8SxXjj761qhfdOc6us5TqciLv/+7ehZp0EhuLsMDdev6MN9dyRynfCG
 ulZw==
X-Gm-Message-State: AOJu0YxBM+BoA1sx6kyW4aqiQ2puXlT3ENcPcEAZcQ6/bOWT8Pe7eiyn
 oCwyF2BmbBTFyH28uJboQSjUDg==
X-Google-Smtp-Source: AGHT+IGrxi1GnppjrrK2xQnuqQXpVn0S9BV7JlZER7VqRu7okaoLjxxpb1e93Cw4xY+0R0sulzeNQg==
X-Received: by 2002:a05:600c:3505:b0:40b:3863:3ae7 with SMTP id
 h5-20020a05600c350500b0040b38633ae7mr8778846wmq.29.1701114255444; 
 Mon, 27 Nov 2023 11:44:15 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 k32-20020a05600c1ca000b0040839fcb217sm15143348wms.8.2023.11.27.11.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 11:44:15 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 27 Nov 2023 20:44:14 +0100
Message-Id: <CX9UOC39HILJ.10TZKPLI4I0AB@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Peter Seiderer"
 <ps.report@gmx.net>
X-Mailer: aerc 0.15.2
References: <20231120214150.671145-1-gael.portay@rtone.fr>
 <20231120231125.2ba705f9@gmx.net> <20231127184501.GC3177259@scaer>
In-Reply-To: <20231127184501.GC3177259@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1701114255; x=1701719055; darn=buildroot.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxAZbD2g0x90uf5F7dpBxSu/wzCeBIeNMOBdHvqtxm8=;
 b=EJRaCCg2SuhbjMLuRCZGCFYsRR2NBhRSwwQ4Fc6V5kIYuRsrYBwbuPd2HLdQ6iOwd8
 ApvWv12srxGpBI9lqMm6Xbe6uylmGKKFHoUxEeyrZjkKnpQugx8wp5e7sW3Dn57IVlJs
 BK097qwnSZ08adQ47b5IifGodtVWL8WTBQZ+k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=EJRaCCg2
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKT24gTW9uIE5vdiAyNywgMjAyMyBhdCA3OjQ1IFBNIENFVCwgWWFu
biBFLiBNT1JJTiB3cm90ZToKPiBQZXRlciwgQWxsLAo+Cj4gT24gMjAyMy0xMS0yMCAyMzoxMSAr
MDEwMCwgUGV0ZXIgU2VpZGVyZXIgc3Bha2UgdGh1c2x5Ogo+ID4gT24gTW9uLCAyMCBOb3YgMjAy
MyAyMjo0MTo1MCArMDEwMCwgR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4gd3Jv
dGU6Cj4gPiA+IFRoZSBjb21taXQgNjg5YjlhYzQzOSAocGFja2FnZS9ycGktZmlybXdhcmU6IHJl
d29yayBib290L2NvbmZpZyBmaWxlCj4gPiA+IGhhbmRsaW5nKSBoYXMgc3BsaXQgaW4gdHdvIHRo
ZSBwcm9wZXJ0eToKPiA+ID4gCWR0b3ZlcmxheT1taW5pdWFydC1idCxrcm5idD1vbgo+ID4gPiBJ
bnRvOgo+ID4gPiAJZHRvdmVybGF5PW1pbml1YXJ0LWJ0Cj4gPiA+IAlkdG92ZXJsYXk9a3JuYnQ9
b24KPiBbLS1TTklQLS1dCj4gPiAuLi5hbHRlcm5hdGl2ZSBwYXRjaCAocmVtb3ZpbmcgdGhlIGZh
aWxpbmcgbGluZSkgYWxyZWFkeSBzdWdnZXN0ZWQsIHNlZSBbNl0gZm9yCj4gPiBkZXRhaWxzIGFu
ZCByZWFzb25pbmcuLi4KPiA+IFs2XSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjMwODA4MTgwOTU5LjI4MDkxLTItcHMucmVwb3J0QGdteC5u
ZXQvCj4KPiBUaGFua3MgZm9yIHRoZSBoZWFkcy11cCBvbiB0aGF0IHBhdGNoLCBJJ2xsIGxvb2sg
aW50byBpdCBub3c6IEl0IHN0YXRlcwo+ICJhcyBubyBvbmUgY29tcGxhaW5lZCBzaW5jZSAyMDIx
IGp1c3QgZHJvcCBpdCIgYnV0IEdhw6tsIG5vdGljZWQgbm93LCBzbwo+IGl0IG1ha2VzIHNlbnNl
IHRvIGFwcGx5IGhpcyBwYXRjaCBub3cuCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCgpZ
YW5uLCBzb3JyeSBmb3IgdGhhdCBsYXRlIHBvc3QsIGJ1dCB5b3UgbWF5IGFsc28gY29uc2lkZXIg
dGhhdCBvbmVbMV0KZm9yIHRoZSBjb25zaXN0ZW5jeS4KCkFuZCByaWdodCwgdGhlc2UgbGluZXMg
c2hvdWxkIGdldCByZW1vdmVkIGFmdGVyIHRoZSBidW1wIG9mIHRoZSBwaQprZXJuZWxbMl0gc2lu
Y2UgdGhlIGtybmJ0PW9uIGlzIG5vdyB0aGUgZGVmYXVsdCBiZWhhdmlvdXIuCgpSZWdhcmRzLApH
YcOrbAoKWzFdOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjMxMTI3MTkyNDU1LjI4MjIzNzQtMS1nYWVsLnBvcnRheUBydG9uZS5mci8KWzJd
OiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nl
cmllcz0zODA2NzEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
