Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B28DC36014
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A052860E91;
	Thu,  3 Apr 2025 19:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDl7n16wE9-F; Thu,  3 Apr 2025 19:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D04CB60B1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D04CB60B1A;
	Thu,  3 Apr 2025 19:07:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E37119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E70781FA8
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qV3ivnkkc0Io for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51F2580CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F2580CB3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51F2580CB3
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:07:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c14016868so1125193f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 12:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743707232; x=1744312032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rakLaTLpX76zBJic6vo78By8W3HjYE8hBGU1/OJzZ6M=;
 b=fv+uYRKWEyWr1kXNI8uRRu7WGmvgchIdr/esIX68350Zv6nNaqk2EcnQQc/R93+DWd
 fzaaZiXIl5695zZqUwj5D0wXTWLwtKYAJavUn3UwX4KLKb1kVrOhuGiIlYRGY98W7+2H
 /raXLHaFTsoEnaSNWIhHXk2cDXl2VArErehqXSDAT5RDNe+s3uOpcUY0aTc5X9m2cKRe
 ZBLkhXZ01fdh/aJnvXtRaOtEVl1CBIABBQOhSbD1s7EVYQlF8Ctk2DO19/BEBo6DPRUD
 tATA/FlG9XUpVF3Lfn6UGFZsxC9blW40MqiJOuvjVbAA4i4JVV0In6VWwNMWLScPlaxE
 0fLg==
X-Gm-Message-State: AOJu0YyDxwOIpJHFAEwLWRd64H16Ow2wjX8AnAAaQkF0h+11B7aIjQSb
 TbSYIopkugM9yGbKuGRcVQrjvrwGalI+pzDXLoB+WB/axJCdcwrSYy8LLMwW
X-Gm-Gg: ASbGncv22dk453gwPPhphkN/19HPy9XIdqDkSlebCD+kz2Tp6W16tMmtYJXpRSPGTOe
 H3LtZ3XABq1pSDn3yXBCMzBX/2EFI8TrRrOmGiCc1+hbtlgPcZpfSc3vb7le4bOCi22tKaxvhDQ
 QdYpcvfn+WusVkAlCe0bAdSyDldszhvqKMI057pkMOJ5Hsi37cEL8pHVriS06V+/iOXVEwUCoEL
 Z44NxU+avIRNCsQCII+c3m8BUgJMM7uS7YIm4uqpyA2kolr3ywynkQ3jwlzj4K3tC5/Z11H4WFp
 bqH/kGM8rhZVA6P/wDYOYV5yXhvSPJscDXNj
X-Google-Smtp-Source: AGHT+IFYqT4GJJedsKZipQsGC2xw5KV06M/lcOgscn1rY2wTJAUUHrNEdevDLzrrL3mUeWDytQhGRw==
X-Received: by 2002:a5d:64ec:0:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-39d07ad4df2mr21176f8f.7.1743707232133; 
 Thu, 03 Apr 2025 12:07:12 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:32bf:237b:9ae:9868])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364d071sm25580595e9.32.2025.04.03.12.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 12:07:11 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
	Maxime Leroy <maxime@leroys.fr>
Date: Thu,  3 Apr 2025 21:07:05 +0200
Message-ID: <20250403190705.14994-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743707232; x=1744312032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=rakLaTLpX76zBJic6vo78By8W3HjYE8hBGU1/OJzZ6M=;
 b=Z5s8UKeUvOMQC+maAJrDWqM1Akwfn0ZNW8zJp9snogcUZl7ZyShz3r0usHg1SUak3H
 0Ui92cZZaMCn/oy9wlrnZfbRrzYNf80tMbiCm0IIKCcGfWgSClJQN4N25PaZCdxZih89
 8Wmp6aFD9kBcofwyarJOfxLwFYqH0cCx7KSQUvU8Jd916M1bItHJN5Z1GTizdSYex5yQ
 +qMLJiyeYVXmRhDad7UvPJYTnLOI7V0kGOiQOzXl282Ir2G0hWb0BgASC23iF3t0b8yk
 yC6vcsoXoerrpsiEEtd0JM9eFcdHekqTl1yygkpDobh5oGcCf7oshLAsw6zCB218D3wE
 d62A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z5s8UKeU
Subject: [Buildroot] [PATCH] package/frr: bump to version 10.3
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

Update FRR to the latest stable version (10.3).

The configure options have been updated accordingly:
- Versions of FRR before 9.2 used `sysconfdir` and `localstatedir` as-is,
  without appending `/frr`. The `/frr` suffix had to be passed explicitly
  to `./configure`, which did not align with standard conventions.
  This behavior has since been fixed upstream [1]. As `sysconfdir` and
  `localstatedir` are already set by `pkg-autotools.mk`, they can now
  be removed from `frr.mk`.
- The `--enable-shell-access` option has been removed as of FRR 10 [2].

[1] https://github.com/FRRouting/frr/commit/ff62df2e4484
[2] https://github.com/FRRouting/frr/commit/afb034b0bb42

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index aa13ed5625..7786cc8009 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5323e5ec236346860301e57f6845443855e8f2508d7ccd87ead395a9991c01c2  frr-9.1.3.tar.gz
+sha256  0f10aca9074c773c12be8a07382c7560d625d4a2c842d82261d18bb8f4b26f6c  frr-10.3.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 5391bcb265..82a4673ab7 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 9.1.3
+FRR_VERSION = 10.3
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
@@ -38,14 +38,11 @@ FRR_CONF_ENV = \
 # Do not enable -fplugin=frr-format for production, see doc/developer/workflow.rst,
 # it is only intended for FRR's developments
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
-	--sysconfdir=/etc/frr \
-	--localstatedir=/var/run/frr \
 	--with-moduledir=/usr/lib/frr/modules \
 	--enable-configfile-mask=0640 \
 	--enable-logfile-mask=0640 \
 	--enable-multipath=256 \
 	--disable-ospfclient \
-	--enable-shell-access \
 	--enable-user=frr \
 	--enable-group=frr \
 	--enable-vty-group=frrvty \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
