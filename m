Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C05C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD5761021;
	Wed,  3 Jul 2024 20:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNGBfsHqS3qn; Wed,  3 Jul 2024 20:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F86361025
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F86361025;
	Wed,  3 Jul 2024 20:22:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3630C1BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220BC83FA9
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r91ciy2W_m2j for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EC7A83FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC7A83FA6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EC7A83FA6
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:22:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42561c16ffeso44838665e9.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 13:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720038173; x=1720642973;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JCnEsY7z2jd+Kr8ngDCBKQyuTTeY9D+gL9vQ+CbQfGM=;
 b=QCBemypbptVRpAiP3cy90Q7otO8CBO1TY9Ny4YIA9Zs8/SQbcfIU6H7JFAwr0VCNXd
 BaHfvKbSnEungPm5ZakAasm80QbpK3JPujhQNnJBWnKpr5cAVnG2+LErD3losefPbhlK
 gzTHhDb9t0ah7ho/z5kBmbmuLTxOhC4V7IHCxqwUuAxROJxfx5gKVujM/OIBbK8W7GgP
 /aytczM194iiTgT6kEyk6Q0oPCM2ejYmY0RyQ2VYTjUVHMwEXdTxHHluROBlXtyQvDdA
 eRO2gH7+Psws4KAamnhH3yIUv+q7Cn35wGPcC+5yH0Ei2Q1BPso5ucTn/FY8+Y/ZLhE1
 9rvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4JIWlS5SHcSfyrQJC+1XtPHSN2Yf7XIkpS67A6Uklw2TmfNdDkLgvmqB1UfPRbG7YrYmk6B4KKjqiyeJsExk5mi92GyrvzA==
X-Gm-Message-State: AOJu0YzMpoHll+2HnolAG2YLEn6E4HFGsaiW1cZhIDpTYGm0f8+NYN0G
 Y0QbztK3LT7PT9gO1VJng0oNor4jsKx3tFbVm+cfkpvVN6CLm2rNz80YqXKpUIE=
X-Google-Smtp-Source: AGHT+IGXdLN7gCOWX8/rXa/P6xi7tQJXz+C9xn1NzVQzu+9GT5GQjWbiOSO/UlHY8ZrHGrWaLIYMcw==
X-Received: by 2002:a05:600c:3089:b0:425:7835:4382 with SMTP id
 5b1f17b1804b1-4257a06da46mr95206045e9.34.1720038173201; 
 Wed, 03 Jul 2024 13:22:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c0f26sm247904385e9.39.2024.07.03.13.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 13:22:53 -0700 (PDT)
Message-ID: <e5dba292-ffd7-479f-9141-7105f6242de9@smile.fr>
Date: Wed, 3 Jul 2024 22:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240703192452.2804130-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240703192452.2804130-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720038173; x=1720642973; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JCnEsY7z2jd+Kr8ngDCBKQyuTTeY9D+gL9vQ+CbQfGM=;
 b=losVJwpyQxoqeSDpqRyvrsMvXmfJuU8b4t0C4ylaIrgwf9ziPUa5aMKvXHFFpWafxo
 4WmSCr/hRks8u2cBemkvC7pF4UcQlzOPJHA49cI7OaMrteP1bMoU6TE/iX2P2CY2bgjK
 L/mGuH+SWfU7yiU0YclWBlPkr8iilLS38JOpE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=losVJwpy
Subject: Re: [Buildroot] [PATCH 1/1] package/memstat: update the patches to
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
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwMy8wNy8yMDI0IMOgIDIxOjI0LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIG1lbXN0YXQgZmFpbHMgdG8g
YnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAwMDEtUEFUSF9NQVgucGF0Y2gg
dXNpbmcgcGF0Y2g6Cj4gICAgIHBhdGNoaW5nIGZpbGUgbWVtc3RhdC5jCj4gICAgIEh1bmsgIzEg
RkFJTEVEIGF0IDE5Lgo+ICAgICAxIG91dCBvZiAxIGh1bmsgRkFJTEVEIC0tIHNhdmluZyByZWpl
Y3RzIHRvIGZpbGUgbWVtc3RhdC5jLnJlago+IAo+IFRoaXMgY29tbWl0IHJlZnJlc2hlcyB0aGUg
cGFja2FnZSBwYXRjaCBvbiB0aGUgY3VycmVudCBwYWNrYWdlIHZlcnNpb24uCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAtLS0KPiAgcGFja2FnZS9tZW1zdGF0LzAwMDEtUEFUSF9NQVgucGF0Y2ggfCA0ICsrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL21lbXN0YXQvMDAwMS1QQVRIX01BWC5wYXRjaCBiL3BhY2thZ2UvbWVt
c3RhdC8wMDAxLVBBVEhfTUFYLnBhdGNoCj4gaW5kZXggMGMzNjE3YTYxYjUyLi4xNGNhNmEwMDc4
ZTIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZW1zdGF0LzAwMDEtUEFUSF9NQVgucGF0Y2gKPiAr
KysgYi9wYWNrYWdlL21lbXN0YXQvMDAwMS1QQVRIX01BWC5wYXRjaAo+IEBAIC0xLDYgKzEsOCBA
QAo+ICBBZGQgbWlzc2luZyAjaW5jbHVkZSBmb3IgUEFUSF9NQVgKPiAgCj4gIFNpZ25lZC1vZmYt
Ynk6IE1hYXJ0ZW4gdGVyIEh1dXJuZSA8bWFhcnRlbkB0cmVld2Fsa2VyLm9yZz4KPiArW0Rhcmlv
OiBtYWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVkIHdpdGggZnV6eiBmYWN0b3IgMF0KPiArU2ln
bmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+ICAKPiAgLS0tIG1lbXN0YXQtMC44Lm9yZy9tZW1zdGF0LmMJMjAwOS0wNi0wOCAx
NDozODowNS4wMDAwMDAwMDAgKzAyMDAKPiAgKysrIG1lbXN0YXQtMC44L21lbXN0YXQuYwkyMDE0
LTA5LTEyIDAzOjU1OjQzLjA5NjAzNTM3NCArMDIwMAo+IEBAIC0xMSw0ICsxMyw0IEBAIFNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gdGVyIEh1dXJuZSA8bWFhcnRlbkB0cmVld2Fsa2VyLm9yZz4KPiAg
KyNpbmNsdWRlIDxsaW1pdHMuaD4KPiAgIAo+ICAgLyogYmxhY2tsaXN0IGRldmljZXMgdGhhdCBq
dXN0IG1hcCBwaHlzaWNhbCBtZW1vcnkgKi8KPiAtIGNoYXIgKmJsYWNrbGlzdFtdID0geyAiL2Rl
di9tZW0iLAo+ICsgY2hhciAqYmxhY2tsaXN0W10gPSB7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
