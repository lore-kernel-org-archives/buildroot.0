Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DCAC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 13:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D08B083827;
	Fri,  2 May 2025 13:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEjUInspSHqq; Fri,  2 May 2025 13:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D11783777
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D11783777;
	Fri,  2 May 2025 13:29:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DAC229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3898E61136
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKH_JSLgMT-I for <buildroot@buildroot.org>;
 Fri,  2 May 2025 13:29:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EFF56102F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFF56102F
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EFF56102F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 13:29:40 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-30f30200b51so19776041fa.3
 for <buildroot@buildroot.org>; Fri, 02 May 2025 06:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746192577; x=1746797377;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lz7ztin3EafTxR5SDlsrwRKdvpKX2IE4HbQwyXWDGCQ=;
 b=qil2ORbaMIAsDIu+TMcrKk0veElrLVxPu3Uom/3l6SOlxN5tdODIcIdk6/+YCFoGD9
 NToeHlz46DJr5yPICWZI2y/ImZqw1sE9ja9Dm0I3d1O+qsc7U59aL0eFTBCiz+44sHCT
 kMfrs48J3BNdIBpWf9guYSu6fL7x4R2hJH6qi6dUd5do8nCx+d8QxcwzVIwWVVoog2Ci
 nqojodwnd/utMbFuhnz9fUrBJR8Jy3zZFrtAWYNjYB25krjfiqUHyGJeQXlQ0rKDQ7Eh
 9+eVfg2NIFrstmRxg82M+m44VTqGsj6h5tmzhwIe95wXTGJEUk0Q0a9cX4fCuuV2EKnK
 28ZA==
X-Gm-Message-State: AOJu0YwCnK/Su2QjWVRnCguBfCXDgTcV0JIw0ByE0ZKDySSM7r+1ki3y
 ne3itSyYtMcT5Tp4H+hykvGZsU2FFemLtfwS/e2IucXwWAjhTDUiBPW6goKN
X-Gm-Gg: ASbGnctGpDGKNhainYdSUgIHU4dG7quCkuSgf8B8JvCpIzpOpxR/la0/RLzS9nx1aCI
 h26rSJLBDzqaYWMOdWIXUQkw3wJQRjua+TpTgvHfug6Yc2l9aLMVCMgQzkgmVlt4OO+AeEFhtPt
 cezofsfbKQ+MHcTg5hpVC0Iclt1K2JMpdMYYoJfuIlr/CWK75c4iFdQ32IU7XDAJY+z44RwzLj2
 /UhQAL9W9zQhaNx/itH1hQHbs1S4wL2wF6V7FCXXN+QzSS5Ss4SO5AAqE9Z0+9wwDtXBmd2ww9D
 4cX//IB8j6wwVcgET5oT14In7Hrz1e6wDAOUDONzSTayGNkzLtytp2t/DeWsMK/GC30NB/3B
X-Google-Smtp-Source: AGHT+IHjY8Xnf2CA9xPPJvy82vBlJJjnanElOi1/IC4R4QiwAKWThwBGVyrA9LEE/dH7t9zdKD60hA==
X-Received: by 2002:a2e:a545:0:b0:30a:4428:dead with SMTP id
 38308e7fff4ca-320c5ec9fd3mr8919871fa.27.1746192577040; 
 Fri, 02 May 2025 06:29:37 -0700 (PDT)
Received: from tollan.addiva.ad (b106.broadband9.quicknet.se.
 [194.132.233.106]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202ad8c3fcsm3370691fa.88.2025.05.02.06.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 06:29:36 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Fri,  2 May 2025 15:29:21 +0200
Message-ID: <20250502132924.3775738-2-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502132924.3775738-1-lazzer@gmail.com>
References: <20250502132924.3775738-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746192577; x=1746797377; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lz7ztin3EafTxR5SDlsrwRKdvpKX2IE4HbQwyXWDGCQ=;
 b=Zx8riwDd0xDkQ+z3olecSiBPF4+zH9dida6YEr2MuU7UfShxx3vyU3qsXE3jyRiJzE
 80Q2kdqFstdJkE/ZvzvAwUuvI8IaIEn+dBRmSg97FDC8Wa0kR26avHF0AiNXoO+qHZJH
 ebxxdXwG9JVKwcvjedTwCnl+JneoujjCkXfFiMxfPUAoWt+ry0sXaqNIwXJ2gor149nY
 bZOUX/UoxsEFD0PEYnI3IkYU8RnUaVyGGxbKf3JcyW4MllRQ8u9Zn6jv9NfFqdjUEcct
 Nm7og1Chw1k1Oja+oQnUVhPXgItpUfnlEpS2HotmYI+ILDniJZswLAGb3tgsTt474pbR
 T0kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zx8riwDd
Subject: [Buildroot] [PATCH 1/4] package/sysrepo: bump to version 3.6.11
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
