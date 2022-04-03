Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E45C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5514E83323;
	Sun,  3 Apr 2022 15:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WIGmhIrfv-0; Sun,  3 Apr 2022 15:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60885832D9;
	Sun,  3 Apr 2022 15:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1C8E1BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9FD4167E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRZhTCGI5zx7 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7128414CA
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:07:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id u9so3134935edd.11
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nuc+TAmiWy/9gZbsZB9x2C77DXe8IozPD5A8KD5mBqc=;
 b=Q4lKYGnIiUytJJCDvwEFr0II64EBNhQGL6V8Q3oVMWbyGPtLsRuQeK+9fkuO1+OtK/
 EO96vXc0DllgPzQbZ9hOoGb217oH2csAsWcZwbowygmdqimZDz1bjSI2y0vJPQlN1QHz
 7go6Ya4I5cCeeU+GwBPwpweG2gOSUyyOHrNVIzii8VsjVs4BXcRdeVcCU9aPjkatRkbS
 TFS/zG+o4wGqnKIoYRUzjPipmOInp3/SO3MHj3n3NTVTt7qwKC+kD4boU6UNuYo6gclZ
 hldSMdNlni3q6/jRKBMb4afw8y0SMT1GgfmggXN0lpX5WU12GaHgIVYN5xGEewyB+JIh
 nq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nuc+TAmiWy/9gZbsZB9x2C77DXe8IozPD5A8KD5mBqc=;
 b=NjC5JNPHjt4kS0+j9rnc7owy8UzL67YZ0vly/na5yS/2IFvjwcQAa9x6iV3mAS08GJ
 1Lpx+oK5iKDYQonVhs8gdu/i5s0TmorQXy8kAnCa5gSKuTZKw4O6weAKcCc758JfPWIM
 wPA0CbtuEe9ItvYO95HR08VK0Ott64dK3G50V5LIIqAvLxlL9khzmXPkDoKxQHYu1Dfe
 IMEhwkSy7igLo+YORVbuqZePBK8yq4uYPEJjBsfqpcGSAvlQjq6t2cldqHruGqx2uQAh
 /WyP6ZEOIuXuAYQelmrBdmDLMFoOC/gcnQuUO0VBWULgvkQGgyZYKi7gPpZ7iXtcRqem
 5t5Q==
X-Gm-Message-State: AOAM530zxHf15590yzedqooh0Rs+X5J36acpOwcDHgM2CvCEVpMQXtsl
 2R4o/1hP2Dydi8gMRDxgK9I3ag==
X-Google-Smtp-Source: ABdhPJzeVJLppaylGOP9YHGisRTim3QhrRjfqTlgLidFHcqRRPlNLh2VKT+dRrJoJFV5r9/hriqwGQ==
X-Received: by 2002:a05:6402:350b:b0:419:1c11:23ed with SMTP id
 b11-20020a056402350b00b004191c1123edmr29459494edd.8.1648998469877; 
 Sun, 03 Apr 2022 08:07:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 sa32-20020a1709076d2000b006df935924c1sm3303634ejc.59.2022.04.03.08.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:07:49 -0700 (PDT)
Message-ID: <40cedffc-e46e-e4d5-e2f3-c0dd398906cd@mind.be>
Date: Sun, 3 Apr 2022 17:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
References: <20220329205136.32435-1-vincent.stehle@laposte.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220329205136.32435-1-vincent.stehle@laposte.net>
Subject: Re: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
 minimal config
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOS8wMy8yMDIyIDIyOjUxLCBWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBVcGRhdGUgdGhlIHFlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29uZmlnIHRvIHVzZSB0
aGUKPiBidXN5Ym94LW1pbmltYWwuY29uZmlnLCB0byBtYWtlIGl0IG1vcmUgY29uc2lzdGVudCB3
aXRoIHRoZSBvdGhlciBuby1NTVUKPiBkZWZjb25maWdzLgoKICBUaGF0J3Mgbm90IGEgdmFsaWQg
cmVhc29uIElNSE8uIFdlIHVzZSB0aGUgbWluaW1hbCBidXN5Ym94IGZvciBib2FyZHMgdGhhdCBh
cmUgCmV4dHJlbWVseSB0aWdodCBvbiBtZW1vcnkgLSB3aGljaCBpcyBvZnRlbiB0aGUgY2FzZSBm
b3Igbm9NTVUgYm9hcmRzLiBCdXQgaWYgd2UgCmNhbiBzcGFyZSB0aGUgc2l6ZSwgZnVsbCBidXN5
Ym94IGlzIGEgbG90IG1vcmUgdXNlYWJsZS4KCiAgSSd2ZSBtYXJrZWQgdGhpcyBwYXRjaCBhcyBS
ZWplY3RlZCBpbiBwYXRjaHdvcmssIGJ1dCBpZiB0aGVyZSdzIGEgZ29vZCByZWFzb24gCnRvIGRv
IHRoaXMsIHdlIGNhbiBhbHdheXMgcmVjb3ZlciBpdC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4g
Cj4gQWZ0ZXIgY29tbWl0IDNkZTQ4NmY4YjA1MiAoInBhY2thZ2UvYnVzeWJveDogZml4IHVkaGNw
YyBvcHRpb25zIGluIG1pbmltYWwKPiBjb25maWciKSwgdGhpcyBoYXMgdGhlIGJlbmVmaXQgb2Yg
Zml4aW5nIHRoZSBmb2xsb3dpbmcgbmV0d29yawo+IGluaXRpYWxpemF0aW9uIGZhaWx1cmU6Cj4g
Cj4gICAgdWRoY3BjOiBpbnZhbGlkIG9wdGlvbiAtLSBiCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IENjOiBHZXJvbWUgQnVybGF0cyA8Z2Vyb21l
LmJ1cmxhdHNAc21pbGUuZnI+Cj4gLS0tCj4gICBjb25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9t
bXVfZGVmY29uZmlnIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3h0ZW5zYV9seDYwX25vbW11X2RlZmNvbmZp
ZyBiL2NvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9ub21tdV9kZWZjb25maWcKPiBpbmRleCBjNDQ3
M2ZiMzJhLi40NGZiODFiZDc0IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV94dGVuc2FfbHg2
MF9ub21tdV9kZWZjb25maWcKPiArKysgYi9jb25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9tbXVf
ZGVmY29uZmlnCj4gQEAgLTcsNiArNyw5IEBAIEJSMl9YVEVOU0FfT1ZFUkxBWV9GSUxFPSJodHRw
czovL2dpdGh1Yi5jb20vamNtdmJrYmMveHRlbnNhLXRvb2xjaGFpbi1idWlsZC9yYXcvCj4gICBC
UjJfUEFDS0FHRV9IT1NUX0VMRjJGTFQ9eQo+ICAgIyBCUjJfVVNFX01NVSBpcyBub3Qgc2V0Cj4g
ICAKPiArIyBVc2UgbWluaW1hbCBidXN5Ym94IHdpdGggaHVzaCBhbmQgbmV0d29ya2luZyB0b29s
cwo+ICtCUjJfUEFDS0FHRV9CVVNZQk9YX0NPTkZJRz0icGFja2FnZS9idXN5Ym94L2J1c3lib3gt
bWluaW1hbC5jb25maWciCj4gKwo+ICAgIyBTeXN0ZW0KPiAgIEJSMl9TWVNURU1fREhDUD0iZXRo
MCIKPiAgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlTMCIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
