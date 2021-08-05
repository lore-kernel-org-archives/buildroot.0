Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E66BC4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 12:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77FEA60E96
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 12:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77FEA60E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38C624029F;
	Thu,  5 Aug 2021 12:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MN6GlUBO6rpG; Thu,  5 Aug 2021 12:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FC2C40330;
	Thu,  5 Aug 2021 12:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84E7B1BF3EA
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 12:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803D440330
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 12:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4h5wFnGwpApU for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 12:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C8974029F
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 12:08:17 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id h9so9186352ejs.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 05:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xs/Vlm3oRajhJ3U/7CERaI5gAsP4XciMves0KR6ywCQ=;
 b=e5d+aBgyryLy6YKrUwz3jWw6jywaFnFBOU8oyIISyGpNvWisTlvlhdzZkXAPc0F9BK
 k/f2IoEwx0GfHo/naAvRLly+bKuDqNDF4oIopLbNGMEYraqGiUUws/13quZy3+CVv689
 7MTQMeNWBtanPGtOgTwgLy4tRA6wF1o+c7KppETavJMlENjH0AhMNMRD4Wi0bu/Wk5uN
 naosgNqWl+cISELxtAg86TYFBY6AgpykKSdXHNTl2wmz9+dMGCZiHz6pdsTtrHuCEGNi
 6Qik1JpKBH8tF4lxSB0K4wPFIhH8LSJwFTVBmwNs14uf47wzMoT1D6tWy3+Uqyo6c4qF
 v6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xs/Vlm3oRajhJ3U/7CERaI5gAsP4XciMves0KR6ywCQ=;
 b=EhuZqeEYXuDv30xnnnP+obWfPVyPuQTLYV1BX8M1ykxv51XTGhB8Xmp7gJnkUsznnA
 FeOGdmhjT6PKx/gLpKzmcFSw77W56L+4s0IK8raxdNsIjlAtUyTt3HKFS1UyZoiuV1FO
 kV2ZBXZ/QXyJfYcf/E2jWQ/uo3ZMsA1WXD4UPZ+osszbdQVlA1+3irPt4peyCE8qa43a
 mTeoF61pkTZ+nHTkdS7uKTuNTkWphLt7YG0m3NCZ4j22/GGxe/YWFTO5DowETR2BsHN6
 o1OfSol4CnRZqdXwDEaf+IF/l4W/v6yrCiTV3OphEDkprxs5w0ssBOlpNK2VH4woZzHQ
 aaNQ==
X-Gm-Message-State: AOAM530EQEhlTMkuhGvwI+rRonccmVD3eRwVQD68sKXgBeAjEO4gP7d/
 WtVnfDOueXTihj+xdTu6VM16mRKWJSwH7Qa1cpo=
X-Google-Smtp-Source: ABdhPJy51l0eu0pZs5NT6Qwt62BThosp2toFv8wdI4VURCUBxQHa5f90FQoOMQ7SMqf6tpDP8ntmaA==
X-Received: by 2002:a17:907:2d28:: with SMTP id
 gs40mr4532649ejc.193.1628165295796; 
 Thu, 05 Aug 2021 05:08:15 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id s7sm2080151edu.23.2021.08.05.05.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 05:08:15 -0700 (PDT)
To: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
References: <20210803143654.550783-1-b.bilas@grinn-global.com>
 <1e2a20e9-3c43-8de3-a954-be4543e77edf@mind.be>
 <86b2e396-7919-de0d-e9dc-03e1869850df@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6109f18b-7913-bb25-2459-30aba58958a7@mind.be>
