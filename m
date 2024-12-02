Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A2E69EA0
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 23:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AD86067C;
	Mon,  2 Dec 2024 23:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU6_-XDtYCpJ; Mon,  2 Dec 2024 23:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA38F606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA38F606BE;
	Mon,  2 Dec 2024 23:40:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E697A1DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 21:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D7280B20
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 21:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4GdleOGeLIw for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 21:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6A6380AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6A6380AEF
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6A6380AEF
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 21:57:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso2552749f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 13:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733176658; x=1733781458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itKIn3kpbdGyB63Y4eyIAyLNZvQ14HM38Djy+d4b9EQ=;
 b=NdKWpjPeDBaFFo+xFtDjg62edmEP+cgXb4UkIsTRtFcf4GaupjbD37qZBMjdHszbYf
 Vq97wBaBsmUDGxrtZFeQrUKrXFzHcFTUugk66uJlodP76LuaVKHKPT/3kGcF9fhNH1OC
 zpx2IjzNYk1Lu/DX+CJujIzp7JIHBceSmb7xQebZE/oWh3FufeCHIQnswGt7Y0e7lBpP
 kQBAIMWPOqfoKsp1489vBK5stuKFreSY227llUZAvPC0l+YXMEonpl+SyS797/r/t9hY
 xGrCt38C3YJF7vQDieYvUB71K40LVBZLL0L6+88gGPvLXtHpzHqkjjwwLoFssiUMtOJg
 tfFA==
X-Gm-Message-State: AOJu0Ywl7X3o6UPPG7+G3uyyrHQz/pmM4EQo/pa5FQWstfgy493Gx7wu
 n8qKTr6sbYGei14AbflPZv9ghoyihaCTHRg+nB0g26euWJF3cxTYsLAEzQ==
X-Gm-Gg: ASbGncvGGb+y+UE/DmBRoetlvOA+hWxPTLecIdz1QTz7OwX+OkzR6RSFP7S5OPtZPD+
 OY0ZPUVWecUg8ktS0rK/ztjqqvVYx5u1O6mEphbAhthOSZ5ErH2fZP0KPCmuXBZUuu9f5qb7uXx
 xQoPBcjzfh5MrFgVYOlf2UH1w5aAIIaLaokaokPI+7HRbizNCZeqiTUOVWLkvuv9UARIl1rtqqZ
 K8cwqcZqI7SJ1WTmFvwI1++oxQ6mhyn9Uij3ZZKv055JjEdEk7BOUO1w7t0b2E=
X-Google-Smtp-Source: AGHT+IHhz18Q0LhPBf9PRGqd7P/nEBgI3NQEUdeMpfn8R33APdw89wtBNhiLeFoBOXyBG5cQfAzV2A==
X-Received: by 2002:a05:6000:1f84:b0:382:5141:f631 with SMTP id
 ffacd0b85a97d-385fd3eeb45mr42472f8f.29.1733176657360; 
 Mon, 02 Dec 2024 13:57:37 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7d25c5sm197206955e9.28.2024.12.02.13.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 13:57:36 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  2 Dec 2024 22:57:30 +0100
Message-ID: <20241202215731.409503-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733176658; x=1733781458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=itKIn3kpbdGyB63Y4eyIAyLNZvQ14HM38Djy+d4b9EQ=;
 b=M0ssHj4g3BRBPajWcDXQCIPEzOHEr8u2lYHNxPJFNZdO4n7m4ArpaqCMJ+qFUwLOei
 +stYrveh4zDP+HzS4Exq2lyZMhKM0/ODCANEww4jFD8R7OG55y963Na93U0qwLMc3Z43
 g2hT9Bk3fgM5rwITg+bpULvvW4zi+3xaSn/ua8aMDlda/eCUQQBw1lHXt5Ba4q+cU0UD
 faOxOl0wIe/mGy6/LvwSLmVPNXMShmafB3T5AO9BJcD8lgjPbcTJGzwTh+EzzFn4Kw08
 MBHdAb2ndBnRe8+x04KxYJlHenukLQu2NfNj619j9C+4igavWpcB6nUpk6NdcX7M9Bkl
 sxLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M0ssHj4g
Subject: [Buildroot] [PATCH 1/1] package/libcap: bump version to 2.73
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index dd9bc75a02..ec59f224bb 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f  libcap-2.70.tar.xz
+sha256  6405f6089cf4cdd8c271540cd990654d78dd0b1989b2d9bda20f933a75a795a5  libcap-2.73.tar.xz
 
 # Hash for license file:
 sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index a1b2636c5d..5a6ed5b494 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.70
+LIBCAP_VERSION = 2.73
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
