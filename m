Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167C1EE0AE9
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 15:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDCB81DB2;
	Sat,  7 Feb 2026 15:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQ0ZmsC4ZbMl; Sat,  7 Feb 2026 15:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD6681AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770478504;
	bh=tH+adyEAYgwYJ4Q3OFPxcKYGUNok5B5KHoSRwV2/tGo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IU0q3PtPKcxvQ026jLbQsD+52bfYIPYO3Sffj+ArTHAeSfowM+r3IWFsUhDJO8Qw2
	 V6lwhpIgqen41IJ1Nj1TWoV31fEUluFT84tLu7UF12vXgMGlzb95JX+gQqMckZDa2z
	 /zLC2pN7MN4DyE1eikERZtUmia3Xug6+1OuGktvTD6RI3io5o4gFTHf6gmu256Paf0
	 H2xriHuqDtRdU6n9l40XEvf/We2TcimpkBsb0jez4AFdRrw3eVhC8wsZ91DUpVF/xP
	 T/FSVKTd+aLf5OdHP1wo7dbnVycmOcWBXk1jg1fn2kVI0jfKZg0Fuq+n4kgCLTTyHN
	 +Pe0Pu+6AGTqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD6681AAB;
	Sat,  7 Feb 2026 15:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E84C7219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 15:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D308C40B17
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 15:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsEva_dO-BUN for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 15:35:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D492340AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D492340AEF
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D492340AEF
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 15:35:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-382fceabddfso25857491fa.1
 for <buildroot@buildroot.org>; Sat, 07 Feb 2026 07:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770478498; x=1771083298;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZxRnPxZ6c3bZAcdEj67lrl5uBG/BKVFGAkACMz1+wxI=;
 b=GK01jDeugF3BhO4vEtoZ8eCruz7lukwR4HWbIjzFYUTsbB9ajNPn6+Q565rsJZAtUK
 T2yKNYnqySgm+tzfoMGX8Yf9kgQJMk/sA3XislAnvfPAAh7cwCtXgk5f1wD9uobA5Xu+
 Cu7sLU17Yt8HtunNHP0cXhCv4bsCAZlf+kESSsyMqwbfvTNvJhvZ9sIRUSEHj/k21ExB
 /y+xP6841H8ny2VPkF+hB25NtqLwHPRrCwSLtDiQLA4LE3KAT0RexqMSreB9jurN9oTd
 IBV9mwdJZ+NIkaTdqkDIseBNVyIgnKUr8QAhWPIMZ1xZXwNIHusnrTfVj1XBjGTjyT9w
 IzRw==
X-Gm-Message-State: AOJu0Yyn1VpNkIC0DuEDzIQrKcGO8xY4qq3EKFrRK/kRkf4GWQlrkJJg
 BT6I5fag1YNApEsM03PEs6kEnSt1qf8M3R8Z2WL0EKHT7m9caiohZ4Puq2mniw==
X-Gm-Gg: AZuq6aLNxLQlrg6s2NffeLWSmg80qVcxUffUBLtrQscIw7jbpuMJ6Df6zyS/tD5ISQ+
 6wPy9iM7nBneXaqWzpQAd1Zjggxl1nHkMzV0ReIbhlKoqpvXV+nAZx3TE/polGNdjp1ld0xj7fJ
 nmcu+akq96K0mLnJ82ByATIXSUQFkjwEh6OwfP+zmF/4Jts8vgXxzMrnck8hTNQg/w7QuxCXoce
 Xk0J5XTP/fKniXdHBBiRwaA9n3N4qexGjxt9AdxStc9gU+kaZAmxdK+zBJzrMFhXd2ml8eTVWgh
 TwTjL/i5S9KnyyLBLR7bwSp2TZxsUHGyTt0osKqoF0hwtB550Pvkvw2wJVbeWs1V9P3+OGcuu+p
 GrRxEmSo/BcuchBlAWxL0VmhjRiv2hD+44Cxc/SBvW6bibOMarMxY6O/sD/3U6+hIHuzSwy53z6
 1PejGkWh5SP+5uTdECG7pSm+8DTHwaX2s=
X-Received: by 2002:a05:651c:4185:b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-386b5144cbbmr15575401fa.37.1770478497611; 
 Sat, 07 Feb 2026 07:34:57 -0800 (PST)
Received: from tollan.. (a254.broadband9.quicknet.se. [194.132.232.254])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386b624d339sm13482311fa.14.2026.02.07.07.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 07:34:57 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat,  7 Feb 2026 16:34:53 +0100
Message-ID: <20260207153453.113393-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770478498; x=1771083298; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxRnPxZ6c3bZAcdEj67lrl5uBG/BKVFGAkACMz1+wxI=;
 b=BEzxwuieAbMMbuAhEULmlfvRUvNwKuxPdEVssUb2MNBJDkpJxEellWXvR4TU3cxXNX
 eIvyfnimdmw0rppQXx0UOAia6y1EZ6xtSPvcQ1gI08vfzsSg1W8v7UyYB9OaUC/Kko8x
 8bgtTGEKB8og8y6PHfJmqtrixOjVoVvlSyu9vGCjgUWqqIn0qxHtdaFvV6qwHfSTC9lP
 Ba4DtcVtcS2n/Lhe1GpB/6fK2TT5PSDlh6ERu+ztSh4gnExAbKZnAb+Y+gaSd6wFsIWz
 q4fShiPGZkiIpFZhwH0fVr0XbS3bKAzjTi9/HRaJbS3FunN7IVT1prcmmAR9sQAqHttD
 Fijg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BEzxwuie
