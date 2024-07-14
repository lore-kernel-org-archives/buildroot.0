Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC5FC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 21:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C772404D6;
	Sun, 14 Jul 2024 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zN76ymgn8Ae; Sun, 14 Jul 2024 21:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79B4404CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79B4404CE;
	Sun, 14 Jul 2024 21:12:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0B2F1BF3CE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D937401DF
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 21:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXUezy_pzfzL for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 21:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD06E4012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD06E4012B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD06E4012B
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 21:12:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-367963ea053so3072284f8f.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 14:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720991567; x=1721596367;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dlq4vESFdBxF/Uka2/IV1tRcfx8Tes/AthSlJrxoLAw=;
 b=jbAl2rp1Mql0fIIo+rqc5qC102oxf9EW31pZGPX+neQHWqayX9lKWOsM9dsYX7cadX
 eSALIlamMhcuYI4uuoGKv1nsqQk/uKrokClcj40v/pJn8gkiaIIT9XM4I62kRsQJwbpF
 dAtkDWHA/IFJ3zekEQOwokEkahPiDFym25u41mrqBikwwMEqaCEkB3QEqVpndJH0vczl
 peM0fjY+8UVu4pU/0Itnme9GwebULz2/UMf/iilQfRFvzB3nTGHkRG0h9WTrs8AX9vkO
 2Exy/7MtXFilv5RWaZw7Vp3EnU09zFZa/vP4pH4Djf/KxZeKErmcz+ZxwfUlwSEtU03G
 3W4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwAQ+RjEhLqdzGv4sb6wuuSCkhj6wAWTaKTp63BjT94T7fEh+lu8RduRZAqo0TQwyBGqAQ7HMuP3P9RFyTtd+uuOI7vzVRQQ==
X-Gm-Message-State: AOJu0YzkCdI5VwAQFYYUYIFevXkGaPOGeF0g7/eDp/2mHBAsDwhsJUmU
 UH35WXzEfgMxdwf0HqkO/fJ5DXvWHHnLWnzHrBVD/PBVAacBGocz+NlcuQkOnhk=
X-Google-Smtp-Source: AGHT+IGOohaTvDh4+JOIJHj3qfdVyVabVRAmwnwsEUBsEKCwIKxa+Hm1bUkEUcNKZGOVtRxRWS324g==
X-Received: by 2002:a5d:47a7:0:b0:360:75b1:77fb with SMTP id
 ffacd0b85a97d-367cea46438mr19003223f8f.8.1720991567171; 
 Sun, 14 Jul 2024 14:12:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cd1sm4657110f8f.22.2024.07.14.14.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 14:12:46 -0700 (PDT)
Message-ID: <29fae247-b4d0-49d5-a1b6-78017c6133b2@smile.fr>
Date: Sun, 14 Jul 2024 23:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org
References: <20240619073252.411472-1-yegorslists@googlemail.com>
 <CAGm1_ktR5h+VeV37voAzZ8jTugdMg=wWdzVWqSBN2w8Bi19uqQ@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CAGm1_ktR5h+VeV37voAzZ8jTugdMg=wWdzVWqSBN2w8Bi19uqQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720991567; x=1721596367; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dlq4vESFdBxF/Uka2/IV1tRcfx8Tes/AthSlJrxoLAw=;
 b=YlU1cYSWNcpa1mTlJJlULKWFvFX5OeOFMn6A6GF5KkPv9gbio7raOsmSXBH91sZ3J+
 GeaCtunUc8FlhpFYaEgnaR1m/jUDqm763OO/Wy1hTWJWkDCIvMu+Ti1BIsmxD/gNPGux
 CZnrkvaSe5vJxHxd1xBfayDGY8O8wEAIkydL0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YlU1cYSW
