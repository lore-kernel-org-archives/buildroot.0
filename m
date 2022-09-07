Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F81EC54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B808416C2;
	Wed,  7 Sep 2022 19:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B808416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDQrEhqszrhR; Wed,  7 Sep 2022 19:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A809416A9;
	Wed,  7 Sep 2022 19:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A809416A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93BF81BF30D
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B1E260D62
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 19:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B1E260D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjtHLq1FfsAE for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 19:54:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482D160701
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482D160701
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 19:54:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so12605575wmk.3
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 12:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=QyWL0JA3gm6uWOzLZybppsF/DH8zXCrr+OKdO9yTrHU=;
 b=TBUcQVEkZi61vzGFsAnZGoZ2SEHAEwldApKy+0wcchJD9gaA0IvkIiFO87222hsXsc
 Sfx4XMmhCnbuiAPxv820ok3Z++ckEOxYDfp4n+czPuEA6VmFP8RKTjlJBRysaGhgQQF4
 IZL03JZyMBvN1h2ImMnkfa7xiKJ5Dwz1GCHuDL/T4Gx5op/EjwSlYPxpuG7uqe0wF6l5
 8RXhU4E4exPylBbnZ70NfjsW9JrO2jHVB2uCbUHBMRTT9Qqcz4/tIICvIruy0XlMyUAq
 8go4eByFDGzoN6kjBHR4oI/9bkbkwtwiyd5BBj2f1OV/5/Fuj4P+bN87DAq5oV8LsPXI
 HTEw==
X-Gm-Message-State: ACgBeo392t5gdVmtvwSEDnRschC83qlT2Xa4fafnMqmZ746At7Cvlx6s
 f3BJ5mqhl7yqp2Xht7dzTms=
X-Google-Smtp-Source: AA6agR5pg+ksmY5XFxsdN0+tcQgeA8LcVHeSBEavVJsjdK+mKBVzo+0hBmzOxPGG4edz4myRzonrWQ==
X-Received: by 2002:a1c:4c03:0:b0:3a5:d65c:c1e7 with SMTP id
 z3-20020a1c4c03000000b003a5d65cc1e7mr68944wmf.4.1662580461247; 
 Wed, 07 Sep 2022 12:54:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228692033dcsm13804119wrb.91.2022.09.07.12.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 12:54:20 -0700 (PDT)
Message-ID: <b16e1fd7-b766-4757-aba8-bef94cf9eec9@gmail.com>
Date: Wed, 7 Sep 2022 21:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220906203423.476196-1-romain.naour@gmail.com>
 <20220907073025.GG1490660@scaer>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220907073025.GG1490660@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=QyWL0JA3gm6uWOzLZybppsF/DH8zXCrr+OKdO9yTrHU=;
 b=JOAJkb3kMV3QQjbmzZnTlC/beWWKds2QgV7wkjz2lfcDQTvxPHQ5sgLeibyAewgJuR
 3GmY5Gt+XYaHAqF40lCvYoN3lS6stxkPy+Pfxq9gOP5j1i52Ixdy7IdBx/QSVP298Ktf
 1BIaVzoQGyk334Zw9R+FHTrXWcEZe6KTBw8NKqg0s4HHUtcWq0HRhpVFZlsk6xM5ttEC
 hiyz50EZhDhcdcA4r0qbVdkoaXkK/Bq0rJt7c9sQaVwMoNVlzsKeE9uaF8PmgCPCDNay
 Gnf42r04M4ijiigEo8ocLRrp0txBF9KbDZtCbfGytN12v7DceI215/oV2lhwq1yXTv7D
 eo6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JOAJkb3k
