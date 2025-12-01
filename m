Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62378D116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 14:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2231940B1F;
	Mon,  1 Dec 2025 14:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZFaHPZXV_9a; Mon,  1 Dec 2025 14:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CF1640B29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF1640B29;
	Mon,  1 Dec 2025 14:48:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 060CA1A9
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6E440B1F
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bX0TzqYHIPUu for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 14:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F09C640B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09C640B1B
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F09C640B1B
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:26 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-37a2dced861so43281071fa.1
 for <buildroot@buildroot.org>; Mon, 01 Dec 2025 06:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764600504; x=1765205304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6xS68IEIDDpzIqq5xujwNBdbKK5SGaLl2nkWhWZ9zI=;
 b=vuBIU4EdW12q0U5IICcnEhUYSigakW6vOGcNAZj5rc4QrS+tgqG/komxHNVlWkswgW
 4yzAwHYXvILIeg1BqGsy9JH5qC2N5pHY9c5PnSgeWie5DQf8xf1HnygiYReLIauOqXSQ
 IQWRooOXkBEoGUxK+mussOCHitE3V9T5kMdMNSTPAD9SlVF2D8MV8Nydofw2LecgicVW
 uHveuVElFp+artTfZeDp+vYTLlChRmVCLub4g/cKpZs5j7DTYFn/6YqBtyo2U3H1KBPx
 hqxFSDmzldBdAnzltzJ9ZIzT4w43Jn9zzkAmmKIkodirGqXdAhv5lFjobqkE8N4thYr0
 AFvg==
X-Gm-Message-State: AOJu0YwAPRqvU1BbTXX1qWn/JdaF3Lrb4KOBt49pjo1PhVDUgZZ7MYpj
 Jb+DtfXywoAF2J7BgbItu/7Rht2u4GD+xZxZGbvVxWi6AxViZxlLva2h7kzOPQ==
X-Gm-Gg: ASbGncvzxiFObeXsyMo0fMKv/KmzvofKlmMXT9YvTGcY+G7iOhi1F0n6bcnPywCJih4
 9itdY/Zgs12PD54+PcPT7ZR5stRvE213o0/BdUaGXI8yFR3p3BKo+CUDtWBbmcoU88zvBQWwK9h
 jAH1Zu0urke44iMbjffdkvLlZmBqG82JGU1vIVzSwyZk0YOlp0iDupqG/TbyXkuPDKdSgwyUGP+
 65ZVD5YofVwk0xvHt/PrL2u67mlJlFUXyVheb3xU0WCq7w0+X25hahRb65FNJS5jU5NE6beFwSQ
 T55lB7PkF5XOsJvkjYnLjC16yb8ZTt8FY/T0pypEh2ZxOrYux6xPQpVs/GFX7mnM+nOk8JwLMon
 co9/MD0q9LRfi2Z+t8S4lt7Dl++OiOkAia/DR5MJUug7vUTG+1ionqMtR6ZggVHcltP59Wr0bqb
 uEwzk=
X-Google-Smtp-Source: AGHT+IHZyoqlZZLhZEmhjhCo/YXyoIomFduzEfxrsnpFQYXKNDqsiPaKSA0sUtnTjUeQCr4pFTxeAg==
X-Received: by 2002:a2e:8593:0:b0:378:d020:b6b3 with SMTP id
 38308e7fff4ca-37cc82c05fcmr128229501fa.7.1764600504180; 
 Mon, 01 Dec 2025 06:48:24 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:3ef2:5482:bc9d:e21b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37d2368e543sm28487831fa.7.2025.12.01.06.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 06:48:23 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon,  1 Dec 2025 15:48:17 +0100
Message-ID: <20251201144819.193967-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764600504; x=1765205304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=E6xS68IEIDDpzIqq5xujwNBdbKK5SGaLl2nkWhWZ9zI=;
 b=E/qTvdXdwiW8EQ+E9+ekqRm2eGUCft5oyLGcsREGvM2WeZqMEi6VNa6Fymu7DJfLqH
 c5EBEG6Of52xHzTTlSPE8UzvRFaqa5HoVKVs6Ld3N/CkiY5Hkxj6f4ni4S/pssWuSrNr
 Dywe9MOLpXMNWc7DL7ZoBT8hdUMXIIEl06d0LZNMfGa9ZDHtCpIgee7Jvvgg9FVEOkC8
 EQapxhvg9h1r6Mu0j4CAF5ARHi1twEiHMC3l0h/8N5jTpNt/lqN840lTgbreQNnRSAhn
 qZ9zheRPaY2fHbj+gdYUG4C6XVGuIORag6r7NBj1I3+1lwbAj8puYRKUREk5xvyx5Egt
 z5tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E/qTvdXd
