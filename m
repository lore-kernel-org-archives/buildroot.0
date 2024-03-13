Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23399C54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 10:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55E08131F;
	Wed, 13 Mar 2024 10:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_aeF_UT9cSj; Wed, 13 Mar 2024 10:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1B998132D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B998132D;
	Wed, 13 Mar 2024 10:56:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18E581BF577
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1318840606
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 10:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoxeHt7qtgwV for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 10:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D37B4046B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D37B4046B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D37B4046B
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 10:56:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso402276f8f.0
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 03:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710327414; x=1710932214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0RhusDPuTrXC2tMI2pJbltupiAxGyOxLRmA5wC/lq00=;
 b=YunQHWoPghDmezRZztxQsx5FNxldgbpiaIbFBLZBdejC4rkuey20QGuGAEbVc8Fsv7
 iay1pZfs2wjUfKtVk+PBHlGaH/B+lp02UgxIK3veeS5Z+DxYQxFRT4uMu57B0B9KRbKc
 XhtjF49UNyQXzk1so8GK+euPij69gPrFDZSAUvae6aSriwyaSNZ3T3EgtuTpjZAXI88f
 hxqqmtiCpvpOlkbQKz7Hwt1wZLnrywPJUsgQA8pvvLMW125YKvoaFCUMFebUNDXpKoVn
 AI6vy/k8d1gH9NaYbnucaANGGVX/AZoCkgsn5Oab2OFR7I4mZWluc8mPODZ5gM2jlgDw
 YStg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqLaotCkzVqa9kExsUbjpdYoQZMs2cwH7w1W0FR1S8/VCiOqqTvTURh+Wpf/R3XjguUz0nWJWCV/cOwcMPi8DJbOgoGpFZ8Q==
X-Gm-Message-State: AOJu0YxeykX4Jb0mqOsPNVTuIlgCiimEsLCf3nS/0IclM6g0JTtqgL9y
 lSseMnIrvkip9BLG0jsD6KRhT8VJrbmPTugu4JMikWbbBNJhph2OvqFXNLARXLI=
X-Google-Smtp-Source: AGHT+IGhjqcKjomi/LUJdy7RwKgrVakVSGbuRZMxJ0G41pxSFYLH9Iut3NzipPaKnOyTflqCR7eAWA==
X-Received: by 2002:a05:6000:1448:b0:33d:dd41:674c with SMTP id
 v8-20020a056000144800b0033ddd41674cmr2105364wrx.28.1710327414402; 
 Wed, 13 Mar 2024 03:56:54 -0700 (PDT)
Received: from [10.5.0.26] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a056000004500b0033e3c4e600asm11364516wrx.7.2024.03.13.03.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 03:56:54 -0700 (PDT)
Message-ID: <96a71705-dceb-4417-9edd-1f962edd66f4@smile.fr>
Date: Wed, 13 Mar 2024 11:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-20-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240304153253.732708-20-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710327414; x=1710932214;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0RhusDPuTrXC2tMI2pJbltupiAxGyOxLRmA5wC/lq00=;
 b=MUcGJwkBd5XCgoRA3GXYfrgZXKEbwr1dMjEo+fRNTC6QaAXZGPjcBHJ+8f4pGaV/bb
 0hchXHbqwG7dZnLBs1ITtyXDKu1cUEbnUAyTBvqVSb7jigOCE4NwM80p3oDcPSb4GSDH
 C0CZVfJBnP8rWRIS6jPqyIcSoXB+hgwhpaZ5S1QKX+aaaN3lldDwPeXGWxOpQqokZF5S
 Y8sba9Gy9UBz5inltiI7hbuzCorsgZf0W5MB96NiFi/6nltixRSpP2yOXzz9WW/n2uaP
 8gQnUCxgFyDHZnOvDX3S8/W7uppJkwz7vW2iZQ1a0aSpdVPi0RIKNeBV2DR/fgjSBSnr
 mKkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MUcGJwkB
