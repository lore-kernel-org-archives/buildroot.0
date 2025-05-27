Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE5C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 07:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D0A407B8;
	Tue, 27 May 2025 07:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFBT7Fm-G_KO; Tue, 27 May 2025 07:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF050407B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF050407B3;
	Tue, 27 May 2025 07:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E743B66
 for <buildroot@buildroot.org>; Tue, 27 May 2025 07:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2591360A96
 for <buildroot@buildroot.org>; Tue, 27 May 2025 07:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd7ITV7OIeWr for <buildroot@buildroot.org>;
 Tue, 27 May 2025 07:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E6BE60A80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6BE60A80
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6BE60A80
 for <buildroot@buildroot.org>; Tue, 27 May 2025 07:48:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad564b7aea9so806465266b.1
 for <buildroot@buildroot.org>; Tue, 27 May 2025 00:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748332091; x=1748936891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLmmEZlYU+15USq9HYx64Jr4RqIMbikbd1EEzo5xUUM=;
 b=rrhWEiv+iSyL2LUCpN2PrXXPaEaurPxmnXM2iwkOKr90u/TgBsGpMIQWrRrD9Wk5xy
 2H16Up3qp2DmFIlXfu9dsGjycEkwyH/U2UwLINKlhvAVJHmAPNHkxiQzi4BTJFF4XVXP
 PkfSa/98RFh72siB49cO3LSLSol1Kly67FjQIexN1cdDQin4QP0IwgopyJaejP/kcl6f
 3zzvOAZcTDwzVUgYSaYHfnJyMR1KlL4Lp1Qvl0Jh/00lJVWKpS2VASnZAqWarV+E1SlN
 MZ3yFfWC8DYjxvsfEkKtt2mVYzNGrRVEMd0pLOMhdLVROBZJ+MpdNbcHDgP5TvzY1lRm
 HImg==
X-Gm-Message-State: AOJu0Yx+o7VUBN9JMdhmKZy1PIl81Im4P+twT72s0CVCOwuw3vv5JF9q
 0unFzXnz0G/bX+qw2zkZBYaAg2c1KDaV/bKWZnE70ibJ8rgP7xmuz+r1ULfe
X-Gm-Gg: ASbGncugkflMiecy8tIlr3eGj0mSSpZajjCEO9TVClgNYJ05vnqKLnX544Ww32rMaVe
 FJDkxGy+UtDpXVld5leIsS3bMLypxGcXaQLpIJ2iZ4YB5//wqhDvM9rxoLm+7amZd1afvH9/zdb
 OVOVUlVpXyQZ/qeQxXQDQXzPTpj/9tXLAcWrBtTK6I34v3hpgj8uQ8J13/02WoYtANbU0Wa6WkF
 pEDH9aE2FzKAH2q1VyniPqc4RHow+jrvlTQDmGAsnxf0RyvzRuYlorLBT5ZRXEy5IRRDjSYoApC
 /yxiAN0XxNMhSrPMFCsA/v2kTBGHLNSSrPlhJHlHAk+fYreVxbuq4nH14D/Mw7W3zskz5kTGara
 m
X-Google-Smtp-Source: AGHT+IFnupK0XLaEGy8xi6Nyege42qXjQe2IHDJxTJ7Wez4KD1Rhe1gdrXQdcVaQcpM/uYhpOcSqMw==
X-Received: by 2002:a17:906:6a1d:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ad8959cc8eemr32481966b.10.1748332090900; 
 Tue, 27 May 2025 00:48:10 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d047749sm1803199266b.8.2025.05.27.00.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 00:48:10 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 27 May 2025 09:47:34 +0200
Message-ID: <20250527074745.8981-3-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527074745.8981-1-shirokovalexs@gmail.com>
References: <20250527074745.8981-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748332091; x=1748936891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLmmEZlYU+15USq9HYx64Jr4RqIMbikbd1EEzo5xUUM=;
 b=d//kaU4QVQkVrwsbzxgmN1z9fy8zm0cgVLqcpaC3ksf5qCCa5fB7In2RLczEolFiU5
 1YfxsiNCFUKu3vQLuc+oJPNjHEiHBE7FhUYyU41jsLVljICQsOV0Wa+ynz1iHJiSKtL1
 fk0NBbFm5b4pnMeqOvyNQLRGysrmt1jdmB2GJ1X68za5Gy8xapGoMGKnsoHpT71JkN18
 i23syy0rzIpmOFOXFKZ/Q6DA5xuJN97409FPbCCAFmXdBHblPskAv0YGs8IAeoHWEJZk
 C1rO3iM/zokQ+uSPwBc3qAp/9xeGjDGl3QGiSxXDsKYmGzBv/f0HAyvoTcm7cvFDfSiu
 SrJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d//kaU4Q
Subject: [Buildroot] [PATCH v5 3/3] DEVELOPERS: add Alexander Shirokov for
 uutils-coreutils
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

U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFNoaXJva292IDxzaGlyb2tvdmFsZXhzQGdtYWlsLmNv
bT4KLS0tCiBERVZFTE9QRVJTIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBkNDcxYjlhYjZm
Li5mNjk3NzQxMWM0IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAg
LTI5OTUsNiArMjk5NSw5IEBAIEY6CXBhY2thZ2UvbHJ6aXAvCiBOOglTYW0gVm9zcyA8c2FtLnZv
c3NAZ21haWwuY29tPgogRjoJcGFja2FnZS9yaXBncmVwLwogCitOOglBbGV4YW5kZXIgU2hpcm9r
b3YgPHNoaXJva292YWxleHNAZ21haWwuY29tPgorRjoJcGFja2FnZS91dXRpbHMtY29yZXV0aWxz
CisKIE46CVPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
LmNvbT4KIEY6CWJvYXJkL2FybWFkZXVzLwogRjoJY29uZmlncy9hcm1hZGV1cyoKLS0gCjIuNDku
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
