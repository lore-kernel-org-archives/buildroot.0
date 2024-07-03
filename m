Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D1FC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E0361021;
	Wed,  3 Jul 2024 20:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYH3P0D8lomY; Wed,  3 Jul 2024 20:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CFD61028
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CFD61028;
	Wed,  3 Jul 2024 20:25:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32AD11BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F3A241A2F
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYq4OGakz8fi for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:25:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 889ED41A26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889ED41A26
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 889ED41A26
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:25:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42579b60af1so34853285e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 13:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720038319; x=1720643119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J/OeGBQEVd5yuXoI+ROzFPSMGmVFfNYB0v8Ge5WWtRc=;
 b=aF9VCv5aZSo6ac7FgUQFy5ERSTBj4pWoQ/15fILYkhYLV06+bYLnP6Dp1ILMpE8ysI
 ltACNEY0aaaNmlDivMk99LQEtT2Fi57aPp+3b/FAbRtaHXP+EJv53nT1kY8oh+x4CyIH
 qac2ZDecTuldkqhAUnE1vuuIVuDsKUCr0ubeUoQ1miZwExBwyFcJ1C/iSSj+w6kn/KYB
 ADBXREjq5vPcF8q9vJL0vEKEVGICHoiePx4fw0gGWUUbh0G2fvbyOaYa6stUDfvQIyy4
 R0+H+JbPginp5B6WDjITmJ9OVXdjPjqq3cMebki/7+B+7GQ1sC8UrtHp6lMF4tloZCTS
 +Arw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqzVlDKGKoGAEfT8C/ZuCE9LRTlOvdPathVFjqVWfkCBuJqcGHwKrF8lUsJv4kPxgvhkCz1VQvlsO+hUqFJT6UCH87F2X8aw==
X-Gm-Message-State: AOJu0YyiR0BK97JcwUyZqqZKLIWvdsIKF72T2BuTRHJzouGe46q8/G92
 JFy6F0TpgUjMtAap2hcKqdETADkk/iwWYVBpNDs25lDSZQhB5yB50MnoDjUHsNg=
X-Google-Smtp-Source: AGHT+IFJVc9KQTE8N7cHjsfdciIX4exlbdnFgTeJiNJ0Le64dLhb90PLcsDLRy1ApkS7C7nPscHaAw==
X-Received: by 2002:a05:600c:4fc5:b0:424:90f4:309e with SMTP id
 5b1f17b1804b1-4257a021443mr87160865e9.6.1720038319412; 
 Wed, 03 Jul 2024 13:25:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b068e54sm254172895e9.25.2024.07.03.13.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 13:25:19 -0700 (PDT)
Message-ID: <8b8ddfb0-dcc2-4ee0-8036-3332ec8ffe75@smile.fr>
Date: Wed, 3 Jul 2024 22:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240703195832.2891159-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240703195832.2891159-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720038319; x=1720643119; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/OeGBQEVd5yuXoI+ROzFPSMGmVFfNYB0v8Ge5WWtRc=;
 b=dtQH21yeQqDD9REsIqwk99cPJ30023z3yu+8y1n0YGTFH9nBFVPhTj9qZjVgX/HRH4
 HY+NGQovPoYjrS0vZSfnzmbLqHmgry54hACSt1fwyac6L+OLhebKr3XSUw4GN3JdBKAZ
 IgTfykQ/i+JFeC2tTI33h5PAExm6DKrqNm4QA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=dtQH21ye
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: update the patches to be
 applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMy8wNy8yMDI0IMOgIDIxOjU4LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIG5jbXBjIGZhaWxzIHRvIGJ1