Date: Thu, 5 Aug 2021 14:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <86b2e396-7919-de0d-e9dc-03e1869850df@grinn-global.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/cegui: disable OpenGLES renderer
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAwNS8wOC8yMDIxIDA5OjM4LCBCYXJ0b3N6IEJpxYJhcyB3cm90ZToKPiBIZWxsbyBBcm5v
dXQsCj4gCj4gT24gOC80LzIxIDEwOjQ5IFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
Pj4KPj4gT24gMDMvMDgvMjAyMSAxNjozNiwgQmFydG9zeiBCaWxhcyB3cm90ZToKPj4+IFN1cHBv
cnQgb2YgT3BlbkdMRVMgZ2VuZXJhdGVzIHRvbnMgb2YgYXV0b2J1aWxkZXJzIGZhaWx1cmVzCj4+
PiBzbyBsZXQncyBkaXNhYmxlIGl0IHRpbGwgdXBzdHJlYW0gZmluZHMgYSBzb2x1dGlvbiBmb3Ig
dGhhdC4KPj4+Cj4+PiBGaXhlczoKPj4+IMKgCj4+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5uZXQvcmVzdWx0cy80MWQvNDFkMTBjMDk0NzJmYmI4NDgxYTcyYzRmOGJlZDc4OWJiMTViYjNj
Mi8vCj4+Pgo+Pj4gwqAKPj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzlhOC85YTgxMjJiNGQzZDBhYTlkNzFjZGY4ZDIxMzU5NDExYjEzMDc0MWY4Ly8KPj4+Cj4+PiDC
oAo+Pj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvN2U1LzdlNWRkNzli
NDhhYmRlMDliZjQ2MzNiMTk2NTc5ZGE1NTYxZjlmYTEvLwo+Pj4KPj4+Cj4+PiBhbmQgbWFueSBt
b3JlLi4uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBCaWxhcyA8Yi5iaWxhc0Bncmlu
bi1nbG9iYWwuY29tPgo+PiDCoCBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Pgo+PiDCoCBI
b3dldmVyLCBJIHdvbmRlciwgaWYgb3BlbmdsZXMgaXMgdHVybmVkIG9mZiwgaXMgdGhlCj4+ICQo
aWYgJChCUjJfUEFDS0FHRV9IQVNfTElCR0xFUyksbGliZ2xlcykgc3RpbGwgcmVsZXZhbnQ/Cj4g
Cj4gT3VjaCwgSSd2ZSBjb21wbGV0ZWx5IGZvcmdvdHRlbiBhYm91dCB0aGlzIGxpbmUuIEknbSBn
b25uYSBzZW5kIGEgcGF0Y2ggdGhhdAo+IHJlbW92ZXMgaXQgdG9vLgoKIFRvIGJlIHN1cmUgdGhh
dCBpdCdzIHJlYWxseSBub3QgbmVlZGVkLCB5b3Ugc2hvdWxkOgoKLSBkbyBhIGJ1aWxkIG9mIGNl
Z3VpIHdpdGhvdXQgYW55IGxpYmdsZXMgcHJvdmlkZXI7Ci0gc2F2ZSB0aGUgYnVpbGQgcmVzdWx0
cyBzb21ld2hlcmU7Ci0gZW5hYmxlIGEgbGliZ2xlcyBwcm92aWRlciBhbmQgYnVpbGQgaXQ7Ci0g
bWFrZSBjZWd1aS1kaXJjbGVhbiBjZWd1aQoKSWYgdGhlIHNlY29uZCBidWlsZCByZXN1bHQgaXMg
ZGlmZmVyZW50IGZyb20gdGhlIGZpcnN0IChpLmUsIHNpZ25pZmljYW50bHkKbGFyZ2VyKSwgdGhl
IGRlcGVuZGVuY3kgY2FuJ3QgYmUgcmVtb3ZlZC4KCgogUmVnYXJkcywKIEFybm91dAoKPiAKPiBC
ZXN0Cj4gQmFydGVrCj4+Cj4+IMKgIFJlZ2FyZHMsCj4+IMKgIEFybm91dAo+Pgo+Pj4gLS0tCj4+
PiDCoCBwYWNrYWdlL2NlZ3VpL2NlZ3VpLm1rIHwgMSArCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jZWd1aS9jZWd1aS5t
ayBiL3BhY2thZ2UvY2VndWkvY2VndWkubWsKPj4+IGluZGV4IDEyN2QzYjBmYWQuLjJlNTYzMjIz
NzQgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL2NlZ3VpL2NlZ3VpLm1rCj4+PiArKysgYi9wYWNr
YWdlL2NlZ3VpL2NlZ3VpLm1rCj4+PiBAQCAtMTMsNiArMTMsNyBAQCBDRUdVSV9DT05GX09QVFMg
PSBcCj4+PiDCoMKgwqDCoMKgIC1EQ0VHVUlfSEFTX01JTklaSVBfUkVTT1VSQ0VfUFJPVklERVI9
T0ZGIFwKPj4+IMKgwqDCoMKgwqAgLURDRUdVSV9CVUlMRF9SRU5ERVJFUl9JUlJMSUNIVD1PRkYg
XAo+Pj4gwqDCoMKgwqDCoCAtRENFR1VJX0JVSUxEX1JFTkRFUkVSX09HUkU9T0ZGIFwKPj4+ICvC
oMKgwqAgLURDRUdVSV9CVUlMRF9SRU5ERVJFUl9PUEVOR0xFUz1PRkYgXAo+Pj4gwqDCoMKgwqDC
oCAtRENFR1VJX0JVSUxEX1hNTFBBUlNFUl9YRVJDRVM9T0ZGIFwKPj4+IMKgwqDCoMKgwqAgLURD
RUdVSV9VU0VfRlJJQklEST1PRkYgXAo+Pj4gwqDCoMKgwqDCoCAtRENFR1VJX1NBTVBMRVNfRU5B
QkxFRD1PRkYgXAo+Pj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDov
L2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
