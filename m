Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A7CC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 18:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 432EA405C2;
	Thu, 16 May 2024 18:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VX7YIGVCR2K; Thu, 16 May 2024 18:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5059141D77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5059141D77;
	Thu, 16 May 2024 18:14:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 898421BF84C
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83AEE606A0
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bFrAvBBp4EX for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 18:14:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E10B4606C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E10B4606C8
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E10B4606C8
 for <buildroot@buildroot.org>; Thu, 16 May 2024 18:14:09 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e538a264e0so14671911fa.1
 for <buildroot@buildroot.org>; Thu, 16 May 2024 11:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715883247; x=1716488047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S7lHzHrnyAZPVgO2n+OmeVBIv1CfLzpk4O88L4Z+uHk=;
 b=sJB9YY/nHkSGmCVH1jKWqDUdk6uEdapZauJzK8oTJZn5NMuGAb9sl0DvldOtG9YZjn
 sRrjGyszNE5dH5/MR4Q+q9SbPP1GnQmyD7a+nTHs0z3L1G2UYhqg39dGLJocWvVXfL6w
 o1T5PuRHRvGgKWT1H2KTA5wUp9pNnWMPh+JL6EZRapeawl3txf3LOfi6tHY08P4ftXcX
 YBgnB9uAiTT+Dy2/q6ggZ+AzinJZVfTHxj1noeU33EsPkz1DgG9z66pke50NoJ3SHXMi
 WoDzdriTUtjEZZwO+3GjDGiyh6ggtuxiMYHE9P6VRPYaitwshRbi71Hvb+cwzkUHY8mR
 R1Kw==
X-Gm-Message-State: AOJu0YxwmkG+y8b1y9TqRRIHy6PJBtO5D1c4Bhi9FHknBqQE2WoOQrxG
 omel1chL7bPNVZgu13sfWRO0oGvh6Z+/D5UYRqS7uP/Aoysl79tg8QzSEETMJHEoSDRLebJSgdV
 P06jO1GsI/i2G6+Vn5dRLPvBsw9bZjg==
X-Google-Smtp-Source: AGHT+IECjsaug9pTVFQGzQKm/OKbe2ddX4zsXQPYBnqEcMcguiIK2r1KHONAdjaZHqrHUKWOiYd2C1mlpkOAcOdqOqo=
X-Received: by 2002:a05:6512:114c:b0:523:add0:baa9 with SMTP id
 2adb3069b0e04-523add0bbe8mr4661337e87.43.1715883247329; Thu, 16 May 2024
 11:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <CACXRmJgPqvXJYt3Q2xh3abjoGxSs_AHXF6xPELYqc1M5ZTG_-w@mail.gmail.com>
In-Reply-To: <CACXRmJgPqvXJYt3Q2xh3abjoGxSs_AHXF6xPELYqc1M5ZTG_-w@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 May 2024 20:13:56 +0200
Message-ID: <CAPi7W835+uBX97R=0VupBdLoMCTMqLK2qGMUo=CQKDWR+6j5sQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715883247; x=1716488047; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7lHzHrnyAZPVgO2n+OmeVBIv1CfLzpk4O88L4Z+uHk=;
 b=QQSEQLrvVb9Ua3n68lPLJz8NMi1PT2XtRiv572i+/NK28uc4/N2A8ng1KXJhUCP0MG
 QFvLA6h7WO4m9xpwlFn1gr8v8nB4oxsmsWWyuixw/Kd9T7IJdCFTlvRRuU36lXI4RNIO
 ZNJmQ8XZJDKHinAAIeR5FGjbIcoGvtLctdNicX6MPCYK5a0W87i03MWOJX2rn8jZL4WA
 4IkN9xUMdFp1cEHAHc1HC5SjFXls3/MYfX/MFNoPOsXoP+DzKOaqPVMbD7ytkLXRCKoT
 WkMFgPgwh221Pdz2Q+g5wfzZhufyPHC+yZmg7QU8p0AEOlUNBJsqRbYMe8HUUzdaHxR2
 jdyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QQSEQLrv
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libcurl build
 without C++
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgamV1LiAxNiBtYWkgMjAyNCDDoCAxOTozMywgVGhvbWFzIERldm9v
Z2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiBhIMOpY3JpdCA6Cj4KPiBIaSBGYWJyaWNlLCBBbGws
Cj4KPgo+IEkgc2F3IGEgdmVyeSBzaW1pbGFyIGlzc3VlIHdoZW4gdXNpbmcgbGlicmVzc2wuCj4g
aHR0cHM6Ly9naXRodWIuY29tL3N5c2xvZy1uZy9zeXNsb2ctbmcvaXNzdWVzLzQ5MjMKPgo+IFBl
cmhhcHMsIHRoZSB1c2FnZSBvZiBsaWJvcGVuc3NsIHNob3VsZCBhbHNvIGJlIGFkZGVkIHRvIHRo
ZSBjb25kaXRpb24uCgpJdCBpcyBhIGRpZmZlcmVudCBpc3N1ZS4gSSB0aGluayBpdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8gZml4IHRoZSBidWlsZAp3aXRoIGxpYnJlc3NsIHJhdGhlciB0aGFuIGFkZGlu
ZyBhIGxpYm9wZW5zc2wgY29uZGl0aW9uLgpJIHdpbGwgbG9vayBpbnRvIGl0IHdoZW4gSSBoYXZl
IHNvbWUgZnJlZSB0aW1lLgoKPgo+Cj4gS3IsCj4KPiBUaG9tYXMKCkJlc3QgUmVnYXJkcywKCkZh
YnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
