Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8126FC369CB
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E7281B35;
	Tue, 22 Apr 2025 07:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQyyPl9E6i4e; Tue, 22 Apr 2025 07:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2C381B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2C381B6D;
	Tue, 22 Apr 2025 07:48:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22BA71A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 141C96067F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e74I5_LYlUU for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:48:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F29C660C1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F29C660C1C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F29C660C1C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:48:08 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso35736125e9.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 00:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308087; x=1745912887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNyIST87hSmbuEVezJEAzjGavNKryEH7zfh2i42BQLQ=;
 b=sZwrfiPAPyJp0AIPuYJBG6wg459AAP3eIfXVfTOJCRXtWCqv/ne8X1cr2sjUjU/Uc/
 kNmE2aFOeytv6uyUu0wVhhc3iJhE9NvOUqG1BYGbk4bNkYuskr0cm4w9GbcUu/b3cKKS
 Kgh9pg7U0hjxNvCK7m7H0EEpqoP3WZW3QTxPQ1Otol+8cygKSn0YoXCC/6Jqr6f6UhJv
 uiCAX4rbbOl6LCrgJ8X7Td10l0/jIZmAvoSRD426WiqfSAxs3In6+XGO7aU6BUDciVci
 QymmpQgV3d/ucLlxMLFbPq/ReYTepSz9tczPK5qRvLeN1ANN5ANfJQO51846d2UEWQnW
 bgWQ==
X-Gm-Message-State: AOJu0YzHObFsoX/WjiY5zE+4gSgPGsl8mAv6IdceRa20cbzx5vwgKXQo
 o6yTAu7daPiU/Bs7DWBBJxqSEUSTser83ZFLelgvmY2kJ4mdfEz78SWIcJqmETYNgf4CgK1r91u
 nqjE=
X-Gm-Gg: ASbGncsnw0TNOhI1UHcWyng1Hmr92cB9GsAYJHyTsLsgDoQqVKu7T3hBnYJ9FQw7ab6
 kailvAfTt9njb3TgjnHclK+YMkuG0zoSEqX7pQwyram1ZPNcDyUI0m4xR5u9YDPo65m51mUF4GW
 5lW4+awPXe5Jery/e7rJCEbYyP0jm1/wMWor2H51UsBVd6mOGkFmpCmr3QBz2Bs1I8ChtB9X1hq
 fB6x/8gfMMFvbNptYxxPhorjHyAP3aSzYOdJ5W88/9RQP5itQjVuNw3QjOPFFl3UjLwsPz0KfyS
 9y2jRNn9WZdNqc0eWQxy3jLSgHFjSPf3VeRq9o+5Qjbh6LPYAOuqEA0bO7w6KZETiU4OEDXruN2
 crCZ7/vQQlf7C+KRKwuMtsDw4i4FDEleIe0w=
X-Google-Smtp-Source: AGHT+IGaGWjOpgKl/jqxAHSD6sXsCEhvszmaGNcjEWQBVbuImyvj4roxJS3aP7SzvzTgdV+ZJX3UPA==
X-Received: by 2002:a05:600c:1e88:b0:43d:10c:2f60 with SMTP id
 5b1f17b1804b1-4406ac0a847mr105445895e9.24.1745308086832; 
 Tue, 22 Apr 2025 00:48:06 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbd8asm162913405e9.23.2025.04.22.00.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 00:48:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 09:47:37 +0200
Message-ID: <20250422074738.821755-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422074738.821755-1-elmehdi.younes@smile.fr>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745308087; x=1745912887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNyIST87hSmbuEVezJEAzjGavNKryEH7zfh2i42BQLQ=;
 b=G8Quk8fzOE/pfhmYwaUDKCVuCPU5cqI76PncXHcansJsXq5zkOLY3dj9tTE7LtLL68
 3tI6BIWDywNF9Z5VMy6Hi8bf8PPJOE6+mWPrmEnGEz/nvFKDvHFesGhDdr5p+Ub16m8J
 Go4bqQd7aJe90tsgXpPf9o9HTGZnLBzuQ1tiY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=G8Quk8fz
Subject: [Buildroot] [PATCH 3/4] package/pkg-download: switch from cargo2 to
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
