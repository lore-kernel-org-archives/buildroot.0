Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E6CC87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F80F6105A;
	Sun, 10 Aug 2025 20:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDHQqUdGNcLi; Sun, 10 Aug 2025 20:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B266104A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B266104A;
	Sun, 10 Aug 2025 20:13:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23381154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10DC240F6F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bwSHhVfxoLD for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:13:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E4C840F69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4C840F69
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E4C840F69
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:13:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so3065858f8f.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754856833; x=1755461633;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLP7NeRRoBrYtymU0bjXqhDkMb9hbqckVolCmOzu5eQ=;
 b=pN1QOWA/iUVNMRZUFBSgYwALgougSFxyUyYzTKT3Gaaio/3p78bfdTs/wVh1Ra8x8Z
 tsEpXYydnYcskMBbDs2rRUgIwZTM5L3ByqwC0KkBztEKHpyZN5MEyR6O2Kt8rzg3nV6n
 2kD3glprVoOP4mDDXq8l95vzB9zcwDZgAuWDsEZqWjwJrhoHznSMsYn68eIxfOul4Syq
 zIu0xF0CSs93kp7TXEXCpCyfCizh0g1rCxhCrK3yjaRFiR86Vg15WwDupGskC7Z3meSM
 75qSVVIL7j7IpqzECIakSyIvboCKG3X2DBdxc9kPxiamnqoxBkr4KukCLwRjkdJH4CKJ
 Ctlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5yTZPvy7lzUMr7gxC8Gdr2YA6A4l1VPzNjwA9rjXETq8hXuOXrNWbQJyClOvSwW4bbeagB8Wgm8M=@buildroot.org
X-Gm-Message-State: AOJu0Yw2abBcSqZl6iAFeasG6CKrPA1Zz6MU9hJAXe49l92MjDMygalH
 BPwudotw7uMzS6AwiQqjkyj+YOBkRvGpeKF1ewys1DLIltNlxa+EXqkgIi6oy8vvnp0=
X-Gm-Gg: ASbGnctirAv8H2HA/7uzwg+RFQYKFi0fkUnGz3cUe+uO1NAvKBdd+EXX5w4BCGZ+Nkg
 zXWKgEQ0Q4GXAhmHWW7UDjX5O1WVKDKTlx1QMbrUgIATJ3Wi1DBZr4/hI09BbXFZsjCwBgTvRxt
 T/2AfRl5UgqBy3Ae/gbDwW0xVswFivG2sMba+t6pnTYP6pkhcP9F9Vtg1FxPSVyLCVwTrFpFaBh
 +lJHLU+pNUHlK5r6immoeDZ4saI/Vkrw3xWAm7GFJOYcZaPpId9It4DbCmz0HmO/Wal22Gl/4zT
 PLeknvt64lbJXXey0pc1d2z1AYWGEWsSKoKwYHiY0ZEatSvwIXxZW/tgm09pVW+Rt8+8hbPSiZf
 DG5nrVaKkqblAxv9ixhaDLt+3Um90FIh28pLIAPS6hDHcW1O1Y8PjFZiu4pcKpekbL3UA1SOG9u
 rYKRw0w38LScYd4ZFesSdpK5DPKandmpbyQkPqRUmQw0AFVuXABygOStt+QiPr
X-Google-Smtp-Source: AGHT+IGoSmiOoV4EfprtvuazDOCAAmBw4HTH2dEtsWm6WiFhm1cnS5rXu4K6IlSuiL0eijbSnKFwDg==
X-Received: by 2002:a5d:5f85:0:b0:3b7:8b1b:a9d5 with SMTP id
 ffacd0b85a97d-3b900b80406mr8728447f8f.51.1754856832998; 
 Sun, 10 Aug 2025 13:13:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0a24bf1sm249076345e9.1.2025.08.10.13.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 13:13:52 -0700 (PDT)
Message-ID: <67d4f2ce-b68c-4cb5-bb10-71f8d1871371@smile.fr>
Date: Sun, 10 Aug 2025 22:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vkrawiec <victor.krawiec@arturia.com>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>
References: <20250120162808.1219036-1-victor.krawiec@arturia.com>
Content-Language: fr, en-US
In-Reply-To: <20250120162808.1219036-1-victor.krawiec@arturia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754856833; x=1755461633; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XLP7NeRRoBrYtymU0bjXqhDkMb9hbqckVolCmOzu5eQ=;
 b=EhQMkOQFTa6pEsLwDKUQysp1o6nJbdp8YKs2dDBbxcuyjDglLlOAZrzQ0qVQKKWwtf
 GgnVbM+Jt78YnTWtfblBqNok5jugpD9KdN483LGk+VumeSL1trSBBaBndFqERnt7bA4d
 OVBUQblcSPoxV6vVQbkXwfF6Ym+3+OoTo2Xpw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=EhQMkOQF
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project/lld: fix broken
 symlink in SDK
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

