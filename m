Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A6C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC1594012F;
	Mon, 19 Feb 2024 10:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qetrqkIfonYi; Mon, 19 Feb 2024 10:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F9A4027F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F9A4027F;
	Mon, 19 Feb 2024 10:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 403891BF3DB
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A08240775
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSmmzZLF27eZ for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:35:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E6D240636
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6D240636
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6D240636
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:35:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33d375993f4so663150f8f.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708338945; x=1708943745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UT4euWQUNFtrB/4BRS2wJD7QZlpW+tFt93/OIdkBowM=;
 b=naSCIsj9MProqjG3tqH97dajo/a7dkm5ZZvaQPNwa6982TxjDvM6A3RSDYd+OnQADr
 dkVaOLNKZ9QLZn0DLSvTdN6z+SVfRhHzbp8WSHpDQAEXBqNVHMoTfwEG0zYvRBCiPzsz
 bchjtU1hTBsZd+v7HMqja1F5xZcunla5AFPJu8ljAdwf1doE8U6ptBqOS/J8W7Tqscll
 +uuhQrTOS2f+YRkYnUSj23GYF9ACLLaEh7T5N22wk1Fhsi9M5VWsFbWFIx7Qx3Vrtz56
 5k5nulb6zvjaGLBPmDwUkr2E6rUvYvLG/u4iuC139QsRvQIj1MBwI7pkD7qq+rnCqZqe
 yI3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgEt/L0JxXqteDfY2ALvlFZnjWutZEQBkdKS2sK0D+lniRwUjrFuSkMnHG2egb9K+ri8SwX2OLvpctYY3mhaV8TJq3wKi49A==
X-Gm-Message-State: AOJu0Yy+eJx6TnBnBQA2NmYlnxPDyU50zU603cmBSRRWIylAomqrSw6U
 zBiW6fL2LYaoULNG8BH4m/mLGIWgLAGoCz9dK0YvIiU9f9s+OpaWlQvZm7pYxI0=
X-Google-Smtp-Source: AGHT+IFR92+2z2DgW7h8qHq+qL3jwekUahhM+TJQjaL9I+tFSlKcmH/PdRuzMj1JgnvWo70zouBQcA==
X-Received: by 2002:a5d:6ac8:0:b0:33d:2745:caae with SMTP id
 u8-20020a5d6ac8000000b0033d2745caaemr4819576wrw.71.1708338944986; 
 Mon, 19 Feb 2024 02:35:44 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a056000170900b0033d5fab6781sm721407wrc.96.2024.02.19.02.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:35:44 -0800 (PST)
Message-ID: <f02196e3-2303-4029-b989-50583f5808d6@smile.fr>
Date: Mon, 19 Feb 2024 11:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <4a8d7f2252b46118554a9e22c49901822e461f2f.camel@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <4a8d7f2252b46118554a9e22c49901822e461f2f.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708338945; x=1708943745;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UT4euWQUNFtrB/4BRS2wJD7QZlpW+tFt93/OIdkBowM=;
 b=x+9aBYWu3PU32IqiMZnDuNLh9MJj/W+2UFqLaG8N0YUK46W3OmCsc+1U9mRMQXgG7C
 dbQSfoQT3fLQOui55Rwjb/LXY+lrYwmJs28Av0iloKbafVCxZ2wNMGJLQ/KyBWHTmHrq
 hESXIuHg5PcL61LHT9+RVTLcprsh+sZYA6YLb6lldlz+KN/ASGMi5XoDyGW5lt5adQuf
 kFPIhZhDnazg6MxXIhDbH075eKGzk4p+GYZ4RkfaDFxYdSm44JTz6/On2LG1OJ74odAV
 rh0W7r0psCg5IvcfrybMsAx7YkxPertsaOKs58BvSiI48s745AJuyB7f1YNXsFsnGFOs
 FeXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=x+9aBYWu
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
 Andreas Dannenberg <dannenberg@ti.com>, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGFuZGVyLAoKTGUgMTcvMDIvMjAyNCDDoCAxODo0MCwgQWxleGFuZGVyIFN2ZXJk