aWxkIHdpdGggb3V0cHV0Ogo+IAo+ICAgICBBcHBseWluZyAwMDAxLW1lc29uLmJ1aWxkLWFkZC1h
dG9taWMtZGVwZW5kZW5jeS1mb3Itc3BhcmMucGF0Y2ggdXNpbmcgcGF0Y2g6Cj4gICAgIHBhdGNo
aW5nIGZpbGUgbWVzb24uYnVpbGQKPiAgICAgSHVuayAjMSBzdWNjZWVkZWQgYXQgMjMyIChvZmZz
ZXQgNTggbGluZXMpLgo+ICAgICBIdW5rICMyIEZBSUxFRCBhdCAzNTUuCj4gICAgIDEgb3V0IG9m
IDIgaHVua3MgRkFJTEVEIC0tIHNhdmluZyByZWplY3RzIHRvIGZpbGUgbWVzb24uYnVpbGQucmVq
Cj4gCj4gVGhpcyBjb21taXQgcmVmcmVzaGVzIHRoZSBwYWNrYWdlIHBhdGNoIG9uIHRoZSBjdXJy
ZW50IHBhY2thZ2UgdmVyc2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICAuY2hlY2twYWNrYWdlaWdu
b3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIC4uLm4uYnVpbGQtYWRk
LWF0b21pYy1kZXBlbmRlbmN5LWZvci1zcGFyYy5wYXRjaCB8IDE2ICsrKysrKysrKy0tLS0tLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhLy5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4g
aW5kZXggOWE3YTNhZjc1N2QzLi4wYTFkMjYyNzQ1NWUgMTAwNjQ0Cj4gLS0tIGEvLmNoZWNrcGFj
a2FnZWlnbm9yZQo+ICsrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiBAQCAtMTA1Myw3ICsxMDUz
LDYgQEAgcGFja2FnZS9tdXNsLzAwMDEtYXZvaWQta2VybmVsLWlmX2V0aGVyLmgucGF0Y2ggbGli
X3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UvbXVzbC8wMDAyLXBhY2thZ2UtbXVzbC1NYWtlLXNj
aGVkdWxlci1mdW5jdGlvbnMtTGludXgtY29tcGF0aWIucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFt
Cj4gIHBhY2thZ2UvbmFuby8wMDAxLWxpYi1nZXRyYW5kb20uYy1maXgtYnVpbGQtd2l0aC11Y2xp
YmMtMS4wLjM1LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL25hbm9jb20vMDAw
MS1maXgtYnVpbGQtd2l0aC1nY2MtMTAucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gLXBhY2th
Z2UvbmNtcGMvMDAwMS1tZXNvbi5idWlsZC1hZGQtYXRvbWljLWRlcGVuZGVuY3ktZm9yLXNwYXJj
LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL25lMTAvMDAwMS1DTWFrZUxpc3Rz
LWRvbi10LWhhcmQtY29kZS10aHVtYi1jb2RlLWdlbmVyYXRpb24ucGF0Y2ggbGliX3BhdGNoLlVw
c3RyZWFtCj4gIHBhY2thZ2UvbmUxMC8wMDAyLWZpeC1idWlsZC13aXRob3V0LUMucGF0Y2ggbGli
X3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UvbmVhcmQvUzUzbmVhcmQgU2hlbGxjaGVjayBsaWJf
c3lzdi5JbmRlbnQgbGliX3N5c3YuVmFyaWFibGVzCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmNt
cGMvMDAwMS1tZXNvbi5idWlsZC1hZGQtYXRvbWljLWRlcGVuZGVuY3ktZm9yLXNwYXJjLnBhdGNo
IGIvcGFja2FnZS9uY21wYy8wMDAxLW1lc29uLmJ1aWxkLWFkZC1hdG9taWMtZGVwZW5kZW5jeS1m
b3Itc3BhcmMucGF0Y2gKPiBpbmRleCBmZDI0NTg5NzYwNTMuLjJiNzI2Yjc0Mzc1MyAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL25jbXBjLzAwMDEtbWVzb24uYnVpbGQtYWRkLWF0b21pYy1kZXBlbmRl
bmN5LWZvci1zcGFyYy5wYXRjaAo+ICsrKyBiL3BhY2thZ2UvbmNtcGMvMDAwMS1tZXNvbi5idWls
ZC1hZGQtYXRvbWljLWRlcGVuZGVuY3ktZm9yLXNwYXJjLnBhdGNoCj4gQEAgLTEsNCArMSw0IEBA
Cj4gLUZyb20gZDJiZDMzZWMxOGMxNDZiMjdmYjVhZmY3ZGQwMDg5ZmFhMTk1ZWY5YiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbSA3MmVmNGMxYzNjMTFmYzA1YzA1N2YyYjQwYjg3ZGU5
MmE1NzNmMmViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICBGcm9tOiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAgRGF0ZTogTW9uLCAxMSBGZWIgMjAx
OSAyMTo0MjowMSArMDEwMAo+ICBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBhZGQgYXRv
bWljIGRlcGVuZGVuY3kgZm9yIHNwYXJjCj4gQEAgLTExLDE2ICsxMSwxOCBAQCBGaXhlczoKPiAg
IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvN2FjMWEwN2U0ZjcyNjMz
ZDNlYzkyYjc5ZGM1ZDhjMDYyNDkwYWJkYwo+ICAKPiAgU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLVtVcHN0cmVhbSBzdGF0dXM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9NdXNpY1BsYXllckRhZW1vbi9uY21wYy9wdWxsLzQ1XQo+ICtV
cHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFlbW9uL25jbXBjL3B1bGwv
NDUKPiArW0RhcmlvOiBtYWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGggZnV6eiBmYWN0
b3IgMF0KPiArU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgo+ICAtLS0KPiAgIG1lc29uLmJ1aWxkIHwgNCArKysrCj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gIAo+ICBkaWZmIC0tZ2l0IGEvbWVzb24u
YnVpbGQgYi9tZXNvbi5idWlsZAo+IC1pbmRleCAyZTZkZWZjLi5iMzkzZTM5IDEwMDY0NAo+ICtp
bmRleCBmYTBlZmY5NDA4YjYuLjgxOTY3NGNiZWRlNCAxMDA2NDQKPiAgLS0tIGEvbWVzb24uYnVp
bGQKPiAgKysrIGIvbWVzb24uYnVpbGQKPiAtQEAgLTE3NCw2ICsxNzQsOSBAQCBlbHNlCj4gK0BA
IC0yMzIsNiArMjMyLDkgQEAgZWxzZQo+ICAgICBwY3JlX2RlcCA9IGRlY2xhcmVfZGVwZW5kZW5j
eSgpCj4gICBlbmRpZgo+ICAgCj4gQEAgLTMwLDE0ICszMiwxNCBAQCBpbmRleCAyZTZkZWZjLi5i
MzkzZTM5IDEwMDY0NAo+ICAgaW5jID0gaW5jbHVkZV9kaXJlY3RvcmllcygKPiAgICAgJ3NyYycs
Cj4gICAKPiAtQEAgLTM1Miw2ICszNTUsNyBAQCBuY21wYyA9IGV4ZWN1dGFibGUoJ25jbXBjJywK
PiArQEAgLTQ0NSw2ICs0NDgsNyBAQCBuY21wYyA9IGV4ZWN1dGFibGUoJ25jbXBjJywKPiAgICAg
c291cmNlcywKPiAgICAgaW5jbHVkZV9kaXJlY3RvcmllczogaW5jLAo+ICAgICBkZXBlbmRlbmNp
ZXM6IFsKPiAgKyAgICBhdG9taWNfZGVwLAo+ICAgICAgIHRocmVhZF9kZXAsCj4gLSAgICAgYm9v
c3RfZGVwLAo+ICsgICAgIGV2ZW50X2RlcCwKPiAgICAgICBwY3JlX2RlcCwKPiAgLS0gCj4gLTIu
MTQuMQo+ICsyLjQzLjAKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
