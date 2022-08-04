Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19623C19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC93C826A8;
	Thu,  4 Aug 2022 15:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC93C826A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlsmQyIGnIVl; Thu,  4 Aug 2022 15:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC37D81DCB;
	Thu,  4 Aug 2022 15:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC37D81DCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81C1E1BF317
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6984E60D8E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6984E60D8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njbq82OZAXie for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:08:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 383C760D58
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 383C760D58
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:08:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dc19so14706056ejb.12
 for <buildroot@buildroot.org>; Thu, 04 Aug 2022 08:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ETCR+VnWFlB3WqMVLs0rA32TCFdiOwaGXzZ9nUAZcaE=;
 b=kFzVxdBW+9NlIOqVcO6TsgCwBnRMSAT0vsSoe9DcGcoFsjMHSLO3Y/b1ov0+YhLAi7
 ZGbzBQphDe1Or89OVoVk1kni8OWnNOEfzYCraZ88CrCP/8nxxMnMLdRZ8DTbC8QGiXGl
 ahzYuYeA2kH3r4Yb+teHaJeTjzWB5Yi3b9D0R18Hetp/rS7bxm3h2wC+dkMTXh+b2smA
 dwqPu9OL/QXDLyWaOqNLfiYor31SrZ+gOufqRHy+Z4ChZbdTop7WLH/cVt7dp6tFiGeZ
 Em+wjgY0O7N0+RgdLH4dhHeI6D8P/QYttAqRHYabZCVgcWL326BSNiEwuvlukL6k9NEc
 wYQg==
X-Gm-Message-State: ACgBeo0kZYhawC8lI48qWWCHKqxwf9fc2XhAY4+EqBPyXtlHUPDzF8O3
 zChVHPcO/Xbr2falcti2rRc2TQ==
X-Google-Smtp-Source: AA6agR7TjDDPCar29K12dO5AVfk/SLqAtF6RX4DUZZkMN5OsbBqI8vWGQauAPOueG3xND7EdftXGxg==
X-Received: by 2002:a17:907:7ea1:b0:72b:83cf:4ce9 with SMTP id
 qb33-20020a1709077ea100b0072b83cf4ce9mr1783957ejc.204.1659625720231; 
 Thu, 04 Aug 2022 08:08:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170906a18f00b0071cef8bafc3sm449531ejy.1.2022.08.04.08.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 08:08:39 -0700 (PDT)
Message-ID: <80ef90c9-2250-bf82-02ae-e5f84b24e73c@mind.be>
Date: Thu, 4 Aug 2022 17:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 David Laight <David.Laight@ACULAB.COM>,
 "'Yann E.MORIN'" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220803165240.BEDEB86D85@busybox.osuosl.org>
 <ffe375e2a41b4e069ce2632c28cea51d@AcuMS.aculab.com>
 <4837f541-d90c-fcd3-4024-73f3e719fe10@theobroma-systems.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4837f541-d90c-fcd3-4024-73f3e719fe10@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ETCR+VnWFlB3WqMVLs0rA32TCFdiOwaGXzZ9nUAZcaE=;
 b=Qj7uMXQCyPbK/P+GHRMYuiDxYcAwVkFYZoXmS/NQm0U2Ijha+1Y7WWK0RfycvCz2VK
 9iUSz9H1XwwstFMO/qvLz8+JvIbt7R4msLOzMA1ocex78gFkqWu1lRrxZxodNd/4o6ot
 9oKDGblWnE2IAhIxL55MQ2VFSxV6LXmbIntwFy/TvFzxfleUH7sprCh9rsq1Ve+zXFE8
 PmbqMNMmja+Mo/mLHjUW1hjGtqm54370aORc/+7/2CBJ2k4FkspUlbtWHCnggh9aZbBa
 pE8Bg36M3/Mn46jyBkiQv7/MeQZcsEMM3O6L/CMy824gJdmxGF0JPS8XL9P7JH58i2xD
 0VPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qj7uMXQC
Subject: Re: [Buildroot] [git commit] Makefile: error out printvars target
 when VARS is empty or unset
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

