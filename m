Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3637C433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 09:23:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691B861244
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 09:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 691B861244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E316070B;
	Mon,  1 Nov 2021 09:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMdVuoFPALel; Mon,  1 Nov 2021 09:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723F8606BB;
	Mon,  1 Nov 2021 09:23:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8B711BF31F
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 09:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3E49401D8
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 09:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZwFrLZP7xD2 for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 09:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 642094014A
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 09:23:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d5so11904890wrc.1
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5V7EFFoJNe9adQVmkkoec5lCHXNXBzgXw0JcNLEQPbE=;
 b=cu3UOZK8dJAxIfMKPVl2SPO7AavpWrajir2NZCvNo3PO0Dz1FOy+IxkZ57lbvZoU2R
 zfPhyRPXP7o/fdStBhVN5DywZwg4cPODroDEEc1Q64n7i/HGMCToTVt66TveJ3Ol/7C9
 otSfU3Lzhhj1SLFbjUyp2/bzjw0vS+YdrmoOTyzkyY7C3gkHv++RPxGEA9rB/5rtTKAO
 p44UOsAkoSmusq2rQK7Rorm7fOwbmCcvpfwc+e7Xwg5jU4bn9QqlHwZ2ApAyYthGUK3Y
 u0gaRL6OMfYcwamxAltZOIhk3w8BIPqRjxsgZs7AJ8hEAIipBBCrKLBM6PPKRv81tq9r
 oBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5V7EFFoJNe9adQVmkkoec5lCHXNXBzgXw0JcNLEQPbE=;
 b=z2ZA1h/kcWGJr5ZJlM3l0sAnCHI+NodxzSkoIJhvLgESQ55W2EHqEPnbihYwwbeQSS
 eglTrvukUjcJWwr5wu7rs9ubWHceANouyETz4n/LrCI7kzdISiPJhQvjteQI83Pu69YJ
 5kg0Ijo4K99uFViSvOtbaL6RscT4zd7QRYPB+rHZUST2/ObGcyA7ofzHQRFG4Q/TdDuj
 S1adIoTM+vLt10poKZtMSxQagpF/e4GqpGx8vYQ0D8B0Btoz7RT3QaXvLTXXFOTOBJQj
 DQg1evFmF5SajLUCxJ0v6mQXw46Br6lgzGDAY7P7NLXN0rud78d3TJF3h2b25yB4vZQv
 Z7vw==
X-Gm-Message-State: AOAM533pl4lYPW83icj7KfUQa1NaFR1+YU6/t42F5k+qigYfTI8qv4eJ
 WebjsBimVxJ2H+lDNSerrq+ap8jk++Y=
X-Google-Smtp-Source: ABdhPJxuhI3TuEqyphdOY4Mmblppfjv1SozHwpG/qKo7Gj5+nOtBTnrIJUtWBnVe+FvB8QrZm8rRqA==
X-Received: by 2002:adf:f209:: with SMTP id p9mr33279310wro.191.1635758603572; 
 Mon, 01 Nov 2021 02:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id v185sm15893251wme.35.2021.11.01.02.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 02:23:23 -0700 (PDT)
