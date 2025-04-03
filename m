Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6C7C3601A
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 14:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F9B607A0;
	Thu,  3 Apr 2025 14:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7P9xd6r6K2q; Thu,  3 Apr 2025 14:15:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385DB60B0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385DB60B0E;
	Thu,  3 Apr 2025 14:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA76B1F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCBE540CB9
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7UOKC19iTLg for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 14:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1119540C2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1119540C2B
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1119540C2B
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:15:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso7211445e9.2
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743689747; x=1744294547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNyIST87hSmbuEVezJEAzjGavNKryEH7zfh2i42BQLQ=;
 b=GK0BrNcUs5XK/H2of9KBy0qWBsXrR+/A6+ydcjgfJ7H+diOW4VNttcIzFxZJX1V5JR
 P12Do/ZmJw2CjokRYbf7GE3c7p5oL5rHoHiZ9xt0nCU0IHIx24JHvJnhn98T3MatTucV
 SHyfv7n6A3nJg9PZ7j2NZwNw+CUt/f9+Eom6RHwc5JlgsgjJnOv77arZdq2tvzrkiF3P
 +NwfBTBXwhbP02O7C3MDsUmyJ8ZHnN8mMDnrdQlaZMMG2wQRBwWqKu2bl/lqCwxnFW60
 8Sws1VMglmHgJ4EHHQAWMEqICcCHRMjLgP0LOSe10CdsKZHSVCH0Ys8s1LOyhlsvZBdR
 0a+g==
X-Gm-Message-State: AOJu0YxUuhDfAAcH8h6JoEDooXBXc3LnTdPalyvkASXYvDH+CjkMhMoz
 LgpCz+UlQITWoWOuHTbIwWk2cr+ZB200HtR0JyGWSXfqTB5BD94asMxwSj48Y2sGvQgEwtDGfXW
 8
X-Gm-Gg: ASbGncttSKhMWBRRacoHtxIRyUrJ9mzSEYoDEt081Xr37sfs8nlC28gXTw1Bg7GhAa5
 u00EnSw0oNnAsiu9heZZqoWT74D3Ze70AYX9vrhOVJP95wI84DtM26inXBq18pQBm3AD72fCo2v
 Uu0QfCfGz05dC/Caz6OMyqRngJJgrvGVwKqmTt6jTK9ZFaRn9cQbu/ECnhqhbbJMsaFcaL+93Hk
 F7BElAQ2lPzLrtWGUVFUzTyquRLHX2D+ILBnHkiDS0jLuJeV9nuD2U1FriAIZcT8l1b2GxblZrc
 mVGMva8V8rC8Ck/slN61LgpRr3uEZDwtEFQGVVOJrIrhaZ7utWXYEEfO4wKI4DWpDZnksqe5WJ7
 1teNTrXGX2Kxw7CYOmxV4TDCuADxnpOvMQfP5jkUe5d1gzBeUIg==
X-Google-Smtp-Source: AGHT+IHX1ry1OxRJsEBOsdLrlP9m05Ntvr+ZsjAYp/GZwNoCPw7xXdYDPzADKl7Uj519OlUA2AWqFw==
X-Received: by 2002:a05:600c:4f8a:b0:43d:412e:8a81 with SMTP id
 5b1f17b1804b1-43eb5cd2d2dmr52740135e9.28.1743689747548; 
 Thu, 03 Apr 2025 07:15:47 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660bcesm23013605e9.10.2025.04.03.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:15:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Apr 2025 16:15:36 +0200
Message-ID: <20250403141538.3769560-2-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
References: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1743689747; x=1744294547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNyIST87hSmbuEVezJEAzjGavNKryEH7zfh2i42BQLQ=;
 b=oaPSEzuJVD/f/nDjS6/4Mh1DhiPOh1TUIyCrr1XE5jOeUHt7KdOLbMWLMtpyt0odck
 U8q5glW2fGB4694/KNYUUBkapwdKNHiX6n+CgyDvfs/9CgyZkk9FSOJqPhl33NMOwps5
 /pjHKBkZv3bW/zwPueyZB1omJjIvQjmztQbD4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=oaPSEzuJ
