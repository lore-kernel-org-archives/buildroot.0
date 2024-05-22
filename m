Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4164BC25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 13:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD77400F1;
	Wed, 22 May 2024 13:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2RpLYR_jsLn; Wed, 22 May 2024 13:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE5044054B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE5044054B;
	Wed, 22 May 2024 13:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 200C21C5BD2
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CFA54054B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naciJ-QfT1J9 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 13:15:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC0ED400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC0ED400F1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC0ED400F1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 13:15:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34f0e55787aso3867473f8f.2
 for <buildroot@buildroot.org>; Wed, 22 May 2024 06:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716383707; x=1716988507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZN5pqfkto6DpNuuEuoZMErx6/0WpfZm/GrKeKC9LtsY=;
 b=hNCUfp/HRnETJmZKq09L6pi/9Y6DtCnvNNm8UqTCa21Np0lUpT7D1zg6I97brQsyav
 IunutEMtKIAiPopMwO7KETpE30O71KeJPLLWjgiPtXBe86UtAlPrZlq2+AV7Jg8++1qE
 hkyeISP61gyvLMSVzoAdPxC1t2e09FSW9KyLMDexrAiIt43BSPYMuX3Euu7VQWhnEuKd
 SwZT7UMp/iHzLmpeQuNWMSHjHfedabX8QjIUcEK8MlTC7jinqKEHuW3d2n0Izjhsf3Sa
 4toWRoJ9YJ6Jf5zWqoO0zCGHV4StMajyQvlkC3XJB9zrY4+VPLFJ35v2SGEwMpsozdkv
 hT8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Y44PW7bztftoiUL+/opcTR1WWlcN13OAVCqKITn6tj167TGwgluz6qPLLau48gcie9V7xRCn5XoNebWFcLRWNjxWdg9qEQ==
X-Gm-Message-State: AOJu0Yx5+rhlvMZsg+1sNstK4MRQg0MWgYgBpbEjvRFY7Ir0+bkiNG6U
 r/G83fvem978+YO7XtQ6zi49cuGqVqLW/Kf68jBWqD/yv40kGZ308CNJu/Ow5BxJLTNFNjxT3TB
 E
X-Google-Smtp-Source: AGHT+IFUPsC3P4YPjyO3sFesnM0h1Tag5xSiq7K1bH+zRh0QDSm876KefvPTY9NQoKLMdcDK4/Bjmw==
X-Received: by 2002:adf:f642:0:b0:347:d352:d5c2 with SMTP id
 ffacd0b85a97d-354d8cc9023mr1354044f8f.13.1716383706663; 
 Wed, 22 May 2024 06:15:06 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc99sm34203690f8f.11.2024.05.22.06.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:15:06 -0700 (PDT)
Message-ID: <aa6efdde-d2da-4db9-9563-c7380a402912@smile.fr>
Date: Wed, 22 May 2024 15:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240521064045.2126436-1-peter@korsgaard.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240521064045.2126436-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716383707; x=1716988507;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZN5pqfkto6DpNuuEuoZMErx6/0WpfZm/GrKeKC9LtsY=;
 b=Bcj2X45lXQzPUypSPZqtQQCc/JO1U+/6mKcupc0TrdcHQJ97h2pVwZDG1u2CBz0qeS
 Wsau/fWl8/5whw54p0gl4mha71UBJKw4Jy+nhfJJ2X4g29V3hc//iBVLDxRnSFNWllSv
 pGVJbNMwxGe0ihnIb+cWzBVwQK8jI3YYoJsWzu6d6JuzWnVmQPAvSvmTj/vCz/wMX1cG
 AJd8MkxG7u1aKX/nuI+v5JZG6IrBSENAyslU/8fYxuo54ZkmtellBB6NbevmDSSk2n6k
 fZ/D/IciuzArBPzyXgDT9n8i46afxtGX2qZD0uY+rFtwHFrVfrS6uTW1SQq8ZXbD9/ip
 MeCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Bcj2X45l
Subject: Re: [Buildroot] [PATCH 1/2] configs/beagleboneai_defconfig: bump
 Linux to 5.10.217 to fix gcc 13.x build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyMS8wNS8yMDI0IMOgIDA4OjQwLCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPiBUaGUgNS4xMC43OSBrZXJuZWwgZmFpbHMgdG8gYnVpbGQgd2l0aCBHQ0MgMTMu
eDoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46Cj4gZHJpdmVycy9h
dGEvbGliYWhjaS5jOiBJbiBmdW5jdGlvbiDigJhhaGNpX2xlZF9zdG9yZeKAmToKPiAuLy4vaW5j
bHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjMxNTo0NTogZXJyb3I6IGNhbGwgdG8g4oCYX19j
b21waWxldGltZV9hc3NlcnRfMzIx4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBC
VUlMRF9CVUdfT04gZmFpbGVkOiBzaXplb2YoX3MpID4gc2l6ZW9mKGxvbmcpCj4gICAzMTUgfCAg
ICAgICAgIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVf
YXNzZXJ0XywgX19DT1VOVEVSX18pCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF4KPiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5o
OjI5NjoyNTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fz
c2VydOKAmQo+ICAgMjk2IHwgICAgICAgICAgICAgICAgICAgICAgICAgcHJlZml4ICMjIHN1ZmZp
eCgpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+Cj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoz
MTU6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9jb21waWxldGltZV9hc3NlcnTi
gJkKPiAgIDMxNSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywg
X19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiAgICAgICB8ICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQo+ICAgIDM5
IHwgI2RlZmluZSBCVUlMRF9CVUdfT05fTVNHKGNvbmQsIG1zZykgY29tcGlsZXRpbWVfYXNzZXJ0
KCEoY29uZCksIG1zZykKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDo1MDo5
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJTERfQlVHX09OX01TR+KAmQo+ICAg
IDUwIHwgICAgICAgICBCVUlMRF9CVUdfT05fTVNHKGNvbmRpdGlvbiwgIkJVSUxEX0JVR19PTiBm
YWlsZWQ6ICIgI2NvbmRpdGlvbikKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgo+
IC4vaW5jbHVkZS9saW51eC9ub3NwZWMuaDo1ODo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYQlVJTERfQlVHX09O4oCZCj4gICAgNTggfCAgICAgICAgIEJVSUxEX0JVR19PTihzaXpl
b2YoX3MpID4gc2l6ZW9mKGxvbmcpKTsgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAg
fCAgICAgICAgIF5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvYXRhL2xpYmFoY2kuYzoxMTM3OjIzOiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYYXJyYXlfaW5kZXhfbm9zcGVj4oCZCj4gIDEx
MzcgfCAgICAgICAgICAgICAgICAgcG1wID0gYXJyYXlfaW5kZXhfbm9zcGVjKHBtcCwgRU1fTUFY
X1NMT1RTKTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn4KPiAKPiBUaGlzIGlzIGZpeGVkIHVwc3RyZWFtIGJ5IGNvbW1pdCBmMDc3ODgwNzlmNTE1Y2Eg
KGF0YTogYWhjaTogZml4IGVudW0KPiBjb25zdGFudHMgZm9yIGdjYy0xMyksIHdoaWNoIGhhcyBi
ZWVuIGJhY2twb3J0ZWQgdG8gNS4xMC54IGFzIG9mIDUuMTAuMTg0LAo+IHNvIGJ1bXAgdG8gdjUu
MTAuMjE3IHRvIGZpeCB0aGUgYnVpbGQuCgpCb3RoIHBhdGNoIGFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBL
b3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gLS0tCj4gIGNvbmZpZ3MvYmVhZ2xlYm9u
ZWFpX2RlZmNvbmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYmVhZ2xlYm9uZWFpX2RlZmNv
bmZpZyBiL2NvbmZpZ3MvYmVhZ2xlYm9uZWFpX2RlZmNvbmZpZwo+IGluZGV4IDU4NmE3NTMxN2Uu
LjEzNzNiYTY2MmUgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9iZWFnbGVib25lYWlfZGVmY29uZmln
Cj4gKysrIGIvY29uZmlncy9iZWFnbGVib25lYWlfZGVmY29uZmlnCj4gQEAgLTgsNyArOCw3IEBA
IEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5z
aCIKPiAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9iZWFnbGVib25lYWkv
Z2VuaW1hZ2UuY2ZnIgo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjUuMTAuNzkiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTAu
MjE3Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ib21hcDJwbHVzIgo+ICBCUjJfTElO
VVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05B
TUU9ImFtNTcyOS1iZWFnbGVib25lYWkiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
