Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9272AEC145E
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184D760F7C;
	Tue,  3 Mar 2026 15:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSsSSMJc23UA; Tue,  3 Mar 2026 15:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA73460DDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772550025;
	bh=CehCvmjoPFhJgnyWTX8Mgx4dw/NI2WDDx7Tdgkchlz4=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UNo6lm2q4PUXW7uMLTTAuCpbV1UYDJuVsUYmMStpUiLUYajsEfSnD3qJabf8tWju/
	 WZFknuNrm3jhLo6E3ObyF3k8Gfjne7nL7emE2VlcxsXWvQgwK4mOUeDnbY305z3fnd
	 AIN/FraACnf03eS3lrWW5BJ9/UOcd6ck9WyJ/JyWSV64ycPwLEbWMcXjyWRab4Ig/+
	 pIXsUh6silUT08nJ4RkkY1PuM1HqvHJLwlzokyslvkTzNBKtySo/GRDB6cGE+Fm6z0
	 +R4vIjCFzNusCn2602AQI7BZ3dgYr2GYTjbBBlrYLSM5i7KpCih3wnbB21bmSVo03S
	 Gk1WoKicFOsNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA73460DDD;
	Tue,  3 Mar 2026 15:00:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 784781EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E53460DDD
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Xlew8EQRBdp for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=oxffffaa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F44C60BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F44C60BB7
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F44C60BB7
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:00:23 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-389f9895c81so34409721fa.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772550021; x=1773154821;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s5KaFHqciSjmP5KCWk1u8cHpNm2g3qjtsWqRfOTH5GM=;
 b=HJDCQnZsezql5a/giWr5gNKslVwd7PQjTafvCIPX1pDkoKlK44oGmSPk0XJIrri2jq
 D0NBJl5Wsw6OnHUGgIvLumPsO198S+IJcyH2eWb7s1dytpxPy/a3xbAvWkr7Re+f9Dxh
 k1SsVVNpb7jAx+MbrzcdTRe7gT47rqTnTLc/n0WkIKtkwu5U0OaWKXZIEFLpM+TdUBRb
 1P5Et+TrX/Ia4V01VcMqwqQBy0MApjOWHTKtMvJqZ/UWt5wf3nayugSzrAF3Hl6lbXdn
 ABLvgYiFSdrtmWRt3PQht+OT0QWX252dP1oVKERiss5/KDeiLYL7AGfdl5xxC+JgzNcy
 qfDQ==
X-Gm-Message-State: AOJu0YwUjXb++hrbOiIOALxxy3Gfo2XkxujtJ5mL1DcPXLvKN/xw0lVt
 Uu4J/khO4ev7nJoSb2OgeLejhcawNF9B0YpjqfIoJHkqOWswrEA5L/LNRePkmsP4
X-Gm-Gg: ATEYQzylm/NhBUZRiPYx8z9aN/U8NNehyIQs/nYhjrZX8p+SrfnT0UAYEpKItBl+424
 tN8xmQhfDDvuzK9vnWrty91uFJ7/lj8PbCAH1jHxIrRJJKXtpcbJNEkOIy7yNGsOLtZbnqVaGkW
 XteLhDWQJKnkJ0aMPLqfbXlCTEDrFb2lUtaIeTXMGXKmsGsU/hrBVy6Hzjxwb1I96Z8Jlx5LHEO
 m7ToSBsblA2HyH9WSGj9rGYYTuZpibORhEAlWlnUbzuGsm63Wvtsi5g/l5QgXI+/yTv9ZXeiIlJ
 VaQaNGWo96RCdw8xN5wSXhxm7l6V/YSZuIoFCRIzW5ripQUHOi0jJdRBHqwoa2SRt2Un3oVSwwD
 K+EfGF3wkLUrTfTsY60yRlyYUDZt45xPcQ1qBhp3Zs1DN8L2V2GcGEAkrGE8SJdrHM0Tji0RRkY
 OEwkH7ihGshsfu9L9ABSfZhr0Jsrk=
X-Received: by 2002:a2e:8890:0:b0:389:fd1d:48ed with SMTP id
 38308e7fff4ca-389ff364574mr86036351fa.36.1772550020100; 
 Tue, 03 Mar 2026 07:00:20 -0800 (PST)
