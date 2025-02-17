Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881C3C021A4
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 02:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F413A81E86;
	Mon, 17 Feb 2025 02:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRjvrGaBT2tc; Mon, 17 Feb 2025 02:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E355A81E6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E355A81E6A;
	Mon, 17 Feb 2025 02:39:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA49CC8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C9A4098E
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcBHETHxV8rL for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 02:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA61440904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA61440904
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA61440904
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:39:00 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e479e529ebcso2864924276.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 18:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739759939; x=1740364739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lAnpLIGM+emmAGB0K72TEKIm7h56Sp5KgdKNz0N0ZIk=;
 b=dTdmddRpH8O1fBv0qfmpbc7QT4Sd8qVAAhDWzQW0lV5QI/FBfAtd7RmeO/67nO1mSa
 HABQ9KNhdpMpek1G6I3GpnuSVM4yDjyBCLZyYgdyYAfG0G9RnYBwowsNrLZYL/isB6Cr
 sGEmu0SLW1OejpQMN/6vUpTt9o68/aeLLtkk/zT+M++fvjO0KVL+dmYZB2z4Y4YJI9ku
 Kq3XbC/2V9crjzbFQCMx1tM84BJAZRVs8PNLZGlZZAYfHHTIw3bX6olV2QV0IOOD5rd4
 nNMpUr2sMF6TnLf0+8CxunDbhd7KedkyL3iaaO8L94NO6PbHZ3fTc9f60vlcTFrufTk3
 xjrg==
X-Gm-Message-State: AOJu0YyKyt/62UNTcQcUwlj3NyYH1TGP+O8aLwvMcF9l0H0f5UjtTxrc
 QUmtKpf55mHYsUUWyL9QS8WEBprxdrhMMV/eO1AwtW4KDxwisSbL6IatQA==
X-Gm-Gg: ASbGncuqWR0wVeWolQcva7PKXAO8MtOpiPryl/+HIbVLTLT+HdNHUb/HC/Bo29z6nKY
 Gf3QJ0tEt7UTUDOJH/imdGBG6sPuBWz6YvDUvQsiryD1iMyTRBzdu5unBCmhT4Tab3OU0dv7yeu
 xZZ2daPQy7MZ0CxsEyFEmBtkJw48zr+zcGquP+OL/U3edUE/09fd0OeFFAWhuedJYHbh/vPgNbM
 bSFw33v69JmnV33kbk1viRh7B2oSyJIU/aO23Wna3lhmmMeAd7y3fhu30OOffqvRb6ru6fa6xQB
 +zcdKmg2V0hb
X-Google-Smtp-Source: AGHT+IGqQ3ECi6UwP0c2SHzChqdnpwRCYWL/zNNnBTXO6z+gFhgfAw1V6fDRmZssYH961MS3fKkkBQ==
X-Received: by 2002:a05:6902:3483:b0:e5a:e39d:c294 with SMTP id
 3f1490d57ef6-e5dc8f65e6amr4914202276.0.1739759939119; 
 Sun, 16 Feb 2025 18:38:59 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5dae0da261sm2432739276.37.2025.02.16.18.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 18:38:58 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 10:38:31 +0800
Message-ID: <20250217023835.349770-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739759939; x=1740364739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lAnpLIGM+emmAGB0K72TEKIm7h56Sp5KgdKNz0N0ZIk=;
 b=aSgxl8s9T94EsKmib86rRsAaeTje3x/hM757C1rval9JbP7RPxXySFBYwfRnLrfdZ5
 WVw9mKDIuBMebo0bxSEjdo/+EVgYttT4bwJd3l80G194KUBIjMYPMfikYD968SM0xUmz
 wu0B5hnzKT2TEMHkxeTnBHOO1HydJ+kECpoc+uN+OPe/FYnnejLgVneWksLnoqwGb3Ol
 fitYFIa5+oZBbfZ8lxfrCsATkQlEv8pWL3UYWh2B6hRgTIYJfaIC1PmyLpJ6h+eX2hRJ
 2l5T2i5c2eEyy9MgC2v1FFlVG8XupUE+zK9qHcG2dx/vZ5drODPoPjTjBkA+gitsOFNy
 CLQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aSgxl8s9
Subject: [Buildroot] [PATCH 1/2] package/sqlite: fix configure options for
 readline/editline support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGF1dG9zZXR1cCBzY3JpcHQgd2lsbCBza2lwIGNoZWNraW5nIGZvciByZWFkbGluZS5oIHdo
