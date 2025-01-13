Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F107C02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC4440342;
	Mon, 13 Jan 2025 13:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDFIFQ2yxpl7; Mon, 13 Jan 2025 13:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADBC40343
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADBC40343;
	Mon, 13 Jan 2025 13:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FED95D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C95240533
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qs24nKUX3ioi for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CC9A404E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC9A404E2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CC9A404E2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so3332209f8f.0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773408; x=1737378208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SamC0LWpHVVNf9CzzE3FIDeR5o5orPEHvP3AAHnv7Sk=;
 b=bQM0TituSgqG/cWSSKaYxbx2wZyUaWIquWVAiwmaIRgsjAhV1piL2afn/uEv2rY4hW
 wTF0wyrQXBWIraPyX40Pa1FbU5RqFsEYWKTmCAvz5Q6I/6L4x7TuywlNWfb6ZPiJTlIU
 z36mq/uAseZOIJiCuF7AVbgk0Sig81dM3MDFalUJQztdlwtdbJb0Eyww7mbcN6guOWrv
 TPPFfuBk+O0n7AHPkXIWJN/K6N9rIZ0HbtK2CONMB0CbKJWIxeZdeFVRbemC2hRv/6F6
 ub2HydoUd2jYIkMxU4bi59ZfLKePx2ITsdBsvqf0xCxxOu3EkMm8XVMUI3cAPX80vzZN
 V9mg==
X-Gm-Message-State: AOJu0YzKRB9SzoCsCmwwvSLsvCPipmfLB7wR+ryHqA3HionomqVZJ8Hn
 jWJ/+hJGEtayVyPAanGJtfInEiSaoWiydR8V81hKPKoid3Csk+NEw5PD6198h5iV4p616yo8kMr
 x
X-Gm-Gg: ASbGncsiI18WvOvLeyZNiXUMVna8JyXDBOd2rrdzyMsJDd7eA+tR4wbXviDzbAqKVDm
 N4P2gjeMi7T0/DsrCTG8es7nkR5R8ikYfsCiiIQVvjd2ddt72UIQ6o91rr2gxqyuxLeMkAwKt6J
 rjU5zDt5O9WhX7W6uTWNZpTh0yBghQy2C8QAYYlwTumF4EtUeaeA4mAM0aWRTW8Zc+t+KD4haq5
 PgRM8KWsKd9leJk5qRYg5gokytq/aaDMFNXKkbTdK2F9Z59q9TvlT2c6HgfCN7imDJ40EXLGZg2
 ubfPwrldK9JYPjJqzCVUnMy4VVMEUfHMCOuVDBVzWQ+JOxbt05ZXdw==
X-Google-Smtp-Source: AGHT+IGeD7qJ9igMAgHpbaVQZSnMvO4hzJdBbHXSud+PnkNI82EdWt8ONuvX+PM0e9m/5207bvg5DA==
X-Received: by 2002:a5d:5f42:0:b0:386:4570:ee3d with SMTP id
 ffacd0b85a97d-38a8b0f693emr14635134f8f.24.1736773408619; 
 Mon, 13 Jan 2025 05:03:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11812279f8f.85.2025.01.13.05.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 05:03:28 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 13 Jan 2025 14:03:22 +0100
Message-ID: <20250113130322.3962035-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130322.3962035-1-romain.naour@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736773408; x=1737378208; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SamC0LWpHVVNf9CzzE3FIDeR5o5orPEHvP3AAHnv7Sk=;
 b=xtkFSXe8RHZdYRjOBUQDRAPfXj4OBj7CMKZJDzp4lJXqR64X7jn7lh9EptIPuZnEGf
 /lHsoaR84rifNY4hsugx8KOyvyIuHemN9Qak5/zx0GFzWT59AYJKHTnDkcLgx2mggbS7
 oRjdvrAqYLLNa+cOb0Nk6kH2BuH/ub4lncQ1c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xtkFSXe8
Subject: [Buildroot] [PATCH 6/6]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump to
 14.2.rel1
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external-arm-aarch64-be/Config.in             | 6 +++---
 .../toolchain-external-arm-aarch64-be.hash                  | 4 ++--
 .../toolchain-external-arm-aarch64-be.mk                    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 725925a5a6..3a71e1356b 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,13 +1,13 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 13.3.rel1"
+	bool "Arm AArch64 BE 14.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index f876465543..317fc10a09 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  55a2f073708c938ffe1d302859e5c3d6195b8bca3affa3d3aa6b2aafd79bf487  arm-gnu-toolchain-13.3.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  0ea5d00d0ba4c5d16bc8e140d434c54367516b568a146d724936c589a2f56aaf  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index dd03635e71..381a591932 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 13.3.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