Subject: Re: [Buildroot] [PATCH v9 19/22] board/ti/am62x-sk: move
 post-{build, image}.sh to board/ti/common/am6xx
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwNC8wMy8yMDI0IMOgIDE2OjMyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBwYXRjaCBtYWtlcyBpdCBjbGVhciB0aGF0IHRoZSBtb3ZlZCBzY3JpcHRz
IGNhbiBiZSB1c2VkIGJ5IHRoZQo+IGFtNnsyLDR9eCBwbGF0Zm9ybXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+IAo+IC0tLQo+IAo+IEFkZGVkIGluIHY4Cj4gCj4gIGJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3Qt
aW1hZ2Uuc2ggICAgICAgICAgICAgICAgICAgfCAgNSAtLS0tLQo+ICBib2FyZC90aS97YW02Mngt
c2sgPT4gY29tbW9uL2FtNnh4fS9wb3N0LWJ1aWxkLnNoIHwgIDAKPiAgYm9hcmQvdGkvY29tbW9u
L2FtNnh4L3Bvc3QtaW1hZ2Uuc2ggICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gIGNv
bmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0t
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAg
ZGVsZXRlIG1vZGUgMTAwNzU1IGJvYXJkL3RpL2FtNjJ4LXNrL3Bvc3QtaW1hZ2Uuc2gKPiAgcmVu
YW1lIGJvYXJkL3RpL3thbTYyeC1zayA9PiBjb21tb24vYW02eHh9L3Bvc3QtYnVpbGQuc2ggKDEw
MCUpCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBib2FyZC90aS9jb21tb24vYW02eHgvcG9zdC1pbWFn
ZS5zaAo+IAo+IGRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9wb3N0LWltYWdlLnNoIGIv
Ym9hcmQvdGkvYW02Mngtc2svcG9zdC1pbWFnZS5zaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDc1
NQo+IGluZGV4IDM0ZjczMmMwOTFhZC4uMDAwMDAwMDAwMDAwCj4gLS0tIGEvYm9hcmQvdGkvYW02
Mngtc2svcG9zdC1pbWFnZS5zaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw1ICswLDAgQEAKPiAt
IyEvYmluL3NoIC14Cj4gLQo+IC1CT0FSRF9ESVI9IiQoZGlybmFtZSAiJDAiKSIKPiAtCj4gLXN1
cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCAtYyAiJHtCT0FSRF9ESVJ9L2dlbmltYWdlLmNmZyIK
PiBkaWZmIC0tZ2l0IGEvYm9hcmQvdGkvYW02Mngtc2svcG9zdC1idWlsZC5zaCBiL2JvYXJkL3Rp
L2NvbW1vbi9hbTZ4eC9wb3N0LWJ1aWxkLnNoCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlCj4gcmVu
YW1lIGZyb20gYm9hcmQvdGkvYW02Mngtc2svcG9zdC1idWlsZC5zaAo+IHJlbmFtZSB0byBib2Fy
ZC90aS9jb21tb24vYW02eHgvcG9zdC1idWlsZC5zaAo+IGRpZmYgLS1naXQgYS9ib2FyZC90aS9j
b21tb24vYW02eHgvcG9zdC1pbWFnZS5zaCBiL2JvYXJkL3RpL2NvbW1vbi9hbTZ4eC9wb3N0LWlt
YWdlLnNoCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjkxN2Nh
MjM4YWE3OAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9ib2FyZC90aS9jb21tb24vYW02eHgvcG9z
dC1pbWFnZS5zaAo+IEBAIC0wLDAgKzEsMTEgQEAKPiArIyEvYmluL3NoIC14Cj4gKwo+ICtib2Fy
ZF9kaXIoKSB7Cj4gKyAgICBpZiBncmVwIC1FcSAiXkJSMl9ERUZDT05GSUc9LiovdGlfYW02NHhf
c2tfZGVmY29uZmlnXCIkIiAiJHtCUjJfQ09ORklHfSI7IHRoZW4KPiArICAgICAgICBlY2hvICJh
bTY0eC1zayIKPiArICAgIGVsc2UKPiArICAgICAgICBlY2hvICJhbTYyeC1zayIKCldoYXQgaWYg
d2UgYWRkIGEgbmV3IGJvYXJkIGJhc2VkIG9uIGFtNjIgU29DIGxpa2UgdGhlIGJlYWdsZXBsYXkg
WzFdID8KCkkgYmVsaWV2ZSBpdCdzIGZpbmUgdG8gaGF2ZSB0aW55IHBvc3QtaW1hZ2Uuc2ggc2Ny
aXB0IGluIGVhY2ggYm9hcmQgZGlyZWN0b3J5Cmluc3RlYWQgb2YgZ2VuZXJpYyBzY3JpcHQgdGhh
dCBpcyBhd2FyZSBvZiBib2FyZHMgbmFtZXMgKGFjdHVhbGx5IGJvYXJkCmRpcmVjdG9yeSBuYW1l
IGluIEJ1aWxkcm9vdCkuCgpbMV0gaHR0cHM6Ly93d3cuYmVhZ2xlYm9hcmQub3JnL2JvYXJkcy9i
ZWFnbGVwbGF5CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKyAgICBmaQo+ICt9Cj4gKwo+ICtz
dXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2ggLWMgImJvYXJkL3RpLyQoYm9hcmRfZGlyKS9nZW5p
bWFnZS5jZmciCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIGIv
Y29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiBpbmRleCBiZDI5NGJiNzEyZWUuLjMxMGJh
NmZiNjQ1MyAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+ICsr
KyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gQEAgLTEsNyArMSw3IEBACj4gIEJS
Ml9hYXJjaDY0PXkKPiAgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzY9
eQo+IC1CUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC90aS9hbTYyeC1zay9wb3N0
LWJ1aWxkLnNoIgo+IC1CUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC90aS9hbTYy
eC1zay9wb3N0LWltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2Fy
ZC90aS9jb21tb24vYW02eHgvcG9zdC1idWlsZC5zaCIKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdF
X1NDUklQVD0iYm9hcmQvdGkvY29tbW9uL2FtNnh4L3Bvc3QtaW1hZ2Uuc2giCj4gIEJSMl9ST09U
RlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgdHR5UzIsMTE1MjAwbjggLWQgazMtYW02MjUtc2suZHRi
IC1sIGFtNjJ4LXNrLWJ1aWxkcm9vdCAtciAvZGV2L21tY2JsazFwMiAteCBlYXJseWNvbj1uczE2
NTUwYSxtbWlvMzIsMHgwMjgwMDAwMCIKPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gIEJSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
