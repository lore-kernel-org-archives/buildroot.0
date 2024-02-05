Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F0EC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D8140135;
	Mon,  5 Feb 2024 17:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D8140135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NsmFhuRkDnG; Mon,  5 Feb 2024 17:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D18840412;
	Mon,  5 Feb 2024 17:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D18840412
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEEE01BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FB781F2D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7FB781F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMLCZRgzFSaS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:37:42 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C58FE81F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C58FE81F31
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3570058f8f.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 09:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707154660; x=1707759460;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Z2ZahTYzQ3qb9rwEw70kUIuEovV5869C0bYaJSZhiw=;
 b=dPtDoAYrGClzYCjCzJSo7I87OvoB9m4henJy28NvZXdhIQeEPvgK/9mBM3dfZ/SCjz
 /pojJ9GzUvyTGbaVhwdVyh1Q2vQlmW8/Q3GogFBcEg2QGxIan8e6q5Ni8OqD5pCah1ZS
 W12cHojvxhoZrdF4gW25NB0DcPZisLq9GfvIRD1fmYLA6qQ6m47V0iT64eOS0b8IUEln
 1epZKdSPRuqBhkN23mdl00oEuz9XjE34Cl1+Kc7h1W6IQlTUiqdCf+/BCR0LVOt27bV9
 ZEAKoUNSJJRqK2JlqJsd2V2QsEzz3lhTlHsseBHwr3M7z9xSg4FHIrdIGM0iY0MLfll3
 IDUw==
X-Gm-Message-State: AOJu0YzALfJNXcQdkd1fNlveYu38iSMgsf7yXEnWO66ta2KCGGqoG41j
 m0JHMOA/aUnspKDvDyRPeV929fYa3cBuWLvwbZXqg/ykygh9oGYHhMfZVFcd3Ih6Xp1FMCbs9SH
 o2vY=
X-Google-Smtp-Source: AGHT+IHgvEnukc0c+8hI0acEy1qzaebV2/aIFx1QpWGtxZQLUNywQnBEFoyJPHyuLsQSKmDi3qA/Cw==
X-Received: by 2002:adf:ea4c:0:b0:337:8f98:8ab4 with SMTP id
 j12-20020adfea4c000000b003378f988ab4mr135183wrn.37.1707154659699; 
 Mon, 05 Feb 2024 09:37:39 -0800 (PST)
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a5d5346000000b0033b15fdad42sm105661wrv.34.2024.02.05.09.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 09:37:39 -0800 (PST)
Message-ID: <3f004ed2-3c15-4717-a071-eddebe0e6c10@smile.fr>
Date: Mon, 5 Feb 2024 18:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240205133530.1188319-1-romain.naour@smile.fr>
 <ZcEHGGPViIgpsLL7@landeda>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZcEHGGPViIgpsLL7@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707154660; x=1707759460;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Z2ZahTYzQ3qb9rwEw70kUIuEovV5869C0bYaJSZhiw=;
 b=SpKYjVcKPX1u1MbZjHA41wGS0RnPvpvZT8V+NG9iOKR22qmzx/WLPkRAbMgLR3Pk9P
 /w5SfNqxvwooEF0Yu4uu0g1DvrdGaSfWBsk3/8pNNoXrjWp2mYpX0hYVLqpJYZQ98sXh
 KTQTUgsFYmO1PZ2npwVE0EOPIWYaJogLmu2bSLB8+cpXZpzLQVpiAormqQmlbS2L0kpe
 mnM4eCEFecXumO474GOSoXXqO0V+OHiSlBMUHK4w9wO1hhPUXH8ZR7ubjrm6yQzy6s7S
 UM0tCenYAMbwvSMDxrKJhWPUPvo52wmZs1W5ged/dxQ1GGHr3dbjrlaT+C2IgNG6MMIJ
 AFqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=SpKYjVcK