Subject: [Buildroot] [PATCH 1/1] package/frr: add configuration option to
 enable gRPC
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

QWRkIGEgY29uZmlndXJhdGlvbiBvcHRpb24gdG8gY29uZmlndXJlIG1nbXRkIHVzaW5nIGdSUEMu
IFRoaXMgaXMKc3RpbGwgZXhwZXJpbWVudGFsIGFuZCBmYXIgZnJvbSBhbGwgdGhpbmdzIGFyZSBj
b25maWd1cmFibGUgdXNpbmcKZ1JQQyB5ZXQsIGJ1dCBzdGlsbCB1c2VmdWwgaW4gc29tZSB1c2Ut
Y2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWlsLmNv
bT4KLS0tCiBwYWNrYWdlL2Zyci9Db25maWcuaW4gfCAxNiArKysrKysrKysrKysrKysrCiBwYWNr
YWdlL2Zyci9mcnIubWsgICAgfCAgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvQ29uZmlnLmluIGIvcGFja2FnZS9m
cnIvQ29uZmlnLmluCmluZGV4IDZjMjZiNmQyZTEuLjY0MTIwMDVhOTQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvZnJyL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2Zyci9Db25maWcuaW4KQEAgLTU4LDYg
KzU4LDE3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9GUlJfUFJPVE9CVUYKIAkgIEJ1aWxkIEZSUiB3
aXRoIHByb3RvYnVmLWJhc2VkIEJpbmFyeS1GUE0gZXhwb3J0IGFuZCBNTEFHCiAJICBwZWVyIHN5
bmNocm9uaXphdGlvbi4KIAorY29uZmlnIEJSMl9QQUNLQUdFX0ZSUl9HUlBDCisJYm9vbCAiZ1JQ
QyBzdXBwb3J0IgorCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgZ3JwYworCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfUFJPVE9CVUZfQVJDSF9TVVBQT1JUUyAjIGdycGMKKwlkZXBl
bmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggIyBncnBjCisJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9MSUJBQlNFSUxfQ1BQX0FSQ0hfU1VQUE9SVFMgIyBncnBjCisJc2VsZWN0IEJS
Ml9QQUNLQUdFX0ZSUl9QUk9UT0JVRgorCXNlbGVjdCBCUjJfUEFDS0FHRV9HUlBDCisJaGVscAor
CSAgQnVpbGQgRlJSIHdpdGggZ1JQQyBzdXBwb3J0IGZvciBub3J0aGJvdW5kIG1hbmFnZW1lbnQu
CisKIGVuZGlmCiAKIGNvbW1lbnQgImZyciBuZWVkcyBhIHRvb2xjaGFpbiB3LyB0aHJlYWRzLCBk
eW5hbWljIGxpYnJhcnkiCkBAIC02OCwzICs3OSw4IEBAIGNvbW1lbnQgImZyciBuZWVkcyBhIHRv
b2xjaGFpbiB3LyB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnkiCiBjb21tZW50ICJwcm90b2J1ZiBz
dXBwb3J0IGZvciBmcnIgbmVlZHMgYSB0b29sY2hhaW4gdy8gcHJvdG9idWYsIEMrKywgaG9zdCBn
Y2MgPj0gNyIKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUFJPVE9CVUZfQVJDSF9TVVBQ
T1JUUwogCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX0hPU1RfR0ND
X0FUX0xFQVNUXzcKKworY29tbWVudCAiZ3JwYyBzdXBwb3J0IGZvciBmcnIgbmVlZHMgYSB0b29s
Y2hhaW4gdy8gQysrLCBnY2MgPj0gOCIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1BST1RPQlVG
X0FSQ0hfU1VQUE9SVFMKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkFCU0VJTF9DUFBfQVJD
SF9TVVBQT1JUUworCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RP
T0xDSEFJTl9HQ0NfQVRfTEVBU1RfOApkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIv
cGFja2FnZS9mcnIvZnJyLm1rCmluZGV4IDQ4ODY4MzcyNDUuLmUzMWZhNjlhZmIgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvZnJyL2Zyci5taworKysgYi9wYWNrYWdlL2Zyci9mcnIubWsKQEAgLTk3LDYg
Kzk3LDE0IEBAIGVsc2UKIEZSUl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXByb3RvYnVmCiBlbmRp
ZgogCisjIE9wdGlvbmFsIGdSUEMgc3VwcG9ydAoraWZlcSAoJChCUjJfUEFDS0FHRV9GUlJfR1JQ
QykseSkKK0ZSUl9ERVBFTkRFTkNJRVMgKz0gZ3JwYyBob3N0LWdycGMKK0ZSUl9DT05GX09QVFMg
Kz0gLS1lbmFibGUtZ3JwYworZWxzZQorRlJSX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtZ3JwYwor
ZW5kaWYKKwogaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19MSUJBVE9NSUMpLHkpCiBGUlJfQ09O
Rl9FTlYgKz0gTElCUz0tbGF0b21pYwogZW5kaWYKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
