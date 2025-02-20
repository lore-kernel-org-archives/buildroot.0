Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C591C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 13:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D9C60807;
	Thu, 20 Feb 2025 13:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zEa5EXo5x5Q; Thu, 20 Feb 2025 13:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EFF460904
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EFF460904;
	Thu, 20 Feb 2025 13:53:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0EA9194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F90E60904
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkZmfU0BFO9H for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 13:53:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2508160807
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2508160807
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2508160807
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:53:40 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-868f169bb56so256008241.0
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 05:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740059619; x=1740664419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5IKMFR+5IxvIfaAyrJ7bT4+jeCqJrNdI9LS43ERH4Q=;
 b=BLPFiuVtaf9UfCic+P9RNs87fwiIMybP2mJmW7wpceEUJWRgMI2L1GUceRUYlj4m4n
 2WKAVScYTUvf4ZP2bZZ37wBNc0u+kAzdo9krZW1O3nstZ2qvULw4ajaiPbiKi/A1FwNZ
 LGraMFXUYji7sfEMBBWVEwYqzZW9frdTNwdrp2RvG8ux79B1kzserObpMlL5+M0ef1C2
 YjXeCWZfnS15TrWTl6fPbDaai4Lkdi6v/RB+95StYnnnuKS29lrdqiR4mNFkE0cJ8SVR
 iAyKljFibskO6rU4xpulfdjTG4P8osNf9hU6KDoo5VdSJnrRWbDjLgqQkQxFSBvrpC2O
 CZoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVt2uQcI4+fyFB0+BlJs/O9HDnIxAWr9zy0F+gIRzAYy+WoNf0IZilCLPBY2puKDXae6jUukoltGA=@buildroot.org
X-Gm-Message-State: AOJu0YzQbSzwkDTsPeWAFqF/D+zBkDSkZMMCkVfL0EVC8iyOf/sbv9r2
 XjKZgldLeylcakqG/JNySBKidsbTi6O8dJ4OlgdJSLJNcccjJ4qLQPnbjOxkSdjthUFzcMU9KI3
 h4IHQDygKAquXnBBqIlpkGAQvST8=
X-Gm-Gg: ASbGncvcFkGe292/zv9P7amVmk2cdroCl1EXYRWBpNdc/weByoyuFFGBN/KAwYDnBMA
 vueVsnVVZx4DMiRtCHVQflbllyTZWjldW+k7+FDfCThgy17Ci6VbkcHZxq46bi6ke5G3MMJceBY
 M=
X-Google-Smtp-Source: AGHT+IGakrH/KJ7QPAWfqSXhVADKOBbwQMDAVtl6sf7cK3EElWaSqb4QDi1ftUeSC3wVL57pTD7SSVAJQxw54Tqv4Wk=
X-Received: by 2002:a67:e70a:0:b0:4b6:8e5d:4bfd with SMTP id
 ada2fe7eead31-4bd3fe2bce9mr12955459137.22.1740059618707; Thu, 20 Feb 2025
 05:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20240710152941.334195-1-kory.maincent@bootlin.com>
 <d9fcfe9b-7b11-42ee-9773-b9620d720135@mind.be>
 <D2Q7RY7OPU0I.2KCWEGO4SYQX5@collins.com>
