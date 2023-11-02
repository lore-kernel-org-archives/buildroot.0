Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7749C4167D
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 09:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC5640158;
	Thu,  2 Nov 2023 09:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC5640158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRDNuNY8TJYB; Thu,  2 Nov 2023 09:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5972040A92;
	Thu,  2 Nov 2023 09:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5972040A92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 690301BF591
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 419F5606AA
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 09:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419F5606AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIQFkie2kv_F for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 09:37:50 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F140160E3B
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 09:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F140160E3B
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso1167263a12.3
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 02:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698917868; x=1699522668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtCot7wc9mVGEqEIDBa+u6S/+CzOiNcw92HNMBFyOvU=;
 b=orQxdeWHel/zfbWrc+CGummbcR7GBBCyMwJCPETZ2lWgjrYyUv+CePcFAKXswxx8C8
 TEyF5WENMC/wTFXGRBFUtGYL4+cU2KjUYi+etPkJWk2mYsZ3Zr+5EYq9znsSQ6hUWKz8
 Ddjm+J1fp8Qlj3ki851XTsor9AKibIGpquMWs5NY3FuSLuW1M/GBkSVkGvRiDLPCvBgN
 oiUGTO49BxMHDNqn5naqyaHMSK3mZWNCe8bbcrikkmqhOlzKMds9eT9HQN16z8QDfo+X
 K7W7BNSusI90G6EkO0z6kPyQhoHwPbR5iVb5F4bXf71iacI752y/zZkWpt0duHX5miQD
 M/zw==
X-Gm-Message-State: AOJu0YwjF1bWKr/mg3oTBXxN419P1s+zNlgHkojmixxOiBUJwu3A/Fe3
 UwTuX8qBSEbCF+r8HWRHoCcxNf832o+3sXilZks=
X-Google-Smtp-Source: AGHT+IETH7k+bsWZCc2GLzzYaecrfFVSrSVtNqj/MUhBwGNR24ErR3stzfGaYEmrZ21AQydk27BYDPy4ErUJPD+BwxY=
X-Received: by 2002:a50:a6d7:0:b0:543:f90:b956 with SMTP id
 f23-20020a50a6d7000000b005430f90b956mr9182771edc.35.1698917867760; Thu, 02
 Nov 2023 02:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
 <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
 <87v8bec0pm.fsf@tarshish>
 <CADRKr2oNM2btAby66VOSNCs2bJkheButc7R+5N7kB-Kc7YuWtg@mail.gmail.com>
 <20231101172935.4daa4d99@windsurf>
In-Reply-To: <20231101172935.4daa4d99@windsurf>
From: =?UTF-8?Q?Cl=C3=A9ment_Ramirez?= <ramirez.clement3@gmail.com>
Date: Thu, 2 Nov 2023 10:37:36 +0100
Message-ID: <CADRKr2pREAb+Yjb3kZPv4zj+mr0_pg9ZdB47eR0N+o2zZOsYtA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698917868; x=1699522668; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtCot7wc9mVGEqEIDBa+u6S/+CzOiNcw92HNMBFyOvU=;
 b=eLTjuwq+DtjfRPk+M1VnKYZGNls8Gn5v9MOFcIkACBcP2i1uuLvrrv4DmuEZBpPF6J
 4Lgl7NSUVH4RBLthMTgDKb4ai21g7DheZq9fwiHBp2C0zf/PFxeXawCPZ4Zf+RQc6jwI
 aTX73T/K89mQm1Uf7DnUfrLmVFxnzacFH6WkhNh1C/Xj6erLcL2jjkzo9Y4v7V5h/hnn
 FnapGYVfL/VNnWgRaPW0GB/eqtotRIA8HeHYOwMdrbNi/HkaB6XTfJkLk3WW6v0boF3+
 zfmDUYCJbB7xIsDCmJKEWOCSuncyVFWOCMuczD+bBjl4U/IlrGCQUWC3xbOmnE1ojm1h
 YNTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eLTjuwq+
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzICEKCj4gQWx3YXlzIGhhcHB5IHRvIHNlZSBzb21lIHBhdGNoZXMgZnJvbSB5b3Ug
b24gQnVpbGRyb290ISA6LSkKClllcyBidXQgSSBuZWVkIHRvIGtlZXAgZ29pbmcKCj4gPiBJIHdp
bGwgdHJ5IHRvIGZpbmQgYSB3YXkgdG8gYWRkIGFuIGVudHJ5IGluIHRoZSBDUEUgZGF0YWJhc2Us
IGFuZCBhZGQgYQo+ID4gY29tbWVudCB0byBleHBsYWluIHdoeSB3ZSBhcmUgaWdub3JpbmcgdGhl
c2UgQ1ZFcy4KPgo+IEluIHRoZSBlbmQsIGRpZCB5b3Ugc2VuZCBhbiBlLW1haWwgdG8gdGhlIE5W
RCBtYWludGFpbmVycyBhYm91dCB0aGlzPwoKSSB0cmllZCB0byBmaWd1cmVkIG91dCBob3cgdG8g
YWRkIGFuIGVudHJ5IGluIHRoZSBDUEUgZGF0YWJhc2UgaW5kZWVkLCBhbmQKZm91bmQgc29tZSB0
b29scyB0byBkbyBpdC4gQnV0IEkgd2Fzbid0IHN1cmUgd2hhdCBpbmZvcm1hdGlvbiBpIHNob3Vs
ZApmaWxsIGluLCBzbwppIGVuZGVkIG5vdCBzZW5kaW5nIGFueXRoaW5nLgoKPiBZb3UgYWN0dWFs
bHkgZG9uJ3QgbmVlZCB0byBsb29rIGZvciBob3cgdG8gYWRkIGFuIGVudHJ5IGluIHRoZSBDUEUK
PiBkYXRhYmFzZS4gSnVzdCBkcm9wIGFuIGUtbWFpbCB0byB0aGUgTlZEIG1haW50YWluZXJzLCBn
aXZpbmcgZm9yIGVhY2gKPiBDVkUgc29tZSBjbGVhciBldmlkZW5jZSB0aGF0IHRoZXJlIHdlcmUg
Zml4ZWQgaW4gOC4xLjEsIGFuZCBhc2sgdGhlbSB0bwo+IHVwZGF0ZSB0aGUgQ1ZFIGVudHJpZXMu
IFRoZXkgd2lsbCBhdXRvbWF0aWNhbGx5IHRha2UgY2FyZSBvZiBhZGRpbmcgdGhlCj4gQ1BFIGVu
dHJ5LCBhbmQgdXBkYXRlIHRoZSBDVkUgaW5mb3JtYXRpb24uCgpUaGF0IHdpbGwgYmUgdmVyeSBu
aWNlLCBhbmQgc2ltcGxlciB0aGFuIGdlbmVyYXRpbmcgYW4gWE1MIGVudHJ5IGFzIGRlc2NyaWJl
ZApvbiB0aGUgQ1BFIHN1Ym1pc3Npb24gd2ViIHBhZ2UgKFswXSkuCkkgd2lsbCB0cnkgdG8gZW1h
aWwgdGhlbSB0b2RheSBhbmQgSSBrZWVwIHlvdSB1cGRhdGVkIGlmIEkgZW5jb3VudGVyZWQKc29t
ZSBwcm9ibGVtcyB0byBkbyBpdC4KClswXSBodHRwczovL2NwZS5taXRyZS5vcmcvZGljdGlvbmFy
eS8jcHJvY2VzcwoKVGhhbmsgeW91IGFnYWluIGZvciB5b3VyIGhlbHAgIQoKQ2zDqW1lbnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
