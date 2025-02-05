Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A3C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4EC60E60;
	Wed,  5 Feb 2025 08:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09hBEREME416; Wed,  5 Feb 2025 08:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 680B260B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680B260B3E;
	Wed,  5 Feb 2025 08:47:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCE00CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B767141419
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnrx_TCi2GGj for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13150413B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13150413B9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13150413B9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:47:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38da713b9daso1543668f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 00:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738745230; x=1739350030;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fngV8ijY+LtHI4FZ3USJdZUG5dDWhaXM/XvAFjhm/sE=;
 b=w8kNOMUW6JVUW5zaQ72acyc0Pm69Y8Qck/0IFSBdPNP3ek0PZBOihxr9h7UN9hanQg
 rinton/AAQ+hGG3WAdvVnFIhMudu+kQGRC37OX5D+CT8svPCvgxXvGoUTQZ5RZ2q2ZPG
 V93J/k+xp4o3HrBQzSLDVojrz811n0bjkmW+nfjl14AjqoZ/9a+uOx001HGDAjBXnAeY
 /ekTWktTxDfbxvuTgledYdFeBsse9JhKsoEHxjFt1xyLs7LgBRvD4xvTzaCi3VhQ1vM+
 zqDbpYimK9LQXSqrVqvjQpDJ2zSeFuC9ynXZnOoTBFLIwTQvSBI6Gx+MIEfQbj8/6N8c
 bolg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0OI3SBJczNnKUo8EDuME/kcj77gl4SJlZwegvzlA/tTtTchzJz1jcoBZGt+Fe8LW0Dklttk8rtd4=@buildroot.org
X-Gm-Message-State: AOJu0Yx22vvZaQu0pE9dhUX6kzxN3O3dc5mfNQ4RzGCPKv96oGY2f88m
 /H87VhYD9kCfUMz9sAcytLYxCSFXP+3YnzAybnDpyuw7gYFewgzy4oI1W0MOemg=
X-Gm-Gg: ASbGncubv5XoKNAiKEMn7WpaaZIHv3wQIrpsSUT+FdJIcJtMTurukdgxmCezsCKYRvo
 g9B4meFLZOH7lUaQvfaAUFqNaNzhO/xxfXv4MBt8ALAMMeEolqDhp8GKyCeHZwbqNKKwkqGyK0S
 HT1T8OGVMQS7sn1zWA3BpVZ692/myOI8PSJObhdwuMTeDm2rnKbkMOiIln9loKD+JbcpimwHDBV
 I7+I9vbwNWOx3B7Y++fgxPSOt1tECzYQVN84dsuTFQBRhLz3pITO8guobldNkvenhslozaDy64Z
 6SndImLfHe66oEwG4Iz40c09REAlQXDRh1UMZaucTW+iOSs5fUd7m3AA
X-Google-Smtp-Source: AGHT+IEXIjgOZRCdeeCIRRx1KMXC9hl8QJyhPoaeKDPAf/Ww8XwB8CCozjGH8mVb1ygcIjZnK4oUGA==
X-Received: by 2002:a05:6000:4020:b0:38a:418e:1179 with SMTP id
 ffacd0b85a97d-38db48697efmr1487597f8f.2.1738745230100; 
 Wed, 05 Feb 2025 00:47:10 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38daba26aaasm4068765f8f.11.2025.02.05.00.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:47:09 -0800 (PST)
Message-ID: <1d789bef-093d-402f-99be-5fda01b2f80c@smile.fr>
Date: Wed, 5 Feb 2025 09:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-3-gael.portay+rtone@gmail.com>
Content-Language: en-US
In-Reply-To: <20250204173456.201056-3-gael.portay+rtone@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738745230; x=1739350030; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fngV8ijY+LtHI4FZ3USJdZUG5dDWhaXM/XvAFjhm/sE=;
 b=pWdw8erxLSpmUOuWFW/ihFMVV8rWbaqUgw5jv57XlsWoSmYEuA/pOmTB2hKufcWRWC
 lmhiMsxGzNJUlJ6nt45j0OUVM9bu8zXREY2QpCZIm7/NxiHctiJx6QvS3huVe3m2U4YF
 l2gwwRb0opGPVmN7a8aP0kSu67o7QxJF4pfm4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=pWdw8erx
