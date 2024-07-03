Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E79DC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFB6402FD;
	Wed,  3 Jul 2024 14:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cay51YevhPD; Wed,  3 Jul 2024 14:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B188D40499
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B188D40499;
	Wed,  3 Jul 2024 14:01:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D03F1BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8955440169
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2MUtjVSdAEB for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E61A40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E61A40130
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E61A40130
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:01:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42565697036so4470745e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015302; x=1720620102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYoMxiLxOj6LZyX4dcDlZ4pae6BXbMY9UFV6UGt5mKM=;
 b=e9Iw1WbyxWMG3cPtlI5jYCVgyo/9GsnSM9ensiedz/lR6PJqRB6r0fzZwI7/aYp6xN
 KGHMC1b0LzCcMa6LVZUuIAqvxfUirxWJvRxRM9yKEYWZ42r0HIYdQerSPO3oFR3U0Ui1
 eDz1ACn6d+zmH92yaH4uuJJvOfCiJRNChMk85ugqn0dPxoFw9GoBrVdKiUfiXEzNQWCa
 ggr5E69Y6c/Q/tLoeh14LJTd6Qv/3ENC78lzZSqEJqJNseXfmtjLpnEcrlS0fDZvMZB0
 7vbNoqz9oAERQ+eEqyfrvO6aPhobwbaw3/4wzxkIrjppFAZWElv6+Hi5OsB/5MreOpM+
 Cz1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR5nV9n+ZsN73A5UQbsG3cbhedyMHA8FsMqn/266RKaE0CLEjNh601/4XvSlFYEZ8bM7OS/pyvoIb5l6nf/TTtjnc/AP+idQ==
X-Gm-Message-State: AOJu0YxqNDWv+T2PkMsgiY6xQyE5ZemHOStpO/7KoFlZdgql1tMeCBZ6
 NJZuQDU/UClCiugh0Ms9l/K1g9Pq+1j3wdUfFTbyfXDkx1DS3uVh+HqmTrvzuwo=
X-Google-Smtp-Source: AGHT+IHWDTNuwIrhZbuc9mKlhXVUCq8njj64nSk25PIj+5saJOEmdm3aet7778oTFohbljaRyTuzaQ==
X-Received: by 2002:a05:600c:22d7:b0:421:8234:9bb4 with SMTP id
 5b1f17b1804b1-4264093f1bcmr17245465e9.19.1720015302132; 
 Wed, 03 Jul 2024 07:01:42 -0700 (PDT)
Received: from [10.5.0.35]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b097fd4sm239220265e9.29.2024.07.03.07.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 07:01:41 -0700 (PDT)
Message-ID: <5de06075-5a14-4473-b4cb-106733b28903@smile.fr>
Date: Wed, 3 Jul 2024 16:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702195555.2498129-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240702195555.2498129-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720015302; x=1720620102; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYoMxiLxOj6LZyX4dcDlZ4pae6BXbMY9UFV6UGt5mKM=;
 b=bL5RfE3DhIpZFTIORmDZ5wb++X0SAi4kgdQwV9LqXs/WDNa49bgBeXmU82hNSZuocC
 iUeYIYClQxa5jaBXLQw3tbNBHXzNEOTwru1W3LZjQatEYvuwLzvp9a8bDIdjmpFzZQDN
 gDqfvhn5ltljGqGXc3EPLqKmVIem4Qo1w5d2w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=bL5RfE3D