Subject: Re: [Buildroot] [PATCH] support/testing: TestGrubX8664EFI: use
 Nehalem cpu emulation
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDUvMDIvMjAyNCDDoCAxNzowNCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjQtMDItMDUgMTQ6MzUgKzAxMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IEZvbGxvd2luZyB0aGUgQm9vdGxpbiB0b29s
Y2hhaW4gYnVtcCB0byAyMDIzLjExLTEgWzFdLCB0aGUKPj4gVGVzdEdydWJYODY2NEVGSSBmYWls
ZWQgd2l0aCB0aGlzIGVycm9yOgo+IAo+IEFzIHdlIGRpc2N1c3NlZCBJUkwsIEkndmUgcmV3b3Jk
ZWQgdGhlIGNvbW1pdCBsb2cgd2l0aCB5b3VyIGlucHV0LgoKVGhhbmtzIGZvciBpbXByb3Zpbmcg
dGhlIGNvbW1pdCBsb2cgd2l0aCBhZGRpdGlvbmFsIGltcG9ydGFudCBpbmZvcm1hdGlvbnMgYWJv
dXQKdGhlIHJvb3QgY2F1c2Ugb2YgdGhlIGlzc3VlLgoKSSByZWFsbHkgYXBwcmVjaWF0ZSBhbmQg
SSdsbCB0cnkgdG8gZG8gZXZlbiBiZXR0ZXIgbmV4dCB0aW1lIDopCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gCj4+ICAgIyBlZml2YXIgLWwKPj4gICB0cmFwczogZWZpdmFyWzg2XSB0cmFwIGlu
dmFsaWQgb3Bjb2RlIGlwOjdmYzE4N2Y0YzdmNCBzcDo3ZmZmOWJiYWE5MzAgZXJyb3I6MCBpbiBs
aWJlZml2YXIuc28uMS4zOFs3ZmMxODdmNGMwMDArMTYwMDBdCj4+ICAgSWxsZWdhbCBpbnN0cnVj
dGlvbgo+Pgo+PiBBY3R1YWxseSB0aGlzIGVycm9yIGNhbiBiZSByZXByb2R1Y2VkIGJ5IGluc3Rh
bGxpbmcgb3RoZXIgcGFja2FnZXMgbGlrZQo+PiAiZmlsZSIgYmVjYXVzZSB0aGUgcWVtdSBlbXVs
YXRpb24gZG9lc24ndCBwcm92aWRlIGFsbCBhc3NlbWJsZXIKPj4gaW5zdHJ1Y3Rpb24gZW11bGF0
aW9uIHJlcXVpcmVkIGJ5IHg4Ni02NC1jb3JlLWk3IHRhcmdldCB1c2VkIGJ5Cj4+IFRlc3RHcnVi
WDg2NjRFRkkuCj4+Cj4+IEEgc2ltaWxhciBpc3N1ZSBoYXMgYmVlbiBmaXhlZCBpbiB0b29sY2hh
aW4tYnVpbGRlciBieSBhZGRpbmcgTmVoYWxlbQo+PiBjcHUgZW11bGF0aW9uIG9uIHRoZSBxZW11
IGNvbW1hbmQgbGluZSBbMl0uCj4+Cj4+IEZpeGVzOgo+PiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzYwOTM4NTM3MTIKPj4KPj4gWzFdIDdlMGU2ZTNi
ODYxOGFiOTQyZjI1YjExZWU3MmZiYzVhNGRlZWZkZjEKPj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2NvbW1pdC9mMmIyNTM3MzJiNGQx
ZmM1Yjg3YmFkYmE3YzJkNDhmMTJhMTk3Zjc2Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IAo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MuCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiAtLS0KPj4gIHN1cHBvcnQv
dGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZ3J1Yi5weSB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9ncnViLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L2Jvb3QvdGVzdF9ncnViLnB5Cj4+IGluZGV4IDlmM2E2YTg0OTUuLjUzMTVmYTIzYmEgMTAwNjQ0
Cj4+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3RfZ3J1Yi5weQo+PiArKysg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkKPj4gQEAgLTEyMCw3ICsx
MjAsNyBAQCBjbGFzcyBUZXN0R3J1Ylg4NjY0RUZJKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4+
ICAgICAgICAgICMgaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2NvbW1pdC9iZjU2
NzhiNTgwMjY4NWUwNzU4M2UzYzdlYzU2ZDg4M2NiZGQ1ZGEzCj4+ICAgICAgICAgICMgaHR0cDov
L2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMy1KdWx5LzY3MDgyNS5o
dG1sCj4+ICAgICAgICAgIHFlbXVfZndfY2ZnID0gIm5hbWU9b3B0L29yZy50aWFub2NvcmUvWC1D
cHVocC1CdWdjaGVjay1PdmVycmlkZSxzdHJpbmc9eWVzIgo+PiAtICAgICAgICBzZWxmLmVtdWxh
dG9yLmJvb3QoYXJjaD0ieDg2XzY0Iiwgb3B0aW9ucz1bIi1iaW9zIiwgYmlvcywgIi1oZGEiLCBo
ZGEsICItZndfY2ZnIiwgcWVtdV9md19jZmddKQo+PiArICAgICAgICBzZWxmLmVtdWxhdG9yLmJv
b3QoYXJjaD0ieDg2XzY0Iiwgb3B0aW9ucz1bIi1iaW9zIiwgYmlvcywgIi1jcHUiLCAiTmVoYWxl
bSIsICItaGRhIiwgaGRhLCAiLWZ3X2NmZyIsIHFlbXVfZndfY2ZnXSkKPj4gICAgICAgICAgc2Vs
Zi5lbXVsYXRvci5sb2dpbigpCj4+ICAKPj4gICAgICAgICAgY21kID0gIm1vZHByb2JlIGVmaXZh
cmZzIgo+PiAtLSAKPj4gMi40My4wCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