Message-ID: <7a877d3b-95b9-55dc-8756-88fa9bb51876@gmail.com>
Date: Mon, 1 Nov 2021 10:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: ratbert90 <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20211031224207.1385633-1-romain.naour@gmail.com>
 <BY5PR19MB36687517E13A0EE264B37A5FFB8A9@BY5PR19MB3668.namprd19.prod.outlook.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <BY5PR19MB36687517E13A0EE264B37A5FFB8A9@BY5PR19MB3668.namprd19.prod.outlook.com>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
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
Cc: Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWRhbSwKCkxlIDAxLzExLzIwMjEgw6AgMDc6MTAsIHJhdGJlcnQ5MCBhIMOpY3JpdMKg
Ogo+IEhlbGxvOwo+IAo+IFNob3VsZG7igJl0IHRoaXMgZ28gaW4gc3lzdGVtZC5taz8KCkknbSBu
b3Qgc3VyZSB0byB1bmRlcnN0YW5kLCB3aGF0IGRvIHlvdSBtZWFuPwoKSXQncyBhYm91dCBhIHJl
ZnBvbGljeSBtb2R1bGUgbm90IHNlbGludXggbW9kdWxlIChTWVNURU1EX1NFTElOVVhfTU9EVUxF
UykuCgpBbm90aGVyIHdheSB0byBmaXggdGhlIGlzc3VlIGlzIHRvIGFkZCB4ZHAgdG8gQlIyX1JF
RlBPTElDWV9FWFRSQV9NT0RVTEVTIGluIHRoZQp0ZXN0IGNvbmZpZy4uLiBidXQgSSBkb24ndCB0
aGluayBpdCdzIHRoZSByaWdodCBmaXguCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQWRh
bQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKkRhOiogYnVpbGRyb290IDxidWlsZHJvb3Qt
Ym91bmNlc0BidWlsZHJvb3Qub3JnPiBwZXIgY29udG8gZGkgUm9tYWluIE5hb3VyCj4gPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+Cj4gKkludmlhdG86KiBTdW5kYXksIE9jdG9iZXIgMzEsIDIwMjEg
Mzo0MjowNyBQTQo+ICpBOiogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnPgo+ICpDYzoqIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT47
IEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0QGtlcm5lbC5vcmc+Cj4gKk9nZ2V0dG86KiBbQnVpbGRy
b290XSBbUEFUQ0hdIHBhY2thZ2UvcmVmcG9saWN5OiBlbmFibGUgcmVmcG9saWN5J3MgeGRnIG1v
ZHVsZQo+IHdoZW4gc3lzdGVtZCBpcyBlbmFibGVkCj4gwqAKPiBwb2xpY3kvbW9kdWxlcy9zeXN0
ZW0vc3lzdGVtZC50ZSByZXF1aXJlcyB4ZGcgbW9kdWxlIGVuYWJsZWQgWzFdCj4gb3RoZXJ3aXNl
IHJlZnBvbGljeSBmYWlsIHRvIGJ1aWxkOgo+IAo+IHBvbGljeS9tb2R1bGVzL3N5c3RlbS9zeXN0
ZW1kLnRlOjI4ODpFUlJPUiAnYXR0cmlidXRlIHhkZ19jb25maWdfdHlwZSBpcyBub3QKPiBkZWNs
YXJlZCcgYXQgdG9rZW4gJzsnIG9uIGxpbmUgNTA4NDQ3Ogo+IAo+IEZpeGVzOgo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTcxMDU1MjQ2OAo+IDxo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0
Njg+Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8x
NzEwNTUyNDcwCj4gPGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMTcxMDU1MjQ3MD4KPiAKPiBbMV0KPiBodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFBy
b2plY3QvcmVmcG9saWN5L2Jsb2IvUkVMRUFTRV8yXzIwMjEwOTA4L3BvbGljeS9tb2R1bGVzL3N5
c3RlbS9zeXN0ZW1kLnRlI0wyODgKPiA8aHR0cHM6Ly9naXRodWIuY29tL1NFTGludXhQcm9qZWN0
L3JlZnBvbGljeS9ibG9iL1JFTEVBU0VfMl8yMDIxMDkwOC9wb2xpY3kvbW9kdWxlcy9zeXN0ZW0v
c3lzdGVtZC50ZSNMMjg4Pgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQGdtYWlsLmNvbT4KPiBDYzogQW50b2luZSBUZW5hcnQgPGF0ZW5hcnRAa2VybmVsLm9y
Zz4KPiAtLS0KPiDCoHBhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tayB8IDEgKwo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVm
cG9saWN5L3JlZnBvbGljeS5tayBiL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tawo+IGlu
ZGV4IDk3NWMzYjU4NGMuLmIxZDEwMWUzMTEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9yZWZwb2xp
Y3kvcmVmcG9saWN5Lm1rCj4gKysrIGIvcGFja2FnZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rCj4g
QEAgLTY5LDYgKzY5LDcgQEAgUkVGUE9MSUNZX01PRFVMRVMgPSBcCj4gwqDCoMKgwqDCoMKgwqDC
oCBzeXNuZXR3b3JrIFwKPiDCoMKgwqDCoMKgwqDCoMKgIHVuY29uZmluZWQgXAo+IMKgwqDCoMKg
wqDCoMKgwqAgdXNlcmRvbWFpbiBcCj4gK8KgwqDCoMKgwqDCoCAkKGlmICQoQlIyX1BBQ0tBR0Vf
U1lTVEVNRCkseGRnKSBcCj4gwqDCoMKgwqDCoMKgwqDCoCAkKFBBQ0tBR0VTX1NFTElOVVhfTU9E
VUxFUykgXAo+IMKgwqDCoMKgwqDCoMKgwqAgJChjYWxsIHFzdHJpcCwkKEJSMl9SRUZQT0xJQ1lf
RVhUUkFfTU9EVUxFUykpIFwKPiDCoMKgwqDCoMKgwqDCoMKgICQoZm9yZWFjaCBkLCQoUkVGUE9M
SUNZX0VYVFJBX01PRFVMRVNfRElSUyksXAo+IC0tIAo+IDIuMzEuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdD4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
