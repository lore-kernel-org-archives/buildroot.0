Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1095DC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 13:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA314076D;
	Sun, 18 Feb 2024 13:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHQlEkT1rpuJ; Sun, 18 Feb 2024 13:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6CC84076E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6CC84076E;
	Sun, 18 Feb 2024 13:50:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1A901BF31A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE91D81E60
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pepQXSapwEki for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 13:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E41B281E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41B281E51
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E41B281E51
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:50:38 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-607f8482b88so19878607b3.0
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 05:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708264237; x=1708869037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mm95zBOUnFjgAuOssU/e2osACTwavks7fVSF4HCRDWo=;
 b=oqqGCXqx7zoxbllODx/lQCcuTj+zGe9rVfXbt0uAveQeThA0hNeB2BcnV0W9d3GU/t
 aaAwg29Bu9EBmONtz0m8K4HPQl7zEiL37e/L9H6eTtDeG+NrxjtVwxJmj+5AKWONUhPa
 Rvrxq5Ta6Zq061HfalG4oL8bOeh6umOQBpwGLm4AzQX6YibCPU/8tuIkMkU1ESLIdhFQ
 0BEzFdWXYwaJIgSJTrr4p9rA6ny1nBBLPQiiOULJk4ShcoX3oOob5K+Bwx5Iu8vaxvOu
 ObhfQSrks8EFdu+N/YHdN2Cb8kFNMRBzqpFU1fnQRtoL3Hkeu7R+iD3paTjHamooUujZ
 mbOw==
X-Gm-Message-State: AOJu0Yz4AucjI9KzoAb913PMOpXayhQdt9m4/MaEmU25E3HftXQcugTl
 4rFGreki7vGg23fXZNVYwmOArO9iwqG+M+ZK2GhV3eDoibBvSaFbYN6tDsRmEaIHPbZ2ID7u3NR
 BjA78uQroGKFdOQKb0scCFZscMLNAoDcu5QXzzw==
X-Google-Smtp-Source: AGHT+IFGu5gieNDAMAOr1DzKlC5raSMz7XcaxWZvLo14sWi1f/QC/RXr5d17mDqAucdRKTDOVm0dQLAXMb9qiy+RQjk=
X-Received: by 2002:a25:a064:0:b0:dcc:a446:553 with SMTP id
 x91-20020a25a064000000b00dcca4460553mr8286301ybh.57.1708264237480; Sun, 18
 Feb 2024 05:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-17-dario.binacchi@amarulasolutions.com>
 <e25d51106a6401c0c8fc5907d693d5dd6f55d94f.camel@gmail.com>
In-Reply-To: <e25d51106a6401c0c8fc5907d693d5dd6f55d94f.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 18 Feb 2024 14:50:26 +0100
Message-ID: <CABGWkvojxYSFC8Bt0=_zXjiJzmrwZxGiWq6Ew97FMHOw1VK=OQ@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708264237; x=1708869037;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mm95zBOUnFjgAuOssU/e2osACTwavks7fVSF4HCRDWo=;
 b=IyVLa5031o+CDjEmVJqtQhNnw0Jk7XlexcwhyJ33hkNQAPjqSqaP3Vj0eThwtxKCwm
 NuuyyzDIOYTukPFmfXgqM/5sYlTny7NlSbunzj4V9BkbTpTInyedhHqw86ohRlf9HZXA
 S82pzrIsvkzwJV5GIzgvZCVdsfK3MrghQ5eSY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IyVLa503
Subject: Re: [Buildroot] [PATCH v4 16/20] configs/ti_am62x_sk_defconfig:
 bump Linux version to 6.6.1
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgOToyN+KAr1BNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBE
YXJpbywKPgo+IE9uIFNhdCwgMjAyNC0wMi0xNyBhdCAxNzowMiArMDEwMCwgRGFyaW8gQmluYWNj
aGkgd3JvdGU6Cj4gPiBUZXN0ZWQgb24gU0stQU02MkItUDEuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
ID4KPiA+IC0tLQo+ID4KPiA+IENoYW5nZXMgaW4gdjQKPiA+IC0gQWRkIEJSMl9QQUNLQUdFX0hP
U1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82IHRvIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZy4KPiA+
Cj4gPiBubyBjaGFuZ2VzIHNpbmNlIHYxCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmlu
YWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAg
Y29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9j
b25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnCj4gPiBpbmRleCAxOTMzMDFjOGI5NDEuLjRkZTM5ZmI4OTdmZCAxMDA2NDQKPiA+IC0tLSBh
L2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPiArKysgYi9jb25maWdzL3RpX2FtNjJ4
X3NrX2RlZmNvbmZpZwo+ID4gQEAgLTEsMTEgKzEsMTEgQEAKPiA+ICBCUjJfYWFyY2g2ND15Cj4g
PiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzQ9eQo+ID4gK0JSMl9Q
QUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl82PXkKPiA+ICBCUjJfUk9PVEZTX1BP
U1RfQlVJTERfU0NSSVBUPSJib2FyZC90aS9hbTYyeC1zay9wb3N0LWJ1aWxkLnNoIgo+ID4gIEJS
Ml9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtaW1hZ2Uu
c2giCj4gPiAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyB0dHlTMiwxMTUyMDBuOCAt
ciAvZGV2L21tY2JsazFwMiAteCBlYXJseWNvbj1uczE2NTUwYSxtbWlvMzIsMHgwMjgwMDAwMCIK
PiA+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiA+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OPXkKPiA+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjQuMTYi
Cj4gPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjEiCj4KPiBD
b3VsZCBiZSB1cGRhdGVkIHRvIHY2LjYuMTcgaWYgeW91IHJlLXNwaW4/CgpPZiBjb3Vyc2UuCgpU
aGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCj4KPiA+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNI
X0RFRkFVTFRfQ09ORklHPXkKPiA+ICBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiA+
ICBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0idGkvazMtYW02MjUtc2siCj4KPiAt
LQo+IEFsZXhhbmRlciBTdmVyZGxpbi4KPgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBF
bWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlv
bnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQu
ICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFz
b2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
