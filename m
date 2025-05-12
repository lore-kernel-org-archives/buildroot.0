Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2171C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F47781B60;
	Mon, 12 May 2025 17:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IKQSSJZm4kY; Mon, 12 May 2025 17:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC03981B6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC03981B6D;
	Mon, 12 May 2025 17:35:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A99717D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF4C4026F
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wINxiwk4PfDg for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42E5C4021A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E5C4021A
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42E5C4021A
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54ea69e9352so6317268e87.2
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071311; x=1747676111;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lz7ztin3EafTxR5SDlsrwRKdvpKX2IE4HbQwyXWDGCQ=;
 b=HO4JyEj8ps2uwQ3PMue2qAZpneRpaS3h3CNd4SZW0Sm557i/nEMQoXP5k1ktlrO/6e
 BqvX5Dt/nsqRfGdm7wgHgoR1klL9ExN3R/9cOfKtBVnshXc23MU6L10wSBKrSNF3/Dpq
 ZdeYHu2rzIfbZD9Lldynfx2M+NWi94GsjmHwmB9Y9qCIwD6On6EwE1c3SrDa11Dyi3Oj
 r1/XsR85ADqkhbWTdFZBm3OQmUQp30l8iU6s+P8VO1E1CZkome+lJrzCQY5Wr7klLcbZ
 Fr1SnHbKFB4xaWSipmPGrB2EOzs6ScAE/HlLmIMqDWMv30/gw9pC4gOiV4aELLtk9nTy
 w9cQ==
X-Gm-Message-State: AOJu0YyTiMRnICWZEFHHDYBgPgrti5jGWQZ28tKW+k6+Lv9te6gLA9hz
 uedowj4Xc8qqHD8775e6jSs4ZAwVVAwZmLm/cXJu2Ly/KvbO05KyCzOiT5OE
X-Gm-Gg: ASbGncvRFgQgRNN/8haxGAg062dy6wLU0mg/Ns24Vndc7zVRerXaFa/uAp/KYuvanwh
 Aez0CHaOxIcNpylEzDLBzekZCGSRFAYnxGJbYkujSy3WmjSpMkwCto+s1SDoKi8IFLH0+BlvqgP
 3WCVhTi21Vlenp6/SssxvvWbTwOshEc01hVq68SSRWjponkGYTBnkHcDMpjOheXyRg0cPJTCSWr
 31yQqnTtl1GiGUDAS2bfyP7Wy489GhB5KYccnLpKtA3rAf34O7a/WF1x0awJ3QiO5U4sab9bwce
 NP3E2W1f94Rz9bEpvagMvhkXtvsUkw9/Bl+4yQkWiHr4YGQ0Mcf7T9wjAiCJqxmLzr6lYAaMl98
 OO8DbGu9uGg==
X-Google-Smtp-Source: AGHT+IGqueRvJ2zTpGqGhNWyIb3Fbb66yOtIa4FUti3UB9KAcybYXv0vZN8isPvuPyezp1xha0bcpQ==
X-Received: by 2002:a05:6512:4408:b0:546:2fde:d2d9 with SMTP id
 2adb3069b0e04-54fc67c93a8mr4275944e87.28.1747071311100; 
 Mon, 12 May 2025 10:35:11 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:10 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:01 +0200
Message-ID: <20250512173506.3179898-2-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512173506.3179898-1-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071311; x=1747676111; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lz7ztin3EafTxR5SDlsrwRKdvpKX2IE4HbQwyXWDGCQ=;
 b=YmKn8ry3Vo907Q9ivfwYYlI4E95EcdAY3KTdGQQtca/lkxopK1GxyZxmYEFl0Qxnz3
 zGlXuwKxfejPDpkqt6vHyWHvAfxIbF2UfcAOuVgNbrV2TDSqLFr5Gezy/THgnu/1D/Hb
 0TqiNnq4me1mJik9YLLpKFZKrVsWi6+ZaHrb0mAs1n+rjrtTkmYyfapPJGqthXb0BdqA
 4RNcd4VdGKSjGO458H0+7Fb+emfnE5jUktIiLwvbdqQffsr5PWXeR3DDojgf/buQDPcl
 FdYj+V27szMh1nxGlhZtvvL0iDxlA3xfKkrperKqE1F/2XPFfnhED8l8bGwXYeeQ0iJ8
 7byw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YmKn8ry3
Subject: [Buildroot] [PATCH v3 1/6] package/sysrepo: bump to version 3.6.11
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgogc2V2ZXJhbCBtb2RlcmF0ZSBvcHRpbWl6YXRpb25zIChAaXJmYW5IYXNsYW5k
ZWQpCiBzZXNzaW9uIHB1c2ggb3BlciBkYXRhIGNhY2hlCiBsb3RzIG9mIG1pbm9yIGJ1Z2ZpeGVz
IGFuZCBpbXByb3ZlbWVudHMKCkRlcGVuZHMgb24gbGlieWFuZyB2My4xMi4yIGh0dHBzOi8vZ2l0
aHViLmNvbS9DRVNORVQvbGlieWFuZy9yZWxlYXNlcy90YWcvdjMuMTIuMgoKU2lnbmVkLW9mZi1i
eTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9zeXNy
ZXBvL3N5c3JlcG8uaGFzaCB8IDIgKy0KIHBhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3N5c3JlcG8vc3lzcmVwby5oYXNoIGIvcGFja2FnZS9zeXNyZXBv
L3N5c3JlcG8uaGFzaAppbmRleCAwNTZmNzA3ODdkLi42NjM3NjllMDhkIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3N5c3JlcG8vc3lzcmVwby5oYXNoCisrKyBiL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBv
Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA0Njdl
ZmVkOGQwZjYyYzI2YTBkMjAwNjAyYjkxMTA5NmViMmQ2Nzg1OGU2MjA5MzdhYjY4Zjk2YjMxNmZh
OWI3ICBzeXNyZXBvLTIuMi4xNTAudGFyLmd6CitzaGEyNTYgIDA3ZmFhMjIwZGQ0MDkzODJhOGE0
ZTJmZDQxMWY5NjFlZjZjMDVjYzFiYjdmNjE2NTc5MDEzODM2NzM0MDMzYzQgIHN5c3JlcG8tMy42
LjExLnRhci5negogc2hhMjU2ICA4OGYxYjdlNWM2NGQyYzExM2UwNzEwNWFhOWMwZmI4MDYzOWI0
MDI4NzU2NWJlMWMyYWZkMDk0OWRmODNkODI2ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdl
L3N5c3JlcG8vc3lzcmVwby5tayBiL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rCmluZGV4IDdm
MjU3MGJkN2QuLmRlNTQ0MWYwMWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBv
Lm1rCisrKyBiL3BhY2thZ2Uvc3lzcmVwby9zeXNyZXBvLm1rCkBAIC00LDcgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotU1lTUkVQT19WRVJTSU9OID0gMi4yLjE1MAorU1lT
UkVQT19WRVJTSU9OID0gMy42LjExCiBTWVNSRVBPX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHN5c3Jl
cG8sc3lzcmVwbyx2JChTWVNSRVBPX1ZFUlNJT04pKQogU1lTUkVQT19JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKIFNZU1JFUE9fTElDRU5TRSA9IEJTRC0zLUNsYXVzZQotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