Subject: [Buildroot] [PATCH 2/4] package/pkg-download: switch from cargo2 to
 cargo3
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RhcnRpbmcgZnJvbSBydXN0IDEuODQuMCAoY2FyZ28gMS44NC4wKSwgcHVibGlzaGVkIGNyYXRl
cyBub3cgYWx3YXlzCmluY2x1ZGUgYSBDYXJnby5sb2NrIGZpbGUuIE9yaWdpbmFsbHkgaXQgd2Fz
IG9ubHkgaW5jbHVkZWQgZm9yIHBhY2thZ2VzCnRoYXQgaGF2ZSBleGVjdXRhYmxlcyBvciBleGFt
cGxlcyBmb3IgdXNlIHdpdGggY2FyZ28gaW5zdGFsbC4gc2VlIFsxXQoKVGhpcyBiZWhhdmlvdXIg
Y2hhbmdlIGFsdGVycyB0aGUgY29udGVudHMgb2YgdGhlIC50YXIuZ3ogYXJjaGl2ZXMsCndoaWNo
IGNhdXNlcyBTSEEyNTYgaGFzaCBtaXN0bWF0Y2hlcyB3aGVuIHRyeWluZyB0byBidWlsZCBSdXN0
IHBhY2thZ2VzLgoKRXhhbXBsZSBidWlsZCBmYWlsdXJlIHdpdGggYmF0LTAuMjQuMDoKCkVSUk9S
OiB3aGlsZSBjaGVja2luZyBoYXNoZXMgZnJvbSBwYWNrYWdlL2JhdC9iYXQuaGFzaApFUlJPUjog
YmF0LTAuMjQuMC1jYXJnbzIudGFyLmd6IGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoKRVJST1I6IGV4
cGVjdGVkOiA0NWZjZGQ2MDc2ZGMxYjQ1Njk4YTdiNmMwZjRkMWY1ZDlhZTY3NmYzY2EzYjE1NTQw
MmFkMjQ2ODBkNWI0ZGY2CkVSUk9SOiBnb3QgICAgIDogMjhiMzAyYjFhYTMyNTIyMTc5NmQ0ZWJi
MjViYWNhYjE5YTg5MjdlZjMyZjRkNTZhOTY1YjMyYTdiMWMxMDJmYwoKQWZ0ZXIgdXNpbmcgdGhl
IG5lIGhhc2ggdG8gZG93bmxvYWQgdGhlIG5ldyBhcmNoaXZlIHRhci5neiwgd2UgaGF2ZSB0aGUK
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYXJjaGl2ZSBhbmQgdGhlIG5ldyBvbmUgdXNpbmcg
ZGlmZm9zY29wZToK4pSCIOKUgiAtLXJ3LXItLXItLSAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
IDE1MjkgMjAyMy0xMC0xMSAxNzoxNDoxMi4wMDAwMDAgYmF0LTAuMjQuMC9WRU5ET1IvYmluY29k
ZS8uY2FyZ28tY2hlY2tzdW0uanNvbgrilIIg4pSCICstcnctci0tci0tICAgMCAgICAgICAgMCAg
ICAgICAgMCAgICAgMTYwOSAyMDIzLTEwLTExIDE3OjE0OjEyLjAwMDAwMCBiYXQtMC4yNC4wL1ZF
TkRPUi9iaW5jb2RlLy5jYXJnby1jaGVja3N1bS5qc29uCuKUgiDilIIgKy1ydy1yLS1yLS0gICAw
ICAgICAgICAwICAgICAgICAwICAgICAxNzY2IDIwMjMtMTAtMTEgMTc6MTQ6MTIuMDAwMDAwIGJh
dC0wLjI0LjAvVkVORE9SL2JpbmNvZGUvQ2FyZ28ubG9jawrilIIg4pSCICAtcnctci0tci0tICAg
MCAgICAgICAgMCAgICAgICAgMCAgICAgMTM4OCAyMDIzLTEwLTExIDE3OjE0OjEyLjAwMDAwMCBi
YXQtMC4yNC4wL1ZFTkRPUi9iaW5jb2RlL0NhcmdvLnRvbWwKCldlIGNhbiBzZWUgdGhhdCBDYXJn
by5sb2NrIGhhcyBiZWVuIGFkZGVkLgoKVG8gYXZvaWQgaGFzaCBtaXNtYXRjaCBpc3N1ZXMgYW5k
IHRvIGNsZWFybHkgbWFyayBhcmNoaXZlcyBnZW5lcmF0ZWQKd2l0aCB0aGUgbmV3IENhcmdvIGJl
aGF2aW9yLCB3ZSBtaWdyYXRlIHRoZSBuYW1pbmcgZnJvbSAnY2FyZ28yLnRhci5neicKdG8gJ2Nh
cmdvMy50YXIuZ3onLgoKSSBkaWQgbm90IGZpbmQgYW55IGFsdGVybmF0aXZlIHRvIGRpc2FibGUg
dGhpcyBuZXcgY2FyZ28tcHVibGlzaApiZWhhdmlvciwgc28gdGhpcyBjaGFuZ2UgaXMgbmVjZXNz
YXJ5IHRvIG1ha2UgYnVpbGRzIHJlcHJvZHVjdGlvYmxlCmFnYWluIHdpdGggcmVjZW50IFJ1c3Qg
dmVyc2lvbnMuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jYXJnby9wdWxsLzE0
ODE1Cmh0dHBzOi8vZG9jLnJ1c3QtbGFuZy5vcmcvbmlnaHRseS9jYXJnby9DSEFOR0VMT0cuaHRt
bAoKU2lnbmVkLW9mZi1ieTogRWwgTWVoZGkgWU9VTkVTIDxlbG1laGRpLnlvdW5lc0BzbWlsZS5m
cj4KLS0tCiBwYWNrYWdlL3BrZy1kb3dubG9hZC5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWRv
d25sb2FkLm1rIGIvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKaW5kZXggY2Y1OTU5ZWE5NS4uYmJi
MzUwMTY0MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKKysrIGIvcGFja2Fn
ZS9wa2ctZG93bmxvYWQubWsKQEAgLTEyLDcgKzEyLDcgQEAKIEJSX0ZNVF9WRVJTSU9OX2dpdCA9
IC1naXQ0CiBCUl9GTVRfVkVSU0lPTl9zdm4gPSAtc3ZuNQogQlJfRk1UX1ZFUlNJT05fZ28gPSAt
Z28yCi1CUl9GTVRfVkVSU0lPTl9jYXJnbyA9IC1jYXJnbzIKK0JSX0ZNVF9WRVJTSU9OX2Nhcmdv
ID0gLWNhcmdvMwogCiBETF9XUkFQUEVSID0gc3VwcG9ydC9kb3dubG9hZC9kbC13cmFwcGVyCiAK
LS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