SGVsbG8gVmljdG9yLCBBbGwsCgpMZSAyMC8wMS8yMDI1IMOgIDE3OjI4LCB2a3Jhd2llYyBhIMOp
Y3JpdMKgOgo+IFRoZSBzeW1saW5rIGJpbi9sbGQgLT4gJChHTlVfVEFSR0VUX05BTUUpL2Jpbi9s
bGQgaXMgYnJva2VuIGluc2lkZSBhIFNESyBjb250YWluaW5nIGhvc3QtbGxkIHBhY2thZ2UKPiBU
aGUgc3ltbGluayBzdGlsbCBwb2ludHMgdG8gdGhlIGxvY2F0aW9uIG9mIGxsZCBpbnNpZGUgdGhl
IGJ1aWxkJ3MgaG9zdCBmb2xkZXIgaW5zdGVhZCBvZiB0aGUgbG9jYXRpb24gb2YgbGxkIGluc2lk
ZSB0aGUgU0RLCj4gSW4gY29uc2VxdWVuY2UgR0NDIGlzIG5vdCBhYmxlIHRvIGZpbmQgbGxkIGxp
bmtlcgo+IENoYW5naW5nIHRoZSBzeW1saW5rIHRvIGJlIHJlbGF0aXZlIGR1cmluZyBob3N0LWxs
ZCBpbnN0YWxsYXRpb24gZml4ZXMgdGhlIHByb2JsZW0KClNvcnJ5IGZvciB0aGUgc2xvdyByZXBs
eS4KCkkgZGlkIGEgdGVzdCB3aXRoIG1ha2Ugc2RrIGFuZCBpbmRlZWQsIHRoZQokKEhPU1RfRElS
KS8kKEdOVV9UQVJHRVRfTkFNRSkvYmluL2xsZCBzdGlsbCBwb2ludHMgdG8gdGhlIGxvY2F0aW9u
IG9mIGxsZAppbnNpZGUgdGhlIEhPU1RfRElSIGRpcmVjdG9yeSB3aGVyZSBob3N0LWxsZCB3YXMg
aW5pdGlhbGx5IGluc3RhbGxlZC4KCkFzIHNvb24gYXMgdGhlIHNkayBpcyByZWxvY2F0ZWQsIHRo
ZSBzeW1saW5rIGlzIHdyb25nLgoKQWNrZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3Vy
QHNtaWxlLmZyPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiB2a3Jhd2llYyA8dmljdG9yLmtyYXdpZWNA
YXJ0dXJpYS5jb20+CgpDYW4geW91IGZpeCB5b3UgbmFtZSBpbiB5b3VyIFNvQiBsaW5lPyBJdCBz
aG91bGQgYmUgIlZpY3RvciBLcmF3aWVjIgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+
ICBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbGQvbGxkLm1rIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGx2bS1wcm9qZWN0L2xsZC9sbGQubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbGQv
bGxkLm1rCj4gaW5kZXggNTM5ZGQwYmQ3MS4uMGMxZmNlNDg2MCAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2xsdm0tcHJvamVjdC9sbGQvbGxkLm1rCj4gKysrIGIvcGFja2FnZS9sbHZtLXByb2plY3Qv
bGxkL2xsZC5tawo+IEBAIC0xOCw4ICsxOCw4IEBAIEhPU1RfTExEX0NPTkZfT1BUUyArPSAtREJV
SUxEX1NIQVJFRF9MSUJTPU9GRgo+ICAjIEdDQyBsb29rcyBmb3IgdG9vbHMgaW4gYSBkaWZmZXJl
bnQgcGF0aCBmcm9tIExMRCdzIGRlZmF1bHQgaW5zdGFsbGF0aW9uIHBhdGgKPiAgZGVmaW5lIEhP
U1RfTExEX0NSRUFURV9TWU1MSU5LUwo+ICAJbWtkaXIgLXAgJChIT1NUX0RJUikvJChHTlVfVEFS
R0VUX05BTUUpL2Jpbgo+IC0JbG4gLXNmICQoSE9TVF9ESVIpL2Jpbi9sbGQgJChIT1NUX0RJUikv
JChHTlVfVEFSR0VUX05BTUUpL2Jpbi9sbGQKPiAtCWxuIC1zZiAkKEhPU1RfRElSKS9iaW4vbGxk
ICQoSE9TVF9ESVIpLyQoR05VX1RBUkdFVF9OQU1FKS9iaW4vbGQubGxkCj4gKwlsbiAtc2ZyICQo
SE9TVF9ESVIpL2Jpbi9sbGQgJChIT1NUX0RJUikvJChHTlVfVEFSR0VUX05BTUUpL2Jpbi9sbGQK
PiArCWxuIC1zZnIgJChIT1NUX0RJUikvYmluL2xsZCAkKEhPU1RfRElSKS8kKEdOVV9UQVJHRVRf
TkFNRSkvYmluL2xkLmxsZAo+ICBlbmRlZgo+ICAKPiAgSE9TVF9MTERfUE9TVF9JTlNUQUxMX0hP
T0tTICs9IEhPU1RfTExEX0NSRUFURV9TWU1MSU5LUwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