CgpPbiAwNC8wOC8yMDIyIDEzOjQ3LCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBEYXZpZCwK
PiAKPiBPbiA4LzQvMjIgMTA6MDAsIERhdmlkIExhaWdodCB3cm90ZToKPj4gRnJvbTogWWFubiBF
Lk1PUklOCj4+PiBTZW50OiAwMyBBdWd1c3QgMjAyMiAxODowNQo+Pj4KPj4+IHByaW50dmFycyBy
ZXR1cm5zIG5vdGhpbmcgd2hlbiBWQVJTIGlzIG5vdCBwYXNzZWQgb3IgZW1wdHkuIFRoaXMgaXMg
ZG9uZQo+Pj4gb24gcHVycG9zZSwgc2VlIGNvbW1pdCBmZDViZDEyMzc5ZGMgKCJNYWtlZmlsZTog
cHJpbnR2YXJzOiBkb24ndCBwcmludAo+Pj4gYW55dGhpbmcgd2hlbiBWQVJTIGlzIG5vdCBzZXQi
KS4KPj4+Cj4+PiBBbiBlcnJvciBtZXNzYWdlIG1ha2luZyBleHBsaWNpdCB3aGF0IGlzIHJlcXVp
cmVkIGZyb20gdGhlIHVzZXIgaW4gb3JkZXIKPj4+IHRvIHVzZSBwcmludHZhcnMgaXMgaG93ZXZl
ciBiZXR0ZXIgdGhhbiBzaWxlbnRseSBkb2luZyBub3RoaW5nLgo+Pj4KPj4+IFRoaXMgYWRkcyBh
IGNoZWNrIGZvciBhIG5vbi1lbXB0eSBWQVJTIHZhcmlhYmxlLgo+Pj4KPj4+IENjOiBRdWVudGlu
IFNjaHVseiA8Zm9zcytidWlsZHJvb3RAMGxlaWwubmV0Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUXVl
bnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNvbT4KPj4+IFNp
Z25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+Pj4g
LS0tCj4+PiDCoCBNYWtlZmlsZSB8IDQgKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4+PiBp
bmRleCAwN2I1OTRlYThhLi41ZjI2NmUzNmIyIDEwMDY0NAo+Pj4gLS0tIGEvTWFrZWZpbGUKPj4+
ICsrKyBiL01ha2VmaWxlCj4+PiBAQCAtMTA1OCw2ICsxMDU4LDEwIEBAIGVuZGlmCj4+PiDCoCAj
IHRvIHdvcmthcm91bmQgYSBidWcgaW4gbWFrZSA0LjM7IHNlZSAKPj4+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fc2F2YW5uYWguZ251Lm9yZ19i
dWdzXy0zRjU5MDkzJmQ9RHdJQ0FnJmM9X3NFcjV4OWtVV2h1azRfbkZ3akp0QSZyPUxZakxleERu
N3JYSXpWbWtOUHZ3NXltQTFYVFNxSEdxOHlCUDZtNnFaWjRualpndVFoWmhrSV8tMTcySUl5MXQm
bT1TZFhUSV9MbnJsdjhnMzdlYUNPdUhUVG96RDVONE1mUk15bUhJc0gwdWFYSk5IaHBYTEQ2dXN1
VzV3Q3pXT2VCJnM9dHA0N1N0cVZjTF9MdlZjeE1EbXE5VmVfdV9kQ0FMaWZaVnotTW51eW84cyZl
PSAKPj4+Cj4+PiDCoCAuUEhPTlk6IHByaW50dmFycwo+Pj4gwqAgcHJpbnR2YXJzOgo+Pj4gK2lm
bmRlZiBWQVJTCj4+PiArwqDCoMKgIEBlY2hvICJQbGVhc2UgcGFzcyBhIG5vbi1lbXB0eSBWQVJT
IHRvICdtYWtlIHByaW50dmFycyciCj4+Cj4+IFNob3VsZG4ndCB0aGF0IGhhdmUgYSA+JjIgPz8K
Pj4KPiAKPiBNYWtlcyBzZW5zZS4gTWF5YmUgd2Ugc2hvdWxkIGFsc28gcHJlZml4IGl0IHdpdGgg
RVJST1I6IGxpa2UgdGhlcmU6IAo+IGh0dHBzOi8vZ2l0LmJ1c3lib3gubmV0L2J1aWxkcm9vdC90
cmVlL01ha2VmaWxlI244ODAKCiAgQWN0dWFsbHksIGluc3RlYWQgb2YgZWl0aGVyIG9mIHRob3Nl
LCBpdCBzaG91bGQgdXNlICQoZXJyb3IgLi4uKSAtIHdoaWNoIGFsc28gCmFsbG93cyB5b3UgdG8g
cmVtb3ZlIHRoZSAiZXhpdCAxIiBiZWxvdy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gPwo+IAo+
IENvdWxkIHlvdSBwbGVhc2Ugc2VuZCBhIHBhdGNoPwo+IAo+IFRoYW5rcyEKPiBRdWVudGluCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
