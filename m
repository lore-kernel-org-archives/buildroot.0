Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549F0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101F883F94;
	Tue, 12 Apr 2022 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y7SgkSlFbYrI; Tue, 12 Apr 2022 18:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123F082CCA;
	Tue, 12 Apr 2022 18:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F117A1BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDF7440B43
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zizIdA3uNpjs for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:34:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E127540B3A
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:34:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k23so39025755ejd.3
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=POFKnTkjW/Yyv+4cueBi5A6/GwpjmpvRAU/fEr9ajSw=;
 b=Dm/za61xtAvJkTqprtBUXGT5DAOKNlTbYxtBOHv8p6zMER2fPfcrGgh6LFrl+dD9pB
 Mv9pHCvGInHsVlR8l4lyyJ/W4Ut57MA0tUTHi3nmSF3rzMihx/vT6yw4MYf/jbKlMlpY
 OWCXoB/ni4HpUixGkYN87WQxUYI9zpg3K+3rp+Dot51EEyRu62sVUuwpr7oT8JyDWdif
 NNFcLIfCcfqWBD9V20kM0dL9IJShD8TFs1YvNZ4PVWHHsVSl8C4pm4QA645/52lREll5
 iDyMc0yiNZif21Y+4VMlnH21UlOtMruBPESNojSWHfSL69lMagvOOZoBFHCSheOw1gHX
 DKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=POFKnTkjW/Yyv+4cueBi5A6/GwpjmpvRAU/fEr9ajSw=;
 b=mOm2FI+JXn6dBYpVKYIvit9F3RDTnT+Dyz6EjeVtd8WjV1UAXBhpA3IbE6F3c37nSj
 OZdjei8jAWe2HZk613zdqX8UJPSVQkONbfqv1ZkWOXr1HI9OA0h9T4khRA6S3bDHF9LB
 xOBrstCsyknupuyZ8hUusBcRObBofWUAR8xLezSbErrNQwvJ+CLEfHXf/IGCfevWXFhk
 ltL9B6BhL7UO1TdMHxVYWVqL4ZkXnkK02EJ480ZOyp429pSmLnz31iRNF34Sf9GLs43+
 MBYJQ75pPLq2nrHEOUKRjjGivKmXpq3ntBKa1J78Rg+InP6ViPGEGm+EMIHMi5TltcKo
 lwWQ==
X-Gm-Message-State: AOAM530rH3326vN1nSDfS/aV+t3/ZSDJcIV2XqtK9eF48u/zWCQKFF3e
 QS/dt8ZghA8IqkTa/vjtP9/VrF78+Naudg==
X-Google-Smtp-Source: ABdhPJzoNYC78if7AdDBcDMneIT7l7zLeqxwnjI2Ba2HY9IxNkDxa70T+uSenZhV3Xf75+iTOFG1pw==
X-Received: by 2002:a17:907:608c:b0:6e8:ad4b:b501 with SMTP id
 ht12-20020a170907608c00b006e8ad4bb501mr5138448ejc.466.1649788451212; 
 Tue, 12 Apr 2022 11:34:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kw3-20020a170907770300b006b2511ea97dsm13347127ejc.42.2022.04.12.11.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:34:10 -0700 (PDT)
Message-ID: <19f9d8ec-e34b-b0d5-051d-9568ffc6ec5f@mind.be>
Date: Tue, 12 Apr 2022 20:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405205521.2117028-1-fontaine.fabrice@gmail.com>
 <e08f9b1f-f1cd-b096-98a2-b81c33bc1c6e@mind.be>
