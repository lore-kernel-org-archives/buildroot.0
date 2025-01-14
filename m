Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A15C02180
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 01:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D031A811A2;
	Tue, 14 Jan 2025 01:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saVhjdzgb4Ys; Tue, 14 Jan 2025 01:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B95811A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B95811A4;
	Tue, 14 Jan 2025 01:34:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D78BDB89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A60408EA
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5UVTvE-a8K7 for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 01:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A92404054B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92404054B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92404054B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 01:34:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436202dd730so35218625e9.2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 17:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736818495; x=1737423295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LWn01cG97HOPNLk6exsgxybZFyHIIXLvpl8JsZgIU84=;
 b=iO+5G+otqmqSK/QH+4nPQcze7gGAMxFut5GaX55QtjrHSAROzqfLWCBiXoXCYjKMGu
 oURd2DIvBFw2RuRacQCaUNbLGE/C4GEYsCcTJHj4kBEw8cc3qZaSJ8qgB/yGxSdcTB7/
 wZsq8YESZhxm92PVR01VWmfL6ShtgiHCSubsxJC79SQKDAyw/29AVg+b0g7tsHD4rlrs
 7UA8VA8OlB++LFTyFMRi9WRANvbFh9JM6tfbZm9tckwxBlTAwC9sQGLgANkIP4riyBfx
 MBC3y513zQ/kvHoQN9+UeHwQnMwYvJpXdj0f2or4DFtQXfnP8aHcmKjfbocs4b+YWXB7
 qV6Q==
X-Gm-Message-State: AOJu0YzA0T/VArbDSEP+xprpil1/mpRWx9Z7SZJYE8MFe38jqA4Xxmvh
 8lms5YZlNXf37S2hzJdnr448OHPE3A2kenWTU4ohysQ7ehtD8dAf0hPXiQ==
X-Gm-Gg: ASbGncv8A11R3JylsInsGRtxqUp7MDuPi6Wopl6bGlgMMTCNZCqvh3wvqXViQbwILeT
 gY7daKUzR3ycLyap7D8Zib+3VxJIy6z7JB4zDwWBfX4+Dn1V6byOkZNyqc/9PM9VjxyakX2VAAU
 gizo0oGeUA+9uzcJxTqVPYiKb99H2Ho5uS0HFVCdTUcaRjY/FOx8NdV84eL/EgWadelRwT3DlN1
 rIycib4YOhDGdXky5JiXeaflTCCMxaSxA/YFr3OsOuEpO9hdYlxyzUtn9w7V9r3QmC6z+iKHeEd
 nGGgNLqi3Y/ifflLxg==
X-Google-Smtp-Source: AGHT+IGmnBbVV15N0jJK38/YG5SuN+MaSo2OWGWcSgx/XT2QcdyQu9L7DHRmURnasoxtCEJOJXcfow==
X-Received: by 2002:a05:600c:3403:b0:435:b064:7dce with SMTP id
 5b1f17b1804b1-436f5881e7amr109448555e9.18.1736818494375; 
 Mon, 13 Jan 2025 17:34:54 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online ([78.30.18.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38d008sm13811453f8f.59.2025.01.13.17.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 17:34:53 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 14 Jan 2025 02:34:12 +0100
Message-ID: <20250114013411.1772357-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736818495; x=1737423295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LWn01cG97HOPNLk6exsgxybZFyHIIXLvpl8JsZgIU84=;
 b=kXnQWytt+yKA3RNBTMUbVqtzZyqzfItN0qaLFYduYdkbiPVLH1KWNyqAbgxOqDzCaC
 kvD9adUmnJPzcOgSGJjUSw28YIirNmk40f80qEZHfA500KVEpC2yNFjV5yaO+OtezuLB
 Sxxc2aJ7BrbDaG8MfrrG5EXuvxQNOcjrHse5Ei017kgdCrEWsvGJmU+pU/18Z9pGgVuH
 QpTVWL2pcrUGlAwB+8su6e5rRpzgWJU3zHv1uQRaWwF3gL7elozvw0t0i+wdAAwoTQdf
 0pYsPrdKj2XfxVw2JOU9l6Hno9PGJklMZcMSTEff4PGtNhwBzJM9i9QZGUjYA7Zyj13N
 /Ccw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kXnQWytt
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.0
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

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2Uv
emZzL3pmcy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdl
L3pmcy96ZnMuaGFzaAppbmRleCBjZTFlMDEwZDZkLi4xODRjZTI3YjBiIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9wYWNrYWdlL3pmcy96ZnMuaGFzaApAQCAtMSw1ICsx
LDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93
bmxvYWQvemZzLTIuMi43L3pmcy0yLjIuNy5zaGEyNTYuYXNjCi1zaGEyNTYgIGIyYjhlM2JmYWJm
MmE2NDA3YTAxMzIyNDM3MjZjYjY3NjI1NDdhNWJkMDk1YjFiMWYzN2VhZjJhOWQ4Zjc2NzIgIHpm
cy0yLjIuNy50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvZG93bmxvYWQvemZzLTIuMy4wL3pmcy0yLjMuMC5zaGEyNTYuYXNjCitzaGEyNTYgIDZl
ODc4N2VhYjU1ZjI0YzZiOWMzMTdmM2ZlOWIwZGE5YTY2NWViMzRjMzFkZjg4ZmYzNjhkOWE5MmU5
MzU2YTYgIHpmcy0yLjMuMC50YXIuZ3oKIAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgogc2hh
MjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1
ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9w
YWNrYWdlL3pmcy96ZnMubWsKaW5kZXggYjg2MjE0ZTc1MS4uNGJiMzJjMmFlOSAxMDA2NDQKLS0t
IGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2UvemZzL3pmcy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVpGU19WRVJTSU9OID0gMi4yLjcK
K1pGU19WRVJTSU9OID0gMi4zLjAKIFpGU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56
ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQogWkZTX1NFTElOVVhf
TU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0tIAoyLjQ4LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
