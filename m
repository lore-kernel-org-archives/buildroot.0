Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0C2C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 09:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB19260A4C;
	Fri, 24 Jan 2025 09:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15mSJ6M0ue_4; Fri, 24 Jan 2025 09:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB6E5607D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6E5607D2;
	Fri, 24 Jan 2025 09:13:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F329794A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B2081CE1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRrKL8RFfbIB for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 09:13:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD61481CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD61481CDC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD61481CDC
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:13:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4363299010dso961925e9.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 01:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737710001; x=1738314801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYucUw7R3SPifbjrOCxzGFh7oRpYkCEAH9H2EeQFh1E=;
 b=PiQa+eIucheaYCCx6LEyBdoRwWENe9zWDF2+97dzwyRxRGZJpJyjnQDHxDF7WTjSuB
 p9+MTJfD0Dc4HGPayUxKO0fUyraJgCdCXtiALX/jqxmoc/I6TxJYfnQLIwGF9VpNs/f8
 TdhmRx32Kj+iyrIBRHwDFljwqQ74zMwgt3jBleYw7bgSydC6M60qqqKpsoZMk1Qsp8E/
 TnmVCkifn9AP/5F6t6cKZdbByqLaWExVsQU2c1WO33cp6tDEwWI4SXyCa52YJhD591K1
 Xxf1ni0Lfd/rvgsgjzOZ71W5lAkgblzna02vKe7A+AXpOn8k4XBcrDT77ANbV9Iklf+V
 oBsQ==
X-Gm-Message-State: AOJu0YxNYSIjf8v9F/sGci3H0LsP9h8LHRnoxQmzrVC7pawVbd+yJEI6
 Zatzf2N9SkvlD9VIRrz9A7XfcioI2nkgrE1+mxCqGoqs5p/IaLE3vcXMOpEl
X-Gm-Gg: ASbGncsJu7DKlhIcKsbMfj6VfdfqSR72uA1raz+5pmPHALJxl5J2LG1qtvwCL1nNpCb
 RWpFdZpceI+y18nhIC9kWslcUbR6t6JPkBTbX67qfqu5cOA13wp2OdwVySigLNZOm4pg6S+VKYN
 TAD3nITnMhyadzzyjlec2qhy5MyyTtxs0b5baacJtXrI4oMg1VhbFMIgvHatIUxuTPqvhqPIYP1
 t6dBQfAkNgQ0TgPegK4W39KoJtxOe8brc6ZcXW73CGMk9OBuqFZjKm1B+CvYRLTIjnIrjWW5T5h
 PxUCBZQrdPmB+0k=
X-Google-Smtp-Source: AGHT+IGwwHtBjt2AA5wqIX8gp/8RB2tGJ6SVj24I9FfDO9ZH9EMZf7N35I7UEvaLA+6Tj7vVoK/PBg==
X-Received: by 2002:a05:600c:3b9c:b0:434:a339:ec67 with SMTP id
 5b1f17b1804b1-438926dc167mr102484305e9.3.1737710000636; 
 Fri, 24 Jan 2025 01:13:20 -0800 (PST)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa416sm19836405e9.6.2025.01.24.01.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:13:20 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Fri, 24 Jan 2025 10:13:08 +0100
Message-ID: <20250124091308.1425248-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737710001; x=1738314801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WYucUw7R3SPifbjrOCxzGFh7oRpYkCEAH9H2EeQFh1E=;
 b=Sn/Jt16c/O5KmYePVd1wfraC+ajPZD5qRg9GL4ebmWfUr+C6OzMBnoMCXqtpBgTRQx
 A8ebyPBEQ8MHlIJZUQ/Zv7VHc1H748w/ZrC9Hvljyd9af2mKjKArZCPHo2Im/eF32r7c
 3SHPXlUolQxgyE4LND91XQN+aAAiAPzhv/FzvqQyJaG7E6QUsDz3La7MH45P6XEBs7FB
 fdER7UoZcbRA6uWFOar6aETcHANtZZx6BINvvaosaD/IvhCvYiVwauYFT8lnOnuKqY7+
 OzpLtepEWZM/IEezdu1+N+pLC+p8EOcBZehWromdNNIkLfLx6azLKCGTUIxWppZ+CM6Y
 hGxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sn/Jt16c
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump to 1.13
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

Q2hhbmdlbG9nOiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL3JlbGVhc2VzL3RhZy92MS4x
MwoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5j
b20+Ci0tLQogcGFja2FnZS9yYXVjL3JhdWMuaGFzaCB8IDIgKy0KIHBhY2thZ2UvcmF1Yy9yYXVj
Lm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvcmF1Yy5oYXNoIGIvcGFja2FnZS9yYXVj
L3JhdWMuaGFzaAppbmRleCBmM2FiMGEwYmU5Li5mZjNlMGU3MmU0IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3JhdWMvcmF1Yy5oYXNoCisrKyBiL3BhY2thZ2UvcmF1Yy9yYXVjLmhhc2gKQEAgLTEsMyAr
MSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJl
Ci1zaGEyNTYgIDk2NjgxZTExOWFmOGI2YjliYjMwZTg1NmE4MzFlNWE1YjMyOTJlOWE1OTU5ZDI2
ZmZhMjc0YjUxMzViYzUwMzEgIHJhdWMtMS4xMi50YXIueHoKK3NoYTI1NiAgMWRkYjIxOGE1ZDcx
M2M4ZGJkNmUwNGQ1NTAxZDk2NjI5ZjFjOGUyNTIxNTc2ZmJkOWU3NzUxZWRiN2RhMTEzZSAgcmF1
Yy0xLjEzLnRhci54egogc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2
Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3JhdWMvcmF1Yy5tayBiL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCmluZGV4IDQ3NWFlZTVkODku
LjkyZjU4YzYxMzkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmF1Yy9yYXVjLm1rCisrKyBiL3BhY2th
Z2UvcmF1Yy9yYXVjLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotUkFVQ19WRVJTSU9OID0gMS4xMgorUkFVQ19WRVJTSU9OID0gMS4xMwogUkFVQ19TSVRF
ID0gaHR0cHM6Ly9naXRodWIuY29tL3JhdWMvcmF1Yy9yZWxlYXNlcy9kb3dubG9hZC92JChSQVVD
X1ZFUlNJT04pCiBSQVVDX1NPVVJDRSA9IHJhdWMtJChSQVVDX1ZFUlNJT04pLnRhci54egogUkFV
Q19MSUNFTlNFID0gTEdQTC0yLjEKLS0gCjIuNDguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
