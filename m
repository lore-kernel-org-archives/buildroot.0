Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FD6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:35:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3506103A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC3506103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E335826FB;
	Fri, 12 Nov 2021 18:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6j_Wz9rWj_9; Fri, 12 Nov 2021 18:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D1D826E5;
	Fri, 12 Nov 2021 18:35:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB6A31BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB5EE826E5
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFqd9rzxUar3 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:35:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C313B826A4
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:35:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r8so17011867wra.7
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wbdLBwBoYAGCWjZJl/mXxWvbEswwlV5CkreR/kW7PLs=;
 b=EYwbPlNdMnCzDMUxtrIuSo/vNG+e8XygYwkFlg7tdNvezvIEi1YGvyfXJRgN8JmqeC
 mR0NHRHGjAhqaMVwP5F6+Boy8ve1XVW/e1AtDTARx8ajHOhI9bo+qoQ59NVHT4XAD7I2
 8oYJbaF0IzRuvJZ+sfv0NSG3hvaZpMXZMYjjs25NspcUzZz7Dq6qQJRTqiEIjWx/VMeu
 zDWGcUC+UFEHL/7nBiusTqxF3SjdrV81ANU1s5BUe/5Aokczu4gG4a7X18uujrTRXJRP
 gT0UBYNC3ZGTPlLVxBUi7hB0UO9Pl2lSCGAPZsR6H9J3kj1e822iyu2E7g180VfRdFfU
 M0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wbdLBwBoYAGCWjZJl/mXxWvbEswwlV5CkreR/kW7PLs=;
 b=b9JPuebC3fKvX55SvQ1VXPTS60e3YwmPdJhaTtF3TVQxIvcuWuVBTkbovQNTRDiY0k
 C0a6TibRAap79JZGRz4OSmxIVWc7lS+HYWJ5kWYjkGXjQ/THw+0ZDbjOsGRQ8JFTeYc+
 npBCnju4o/vJM7SHoSchh408XkMIijJY1BWbBcF7VHKxp1K4AIzpKpneV+8ku+LVuQ/p
 Np4omClho1q43J6PvknBNqhP/A78OfeDZAl335eh5HmsP2qcWp/cX21aO8DhiRBqS9bb
 BV4zxVXMKVLrPrwDMJan3JA+7CDXFHqbpBHza6d0CZl6mZ9Z/7KESeJNyPGWr4epOBdZ
 nw4Q==
X-Gm-Message-State: AOAM530d9W7Go0ugg30DhPagI2BSqe0mTX5Oz8kJ7Z2rAGGTxbr8dICy
 nMRrZc5BfKHlY3SMcUAc8cA=
X-Google-Smtp-Source: ABdhPJx/aGuNlZ/75WjgDFSfW2Mgj7BYwk1NP23t8DEXBDgWVfAgadzc7NBoKtoU0nc0CO7Hc3iEzQ==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr20761672wrq.44.1636742135784; 
 Fri, 12 Nov 2021 10:35:35 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id b10sm6856152wrt.36.2021.11.12.10.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 10:35:35 -0800 (PST)
Message-ID: <126b98d0-f722-68ee-889f-79aa055625a8@gmail.com>
Date: Fri, 12 Nov 2021 19:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-7-romain.naour@gmail.com>
 <20211112125151.GI2609@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211112125151.GI2609@scaer>