Subject: Re: [Buildroot] [PATCH] package/attr: add missing libgen.h header
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWVnb3IsIEFsbCwKCkxlIDEwLzA3LzIwMjQgw6AgMTI6MjcsIFllZ29yIFllZnJlbW92
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIaSBBbGwsCj4gCj4gT24gV2VkLCBKdW4gMTks
IDIwMjQgYXQgOTozM+KAr0FNIDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4+
Cj4+IEZyb206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPj4K
Pj4gUmVzb2x2ZXMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGJ1aWxkaW5nIGFnYWluc3QgTVVT
TDoKPj4KPj4gdG9vbHMvYXR0ci5jOiBJbiBmdW5jdGlvbiAnbWFpbic6Cj4+IHRvb2xzL2F0dHIu
Yzo2OToyMDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdiYXNlbmFt
ZScKPj4gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4+ICAgIDY5IHwgICAgICAg
ICBwcm9nbmFtZSA9IGJhc2VuYW1lKGFyZ3ZbMF0pOwo+PiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fgo+PiB0b29scy9hdHRyLmM6Njk6MTg6IGVycm9yOiBhc3NpZ25tZW50IHRv
ICdjaGFyIConIGZyb20gJ2ludCcgbWFrZXMKPj4gcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91
dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25dCj4+ICAgIDY5IHwgICAgICAgICBwcm9nbmFtZSA9
IGJhc2VuYW1lKGFyZ3ZbMF0pOwo+PiAgICAgICB8ICAgICAgICAgICAgICAgICAgXgo+Pgo+PiBV
cHN0cmVhbTogaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9hY2wtZGV2ZWwv
MjAyNC0wMy9tc2cwMDAwMC5odG1sCj4gCj4gVGhlIHBhdGNoIHdhcyBtZXJnZWQgWzFdIHVwc3Ry
ZWFtIGJ1dCB0aGVyZSBpcyBzdGlsbCBubyBuZXcgcmVsZWFzZS4KPiAKPiBbMV0gaHR0cHM6Ly9n
aXQuc2F2YW5uYWgubm9uZ251Lm9yZy9jZ2l0L2F0dHIuZ2l0L2NvbW1pdC8/aWQ9OGE4MGQ4OTVk
ZmQ3NzkzNzMzNjNjM2E0YjYyZWNjZTVhNTQ5ZWZiMgoKSSByZXBsYWNlZCB0aGUgcGF0Y2ggYnkg
dGhlIHVwc3RyZWFtIG9uZSB3aXRoIHRoZSBjb3JyZWN0IGF1dGhvcnNoaXAuCgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFllZ29yCj4gCj4+
IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9jNjEyMDY5Njhl
ZGE5OTEzZTM3ZTk1YTYxZGMzZTEwMzk5NTAzZmNkLwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZZWdv
ciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4+IC0tLQo+PiAgLi4uLW1p
c3NpbmctbGliZ2VuLmgtaW5jbHVkZS1mb3ItYmFzZW5hLnBhdGNoIHwgMzEgKysrKysrKysrKysr
KysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL2F0dHIvMDAwMy10b29scy1hdHRyLmMtQWRkLW1pc3NpbmctbGli
Z2VuLmgtaW5jbHVkZS1mb3ItYmFzZW5hLnBhdGNoCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2F0dHIvMDAwMy10b29scy1hdHRyLmMtQWRkLW1pc3NpbmctbGliZ2VuLmgtaW5jbHVkZS1mb3It
YmFzZW5hLnBhdGNoIGIvcGFja2FnZS9hdHRyLzAwMDMtdG9vbHMtYXR0ci5jLUFkZC1taXNzaW5n
LWxpYmdlbi5oLWluY2x1ZGUtZm9yLWJhc2VuYS5wYXRjaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5iNDAxMjI5N2U2Cj4+IC0tLSAvZGV2L251bGwKPj4gKysr
IGIvcGFja2FnZS9hdHRyLzAwMDMtdG9vbHMtYXR0ci5jLUFkZC1taXNzaW5nLWxpYmdlbi5oLWlu
Y2x1ZGUtZm9yLWJhc2VuYS5wYXRjaAo+PiBAQCAtMCwwICsxLDMxIEBACj4+ICtGcm9tIGZlN2Zi
YzJiNjY2ZjBkYWFkNWI3YmIwYjFlOGViMjI2MWNmMTY1MzAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4+ICtGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+
Cj4+ICtEYXRlOiBXZWQsIDE5IEp1biAyMDI0IDA5OjIxOjM0ICswMjAwCj4+ICtTdWJqZWN0OiBb
UEFUQ0hdIHRvb2xzL2F0dHIuYzogQWRkIG1pc3NpbmcgbGliZ2VuLmggaW5jbHVkZSBmb3IgYmFz
ZW5hbWUoMykKPj4gKwo+PiArRml4ZXMgY29tcGlsYXRpb24gaXNzdWUgd2l0aCBtdXNsIGFuZCBt
b2Rlcm4gQzk5IGNvbXBpbGVycy4KPj4gKwo+PiArU2VlOiBodHRwczovL2J1Z3MuZ2VudG9vLm9y
Zy85MjYyOTQKPj4gKwo+PiArVXBzdHJlYW06IGh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNo
aXZlL2h0bWwvYWNsLWRldmVsLzIwMjQtMDMvbXNnMDAwMDAuaHRtbAo+PiArCj4+ICtTaWduZWQt
b2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4+ICst
LS0KPj4gKyB0b29scy9hdHRyLmMgfCAxICsKPj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPj4gKwo+PiArZGlmZiAtLWdpdCBhL3Rvb2xzL2F0dHIuYyBiL3Rvb2xzL2F0dHIuYwo+
PiAraW5kZXggZjEyZTRhZi4uNmEzYzFlOSAxMDA2NDQKPj4gKy0tLSBhL3Rvb2xzL2F0dHIuYwo+
PiArKysrIGIvdG9vbHMvYXR0ci5jCj4+ICtAQCAtMjgsNiArMjgsNyBAQAo+PiArICNpbmNsdWRl
IDxlcnJuby5oPgo+PiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPj4gKyAjaW5jbHVkZSA8bG9jYWxl
Lmg+Cj4+ICsrI2luY2x1ZGUgPGxpYmdlbi5oPgo+PiArCj4+ICsgI2luY2x1ZGUgPGF0dHIvYXR0
cmlidXRlcy5oPgo+PiArCj4+ICstLQo+PiArMi4zNC4xCj4+ICsKPj4gLS0KPj4gMi4zNC4xCj4+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