Organization: Essensium/Mind
In-Reply-To: <e08f9b1f-f1cd-b096-98a2-b81c33bc1c6e@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/lsof: drop first and second
 patches
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IMKgUHJlc3NlZCBzZW5kIHRvbyBzb29uLi4uCgogwqBTdWJqZWN0IHdhcyB3cm9uZzogaXQncyBm
aXJzdCBhbmQgdGhpcmQgcGF0Y2hlcy4KCgpPbiAxMi8wNC8yMDIyIDIwOjMyLCBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSB3cm90ZToKPgo+Cj4gT24gMDUvMDQvMjAyMiAyMjo1NSwgRmFicmljZSBGb250
YWluZSB3cm90ZToKPj4gU2V0IExTT0ZfQVIgYW5kIExTT0ZfQ0MgdG8gYmUgYWJsZSB0byBkcm9w
IGZpcnN0IHBhdGNoIHdoaWNoIGlzIG5vdAo+PiB1cHN0cmVhbWFibGU6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9sc29mLW9yZy9sc29mL2lzc3Vlcy8xOTcKPj4KPj4gJChUQVJHRVRfQ09ORklHVVJFX09Q
VFMpIG11c3QgYWxzbyBiZSByZW1vdmVkIHRvIGF2b2lkIG92ZXJyaWRpbmcgQVIKPj4gYW5kIHNv
IHdlIGNhbiBkcm9wIExTT0ZfQ0ZMQUdTX09WRVJSSURFPTEgYW5kIHRoaXJkIHBhdGNoCj4+Cj4+
IERFQlVHPSIkKFRBUkdFVF9DRkxBR1MpIiBjYW4gYWxzbyBiZSBkcm9wcGVkIGZyb20gTFNPRl9C
VUlMRF9DTURTIGFzIGl0Cj4+IGlzIGFscmVhZHkgc2V0IGluIExTT0ZfQ09ORklHVVJFX0NNRFMK
Pj4KPj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+IApbc25pcF0KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHNvZi9sc29mLm1rIGIv
cGFja2FnZS9sc29mL2xzb2YubWsKPj4gaW5kZXggZmYwOWQ2NDM0NS4uZTRlMzM5MzQ5YSAxMDA2
NDQKPj4gLS0tIGEvcGFja2FnZS9sc29mL2xzb2YubWsKPj4gKysrIGIvcGFja2FnZS9sc29mL2xz
b2YubWsKPj4gQEAgLTMzLDcgKzMzLDggQEAgZW5kaWYKPj4gwqAgZGVmaW5lIExTT0ZfQ09ORklH
VVJFX0NNRFMKPj4gwqDCoMKgwqDCoCAoY2QgJChARCkgOyBcCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBlY2hvIG4gfCAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgREVCVUc9IiQoVEFSR0VUX0NGTEFH
UykiIFwKPj4gLcKgwqDCoMKgwqDCoMKgIExTT0ZfSU5DTFVERT0iJChTVEFHSU5HX0RJUikvdXNy
L2luY2x1ZGUiIExTT0ZfQ0ZMQUdTX09WRVJSSURFPTEgXAo+PiArwqDCoMKgwqDCoMKgwqAgTFNP
Rl9BUj0iJChUQVJHRVRfQVIpIGNyIiBMU09GX0NDPSQoVEFSR0VUX0NDKSBcCgogwqBZb3UgbmVl
ZCB0byBwdXQgcXVvdGVzIGFyb3VuZCBUQVJHRVRfQ0MsIGJlY2F1c2UgaXQgbWF5IGNvbnRhaW4g
Y2NhY2hlLgoKIMKgQm90aCBmaXhlcyB3ZXJlIGFwcGxpZWQgYmVmb3JlIHB1c2hpbmcuCgoKIMKg
UmVnYXJkcywKIMKgQXJub3V0CgoKPj4gKyBMU09GX0lOQ0xVREU9IiQoU1RBR0lOR19ESVIpL3Vz
ci9pbmNsdWRlIiBcCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBMSU5VWF9DTElCPS1ER0xJQkNWPTIg
TFNPRl9DRkdMPSIkKFRBUkdFVF9MREZMQUdTKSIgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLi9D
b25maWd1cmUgbGludXgpCj4+IMKgwqDCoMKgwqAgJChMU09GX0NPTkZJR1VSRV9XQ0hBUl9GSVhV
UFMpCj4+IEBAIC00MSw3ICs0Miw3IEBAIGRlZmluZSBMU09GX0NPTkZJR1VSRV9DTURTCj4+IMKg
IGVuZGVmCj4+IMKgIMKgIGRlZmluZSBMU09GX0JVSUxEX0NNRFMKPj4gLcKgwqDCoCAkKFRBUkdF
VF9NQUtFX0VOVikgJChNQUtFKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgCj4+IERFQlVHPSIk
KFRBUkdFVF9DRkxBR1MpIiAtQyAkKEBEKQo+PiArwqDCoMKgICQoVEFSR0VUX01BS0VfRU5WKSAk
KE1BS0UpIC1DICQoQEQpCj4+IMKgIGVuZGVmCj4+IMKgIMKgIGRlZmluZSBMU09GX0lOU1RBTExf
VEFSR0VUX0NNRFMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