Subject: Re: [Buildroot] [PATCH 1/1] package/libsvg: update the patches to
 be applied with fuzz 0
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
Cc: Carsten Schoenert <c.schoenert@gmail.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMi8wNy8yMDI0IMOgIDIxOjU1LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIGxpYnN2ZyBmYWlscyB0byBi
dWlsZCB3aXRoIG91dHB1dDoKPiAKPiAgICAgQXBwbHlpbmcgMDAwMS1maXgtZXhwYXQtc3RhdGlj
LWRlY2xhcmF0aW9uLnBhdGNoIHVzaW5nIHBhdGNoOgo+ICAgICBwYXRjaGluZyBmaWxlIHNyYy9z
dmdfcGFyc2VyX2V4cGF0LmMKPiAgICAgSHVuayAjMiBGQUlMRUQgYXQgNDQuCj4gICAgIDEgb3V0
IG9mIDIgaHVua3MgRkFJTEVEIC0tIHNhdmluZyByZWplY3RzIHRvIGZpbGUgc3JjL3N2Z19wYXJz
ZXJfZXhwYXQuYy5yZWoKPiAKPiBUaGlzIGNvbW1pdCByZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0
Y2ggb24gdGhlIGN1cnJlbnQgcGFja2FnZSB2ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERh
cmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KCkFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIHBh
Y2thZ2UvbGlic3ZnLzAwMDEtZml4LWV4cGF0LXN0YXRpYy1kZWNsYXJhdGlvbi5wYXRjaCB8IDMg
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJzdmcvMDAwMS1maXgtZXhwYXQtc3RhdGljLWRlY2xhcmF0aW9uLnBhdGNoIGIv
cGFja2FnZS9saWJzdmcvMDAwMS1maXgtZXhwYXQtc3RhdGljLWRlY2xhcmF0aW9uLnBhdGNoCj4g
aW5kZXggNThlZjI4NjcyOWYxLi4xMDg2Nzg1ZDBmMGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
aWJzdmcvMDAwMS1maXgtZXhwYXQtc3RhdGljLWRlY2xhcmF0aW9uLnBhdGNoCj4gKysrIGIvcGFj
a2FnZS9saWJzdmcvMDAwMS1maXgtZXhwYXQtc3RhdGljLWRlY2xhcmF0aW9uLnBhdGNoCj4gQEAg
LTEyLDYgKzEyLDggQEAgUGF0Y2ggYmFzZWQgb24KPiAgaHR0cDovL29lLWxpdGUub3JnL3JlZG1p
bmUvcHJvamVjdHMveG9yZy9yZXBvc2l0b3J5L3JldmlzaW9ucy9jNGRmNzk1MWU4NDZlMWJlNzE4
ZjM3ZjI0NTU2OTZhMWQwODYxZjNkL2VudHJ5L3JlY2lwZXMvY2Fpcm8vbGlic3ZnLTAuMS40L2dj
YzRfYW5kX2V4cGF0LnBhdGNoCj4gIAo+ICBTaWduZWQtb2ZmLWJ5OiBDYXJzdGVuIFNjaG9lbmVy
dCA8Yy5zY2hvZW5lcnRAZ21haWwuY29tPgo+ICtbRGFyaW86IG1ha2UgdGhlIHBhdGNoIHRvIGJl
IGFwcGxpZWQgd2l0aCBmdXp6IGZhY3RvciAwXQo+ICtTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gIAo+ICBkaWZmIC1i
dXIgbGlic3ZnLTAuMS40fm9yaWcvc3JjL3N2Z19wYXJzZXJfZXhwYXQuYyBsaWJzdmctMC4xLjQv
c3JjL3N2Z19wYXJzZXJfZXhwYXQuYwo+ICAtLS0gbGlic3ZnLTAuMS40fm9yaWcvc3JjL3N2Z19w
YXJzZXJfZXhwYXQuYwkyMDA1LTAyLTE0IDExOjI2OjI2LjAwMDAwMDAwMCAtMDYwMAo+IEBAIC0z
MSwzICszMyw0IEBAIGRpZmYgLWJ1ciBsaWJzdmctMC4xLjR+b3JpZy9zcmMvc3ZnX3BhcnNlcl9l
eHBhdC5jIGxpYnN2Zy0wLjEuNC9zcmMvc3ZnX3BhcnNlcl9lCj4gICsjZW5kaWYKPiAgIAo+ICAg
c3RhdGljIHZvaWQKPiArIF9zdmdfcGFyc2VyX3NheF93YXJuaW5nICh2b2lkCQkqY2xvc3VyZSwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
