Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C08CF9C69
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 19:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A91360B8F;
	Tue, 24 Sep 2024 19:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vD2ErmI7J0Do; Tue, 24 Sep 2024 19:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509CE60D77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509CE60D77;
	Tue, 24 Sep 2024 19:47:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE2D11BF3CB
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 19:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6A860D77
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 19:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPdrVK-F8VHA for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 19:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com;
 envelope-from=jarraneil@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0131E60B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0131E60B8F
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0131E60B8F
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 19:47:32 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6c548eb3380so27422176d6.1
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 12:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727207251; x=1727812051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uA9UWcxoAB+SjShsg2wuxIo2QgnanYMGpXNnNv2oWIk=;
 b=sKR/0tWsgmT92Re1REaylhf7FrQaezx2gEGt8e1MkRXIUpICHF16++ihBwlfgOdQJO
 X2mrktLBXJYvu80LULWx6PJ3Y1s4QorwZPhXIbHC8hWaCPyMPmAitkPagebmN/TZklaS
 TgzYkA0qz0Wnpv77/IWTJ0vgbTvlEpbiDKzRK1lKWRIJXvBcidDaAM2PFY9I0quKxpS1
 EsgGOGEoJIB+bDfC7qHFPS2nLVHsTe9a8hyGfION3ZQ2J2ziGMr8dg7dac/91ec3E8b+
 pM3JqxiFEMjaVDJKzfnJ1uWQK41OIW2DpVoh+3XCn4hkfHZIhX+hFtEg8HvdBGd6FpFi
 3bYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbg4Ym3SAtc8UdqyhDCdd1lIai96+3jI0cizFh8obHa0gN8SFeF6W0cpibt3zoCLwnAmPO7VMQL64=@buildroot.org
X-Gm-Message-State: AOJu0YyNqdjAOx87njCkXLN8/KbjiQtpZLP16aHYMnV9tH3bJa7ZAF5s
 lHsI8NeUXjgzqg0QPeSBRvpx9yHtBRjuX6K8zsqouDghoQwHrYPo
X-Google-Smtp-Source: AGHT+IFJtoltypVJGrS4AVQgH9vxOJDQYIZ4SHr9vkAEV5xF6bvEhlMisvC0MU4udRf8nzivS92Emg==
X-Received: by 2002:a05:6214:458b:b0:6c7:c6f7:48a5 with SMTP id
 6a1803df08f44-6cb1dd7f01emr3768886d6.25.1727207251484; 
 Tue, 24 Sep 2024 12:47:31 -0700 (PDT)
Received: from [192.168.2.11] ([74.15.242.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb0f4a3ca2sm9398036d6.27.2024.09.24.12.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 12:47:30 -0700 (PDT)
Message-ID: <ec4d920c-d9a0-4185-8a8a-1c6030d19c2b@gmail.com>
Date: Tue, 24 Sep 2024 15:47:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>
References: <bf3a752a-6954-44dc-b805-c7850be85539@tungstencollaborative.com>
 <216539b9-4730-4adc-b400-655d287a082a@mind.be>
 <a9c3d961-ceda-4092-9830-27e3c4bd114b@gmail.com>
 <9d0c3fb8-a4ac-40f1-9608-a14ab281a861@mind.be>
 <f9a209f6-cca2-4f37-83d4-faa6ab86ac36@gmail.com>
 <e52f4b06-392d-42ce-be58-3987f85b4caf@mind.be>
 <5294b549-5641-49ba-b586-4e444494f599@gmail.com>
 <07c7a1e9-fa5b-4c4e-8d97-3175d9b4a454@mind.be>
 <7be9c48f-2504-40c7-98f3-236fc205b27e@gmail.com>
 <59faceb2-6814-432b-a888-a17549fd0bf4@gmail.com>
 <f7bf494a-a398-4f29-b730-a69ac46570f2@gmail.com>
 <CAOMZO5CyhAAAvP1cViv=xdu14h4GjZ=S8eV=xO0SzcRJFPj1Pw@mail.gmail.com>
Content-Language: en-US
From: Neil Webster <jarraneil@gmail.com>
In-Reply-To: <CAOMZO5CyhAAAvP1cViv=xdu14h4GjZ=S8eV=xO0SzcRJFPj1Pw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727207251; x=1727812051; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uA9UWcxoAB+SjShsg2wuxIo2QgnanYMGpXNnNv2oWIk=;
 b=evsIptO08EdUY4S/dEOz+nomotD4D9QOV2HGW2ts6+dYXnjAOQs4qn6GtKOnkR50D6
 kaLGztynuGpK0Aa/QXCc60oMjsSjgvAGjKyVbIeYJm50KcBPGkhnzQcyI786LL5fIUaL
 93JuGto6Q1LNjbGEmkHpYnBUCJV6BmV99b5NMTleVeBzktJQW7i4I61nBdo16EUyk2d8
 OY6P+IGkspYo87jaAq/pvy30lNfRMo96JLMN061+hkR+vbVD9ilP3XbHd1ywniYHh8Ek
 2fBh+uhZVuOcj3rJuNEqRl/bVBXTOCs6V9czaYxYrHoFmBShkev6TvyKStab0qAoNGCi
 A/qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=evsIptO0
Subject: Re: [Buildroot] Variscite Dart
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIEZhYmlvLgoKVGhlIHRyb3VibGUgaXMgdGhhdCBWYXJpc2NpdGUgZG8gbm90IHN1cHBv
cnQgYnVpbGRyb290IHNvIEkgY2FuJ3QgZ2V0IAphbnl0aGluZyB1c2VmdWwgb3V0IG9mIHRoZW0u
IEkgaGF2ZSB0cmllZC4gVGhleSBrZWVwIHRyeWluZyB0byBzdGVlciBtZSAKdG8gWW9jdG8uCgpD
aGVlcnMsIE5laWwKCk9uIDIwMjQtMDktMjQgMzowOSBwLm0uLCBGYWJpbyBFc3RldmFtIHdyb3Rl
Ogo+IE9uIFR1ZSwgU2VwIDI0LCAyMDI0IGF0IDQ6MDXigK9QTSBOZWlsIFdlYnN0ZXIgPGphcnJh
bmVpbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4+IEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09O
RklHPSJpbXg4bW1fZXZrIgo+IFlvdSBjYW5ub3QgdXNlIHRoZSBVLUJvb3QgaW14OG1tX2V2a19k
ZWZjb25maWcgZm9yIHRoZSBpLk1YOE1NCj4gVmFyaXNjaXRlIERhcnQgYm9hcmQuCj4KPiBZb3Ug
bXVzdCB1c2UgYSBzcGVjaWZpYyBpLk1YOE1NIFZhcmlzY2l0ZSBEYXJ0IFUtQm9vdCBkZWZjb25m
aWcgaW5zdGVhZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
