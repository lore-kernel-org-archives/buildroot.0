Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7A2C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AF754031F;
	Wed,  1 May 2024 20:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcvU8QNRCiPO; Wed,  1 May 2024 20:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FAF405E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77FAF405E9;
	Wed,  1 May 2024 20:30:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 574271BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D1B40811
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oN-msskoHIb for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:29:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD36D407D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD36D407D6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD36D407D6
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:29:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa2fso45496615e9.1
 for <buildroot@buildroot.org>; Wed, 01 May 2024 13:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714595397; x=1715200197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pnk3toZM/lQSqJogl1SiszzY+p3CrDDy5aCQZDt+kEo=;
 b=ExOKxLlTuMgieIBdvSYB0CAscxYCnd8Lw0ts2WDvsMyG6usKuI8IbPBXIlOVCkmzRL
 DKEUKuI4leyrDWIX5aC/TzAi614SNsB94EY5/2491QDJnHkAWJ40JH5Pk0zdeD4STJWb
 eb7jSv8H06jvvMpI9E2zSr2/ji2UBK8pChC7mKvPx5Q63BPfdZMm+Qrwz9bZQt8NWQqo
 yWSv76U6kmtk5q+MEVxNSgp/jGVEm9jQvVqQfo8KtuiICyjwW94x+pQ70vX7ukUggcnD
 4mpvRD2eUq77+fRZCE/l9t/KL+UOik5NUbXH4Wv4J7nc6lnJ+UKDo6YVCSK4w6qwoRre
 lbNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNXNq9aoPUV3poCX6j1O1H9jR9X8LYtYnAgk4HEhhOK6bHQ5F+SwVAMv3+MdTLY0mhGsNx16pLGuMjKyrBdEpRVFtlOwp8TQ==
X-Gm-Message-State: AOJu0YziDfz9w4bXDHEU104cvcHidEnsiAjEf0tXBAlLlMVvMOJ73G5G
 wdd9bjObxKNSBD2ThRVBeh1CtX9V00gBN+L4ZaLyq3M5Cv3bVIlrUdWAyx/m+Io=
X-Google-Smtp-Source: AGHT+IH9L/wRyx7hx0Jf0dVWDm4mpsgGdoBGXN0hYvVSU/Jwymmcy999swSzXl32eduYIajfINbnYg==
X-Received: by 2002:a05:600c:3d0a:b0:41b:4d5d:9687 with SMTP id
 bh10-20020a05600c3d0a00b0041b4d5d9687mr2099289wmb.24.1714595396939; 
 Wed, 01 May 2024 13:29:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d434c000000b0034ad657deccsm28208075wrr.71.2024.05.01.13.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 13:29:56 -0700 (PDT)
