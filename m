Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D3AC48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 19:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC8D540B87;
	Mon, 19 Feb 2024 19:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9TeVLdPNX8v; Mon, 19 Feb 2024 19:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89EF940B6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89EF940B6D;
	Mon, 19 Feb 2024 19:59:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D142A1BF228
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE50140837
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaLuA7YWNSY9 for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 19:59:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E993E407BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E993E407BE
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E993E407BE
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 19:59:23 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e4560664b5so1266312b3a.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 11:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708372762; x=1708977562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AixJj0a4w31XdFFTxN3FK42mAGM84iuLn5VGsDW4zsU=;
 b=qX6mkyudiPWMlyTf+qf3cUq9kyDodUQopkXUlS/tq1BpQgTaTrjC+3G285qKkWDaDN
 0F3A8lGiopE8JKgYTkRFAQCEncTkrx0WQ5Rq/PyIRa/7wGi51fo67Qpiz08Snm3ironS
 8OdmgVltKjtK5Mqd+r0ceGcTJIesTCfi5rsMgnVjNPvivJ5WyF3pkQ+F2s8bl+syTQvS
 cpwZ+GDIIJyuLUoalgRL94GVbL+vVLpEajLYdKg5NlNQ0Mu90uUMEWMZbHnTh598F7YU
 lxQ7a2WUp9XpDmlpR6GQ+LjzCzzZuvyeygjmu6YdzgqcT6oDENuySqj3iSYBf8XeI++h
 +QHA==
X-Gm-Message-State: AOJu0YyPXRzCL5QNbEUBKCGG4sWt1mBumEIQf1r0kSwNBSG8JHPQKR9E
 peNLojTcXILuaiDxiFNxzbMN4moMyLdGb263j7J8SOP4CE/81k6B1T++biSMKbw=
X-Google-Smtp-Source: AGHT+IGFNSbQ/+USfN0c6bIDPZ6NDasMIGZk8pt/a0n8Qvmqfplr86bQiIJUEOb+myLBYqzTlhsJAQ==
X-Received: by 2002:a05:6a00:4c1a:b0:6e4:6878:8d55 with SMTP id
 ea26-20020a056a004c1a00b006e468788d55mr3483189pfb.28.1708372762475; 
 Mon, 19 Feb 2024 11:59:22 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 o19-20020a637313000000b005dbed0ffb10sm5041245pgc.83.2024.02.19.11.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 11:59:22 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 11:59:11 -0800
Message-Id: <20240219195911.43452-2-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219195911.43452-1-kadambini.nema@gmail.com>
References: <ba5719b0-9b18-4148-bdfe-8a16ef06c4ee@benettiengineering.com>
 <20240219195911.43452-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708372762; x=1708977562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AixJj0a4w31XdFFTxN3FK42mAGM84iuLn5VGsDW4zsU=;
 b=Yn33Mz/s5yIm1AcNmE44B6UIzachsiE+wN9HepWFX2twFm/y5sPHnWaqfGM9zbzwkP
 wzBmApZT7SPq06zk25tFytBoPlGW2YlRV1TvOFNoM69nQR+TtX5hee4CihJDyewcsiGI
 ASD4q8WZ44t5HAizoIANT0XEkrofkwAlQW/p4vBznbm+Y+jPJj52aKLQjqykw1U/4TJa
 1YKOIoWC4ItcGNomvDGERsD5fjPfnb2KlQoODSDbm4LygweWTLei4FHLhorO4FGeTNWN
 mtNvKVx4oeKDP7k8dOrWqBYz5RHro14ngW3+u00wofj0RoiSAXz+DADiAgDW4BnCnWcu
 ihgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yn33Mz/s
Subject: [Buildroot] [PATCH 2/2] package/sysrepo: bump version to 2.2.150
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: giulio.benetti@benettiengineering.com,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note: This release depends on libyang (v2.1.148) (https://github.com/sysrepo/sysrepo/releases/tag/v2.2.150)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 6a5e98f41b..056f70787d 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bebb7901682eb23bf4c73d086d0a45c124ec751a67793a66024f1d4203425730  sysrepo-2.2.36.tar.gz
+sha256  467efed8d0f62c26a0d200602b911096eb2d67858e620937ab68f96b316fa9b7  sysrepo-2.2.150.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 6b031ae6f9..7f2570bd7d 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.2.36
+SYSREPO_VERSION = 2.2.150
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
