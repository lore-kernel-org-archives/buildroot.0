Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA45C3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 20:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64A882209;
	Wed, 23 Aug 2023 20:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64A882209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDtG6z7bXED5; Wed, 23 Aug 2023 20:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17481817EB;
	Wed, 23 Aug 2023 20:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17481817EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8C01BF2BE
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 20:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB42C60ADC
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 20:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB42C60ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2ExwIBcOCsJ for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 20:17:45 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A851E60AD8
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 20:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A851E60AD8
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-26f3975ddd4so2840591a91.1
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 13:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692821865; x=1693426665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSwkAwSdAvguiW927SB7B4oWGQZAyqQDLKv4hr82JxM=;
 b=HCyZdkw8NzSFMbAHuk4XgeOK9cQgerztreplAckdkNRTmDokXJ8RIvz5R3NSWB+DJk
 tX5+EyW6cLHGvkzKVUbgUdJuCM1U1ObmlelPHtkGHIUoPjSh4BWrWpN+yCpHv9M+Kkmp
 PCmusw/EgErjCBgN1oyK41Mbwxou8JroBopVYwJuFZJ1zEPbm2gWI6pxcl5N3ol+9aJr
 ccAKHBagLmN1y+OYBomB0VFvVU3laJ5JCDRjB9kLedG81vcHc8nDk8UI5ExKhFdWZxY1
 Qoa8PBE4VtXDc2EhcXM47Qm4IgXrRZEO4YUaN6glRz6J1egoDmWn/XaCaEvW9XQoyQ4o
 BuEQ==
X-Gm-Message-State: AOJu0YzTSaSHviFAZdjtLmNmQ5rUXSIthYf/FygdE3tSfOVFJAYo5CzI
 oBpOfcyIm3gMXPMGQKT9dTleWx73QXDjqz1wt4SyDHQYkfU=
X-Google-Smtp-Source: AGHT+IG073kpZCgiQLjxaJkMn+Q5W59T2rFyem289sugmEyPEv5W432h3SpA74lIFZbkJByPdszv0hKLN0a/HtFmTQE=
X-Received: by 2002:a17:90a:4982:b0:26b:3a18:3559 with SMTP id
 d2-20020a17090a498200b0026b3a183559mr12411942pjh.4.1692821865094; Wed, 23 Aug
 2023 13:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230814215233.745573-1-gregorhaas1997@gmail.com>
 <20230822214755.1af65bb4@windsurf>
In-Reply-To: <20230822214755.1af65bb4@windsurf>
From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 23 Aug 2023 13:17:09 -0700
Message-ID: <CAMqWt3qPd-FynCeT_bZEtRXQutrrSaadDAjA+nKCKfNoKDtYkg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692821865; x=1693426665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSwkAwSdAvguiW927SB7B4oWGQZAyqQDLKv4hr82JxM=;
 b=QTXB5LjaknNS7S7nCDlAGotN9ONer3cafa1o697/Abj2/c6yw3EAnOR7upTbVCz891
 kMl4T354DCKhHFUUK9/9bAiDNC8PoPpgSTjhxOpJ2vEHm9CLZ+Ftt6eFAw5jlR2HBe+7
 V2GCFDk13bAj20fqQ85GkcSGCI8rJS5Nz+TlLKkYaOjm2ve0XzbiEtdL1jLsn12xVsdr
 UOp4HXzBuEKJ+QNnw18NSEZxxqKhoIbscX/+Llz1J1A2kzRlUDEtPDW+NZTlnCLKjXy2
 Wg/aH9/UghBDsjSdef03zU16/xIgf24Z7HG7kipCFE1+huVBuNl+pA1djhp6ldxKB6hO
 YXPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QTXB5Lja
Subject: Re: [Buildroot] [PATCH 1/1] package/bmap-tools: add dependency on
 python-six
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMTI6NDfigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSSdtIHRoaW5r
aW5nIGFib3V0IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4KPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUg
Yi9NYWtlZmlsZQo+IGluZGV4IGYwZmY5YTE0ODAuLjAwY2U2NGFiMTUgMTAwNjQ0Cj4gLS0tIGEv
TWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC03MTMsNiArNzEzLDE1IEBAIFNUQUdJTkdf
RElSX0ZJTEVTX0xJU1RTID0gJChzb3J0ICQod2lsZGNhcmQgJChCVUlMRF9ESVIpLyovLmZpbGVz
LWxpc3Qtc3RhZ2luZy50Cj4gIGhvc3QtZmluYWxpemU6ICQoUEFDS0FHRVMpICQoSE9TVF9ESVIp
ICQoSE9TVF9ESVJfU1lNTElOSykKPiAgICAgICAgIEAkKGNhbGwgTUVTU0FHRSwiRmluYWxpemlu
ZyBob3N0IGRpcmVjdG9yeSIpCj4gICAgICAgICAkKGNhbGwgcGVyLXBhY2thZ2UtcnN5bmMsJChz
b3J0ICQoUEFDS0FHRVMpKSxob3N0LCQoSE9TVF9ESVIpKQo+ICtpZmVxICgkKEJSMl9QRVJfUEFD
S0FHRV9ESVJFQ1RPUklFUykseSkKPiArICAgICAgICQoUSlncmVwIC0tYmluYXJ5LWZpbGVzPXdp
dGhvdXQtbWF0Y2ggLWxyWiAnJChQRVJfUEFDS0FHRV9ESVIpL1teL11cKy9ob3N0JyAkKEhPU1Rf
RElSKSBcCj4gKyAgICAgICB8d2hpbGUgcmVhZCAtZCAnJyBmOyBkbyBcCj4gKyAgICAgICAgICAg
ICAgIGZpbGUgLWIgLS1taW1lLXR5cGUgIiQke2Z9IiB8IGdyZXAgLXEgJ150ZXh0LycgfHwgY29u
dGludWU7IFwKPiArICAgICAgICAgICAgICAgcHJpbnRmICclc1wwJyAiJCR7Zn0iOyBcCj4gKyAg
ICAgICBkb25lIFwKPiArICAgICAgIHx4YXJncyAtMCAtLW5vLXJ1bi1pZi1lbXB0eSBcCj4gKyAg
ICAgICAgICAgICAgICQoU0VEKSAnczokKFBFUl9QQUNLQUdFX0RJUikvW14vXVwrL2hvc3Q6JChI
T1NUX0RJUik6ZycKPiArZW5kaWYKPgo+ICAuUEhPTlk6IHN0YWdpbmctZmluYWxpemUKPiAgc3Rh
Z2luZy1maW5hbGl6ZTogJChTVEFHSU5HX0RJUl9TWU1MSU5LKQoKSnVzdCB3YW50ZWQgdG8gY29u
ZmlybSB0aGF0IHRoaXMgcGF0Y2ggYWxzbyBmaXhlcyBteSBpc3N1ZSwgc28gSSdtIG9rYXkgd2l0
aAp0aGlzIGluc3RlYWQgb2YgdGhlIHBhdGNoIEkgc2VudCBlYXJsaWVyLgoKVGhhbmtzLApHcmVn
b3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