Message-ID: <5ae27bc5-21b0-41c3-a931-a43678bce93d@smile.fr>
Date: Wed, 1 May 2024 22:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240501120050.670109-1-dario.binacchi@amarulasolutions.com>
 <20240501120050.670109-2-dario.binacchi@amarulasolutions.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240501120050.670109-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714595397; x=1715200197;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pnk3toZM/lQSqJogl1SiszzY+p3CrDDy5aCQZDt+kEo=;
 b=xtb7JlpqzANM7YyojOlV/TlFypkd0dGcRK+Ea2HH+PODQbsimdZ1fQhiU0Zi/fRBNI
 jejhzODTL75q6idwieRIoz7NAH8K6EyASoQwmcC4zH64VnPXz8229sQOf4vgbTrPhkoV
 TdsMoKZ5PTLpT2+S+hASCJU7yXjrPxViXXxH/yWETVbDWCt+xxONshCuVFwtyvCTGh3e
 BEzSftuRjQTESgdhSJsn+05r5/aoaj0XlezHirSXNYi4JPvYNK7w7q/OPA5ybSjp5Fcg
 5MU2mTAZKzUK6mn48x/bvxM2uZN9sRArbfoovgDXIjuvCEflqXmLm0cSzBvG78vMrtO7
 l6xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xtb7Jlpq
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: renumber patch
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDAxLzA1LzIwMjQgw6AgMTQ6MDAsIERhcmlvIEJpbmFjY2hp
IGEgw6ljcml0wqA6Cj4gQ29tbWl0IDNmYTFhZTAwNjgxY2EgKCJwYWNrYWdlL3FlbXU6IGFkZCBv
cHRpb24gdG8gZW5hYmxlIHRyYWNpbmciKQo+IGFkZGVkIGEgcGF0Y2ggd2l0aCBhIHdyb25nIG51
bWJlci4KPiAKPiBUaGUgcGF0Y2ggYWxzbyB1cGRhdGVzIHRoZSB1cHN0cmVhbSB0cmFpbGVyIG9m
IHRoZSByZW51bWJlcmVkIHBhdGNoIHRvCj4gZW5zdXJlIHN1Y2Nlc3NmdWwgY29tcGxldGlvbiBv
ZiB0aGUgYHV0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlYAo+IGNvbW1hbmQgY2hl
Y2tzLgo+IAo+IFRoZSBwYXRjaCBhbHNvIG1vZGlmaWVzIHRoZSB1cHN0cmVhbSB0cmFpbGVyIG9m
IHRoZSByZW51bWJlcmVkIHBhdGNoIHRvCj4gc3VjY2Vzc2Z1bGx5IHBhc3MgdGhlIGNoZWNrcyBv
ZiB0aGUgYHV0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlYAo+IGNvbW1hbmQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+IC0tLQo+ICAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgLi4uMy10cmFjaW5nLWluc3Rh
bGwtdHJhY2UtZXZlbnRzLWZpbGUtb25seS1pZi1uZWNlc3NhcnkucGF0Y2h9IHwgMiArLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICByZW5hbWUg
cGFja2FnZS9xZW11L3swMDA0LXRyYWNpbmctaW5zdGFsbC10cmFjZS1ldmVudHMtZmlsZS1vbmx5
LWlmLW5lY2Vzc2FyeS5wYXRjaCA9PiAwMDAzLXRyYWNpbmctaW5zdGFsbC10cmFjZS1ldmVudHMt
ZmlsZS1vbmx5LWlmLW5lY2Vzc2FyeS5wYXRjaH0gKDkwJSkKPiAKPiBkaWZmIC0tZ2l0IGEvLmNo
ZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiBpbmRleCBjMTZlMTdjYzM1
ZTQuLmU0ZjkxMzlkNjY1YSAxMDA2NDQKPiAtLS0gYS8uY2hlY2twYWNrYWdlaWdub3JlCj4gKysr
IGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+IEBAIC0xMDc1LDYgKzEwNzUsNyBAQCBwYWNrYWdlL3B5
dGhvbjMvMDAzMC1BZGQtYW4tb3B0aW9uLXRvLWRpc2FibGUtdGhlLWJlcmtlbGV5ZGItbW9kdWxl
LnBhdGNoIGxpYl9wYQo+ICBwYWNrYWdlL3B5dGhvbjMvMDAzMS1saWItY3J5cHQtdUNsaWJjLW5n
LWRvZXNuLXQtc2V0LWVycm5vLXdoZW4tZW5jcnlwdGlvLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVh
bQo+ICBwYWNrYWdlL3FlbXUvMDAwMS10ZXN0cy1mcC1tZXNvbi1kb24tdC1idWlsZC1mcC1iZW5j
aC10ZXN0LWlmLWZlbnYuaC1pLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL3Fl
bXUvMDAwMi1zb2Z0bW11LXFlbXUtc2VjY29tcC5jLWFkZC1taXNzaW5nLWhlYWRlci1mb3ItQ0xP
TkVfLnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICtwYWNrYWdlL3FlbXUvMDAwMy10cmFjaW5n
LWluc3RhbGwtdHJhY2UtZXZlbnRzLWZpbGUtb25seS1pZi1uZWNlc3NhcnkucGF0Y2ggbGliX3Bh
dGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UvcWV4dHNlcmlhbHBvcnQvMDAwMS1DcmVhdGUtYS1tYWlu
LWluY2x1ZGUtZmlsZS1RRXh0U2VyaWFsUG9ydC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAg
cGFja2FnZS9xZXh0c2VyaWFscG9ydC8wMDAyLVRlbGwtcW1ha2UtdG8tYWRkLWEtcGtnY29uZmln
LWZpbGUtdG8tZWFzZS11c2FnZS13aXQucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2th
Z2UvcXQ1L3F0NWJhc2UvMDAwMS1xdGJhc2UtRml4LWJ1aWxkLWVycm9yLXdoZW4tdXNpbmctRUdM
LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvMDAw
NC10cmFjaW5nLWluc3RhbGwtdHJhY2UtZXZlbnRzLWZpbGUtb25seS1pZi1uZWNlc3NhcnkucGF0
Y2ggYi9wYWNrYWdlL3FlbXUvMDAwMy10cmFjaW5nLWluc3RhbGwtdHJhY2UtZXZlbnRzLWZpbGUt
b25seS1pZi1uZWNlc3NhcnkucGF0Y2gKPiBzaW1pbGFyaXR5IGluZGV4IDkwJQo+IHJlbmFtZSBm
cm9tIHBhY2thZ2UvcWVtdS8wMDA0LXRyYWNpbmctaW5zdGFsbC10cmFjZS1ldmVudHMtZmlsZS1v
bmx5LWlmLW5lY2Vzc2FyeS5wYXRjaAo+IHJlbmFtZSB0byBwYWNrYWdlL3FlbXUvMDAwMy10cmFj
aW5nLWluc3RhbGwtdHJhY2UtZXZlbnRzLWZpbGUtb25seS1pZi1uZWNlc3NhcnkucGF0Y2gKPiBp
bmRleCAzNmJkYWE0OTc4YWQuLmY5YjgyODY1Y2UxNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Fl
bXUvMDAwNC10cmFjaW5nLWluc3RhbGwtdHJhY2UtZXZlbnRzLWZpbGUtb25seS1pZi1uZWNlc3Nh
cnkucGF0Y2gKPiArKysgYi9wYWNrYWdlL3FlbXUvMDAwMy10cmFjaW5nLWluc3RhbGwtdHJhY2Ut
ZXZlbnRzLWZpbGUtb25seS1pZi1uZWNlc3NhcnkucGF0Y2gKPiBAQCAtNSw3ICs1LDcgQEAgU3Vi
amVjdDogW1BBVENIXSB0cmFjaW5nOiBpbnN0YWxsIHRyYWNlIGV2ZW50cyBmaWxlIG9ubHkgaWYg
bmVjZXNzYXJ5Cj4gIAo+ICBJdCBpcyBub3QgdXNlZnVsIHdoZW4gY29uZmlndXJpbmcgd2l0aCAt
LWVuYWJsZS10cmFjZS1iYWNrZW5kcz1ub3AuCj4gIAo+IC1VcHN0cmVhbTogaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwvcGF0Y2gvMjAyMzA0MDgwMTA0MTAu
MjgxMjYzLTEtY2FzYW50b3NAcmVkaGF0LmNvbS8KPiArW1Vwc3RyZWFtIHN0YXR1czogaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwvcGF0Y2gvMjAyMzA0MDgw
MTA0MTAuMjgxMjYzLTEtY2FzYW50b3NAcmVkaGF0LmNvbS9dCgpTYW1lIGNvbW1lbnQsIHVzZSBV
cHN0cmVhbTogdG8gYXZvaWQgdGhlIGNoZWNrLXBhY2thZ2Ugd2FybmluZy4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgoKPiAgU2lnbmVkLW9mZi1ieTogQ2FybG9zIFNhbnRvcyA8Y2FzYW50b3NAcmVk
aGF0LmNvbT4KPiAgU2lnbmVkLW9mZi1ieTogQ2FybG9zIFNhbnRvcyA8dW5peG1hbmlhQGdtYWls
LmNvbT4KPiAgLS0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
