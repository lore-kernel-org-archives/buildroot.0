Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2251C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E9760BAD;
	Mon, 14 Apr 2025 18:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkTmTybQVII9; Mon, 14 Apr 2025 18:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A71B460B1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71B460B1B;
	Mon, 14 Apr 2025 18:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99093108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C0BC60684
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F869EFAeJ0bf for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE31B606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE31B606CC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE31B606CC
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:16:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so40053585e9.3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744654611; x=1745259411;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YlAPo0fgON8cbwjqGesv198tdtqikiilOzwdXtQvk/c=;
 b=eMjuiqT0Kbl2cJCwAOjLT6FXLdRpITnzlbbKWDQ80XUFqLUJEq55L3k2sgY4Hmf0Vu
 dkFuh+jVmtot8KLYxLJl/5s+XsEQlsSJRSDh7rDh9DbFL+X0imiLefdt22Oe1Ppc2R4P
 XVoQnvlxfO9aJmJrFaVKHqboat4uiIb+JolkIpMdCThVOy0PcwjjaqjsbzSYiw4c+oQy
 nQUPcgOTnYLFx/ORuVtnwl77FHb+F7flrTusWq3mopmwdqlXbxxqRGp+XEF5mTwA5ABx
 8vJlznUC82zNDON+N8AIi0AvWXBxkNsQOhWIw67vjTPdB1jfC2Ozkn6tPZC4iDdu+DeC
 mkdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa0yc3Us8g5xx3oM24PzGwIPC0vfp7XXSndH418/mLCwrbwGGer9CyieTLEoeBZINlE1FCTxmZLvk=@buildroot.org
X-Gm-Message-State: AOJu0Yzw0aI1FQW+v2HtWNs5Cahbmb+uX5MN5kZ26mzU3vouevl6rfdo
 pEXStm4jx8UL7C5tGqP/nz6nco4GT3go9mZkf94R4Ptrm4DK+20E
X-Gm-Gg: ASbGncsbJ7B97PA0j2yNevpcBsuQKpwl3ErTC+WoxSjkrM56Ew9jYUh7hWpGMVUR5RC
 WwagC+ya2F/so48/XQ876B15thArDlTwe1gfnxZyv1nV3Vzz5/0ixpjVKY94YoytOote143F15z
 bR6Pxn2WA3x4jx4wumsrAFlMbpOhZhoZDG1yc2gc3I2JAn3KRCfkKrrdqfk01wHttJlo/x/h/JA
 mEnocsVBo3DXZ5MsSokEc/53h9T/B8BiSIrHRDNzHQLMbaOkPlO03oLBD+5Szp0jyrmXr/N4Crb
 o5V+DFhP72icVfbiTIp+aBXlxo+NTkkKOQuzGJEuO6lrCnVand0C9pzgdycFIL+nuySFhv5vT4H
 GxIcEGg3o/g==
X-Google-Smtp-Source: AGHT+IG/xdgaFnCrK14XDnVPbnC+XA2z+6xvy9pQz3UJTgf1wl/8QVopqca0TaEQwXrgIpgij1iC3A==
X-Received: by 2002:a05:600c:3b0d:b0:439:8c80:6af4 with SMTP id
 5b1f17b1804b1-43f3a9599e7mr115197815e9.19.1744654610511; 
 Mon, 14 Apr 2025 11:16:50 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338db0dsm188496175e9.7.2025.04.14.11.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 11:16:50 -0700 (PDT)
Message-ID: <86eaf5bd-23e6-40c3-82f2-adc1d6a7e85c@gmail.com>
Date: Mon, 14 Apr 2025 20:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20250413164708.1943803-1-dario.binacchi@amarulasolutions.com>
 <20250413164708.1943803-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250413164708.1943803-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744654611; x=1745259411; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YlAPo0fgON8cbwjqGesv198tdtqikiilOzwdXtQvk/c=;
 b=S6/GKmurWP5Hg/b3iTYFNos3sLQiCN2bAF8W7HFY5+FmZ+oNnMSiwkY1J+4LU8dds0
 UVypWODUQNBB9g7HAmV4JTttXOAKI9awrpGoQlgn3X9iZ1X+kyq7Pqek8Ktil0uokpiW
 wYnkH42f71/KHLkeGhxBMIJF058oh/89CsJ7TVDRB+A9o3uFNc5X3KJUeg7JmpQbmLGg
 gv6d/Rir3P3bois4NI0qQx0ZMsH9FqeC5hsdvxXgMSwJjY9PV11gd6GJPJwiWs0wV5bG
 bYB6eRudnzaF9blgvcOrSqeDsy8cpkVgr8iMkfLClW8RNGmqRj9ovpFhN8tjvAnkyq7k
 CHJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S6/GKmur
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/stm32mp1*_dk*: bump TF-A to
 2.10, Linux to 6.12.22 and U-Boot to 2025.04
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxMy8wNC8yMDI1IMOgIDE4OjQ3LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdMKgOgo+IFRo
ZSBwYXRjaCBidW1wcyBBcm0gVHJ1c3RlZCBGaXJtd2FyZSAoVEYtQSkgdG8gdmVyc2lvbiAyLjEw
IExUUyBmb3IKPiAKPiAtIHN0bTMybXAxNTdhX2RrMV9kZWZjb25maWcKPiAtIHN0bTMybXAxNTdj
X2RrMl9kZWZjb25maWcKPiAKPiB0aGUgTGludXgga2VybmVsIHRvIHZlcnNpb24gNi4xMi4yMiBh
bmQgVS1Cb290IHRvIHZlcnNpb24gMjAyNS4wNCBmb3IKPiAKPiAtIHN0bTMybXAxMzVmX2RrX2Rl
ZmNvbmZpZwo+IC0gc3RtMzJtcDE1N2FfZGsxX2RlZmNvbmZpZwo+IC0gc3RtMzJtcDE1N2NfZGsy
X2RlZmNvbmZpZwo+IAo+IFRoZSBuZXcgdmVyc2lvbiBvZiBVLUJvb3QgaGFzIGFkZGVkIEVGSSBD
YXBzdWxlIHN1cHBvcnQsIHdoaWNoIGRlcGVuZHMgb24KPiBHbnVUTFMsIHRodXMgcmVxdWlyaW5n
IHRoZSBhY3RpdmF0aW9uIG9mIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfR05VVExTCj4gZm9yIHN0
bTMybXAxMzVmX2RrX2RlZmNvbmZpZy4KPiAKPiBUZXN0ZWQgb24gU1RNMzJNUDE1N0MtREsyIERp
c2NvdmVyeSBCb2FyZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCgpIaSBEYXJpbywKClJldmlld2VkLWJ5
OiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPgoKQmVzdCByZWdh
cmRzLApSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