Subject: [Buildroot] [PATCH 0/2] package/frr: bump to 10.5.0
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

VGhpcyBzZXJpZXMgdXBkYXRlcyBGUlJvdXRpbmcgdG8gdmVyc2lvbiAxMC41LjAgYW5kIGluc3Rh
bGxzIGl0cyBoZWFkZXJzIGludG8gc3RhZ2luZy4KUmVsZWFzZSBub3RlczogaHR0cHM6Ly9naXRo
dWIuY29tL0ZSUm91dGluZy9mcnIvcmVsZWFzZXMvdGFnL2Zyci0xMC41LjAKCkJ1aWxkIHRlc3Rz
OgrigKIgRlJSIDEwLjUuMDogaHR0cHM6Ly9naXRsYWIuY29tL21heGltZS1sZXJveS9idWlsZHJv
b3QvLS9waXBlbGluZXMvMjE4ODY3MjI2NQooMiBmYWlsdXJlcykK4oCiIEZSUiAxMC40LjE6IGh0
dHBzOi8vZ2l0bGFiLmNvbS9tYXhpbWUtbGVyb3kvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzIxODg2
NzIyNjUKClRoZSB0d28gZmFpbHVyZXMgY29ycmVzcG9uZCB0byB0aGUgYm9vdGxpbi1hcmNsZS1o
czM4LXVjbGliYyBhbmQgYm9vdGxpbi14dGVuc2EtdWNsaWJjIGRlZmNvbmZpZ3MsIHdoaWNoIGFs
cmVhZHkgZmFpbGVkIHdpdGggRlJSIDEwLjQuMSwgc28gdGhpcyBidW1wIGludHJvZHVjZXMgbm8g
bmV3IGJyZWFrYWdlLgoKUGF0Y2ggMSBidW1wcyB0aGUgdmVyc2lvbiBhbmQgcmVtb3ZlcyBhbiBv
YnNvbGV0ZSBwYXRjaC4KUGF0Y2ggMiBpbnN0YWxscyBGUlIgaGVhZGVycyBpbnRvIHN0YWdpbmcu
IFRoaXMgaXMgbm93IHN1cHBvcnRlZCB1cHN0cmVhbSBpbiBGUlIgMTAuNSBhbmQgYWxsb3dzIEdy
b3V0IHRvIGNvbXBpbGUgaXRzIEZSUiBkcGxhbmUgcGx1Z2luIGluIEJ1aWxkcm9vdC4gVGhlIHBs
dWdpbiBpcyB1c2VkIHRvIGNvbmZpZ3VyZSBHcm91dCBpbnN0ZWFkIG9mIHRoZSBrZXJuZWwgZm9y
IG5ldHdvcmsgcGFja2V0IHByb2Nlc3NpbmcuIFN1Y2Nlc3NmdWwgdGVzdHMgaGVyZToKaHR0cHM6
Ly9naXRsYWIuY29tL21heGltZS1sZXJveS9idWlsZHJvb3QvLS9waXBlbGluZXMvMjE4OTA4MzM3
OQoKTWF4aW1lIExlcm95ICgyKToKICBwYWNrYWdlL2ZycjogYnVtcCB0byB2ZXJzaW9uIDEwLjUu
MAogIGZycjogaW5zdGFsbCBoZWFkZXJzIG9uIHN0YWdpbmcKCiAuLi5kYXZnLW9wdGlvbmFsLWlu
LWxhdGUtdGltZXItd2FybmluZ3MucGF0Y2ggfCA0OSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNr
YWdlL2Zyci9mcnIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2Fn
ZS9mcnIvZnJyLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIDMgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2Zyci8wMDAxLWxpYi1tYWtlLWdldGxvYWRhdmctb3B0aW9uYWwtaW4tbGF0
ZS10aW1lci13YXJuaW5ncy5wYXRjaAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