Subject: Re: [Buildroot] [PATCH] arch/Config.in.powerpc: disable 64bits only
 target for PowerPC target variant
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDcvMDkvMjAyMiDDoCAwOTozMCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjItMDktMDYgMjI6MzQgKzAyMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IEl0IHR1cm4gb3V0IHRoYXQgc29tZSBQb3dl
clBDIHZhcmlhbnQgYXJlIGFjdHVhbGx5IDY0Yml0cyBvbmx5IGFuZAo+PiBmYWlsIHRvIGJ1aWxk
IGFuIGludGVybmFsIHRvb2xjaGFpbiAoZmFpbCBvbiBnbGliYywgdUNsaWJjLW5nIG9yIG11c2wK
Pj4gYnVpbGQpLgo+IFstLVNOSVAtLV0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluLnBv
d2VycGMgYi9hcmNoL0NvbmZpZy5pbi5wb3dlcnBjCj4+IGluZGV4IGM0OGVkZDNiYjQuLmIzMjFk
ZDJkNGMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvQ29uZmlnLmluLnBvd2VycGMKPj4gKysrIGIvYXJj
aC9Db25maWcuaW4ucG93ZXJwYwo+PiBAQCAtNjYsMTAgKzY2LDE0IEBAIGNvbmZpZyBCUjJfcG93
ZXJwY182MDRlCj4+ICAJZGVwZW5kcyBvbiAhQlIyX0FSQ0hfSVNfNjQKPj4gIGNvbmZpZyBCUjJf
cG93ZXJwY182MjAKPj4gIAlib29sICI2MjAiCj4+ICsJIyBnY2Mgc3VwcG9ydCBvbmx5IHBvd2Vy
cGM2NCB0YXJnZXQKPj4gKwlkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4+ICAJIyBObyBDIGxp
YnJhcnkgc3VwcG9ydHMgdGhpcyB2YXJpYW50IG9uIHBwYzY0bGUKPj4gIAlkZXBlbmRzIG9uICFC
UjJfcG93ZXJwYzY0bGUKPiAKPiBBcyBUaG9tYXMgcHJldmlvdXNseSBzdWdnZXN0ZWQsIGxldCdz
IHVzZSBwb3NpdGl2ZSBsb2dpYzoKPiAKPiAgICAgIyBnY2Mgc3VwcG9ydCBvbmx5IHBvd2VycGM2
NCB0YXJnZXQsIGFuZAo+ICAgICAjIG5vIEMgbGlicmFyeSBzdXBwb3J0cyB0aGlzIHZhcmlhbnQg
b24gcHBjNjRsZQo+ICAgICBkZXBlbmRzIG9uIEJSMl9wb3dlcnBjNjQKPiAKPiBBbmQgc28gb24g
Zm9yIHRoZSBvdGhlcnMuCj4gCj4gTGV0J3MgdHJ5IGFuZCBnZXQgc2ltcGxlciBkZXBlbmRlbmNp
ZXMsIHdoaWNoIG1ha2UgaXQgb2J2aW91cyB1bmRlciB3aGF0Cj4gY29uZGl0aW9ucyBlYWNoIENQ
VSB2YXJpYW50IGlzIGFjdHVhbGx5IGF2YWlsYWJsZS4KPiAKPiBBbHNvLCBJIHRoaW5rIEpvZWwn
cyBzZXJpZXMgWzBdIGhhZCBldmVuIG1vcmUgY2hhbmdlcyBpbiB0aGF0IGFyZWEsIGFuZAo+IGl0
IHdvdWxkIGJlIHNvIG5pY2UgdG8gc2VlIGFuIHVwZGF0ZWQgcmV2aXNpb24uCgpTb3JyeSBJIGRp
ZG4ndCByZW1lbWJlciBvZiB0aGlzIHBhdGNoIHNlcmllcyAobW9yZSBvbmUgbW9udGggYWdvKSBh
bmQgbWFya2VkCmNoYW5nZXMgcmVxdWVzdGVkLiBBY3R1YWxseSBJIHdhcyBub3QgbGlzdGVuaW5n
IHRvIHRoZSBtYWlsaW5nIGxpc3QgYXQgdGhhdCB0aW1lCmR1ZSB0byB2YWNhdGlvbnMgOnAKCkpv
ZWwsIGNhbiB5b3UgcmVzZW5kIHlvdXIgc2VyaWVzIGFuZCBpbmNsdWRlIGFsbCB0aGUgbGluayBJ
IHByb3ZpZGVkIGluIG15CmNvbW1pdCBsb2c/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBb
MF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjIwNzI5MDAwOTA0LjEyOTUy
OTUtMS1qb2VsQGptcy5pZC5hdS8KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