Received: from [192.168.0.111] ([77.220.140.242])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1235914cdsm622369e87.8.2026.03.03.07.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 07:00:19 -0800 (PST)
Message-ID: <987bd2ed-5087-4ee4-b3ce-3cb7a9030563@gmail.com>
Date: Tue, 3 Mar 2026 18:00:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru
To: buildroot@buildroot.org
From: Arseniy Krasnov <oxffffaa@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772550021; x=1773154821; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5KaFHqciSjmP5KCWk1u8cHpNm2g3qjtsWqRfOTH5GM=;
 b=j5MReG9lOLbU9ncqkbT3RZC/8FzSS7n3xuXWA/uXdWML1XX6FWl/G+rYk86T9XFl9S
 93SCffrlrYb2qia4nOf6ZBfY8irw+WtxvqrfwMapL2284SzG8VIsOJSpRHr5TaxaFyrs
 6yw2VO+tQ8zhIf9Upl+FQfZUO0TWDAf0AAN84otou492DuBYvmhy7LW9B1IsU7+aRJxv
 t0xIg/79+J8KiO/8y8w+LbuNmwwojZG8swY4tzIxAEWJVRf8NLAj4nr3k1XKAFYA2w38
 TkdipMdRVx8hfa/8a/DS1BCZILpm1JF8fTXzUC7gVluIB/pQ/+jeuJL/4KHMmgA2PsXR
 psXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j5MReG9l
Subject: [Buildroot] [PATCH v1] package/wpa_supplicant: add option for
 bgscan "learn"
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ClRoaXMgbW9kZSBmb3IgYmdzY2FuIGlzIGV4cGVyaW1lbnRhbCBhbmQgdGh1cyBpcyBkaXNhYmxl
ZCBieSBkZWZhdWx0LgoKU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxveGZmZmZhYUBn
bWFpbC5jb20+Ci0tLQrCoHBhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluwqAgwqAgwqAg
wqAgwqB8IDUgKysrKysKwqBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1r
IHwgNCArKysrCsKgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L0NvbmZpZy5pbiBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNh
bnQvQ29uZmlnLmluCmluZGV4IGE0NDJlYWE2NDEuLmQ2YzI5MTRiNjcgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNh
bnQvQ29uZmlnLmluCkBAIC0xODAsNCArMTgwLDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dQQV9T
VVBQTElDQU5UX0RCVVNfSU5UUk9TUEVDVElPTgrCoCDCoCDCoCDCoHNlY3VyaXR5IGNvbmNlcm5z
LCBidXQgc29tZSBzeXN0ZW1zIG1heSB3YW50IHRvIHN1cHBvcnQgV0VQCsKgIMKgIMKgIMKgbmV0
d29ya3MuCsKgCitjb25maWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQkdTQ0FOX0xFQVJO
CivCoCDCoCBib29sICJFbmFibGUgYmdzY2FuIFwibGVhcm5cIiIKK8KgIMKgIGhlbHAKK8KgIMKg
IMKgIEVuYWJsZSBleHBlcmltZW50YWwgImxlYXJuIiBtb2RlIGZvciBiZ3NjYW4uCisKwqBlbmRp
ZgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tayBi
L3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKaW5kZXggODY5OTc4MDcz
Ni4uZWVkZDVkNDA5MyAxMDA2NDQKLS0tIGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3Vw
cGxpY2FudC5taworKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1r
CkBAIC0xMjYsNiArMTI2LDEwIEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRf
V1BTKSwpCsKgV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgKz0gQ09ORklHX1dQUwrCoGVu
ZGlmCsKgCitpZmVxICgkKEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX0JHU0NBTl9MRUFSTiks
eSkKK1dQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFCTEUgKz0gQ09ORklHX0JHU0NBTl9MRUFSTgor
ZW5kaWYKKwrCoCMgV1BBMyBjb25maWd1cmF0aW9uczoKwqAjIC0gQ09ORklHX0RQUDogRWFzeSBD
b25uZWN0IChEZXZpY2UgUHJvdmlzaW9uaW5nIFByb3RvY29sIC0gRFBQIFIxICYgUjIpCsKgIyAt
IENPTkZJR19TQUU6IFNpbXVsdGFuZW91cyBBdXRoZW50aWNhdGlvbiBvZiBFcXVhbHMgKFNBRSks
IFdQQTMtUGVyc29uYWwKLS3CoAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
