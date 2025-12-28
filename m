Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B08EE9271B
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3384813EB;
	Sun, 28 Dec 2025 18:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ek2Midj6AWi8; Sun, 28 Dec 2025 18:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB588131B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948208;
	bh=v+9GSUaY1bvrfpnfNPEXFKLx13GWLvpBiXwhsTQvs1s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qAVAWTF+5hZwl+XajJuOI9HEfdd4KCZ31zmDi7TS7aizz0bgc4DnQqxtUSKdXCYQg
	 YWlisST/6g+15skTvzWcZw3/ImbZyffu2W5NG8zCD0aaegYCnnpWaWw3geiG7hM4CW
	 T6GJhZIJMewrlV/BXFFyTzNO2E2wYqahjQw+E1lX5xSWfyq2cD38+dEkl6S1qL6vXZ
	 hPSsWHnhmjdrlUh/1UuBB05JF+U76UfuRhpw5DJVSpekJ64rgSTb4/e9FTySAhZIbJ
	 D1uc7pKYbyJ4AgkW4GkrIn6ZkPx//Ja9JhPBc2XRf4I2lcxU3nk8Lita46gjcFmwRQ
	 bOblwinxX/bAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB588131B;
	Sun, 28 Dec 2025 18:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FB361E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C19A80BF7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4k5ZUA6VrKRL for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4A6980C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A6980C1D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4A6980C1D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so790872f8f.3
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948200; x=1767553000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nQPGeF/xql3diCAj/Su6NmLvIljpgAEMziNFJ2fQkc8=;
 b=uB9CggqAKTPb8Y0wpnjRW1vHERlokf6yqe+FTdxXKfSifDpg5a1BGe8f1ejE301n5U
 9bXpAYrdiWUhhXnOYhs2p9c7eYmxbr1rUx7iY5BT/h7ziUdhd2Uvv3//Qv3PaoXNCYiE
 g7hpP+obq+7wdiN7ZkBxRNgzFUhtRU3TkIvo8LghtP6u1SmWbUJeIcMcYGm9ZO48K75f
 1E3Jf6ZPxDyil4XUXZW7yxhCe7pcLwxWNoPGzSuTt1s51/7LGhevtRGhct1hxjDnpXJI
 I4yXrU33SdrCIR47DP7qqG5DIYY3tRNuGbjsH6b018Ij4MCM0rxPcOuKhwEbI4Kp0PsA
 4yxA==
X-Gm-Message-State: AOJu0Yzp1pBRfCafXDGAtn4PVdxEjx9MRPoRZTIE42gfKKKyr6QSHyL9
 AaTWFWh/dtIaEyEjCAbWNu3qBJYGaWhsP05n9VLiEDgQO1AUD6aehkkt0FnBAHhnOmj1MtTQogs
 Rr9sXm4w=
X-Gm-Gg: AY/fxX5cY14XxJve1CRyfGwxGN4lMEHKxgIBjyrnWzt0uzuVYrwPGIZftdsixLwjI04
 dX2a2bFrPSuqfeVibucVCV4ntecfT7GppN6W19ppquEdhI+q5B42rN1j7n+q+6+StvIgKXb/CI1
 m3Z0nsbLkOv9JJs+p85aI0LJKBR1UhO75YYj9oBNJhtrROI34m1ICL8++zAxWCcEXuvuuxt/XKy
 2ZjaZ6+PTXuyczpWjHjGKrcZqkhjhmLgWTKJqzhoqwT223FmHDCmm4O6v9pVeELu9f97oevyrTH
 Ce9AyFMaJVJsQuCP4ChYpD1dj8FPaqVJ6JImZ4Z9zEVW2OE736O8McZArypdZ3EMXKNyIMBPeDH
 ze6NSxqG7VIGs+K9oypVyNmAeBTP5HnF5QtJ+jNhVBBJUsY69PHSwv1hO1/cjbyo0MFMcBqjcUX
 +Nzw1/A4LH3UtzIhh2LGGFMvUqNblkMmM9XAtm+TLUEN+DlVq8vScd1k9nzxSYWAe64mGRBoaN
X-Google-Smtp-Source: AGHT+IH18RzhgwBcQAjvpNCdQUJL4JkRfnF49E5KBjHUjj0KARtYTyblW+CAUa8zPGAM9mf9QqI+Rg==
X-Received: by 2002:a05:6000:2308:b0:431:701:4a22 with SMTP id
 ffacd0b85a97d-4324e4cecfcmr33083455f8f.27.1766948200471; 
 Sun, 28 Dec 2025 10:56:40 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:40 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:28 +0100
Message-ID: <20251228185637.58072-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948200; x=1767553000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQPGeF/xql3diCAj/Su6NmLvIljpgAEMziNFJ2fQkc8=;
 b=OAzoda2TYV0BSL3lUiP00HTWTVEyzNJM9i5t0t+aLoI2Z+shn+Kq7btEw2feCPZcPI
 937ITL0QnySKX0jiPRzgaXjhnP7K3Ij24RbtKoBD1oX1PlWMXk6geLLB6Kjddjt3nPIO
 LlXzZpPmflg2OGZSAGJoheZ9v28BenTkN9mbEHP06NJbfsSfx+lFC4RJZPyFZwvGg4C6
 ewEbAbUUVyrH+Ac28hhAmZb9LOhRGPOTPNABan9T7LKedme3cFBhSdqpeTH4LQ9wyXd6
 z6cjIdSFQ7niRjnIlrwBT/hUSSsEJwg6zACm2W0LsU0lGlGjKI6OGFYBS4vnzSZJzhTa
 8Kyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OAzoda2T
Subject: [Buildroot] [PATCH 03/10] package/mupdf: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The fixes for the CVE-2024-24258 & CVE-2024-24259 were introduced in [1]
and targeted the package libfreeglut.

The patches that fixed CVE-2024-24258 & CVE-2024-24259 in libfreeglut
were removed in Buildroot commit [2]. With this bump the IGNORE_CVES
entries for mupdf were not removed.

[1] 0f4fef076f package/libfreeglut: add upstream security fix for CVE-2024-2425{8, 9}
[2] b1c77090ef package/libfreeglut: bump version to 3.6.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 6b666033eb..9eecb84232 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,12 +21,6 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
-# libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
-# Fix is in libfreeglut, but CVE applied to mupdf.
-MUPDF_IGNORE_CVES = \
-	CVE-2024-24258 \
-	CVE-2024-24259
-
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