bGluIGEgw6ljcml0wqA6Cj4gSGkgRGFyaW8hCj4gCj4gT24gU2F0LCAyMDI0LTAyLTE3IGF0IDE3
OjAyICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4gVGhpcyBzZXJpZXMsIHdoaWNoIGlu
IG15IGh1bWJsZSBvcGluaW9uLCBzaG91bGQgaGF2ZSBiZWVuIGltbWVkaWF0ZWx5Cj4+IGNvbnNp
ZGVyZWQgdG8gY29ycmVjdCB0aGUgY29tcGlsYXRpb24gZXJyb3JzIGluIGNhc2Ugb2YgSFMtRlMg
ZGV2Y2llcywgaGFzCj4+IHNlZW4gYW4gaW5jcmVhc2UgaW4gcGF0Y2hlcyBpbiB2ZXJzaW9uIDQg
dG8gcmVtb3ZlIHRoZSB0aS1rMy1pbWFnZS1nZW4KPiAKPiBJIHdhc24ndCBhd2FyZSBvZiB0aGUg
cHJlY2VlZGluZyB2ZXJzaW9ucywgYnV0Li4uCj4gCj4+IHBhY2thZ2UgdGhhbmtzIHRvIEJpbm1h
bi4gQWRkaXRpb25hbGx5LCBpdCBzaGFyZXMgc29tZSBtb2RpZmljYXRpb25zIGFuZAo+PiB2aWV3
cyBvbiBob3cgdG8gaW1wbGVtZW50IGNlcnRhaW4gY2hhbmdlcyB3aXRoIHRoZSBzZXJpZXMKPj4g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJp
ZXM9Mzk0ODQwLgo+PiBUaGVyZWZvcmUsIEkgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5IG5vdCB0byBy
dW4gdGhlbSBpbiBwYXJhbGxlbCBidXQgdG8gZGVjaWRlCj4+IHdoZXRoZXIgdG8gbWVyZ2Ugb25l
IGJlZm9yZSB0aGUgb3RoZXIgb3IgdG8gY29uc2lkZXIgYSBzaW5nbGUgc2VyaWVzIHdoZXJlCj4+
IHRoZSBwYXRjaGVzIGNhbiBiZSBjb2hlcmVudCB3aXRoIGVhY2ggb3RoZXIuIEkgYW0gYXZhaWxh
YmxlIGZvciBib3RoIHNvbHV0aW9ucy4KPj4gTGV0IG1lIGtub3cuCj4gCj4gLi4uIGFzIHRoZSBi
cm9rZW4gSFMtRlMgd2VudCB1bm5vdGljZWQsIHNlZW1zIHRoZXJlIGlzIG5vIHJ1c2ggdG8gZml4
IHRoZQo+IGJ1aWxkIG5vdz8gSSdkIHZvdGUgZm9yIGEgY29tYmluZWQgc2VyaWVzLCBiZWNhdXNl
IHlvdXJzIGFuZCBSb21haW5zIGRvCj4gb3ZlcmxhcCBoZXJlIGFuZCB0aGVyZSwgYnV0IEkgcGVy
c29uYWxseSB3b3VsZCBwaWNrIGRpZmZlcmVudCBwYXJ0cyBmcm9tCj4gZGlmZmVyZW50IHNlcmll
cy4gSSdkIG5vdCBpbnRyb2R1Y2Ugc2VjZGV2IHBhY2thZ2UgdW5sZXNzIGFic29sdXRlbHkKPiBu
ZWNlc3NhcnksIGFuZCBJIGFjdHVhbGx5IGJ1aWxkIEhTLUZTIGltYWdlcyB3aXRoIHlvY3RvIHdp
dGggY3VzdG9tIGtleXMKPiBhbmQgdXNpbmcgdXBzdHJlYW0gVS1Cb290IGJpbm1hbiBhbG9uZSwg
c28gbWF5YmUgSSBtaXNzIHNvbWV0aGluZywgYnV0Cj4gSSBkb24ndCBzZWUgdGhlIHBhY2thZ2Ug
YXMgcmVxdWlyZWQuCj4gCj4gRnJvbSBteSBzaWRlIEkgY2FuIG9mZmVyIHRlc3Rpbmcgb24gU0st
QU02MnggdmFyaWFudHMsIGJvdGggR1AgYW5kIEhTLUZTLgo+IEkgd2lsbCBkZWZpbml0ZWx5IHRl
c3QgeW91ciB2NCBiZWNhdXNlIGluIGNvbnRyYXN0IHRvIFJvbWFpbidzIFUtQm9vdAo+IHYyMDI0
LjAxIGJ1bXAgeW91cnMgbWF5IGFjdHVhbGx5IGJvb3QuLi4KPiAKCkNhbiB5b3UgbWVyZ2UgRGFy
aW8gY2hhbmdlcyAoZXh0bGludXguY29uZiBhbmQgcG9zdC1idWlsZC5zaCkgYW5kIHRyeSBhZ2Fp
bj8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