In-Reply-To: <D2Q7RY7OPU0I.2KCWEGO4SYQX5@collins.com>
From: Matthew Weber <matt@thewebers.ws>
Date: Thu, 20 Feb 2025 07:53:25 -0600
X-Gm-Features: AWEUYZlj50A8OTNCthMRirVhJXRFrSvrT0kLdENA2oIJvvma1aMEfA0yWiHkWTs
Message-ID: <CAFt09wMuPRBHy7XFAM2ze965fR364RhguQQhaQbgs4AonTcExw@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thewebers-ws.20230601.gappssmtp.com; s=20230601; t=1740059619; x=1740664419;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5IKMFR+5IxvIfaAyrJ7bT4+jeCqJrNdI9LS43ERH4Q=;
 b=F1rKDT8Bme6JcQiEDpkpu8MtDe6jPYZhJIocqaX3jIg7+qVFmQGVUSLuYCIK+trB8a
 25rypODDhPicB8tDGBmQqI0yNqG8JdShmKxUSyHiOTvAN15921MVxei+wa4pQXSzFjo+
 iLKf10QzjhXY+jUeOXouluSuSDTON1AeAMY+bzWz7/wVuMHxnj2RDqhZ27X9ixEk7QhA
 yREKqQXcz1zhOPpqN1AVM3ePUtuQYuazY7IxHmyxu+uoZd4uRSTOudRgBVHj1Scx5tuD
 xqG27VtawE4fq5j8DjcJB848cpO3tQzSI1FlL4hAo6Yvmr6WBe29MQnAFrtEcAQaEbWJ
 trLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=thewebers.ws
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=thewebers-ws.20230601.gappssmtp.com
 header.i=@thewebers-ws.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=F1rKDT8B
Subject: Re: [Buildroot] [PATCH] linux: Add support for vendor directory in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgS29yeSwKCgpPbiBNb24sIEp1bCAxNSwgMjAyNCBhdCAxMDoyM+KAr0FNIEJyYW5kb24gTWFp
ZXIgdmlhIGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gSGkg
QXJub3V0LCBLb3J5LAo+Cj4gT24gTW9uIEp1bCAxNSwgMjAyNCBhdCAyOjA3IFBNIFVUQywgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+Cj4gPgo+ID4gT24gMTAv
MDcvMjAyNCAxNzoyOSwgS29yeSBNYWluY2VudCB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4gPiBM
aW51eCBvcmdhbml6ZXMgZGV2aWNldHJlZSBmaWxlcyB1bmRlciB2ZW5kb3Igc3ViZGlyZWN0b3Jp
ZXMgZm9yIGFybSBhbmQKPiA+ID4gYXJtNjQgYXJjaGl0ZWN0dXJlcywgc3VjaCBhcyBhcmNoLzxh
cmNoPi9ib290L2R0cy88dmVuZG9yPi8uIFRoZQo+ID4gPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9EVFNfUEFUSCB3YXMgb25seSBjb3B5aW5nIGRldmljZXRyZWUgZmlsZXMgdG8KPiA+ID4gYXJj
aC88YXJjaD4vYm9vdC9kdHMvLCB3aGljaCBpcyBpbmNvbXBhdGlibGUgd2l0aCB0aGUgdmVuZG9y
Cj4gPiA+IHN1YmRpcmVjdG9yeSBzdHJ1Y3R1cmUuCj4gPgpbc25pcF0KCldoaWNoIGtlcm5lbCB2
ZXJzaW9uIHdlcmUgeW91IHVzaW5nPyAgSSBub3RpY2VkIGluIDYuMTIgd2hlbiBJIHVzZSB0aGUK
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgsIEkgZ2V0IGEgIm5vIG1ha2UgdGFyZ2V0
IGZvciIgZXJyb3IKdHJ5aW5nIHRvIGJ1aWxkIHRoYXQgZHRiIG9uY2UgcGxhY2VkIGluIHRoZSBy
b290IG9mCmFyY2gvPGFyY2g+L2Jvb3QvZHRzLy4gIFRoZSBmaWxlIGlzIHRoZXJlIGFuZCBpZiBJ
IG1vdmUgaXQgaW50byB0aGUKdmVuZG9yIGZvbGRlciBhbmQgdXBkYXRlIEJ1aWxkcm9vdCB0byBi
dWlsZCBpdCBhcyBhIGluLXRyZWUgZHRzLCBpdAp3b3JrcyBPSy4KCldhbnRlZCB0byBjaGVjayBp
ZiB0aGlzIGlzIGEga25vd24gaXNzdWUgYmVmb3JlIHNoYXJpbmcgYSBiYXNpYwpleGFtcGxlIHRv
IHJlcHJvZHVjZS4KClJlZ2FyZHMsCk1hdHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
