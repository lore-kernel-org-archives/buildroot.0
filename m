Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8FCC48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8495582AED;
	Sat, 17 Feb 2024 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0MnhfGKx_nU; Sat, 17 Feb 2024 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65C282B3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65C282B3E;
	Sat, 17 Feb 2024 20:27:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4A731BF59E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF254414C5
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7d956CXCCGXG for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 20:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E11CA414C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11CA414C0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E11CA414C0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 20:27:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33d3a9f377aso139968f8f.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 12:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708201652; x=1708806452;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Qn4pskmrugKfe5d8Bc8kV7tu3GdshX26aXtkWAmMs8=;
 b=asaEHC8+QQAgc7tXQYdW7LVuV0cRd84Bbo9PRODa1ws+Jk3zmRMY6XbLWvMiIq+44B
 SrgIhnkM3OnCa7S/fGwnuZQIQiuRQyJcIqFsg/lzAZHin42js9Zc9CAJqr0HjC+MQ7qY
 32xmEFc4fydmsrzPbSuKcy2f/I+PLcr3Xhd15zPuEkLl0Blg8eVh3F30MKnDeBS5NpgG
 BrQvDfa3zg2rB5YIJ8yOtEUiIjvPucJJRFBjHvFH6240Y2sCyvkjB216EovOFQhD6xLv
 2zSC9antQqbnsP9JT8ELgNtFsR3GbvvAGAOF/322CvGB21hTOu85eQV01Rf80psG1ZoL
 uKEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkmqY5ysLQE2nIUbWDKh2m6JyJVqT/M0hYWZbP1IbdmWQFzT05lC6U2DV969gDL/KNrWyBDKdzvtD/cq4FIKnQrbwdcWlDTg==
X-Gm-Message-State: AOJu0Yw0LfDflpP3oL8dIPNTwXcK93CpruiLmfehAZv3wK4JYaNVP6QO
 usNAx3JkbMQ66lORMG5up9VHEyMRZwLpGPb//33vpSSfWFCab5eE
X-Google-Smtp-Source: AGHT+IE1KdStQqCKNHprDK7hfymOEdS5Mf8iWts/bVdcnQHIKN2yHgvbksM587K11F5SwdljZk4p0g==
X-Received: by 2002:adf:fd01:0:b0:33d:ef:ceac with SMTP id
 e1-20020adffd01000000b0033d00efceacmr6214010wrr.61.1708201651793; 
 Sat, 17 Feb 2024 12:27:31 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d44cb000000b0033cffd1a302sm5660082wrr.57.2024.02.17.12.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 12:27:31 -0800 (PST)
Message-ID: <e25d51106a6401c0c8fc5907d693d5dd6f55d94f.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 21:27:36 +0100
In-Reply-To: <20240217160244.1320482-17-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-17-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708201652; x=1708806452; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9Qn4pskmrugKfe5d8Bc8kV7tu3GdshX26aXtkWAmMs8=;
 b=npDfoA3uyL7zONaJfOOtzLkyonX/hruWm7SZ+Bd8j4Jpa0G79ERgZ+3pcqf+9UC9sO
 tEZ86/0ZDnfhMXNSeMqKKvlvy95iQntxjLi9mMxtBJN8puYP9cVdeyLjsTk9wL/ag5/o
 tVarfKt+tk4Mlbs4OPhnFXbnHTtRSWY5WFb4TXzDungUBTyPxBpR8ht4PI9hn1SDS+WX
 4DAE6inoG9lXkvRihxaOwdLwR9Rr+UjVF2p9dI2YISw3SKppZxTBathmvCVMvdmAUhJ2
 E1Mo/FVS0wOhcndRNvsFAiFBNS7/xEs5mE6VeDg02CaloQMhjkgE0hIkyRYXc/2Zxez6
 4FZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=npDfoA3u
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBTYXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IFRlc3RlZCBvbiBTSy1BTTYyQi1QMS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4g
LS0tCj4gCj4gQ2hhbmdlcyBpbiB2NAo+IC0gQWRkIEJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVB
REVSU19DVVNUT01fNl82IHRvIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZy4KPiAKPiBubyBjaGFuZ2Vz
IHNpbmNlIHYxCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+IMKgY29uZmlncy90aV9hbTYyeF9za19k
ZWZjb25maWcgfCA0ICsrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBpbmRleCAxOTMzMDFjOGI5NDEu
LjRkZTM5ZmI4OTdmZCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZp
Zwo+ICsrKyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gQEAgLTEsMTEgKzEsMTEg
QEAKPiDCoEJSMl9hYXJjaDY0PXkKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NV
U1RPTV82XzQ9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15
Cj4gwqBCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC90aS9hbTYyeC1zay9wb3N0
LWJ1aWxkLnNoIgo+IMKgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvdGkvYW02
Mngtc2svcG9zdC1pbWFnZS5zaCIKPiDCoEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMg
dHR5UzIsMTE1MjAwbjggLXIgL2Rldi9tbWNibGsxcDIgLXggZWFybHljb249bnMxNjU1MGEsbW1p
bzMyLDB4MDI4MDAwMDAiCj4gwqBCUjJfTElOVVhfS0VSTkVMPXkKPiDCoEJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjQuMTYiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYu
Ni4xIgoKQ291bGQgYmUgdXBkYXRlZCB0byB2Ni42LjE3IGlmIHlvdSByZS1zcGluPwoKPiDCoEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+IMKgQlIyX0xJTlVYX0tF
Uk5FTF9EVFNfU1VQUE9SVD15Cj4gwqBCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0i
dGkvazMtYW02MjUtc2siCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
