Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39F1C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC0560FE7;
	Sat, 23 Jul 2022 13:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC0560FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmIUs_ORVXJf; Sat, 23 Jul 2022 13:41:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033B260FF0;
	Sat, 23 Jul 2022 13:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 033B260FF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2181BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA42B60FE9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA42B60FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGAFxLcRexGb for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:41:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E96660FE7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E96660FE7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:41:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l15so5870436wro.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=L1r7NoPpj6mtopvYoOBIt5S/q2frBWzVRQlmtY6wL4A=;
 b=Go1SitPAeJEl10np4aHNUttPv4FdUikPnun1xVTxJtcDVJWm+Y9WeyUFeh7bD8uxng
 IP2F7Rwh+ogDOAVo9Sb8pYB/PKeVa46Skz3OACXI0lhoIz6eiaWz7NEh1CFdwQpqwqfh
 F01B2o3UXu4VYkuPss32+wvkQCFGx4A21Rwiv/26gOjD+cL9URzx/cm/3IiavqpOUOil
 5LXTIyb1St+OV2f0Jev43SDT+K40gZJRvICQ28sE81ITDOMDbVxXzYpPXj9CdbqqhW0r
 X/nc3OFNC67xbzrTrX5NUZMH9yBobDUFA7mCo3QHWk/BDtCOIpwwcMGhH0ziDMxrc5II
 9CcA==
X-Gm-Message-State: AJIora8iCdmnJSNGk4SxcIETbdVOdC4imlnDmN7Yizs52T/AzNPC0poT
 ZSl4DfzoWhwP954c6OebINOJCg==
X-Google-Smtp-Source: AGRyM1vXWxsOT6E3tSY1oRsOTFxHyUgI9ZCdmxCSgKVhgvivAXA3my6nNrPGPywS2ZtZgdEbtjT/Jg==
X-Received: by 2002:adf:fc8a:0:b0:21e:47f5:be99 with SMTP id
 g10-20020adffc8a000000b0021e47f5be99mr2812105wrr.168.1658583699481; 
 Sat, 23 Jul 2022 06:41:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600011ce00b0021d82a6095bsm6698453wrx.95.2022.07.23.06.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 06:41:39 -0700 (PDT)
Message-ID: <2b27ec0b-ef6d-9540-062c-04d6f75c2cd3@mind.be>
Date: Sat, 23 Jul 2022 15:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Michael Zimmermann <sigmaepsilon92@gmail.com>, buildroot@buildroot.org
References: <20220720152440.1568667-1-sigmaepsilon92@gmail.com>
 <2569cf83-d180-41ea-ad10-d053528d462d@mind.be>