Subject: Re: [Buildroot] [PATCH v4 2/2] package/rpi-userland: package is
 deprecated
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

SGVsbG8gR2HDq2wsIEFsbCwKCkxlIDA0LzAyLzIwMjUgw6AgMTg6MzQsIEdhw6tsIFBPUlRBWSBh
IMOpY3JpdMKgOgo+IFRoZSBwYWNrYWdlIHJwaS11c2VybGFuZCBoYXMgYmVlbiBtYXJrZWQgYXMg
YW5jaWVudCBhbmQgZGVwcmVjYXRlZFsxXS4KPiAKPiBUaGlzIGFkZHMgdGhlIG1lc3NhZ2UgaW4g
aXRzIGhlbHAuCj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxh
bmQvY29tbWl0Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKPiAKCldp
dGggcnBpLXV0aWxzIHBhY2thZ2UgZW5hYmxlZCwgd2Ugc2hvdWxkIGF2b2lkIGFueSBjb25mbGlj
dCB3aXRoIHRoaXMgcGFja2FnZS4KVGhleSBzaG91bGQgbm90IGJlIGVuYWJsZWQgYXQgdGhlIHNh
bWUgdGltZSBpZiB0aGV5IHByb3ZpZGUgdGhlIHNhbWUgYmluYXJpZXMgZXRjLgoKTWF5YmUgaXQg
d291bGQgYmUgZWFzaWVyIGlmIHJwaS11c2VybGFuZCBjYW4gYmUgcmVtb3ZlZD8KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5
K3J0b25lQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmlnLmlu
IHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmlnLmluIGIvcGFja2FnZS9y
cGktdXNlcmxhbmQvQ29uZmlnLmluCj4gaW5kZXggNDIxOWJkYjljNC4uYzM5ZWI0NTk4ZiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL3JwaS11c2VybGFuZC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L3JwaS11c2VybGFuZC9Db25maWcuaW4KPiBAQCAtMTYsNiArMTYsMTcgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX1JQSV9VU0VSTEFORAo+ICAJICBtbWFsLCBHTEVTdjIsIHZjb3MsIG9wZW5tYXhpbCwg
dmNoaXFfYXJtLCBiY21faG9zdCwgV0ZDLAo+ICAJICBPcGVuVkcuCj4gIAo+ICsJICBJbXBvcnRh
bnQ6IFRoZSBwYWNrYWdlIGlzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWQuCj4gKwo+ICsJICBJdCBs
YXJnZWx5IGNvbnRhaW5zIGNvZGUgdXNpbmcgcHJvcHJpZXRhcnkgQVBJcyB0byBpbnRlcmZhY2UK
PiArCSAgdG8gdGhlIFZpZGVvQ29yZSBmaXJtd2FyZS4gSXQgaGFzIHNpbmNlIG1vdmVkIHRvIHN0
YW5kYXJkCj4gKwkgIGxpbnV4IEFQSXMuCj4gKwo+ICsJICBWNEwyLCBEUk0vS01TIGFuZCBNZXNh
IGFyZSB0aGUgQVBJcyB5b3Ugc2hvdWxkIGJlIHVzaW5nLgo+ICsKPiArCSAgVGhlIGZldyB1c2Vm
dWwgdG9vbHMgZnJvbSBoZXJlIChkdG92ZXJsYXksIGR0bWVyZ2UsCj4gKwkgIHZjbWFpbGJveCwg
dmNnZW5jbWQpIGhhdmUgYmVlbiBtb3ZlZCB0byB0aGUgcGFja2FnZSBycGktdXRpbHMuCj4gKwo+
ICAJICBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvCj4gIAo+ICBpZiBC
UjJfUEFDS0FHRV9SUElfVVNFUkxBTkQgJiYgQlIyX2FybQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
