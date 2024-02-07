Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8108C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FC0A40136;
	Wed,  7 Feb 2024 10:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtfleyFvy-yC; Wed,  7 Feb 2024 10:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F46402E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53F46402E6;
	Wed,  7 Feb 2024 10:43:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8AA91BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A53426136F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e69Eqh1oMBlT for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B207B61306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B207B61306
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B207B61306
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:43:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b18099411so351333f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 02:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707302595; x=1707907395;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6NsrG9NEq8/ecsta+o0o9T+pM/yNo1mQUutPXyIlcQ=;
 b=wqY0pI6pzsIHDXAxMilQzNdNC33IK4Y77U6zXr4F6Pe/tzhjq6gVoP1rHbbN/8u8Ig
 DY7vVcU4v9OrXW3Gd+VXNvqQYSFBl9SwFtqARRWr3bG3FDbl26nHJa3b2uSwo8NKAQOj
 My2BMgMs3qTa37yYV3/wQsGchNaAVc8weU1CXhlOpWEBo2EO8m6y7lomgOgExF4D70Ts
 Pyc5FH0mTMFdmUaaOcyjjw67iKjt6Syd+vURCdiGe39OPqVIW8wXRQ8NVQJTyTznLQRl
 pruLA/UqnYj0F+pSjIqiYmBH8BMEz5hkHAZ4p6OHPCsXitXvbXwDDgi06xRDc/ajSTU3
 cBXw==
X-Gm-Message-State: AOJu0Yy5G2ncJFBx2PGmc+8BCMoPIVBOBk8/GhqkvYk2fxuonEfshWVk
 rTsVqdLbWMhfmAtuSCucbwOg0LWy8BE9Ugu2VKYDAc4/0/YIfFz36vgQhETreOw=
X-Google-Smtp-Source: AGHT+IFYjqmZEiufR0NdkgX8nX5VWg+RVxo7AqjmOgyJuGe7I6Ivz8bPtA1IYSqnbkYIF/J4vr0+zg==
X-Received: by 2002:a5d:4e8c:0:b0:33b:180d:edc7 with SMTP id
 e12-20020a5d4e8c000000b0033b180dedc7mr3312219wru.17.1707302594801; 
 Wed, 07 Feb 2024 02:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVDNiD0tysww40IHW4li1NGmdHlDLH47HjuNK9Jov93ZC3/hgO9vUDnBpGHKbqhVFDuFqJrPZJiRxkCxgupxvFoc2018JWjHAPemOYXFsTNIafFZwCogaJfJXR7kHAqwVgtmY5Bd0A00NRVOjV6DtregzVysA7Pr0a0EZC9ny+VRUeZCRlhFgkJ1v673uk+gRV5ddFlFiXBS6s8L7lcWVHrZASix4aKjO6Tq/DJ/OBwxygBB/nkOo3Go1217UMpzc1wmhRjGsHeg0Ymhq0gk/pR6RGlidrqHVT+Ja3qHE4yfjYvuAnbZ1d575jA4t8Kos1PvuQ=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a05600000ca00b0033b464bc0d9sm1182538wrx.24.2024.02.07.02.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:43:14 -0800 (PST)
Message-ID: <5c8f11b3-6142-47d9-a05f-bd4c8750f10b@smile.fr>
Date: Wed, 7 Feb 2024 11:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-12-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231218081958.506691-12-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707302595; x=1707907395;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p6NsrG9NEq8/ecsta+o0o9T+pM/yNo1mQUutPXyIlcQ=;
 b=0AlJ0/jKtBXvkZiAB9dcP2sqefczoTGmIp4aUtIrF1q5Mzok7u+tz1aYOxnN2XHbX5
 Dw3AViLFIkoOdnaViCq80bndKzHvAODs1tVF9p0JZ/NihkwDKs9yfR8G3LmGVD+bDjOh
 MuXrldvljWjf19UlddRY9ykkDcYyBfzHfSRh7tY7UqFJblnuTaYmVQXyqRoWb7py60JS
 NvJceYh+5M5qiRh7kOUpmurZVPUOe32XjR3DFghsJHDgd1WUqqBWt8M9wFbsXLpkWmEB
 mgobIP65hELM1eNVk7TE2Chx80n0gSzpvAmCRTl2mU1S+78N8kt+UbSCFvWok+lsXGGL
 BvTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0AlJ0/jK
Subject: Re: [Buildroot] [PATCH v3 11/11] configs/ti_am62x_sk_defconfig:
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxOC8xMi8yMDIzIMOgIDA5OjE5LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRlc3RlZCBvbiBTSy1BTTYyQi1QMS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4g
IGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3RpX2FtNjJ4X3NrX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gaW5kZXggMGZiOWEyZjAy
NDZjLi45ZTgyNWQ2NWMwZjYgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19kZWZj
b25maWcKPiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+IEBAIC0xLDggKzEs
MTEgQEAKPiAgQlIyX2FhcmNoNjQ9eQo+ICtCUjJfS0VSTkVMX0hFQURFUlNfNl82PXkKCkFzIHJl
cG9ydGVkIGJ5IEdpdWxpbyBCZW5ldHRpIGluIGEgcHJldmlldyBwYXRjaCwKQlIyX1BBQ0tBR0Vf
SE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzYgbXVzdCBiZSB1c2VkIGluc3RlYWQuCgpUaGlz
IHBhdGNoIHNlcmllcyBuZWVkcyBzb21lIHJld29yaywgSSdsbCBtYXJrIGl0IGFzICJjaGFuZ2Vz
IHJlcXVlc3RlZCIuCgpUaGFuayB5b3UsCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIEJSMl9S
T09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2gi
Cj4gIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3Qt
aW1hZ2Uuc2giCj4gIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1MjAw
bjggLXIgUEFSVFVVSUQ9MDAwMDAwMDAtMDIgLXggZWFybHljb249bnMxNjU1MGEsbW1pbzMyLDB4
MDI4MDAwMDAiCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42
LjEiCj4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ICBCUjJf
TElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRT
X05BTUU9InRpL2szLWFtNjI1LXNrIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