Subject: Re: [Buildroot] [PATCH 6/6] support/testing: test_luvi: make luvi
 test reproducible
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDEyLzExLzIwMjEgw6AgMTM6NTEsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIxLTExLTEyIDEyOjAwICswMTAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBBcyBleHBsYWluZWQgYnkgSsO2cmcgWzFdLCBpdGVy
YXRpb24gd2l0aCBwYWlycygpIGRvZXMgbm90IHJlc3VsdCBpbiB0aGUKPj4gc2FtZSBvcmRlciBz
aW5jZSBsdWFqaXQgMi4xLgo+Pgo+PiBGcm9tIFsyXQo+PiAiVGFibGUgaXRlcmF0aW9uIHdpdGgg
cGFpcnMoKSBkb2VzIG5vdCByZXN1bHQgaW4gdGhlIHNhbWUgb3JkZXI/Cj4+Cj4+IFRoZSBvcmRl
ciBvZiB0YWJsZSBpdGVyYXRpb24gaXMgZXhwbGljaXRseSB1bmRlZmluZWQgYnkgdGhlIEx1YQo+
PiBsYW5ndWFnZSBzdGFuZGFyZC4gRGlmZmVyZW50IEx1YSBpbXBsZW1lbnRhdGlvbnMgb3IgdmVy
c2lvbnMgbWF5IHVzZQo+PiBkaWZmZXJlbnQgb3JkZXJzIGZvciBvdGhlcndpc2UgaWRlbnRpY2Fs
IHRhYmxlcy4gRGlmZmVyZW50IHdheXMgb2YKPj4gY29uc3RydWN0aW5nIGEgdGFibGUgbWF5IHJl
c3VsdCBpbiBkaWZmZXJlbnQgb3JkZXJzLCB0b28uIER1ZSB0bwo+PiBpbXByb3ZlZCBWTSBzZWN1
cml0eSwgTHVhSklUIDIuMSBtYXkgZXZlbiB1c2UgYSBkaWZmZXJlbnQgb3JkZXIgb24KPj4gc2Vw
YXJhdGUgVk0gaW52b2NhdGlvbnMgb3Igd2hlbiBzdHJpbmcga2V5cyBhcmUgbmV3bHkgaW50ZXJu
ZWQuCj4+Cj4+IElmIHlvdXIgcHJvZ3JhbSByZWxpZXMgb24gYSBkZXRlcm1pbmlzdGljIG9yZGVy
LCBpdCBoYXMgYSBidWcuCj4+IFJld3JpdGUgaXQsIHNvIGl0IGRvZXNuJ3QgcmVseSBvbiB0aGUg
a2V5IG9yZGVyLgo+PiBPciBzb3J0IHRoZSB0YWJsZSBrZXlzLCBpZiB5b3UgbXVzdC4iCj4+Cj4+
IFsxXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIxLU5v
dmVtYmVyLzYyNzkzOC5odG1sCj4+IFsyXSBodHRwczovL2x1YWppdC5vcmcvZmFxLmh0bWwKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+
PiBDYzogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Cj4+IENjOiBK
w7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5yb2Nrcz4KPj4gLS0tCj4+ICBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2x1dmkucHkgfCAxMCArKysrKy0tLS0tCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZpLnB5IGIv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZpLnB5Cj4+IGluZGV4IGViMTVh
ZDMxYjUuLjI3MTU1YTc1YjYgMTAwNjQ0Cj4+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfbHV2aS5weQo+PiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2x1dmkucHkKPj4gQEAgLTIzLDEzICsyMywxMyBAQCBjbGFzcyBUZXN0THV2aShpbmZy
YS5iYXNldGVzdC5CUlRlc3QpOgo+PiAgICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKPj4g
IAo+PiAgICAgIGRlZiB2ZXJzaW9uX3Rlc3Qoc2VsZik6Cj4+IC0gICAgICAgIGNtZCA9ICJsdXZp
IC12Igo+PiArICAgICAgICBjbWQgPSAibHV2aSAtdiB8IHNvcnQiCj4gCj4gVGhlIGlzc3VlIHdp
dGggdGhpcyBpcyB0aGF0LCBzaG91bGQgJ2x1dmkgLXYnIGZhaWwsIHRoZSBjb21tYW5kIHdpbGwg
bm90Cj4gZmFpbCwgYmVjYXVzZSBvZiB0aGUgcGlwZS4gSW5kZWVkLCB0aGUgcmVzdWx0IG9mIGEg
cGlwZSBpcyB0aGUgcmVzdWx0IG9mCj4gdGhlIHJpZ2h0LW1vc3QgY29tbWFuZCwgaW4gdGhpcyBj
YXNlICdzb3J0Jywgd2hpY2ggSSBkb24ndCB0aGluayB3b3VsZAo+IGV2ZXIgZmFpbCBpbiBwcmFj
dGljZSBpbiB0aGlzIGNhc2UuCj4gCj4gU28sIHRvIHByb3Blcmx5IGNhdGNoIHRoYXQgJ2x1dmkg
LXYnIGZhaWxzLCB5b3Ugd291bGQgc29ydCBpbiB0aGUgcHl0aG9uCj4gY29kZSwgc29tZXRoaW5n
IGxpa2UgKGFzc3VtaW5nIHRoZSBsdXZpIHZlcnNpb24gYWx3YXMgY29tZXMgZmlyc3Q/KToKPiAK
PiAgICAgY21kID0gImx1dmkgLXYiCj4gICAgIG91dHB1dCwgZXhpdF9jb2RlID0gc2VsZi5lbXVs
YXRvci5ydW4oY21kKQo+ICAgICBzZWxmLmFzc2VydEVxdWFsKGV4aXRfY29kZSwgMCkKCkknbSBu
b3Qgc3VyZSBpdCdzIHJlYWxseSB1c2VmdWwgdG8gdGVzdCB0aGUgZXJyb3IgY29kZSBvZiBsdXZp
IC12IHNpbmNlIGl0CnJldHVybiAyNTUgZXZlbiBvbiBzdWNjZXNzIDopCgo+ICAgICBzZWxmLmFz
c2VydEluKCdsdXZpJywgb3V0cHV0WzBdKQo+ICAgICBvdXRwdXQgPSBzb3J0ZWQob3V0cHV0WzE6
XSkKCkFzIGRpc2N1c3NlZCBvbiBJUkMsIG5vIG5lZWQgdG8gZHJvcCBvdXRwdXRbMF0gc2luY2Ug
aXQncyBub3QgdGhlIGV4ZWN1dGVkCmNvbW1hbmQgbGluZS4KCkJlc3QgcmVnYXJkcywKUm9tYWlu
CgoKPiAgICAgc2VsZi5hc3NlcnRJbignbGlidXYnLCBvdXRwdXRbMF0pCj4gICAgIHNlbGYuYXNz
ZXJ0SW4oJ2x1dmknLCBvdXRwdXRbMV0pCj4gICAgIHNlbGYuYXNzZXJ0SW4oJ3JleCcsIG91dHB1
dFsyXSkKPiAgICAgc2VsZi5hc3NlcnRJbignc3NsJywgb3V0cHV0WzNdKQo+ICAgICBzZWxmLmFz
c2VydEluKCd6bGliJywgb3V0cHV0WzRdKQo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
PiAKPj4gICAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihjbWQp
Cj4+IC0gICAgICAgIHNlbGYuYXNzZXJ0SW4oJ2x1dmknLCBvdXRwdXRbMF0pCj4+IC0gICAgICAg
IHNlbGYuYXNzZXJ0SW4oJ3psaWInLCBvdXRwdXRbMV0pCj4+ICsgICAgICAgIHNlbGYuYXNzZXJ0
SW4oJ2xpYnV2Jywgb3V0cHV0WzBdKQo+PiArICAgICAgICBzZWxmLmFzc2VydEluKCdsdXZpJywg
b3V0cHV0WzFdKQo+PiAgICAgICAgICBzZWxmLmFzc2VydEluKCdyZXgnLCBvdXRwdXRbMl0pCj4+
IC0gICAgICAgIHNlbGYuYXNzZXJ0SW4oJ2xpYnV2Jywgb3V0cHV0WzNdKQo+PiAtICAgICAgICBz
ZWxmLmFzc2VydEluKCdzc2wnLCBvdXRwdXRbNF0pCj4+ICsgICAgICAgIHNlbGYuYXNzZXJ0SW4o
J3NzbCcsIG91dHB1dFszXSkKPj4gKyAgICAgICAgc2VsZi5hc3NlcnRJbignemxpYicsIG91dHB1
dFs0XSkKPj4gIAo+PiAgICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPj4gICAgICAgICAgc2VsZi5s
b2dpbigpCj4+IC0tIAo+PiAyLjMxLjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