Organization: Essensium/Mind
In-Reply-To: <2569cf83-d180-41ea-ad10-d053528d462d@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=L1r7NoPpj6mtopvYoOBIt5S/q2frBWzVRQlmtY6wL4A=;
 b=TqgcAVM7HQtUu2b12mq13+uugHo0GQJI5Aj6fy/lg9XufEBiDs7Buh62AbmHvvdA6q
 7sYxCMuB8gpxe+srvDQskN05kizXd0ksU8v4ccDTlLg6lnLvKBHnZ5cPzoh9CZEElPvl
 C8Vc3q/QgwgjqEwKPL85ChHr1QhnvsMzSxQMNs9h+rT+xQABpjzYw0PEHcX1Enr/wwt5
 uwoScvCreeXhfv4uQ5KxTahbotDKkx2QN6flydvYXK0zLFH+jCR7y7DXqGlKLXn1/3GO
 uTysp5lT2xJeIhzBZpvsmLwJmgbRXuCLMLI2m3qJ+Fb3/zPX2WqE87UlBLK76YixAA3G
 hnJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TqgcAVM7
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: fix cross-compilation
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
Cc: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzA3LzIwMjIgMTQ6NDIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyMC8wNy8yMDIyIDE3OjI0LCBNaWNoYWVsIFppbW1lcm1hbm4gd3JvdGU6Cj4+IEN1cnJlbnRs
eSwgdGhlIGtlcm5lbCBtb2R1bGUgZ2V0cyBidWlsdCB1c2luZyB0aGUgaG9zdC1jb21waWxlcihm
cm9tIHRoZQo+PiB1c2VyIGRpc3Rybywgbm90IGZyb20gYnVpbGRyb290KS4gCj4KPiDCoFRoYXQg
c2hvdWxkbid0IGhhcHBlbi4gVGhlIGtlcm5lbC1tb2R1bGUgaW5mcmFzdHJ1Y3R1cmUgcGFzc2Vz
IAo+IExJTlVYX01BS0VfRkxBR1MgaW4gdGhlIGVudmlyb25tZW50IGFscmVhZHkuIEFuZCBpZiB0
aGUgbW9kdWxlIHdlcmUgYnVpbHQgCj4gZHVyaW5nIHRoZSB1c2Vyc3BhY2UgYnVpbGQgc3RhZ2Us
IHRoYXQgb25lIGFscmVhZHkgaGFzIHRoZSBjcm9zcy1jb21waWxlciBhcyAKPiB3ZWxsIHRocm91
Z2ggdGhlIGF1dG90b29scyBpbmZyYXN0cnVjdHVyZS4KPgo+IMKgQ2FuIHlvdSBnaXZlIGEgYml0
IG1vcmUgZGV0YWlsIGFib3V0IHRoZSBjb25maWcgd2hlcmUgeW91IGdldCB0aGUgaXNzdWUsIGFu
ZCAKPiBob3cgZXhhY3RseSBpdCBmYWlscz8KCiDCoEl0J3MgYWN0dWFsbHkgZWFzeSB0byByZXBy
b2R1Y2UsIGp1c3QgY2hhbmdlIHRoZSBhcmNoaXRlY3R1cmUgdG8gYW55dGhpbmcgCm90aGVyIHRo
YW4geDg2LgoKCiDCoEkndmUgbG9va2VkIGFyb3VuZCBhIGJpdCBhbmQgaXQgc2VlbXMgdG8gbWUg
dGhhdCB6ZnMgYWxyZWFkeSBidWlsZHMgdGhlIGtlcm5lbCAKbW9kdWxlIGZyb20gdGhlIGF1dG90
b29scyBpbmZyYXN0cnVjdHVyZSwgc28gd2UncmUgYWN0dWFsbHkgYnVpbGRpbmcgaXQgdHdpY2Uu
IEkgCnRoaW5rIHdlIHNob3VsZCB0aGVyZWZvcmUgcmVtb3ZlIHRoZSBrZXJuZWwtbW9kdWxlIGlu
ZnJhIGZvciB0aGlzIHBhY2thZ2UsIGFuZCAKaW5zdGVhZCBhZGQgYSBkZXBlbmRlbmN5IG9uIGxp
bnV4IGFuZCBjb3B5IHRoaXMgcGFydDoKCiMgSWYgdGhlIHBhY2thZ2UgaXMgZW5hYmxlZCwgZW5z
dXJlIHRoZSBrZXJuZWwgd2lsbCBzdXBwb3J0IG1vZHVsZXMKaWZlcSAoJCQoQlIyX1BBQ0tBR0Vf
JCgyKSkseSkKTElOVVhfTkVFRFNfTU9EVUxFUyA9IHkKZW5kaWYKCgogwqBSZWdhcmRzLAogwqBB
cm5vdXQKCgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4KPj4gVGhhdCBtaWdodCB3b3JrIHdo
ZW4gdGFyZ2V0IGFuZCBob3N0Cj4+IGFyY2ggYXJlIHRoZSBzYW1lIGJ1dCBkdXJpbmcgY3Jvc3Mg
Y29tcGlsYXRpb24gdGhhdCByZXN1bHRzIGluIHRoZQo+PiBtZXNzYWdlIGBVbmFibGUgdG8gYnVp
bGQgYW4gZW1wdHkgbW9kdWxlLmAgYmVjYXVzZSB0ZXN0cyBmb3IgY29tcGlsaW5nCj4+IG1vZHVs
ZXMgZmFpbCBkdWUgdG8gbWlzc2luZyBoZWFkZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNo
YWVsIFppbW1lcm1hbm4gPHNpZ21hZXBzaWxvbjkyQGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKgIHBh
Y2thZ2UvemZzL3pmcy5tayB8IDMgKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZz
L3pmcy5tawo+PiBpbmRleCAwN2NlMzI5NWVjLi4zMGY5NjZiZGViIDEwMDY0NAo+PiAtLS0gYS9w
YWNrYWdlL3pmcy96ZnMubWsKPj4gKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCj4+IEBAIC01Nyw2
ICs1Nyw5IEBAIGVsc2UKPj4gwqAgWkZTX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtcGFtCj4+IMKg
IGVuZGlmCj4+IMKgICtaRlNfQ09ORl9FTlYgKz0gJChMSU5VWF9NQUtFX0ZMQUdTKQo+PiArWkZT
X01BS0VfRU5WICs9ICQoTElOVVhfTUFLRV9GTEFHUykKPj4gKwo+PiDCoCAjIFpGUyB1c2VybGFu
ZCB0b29scyBhcmUgdW5mdW5jdGlvbmFsIHdpdGhvdXQgdGhlIExpbnV4IGtlcm5lbCBtb2R1bGVz
Lgo+PiDCoCBaRlNfTU9EVUxFX1NVQkRJUlMgPSBcCj4+IMKgwqDCoMKgwqAgbW9kdWxlL2F2bCBc
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