ZW4gY3Jvc3MtY29tcGlsaW5nLAp3aGljaCB3aWxsIGNhdXNlIGxpbmUtZWRpdGluZyBzdXBwb3J0
IGZvciB0aGUgc3FsaXRlMyBzaGVsbCB0byBhbHdheXMgYmUgIm5vbmUiLgoKSW4gdGhpcyBjYXNl
LCBpZiB0aGUgLS1lZGl0bGluZSBvcHRpb24gaXMgcHJvdmlkZWQsIGFuIGVycm9yIHdpbGwgYmUg
cmVwb3J0ZWQ6CkVSUk9SOiBFeHBsaWNpdCAtLWVkaXRsaW5lIGZhaWxlZCB0byBmaW5kIGEgbWF0
Y2hpbmcgbGlicmFyeS4KCkhvd2V2ZXIsIHdlIGNhbiBlbmFibGUgcmVhZGxpbmUgb3IgZWRpdGxp
bmUgc3VwcG9ydCBieSBzcGVjaWZ5aW5nIHRoZSBDRkxBR1MKYW5kIExERkxBR1MgdmFsdWVzIOKA
i+KAi2luc3RlYWQgb2YgaGF2aW5nIGl0IGhhbmRsZWQgYXV0b21hdGljYWxseSBieSB0aGUKYXV0
b3NldHVwIGNvbmZpZ3VyZSBzY3JpcHQuCgpJbiBhZGRpdGlvbiwgdGhlIGxpYmVkaXQgcGFja2Fn
ZSBhY3R1YWxseSBkZXBlbmRzIG9uIHRoZSBuY3Vyc2VzIHBhY2thZ2UsCmp1c3QgbGlrZSB0aGUg
cmVhZGxpbmUgcGFja2FnZS4gU28gd2hlbiB1c2luZyB0aGUgbGliZWRpdCBwYWNrYWdlLAphbHNv
IGFkZCB0aGUgbmN1cnNlcyBkZXBlbmRlbmN5LgoKVGVzdGVkLWJ5OiBXYWxkZW1hciBCcm9ka29y
YiA8d2J4QG9wZW5hZGsub3JnPgpTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZhbmNwMjAwN0Bn
bWFpbC5jb20+CgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIHVzZSB0aGUgQ0ZMQUdTIGFuZCBM
REZMQUdTIHZhbHVlcyBpbnN0ZWFkIG9mIGF1dG9zZXR1cCBjb25maWd1cmUgb3B0aW9ucwogIC0g
dXBkYXRlIGNvbW1pdCBtZXNzYWdlCgpDaGFuZ2VzIHYyIC0+IHYzOgogIC0gYWRkIFRlc3RlZC1i
eSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKLS0tCiBwYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsgfCAx
MSArKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsgYi9wYWNrYWdlL3Nx
bGl0ZS9zcWxpdGUubWsKaW5kZXggNWE4YjAzM2NlMC4uMjU1ZGRjOTM3YiAxMDA2NDQKLS0tIGEv
cGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rCisrKyBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tawpA
QCAtNDQsOSArNDQsMTIgQEAgZW5kaWYKIAogaWZlcSAoJChCUjJfUEFDS0FHRV9OQ1VSU0VTKSQo
QlIyX1BBQ0tBR0VfUkVBRExJTkUpLHl5KQogU1FMSVRFX0RFUEVOREVOQ0lFUyArPSBuY3Vyc2Vz
IHJlYWRsaW5lCi1lbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCRURJVCkseSkKLVNRTElURV9E
RVBFTkRFTkNJRVMgKz0gbGliZWRpdAotU1FMSVRFX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtcmVh
ZGxpbmUgLS1lZGl0bGluZQorU1FMSVRFX0NGTEFHUyAgKz0gLURIQVZFX1JFQURMSU5FPTEKK1NR
TElURV9MREZMQUdTICs9IC1scmVhZGxpbmUgLWxuY3Vyc2VzCitlbHNlIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfTkNVUlNFUykkKEJSMl9QQUNLQUdFX0xJQkVESVQpLHl5KQorU1FMSVRFX0RFUEVOREVO
Q0lFUyArPSBuY3Vyc2VzIGxpYmVkaXQKK1NRTElURV9DRkxBR1MgICs9IC1ESEFWRV9FRElUTElO
RT0xCitTUUxJVEVfTERGTEFHUyArPSAtbGVkaXQgLWxuY3Vyc2VzCiBlbHNlCiBTUUxJVEVfQ09O
Rl9PUFRTICs9IC0tZGlzYWJsZS1yZWFkbGluZQogZW5kaWYKQEAgLTU5LDcgKzYyLDcgQEAgaWZl
cSAoJChCUjJfUEFDS0FHRV9TUUxJVEVfRU5BQkxFX0pTT04xKSwpCiBTUUxJVEVfQ09ORl9PUFRT
ICs9IC0tZGlzYWJsZS1qc29uCiBlbmRpZgogCi1TUUxJVEVfQ09ORl9FTlYgPSBDRkxBR1M9IiQo
U1FMSVRFX0NGTEFHUykiCitTUUxJVEVfQ09ORl9FTlYgPSBDRkxBR1M9IiQoU1FMSVRFX0NGTEFH
UykiIExERkxBR1M9IiQoU1FMSVRFX0xERkxBR1MpIgogCiBkZWZpbmUgU1FMSVRFX0NPTkZJR1VS
RV9DTURTCiAJKGNkICQoQEQpOyAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChTUUxJVEVfQ09O
Rl9FTlYpIC4vY29uZmlndXJlIFwKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
