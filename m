Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB560C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 11:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BD741B8B;
	Sun,  7 Jan 2024 11:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83BD741B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNpq_aQ4T7EP; Sun,  7 Jan 2024 11:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA45B417E6;
	Sun,  7 Jan 2024 11:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA45B417E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 585D11BF292
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 315BD417E6
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 315BD417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpVnhnYIJS41 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 11:42:34 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38A29417B9
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 11:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A29417B9
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33765009941so652689f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 03:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704627751; x=1705232551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+VGg+mizrVLQZZCilzZLfnO7k+hhhpXCH05P/ORVXM=;
 b=bnkAxcQfJDqWesRHlkXwcNlswo3y3K1PHzjwm2bnEbQ8MIhFfyFgEXd5bXDGYM7oXn
 yTsmNIAy5oxnKPhe+2bUEtSIZ4wvSuz8puL5hTRkYdZ+cJxdspuqbD4IF+QpVwP1eypW
 bqcQg85K+Bmlj78JKtzlkvCM13trmgRAWrXjswP9ohCfs4Xy4qWOD+5plSUSfnWO5MG9
 IJ/DdbTW2RW5SF44LSgqWe8Mg39lIJ46byNr/2/8Lv1LDwwLsnlFqu816RZQ2mOM79cb
 3P/TYD7xX7FPpJFvmPMxfxoU66QCsoaGrcbW2qRE0pI/h+ZBMoWsOHlgCf2+51+AlynG
 7dGA==
X-Gm-Message-State: AOJu0YyXLvkBZzXUTk4u/0dp7Me3rnWZEEWZqKm3QGFCWYI9FkDuU+pQ
 f1U4oSYgycOweUUXFMGLwE8xRksEGKg=
X-Google-Smtp-Source: AGHT+IFdZvcHji7fyT2kcoXkcroy7HvxNjs+5msTHrNqyGOuppzJLkfTK/qnfQr+q35eC4QEgt4eJw==
X-Received: by 2002:adf:e6c3:0:b0:336:7be8:e216 with SMTP id
 y3-20020adfe6c3000000b003367be8e216mr1332955wrm.22.1704627751354; 
 Sun, 07 Jan 2024 03:42:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d4dc1000000b0033664ffaf5dsm5162682wru.37.2024.01.07.03.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 03:42:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 12:42:27 +0100
Message-ID: <20240107114227.2794298-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704627751; x=1705232551; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+VGg+mizrVLQZZCilzZLfnO7k+hhhpXCH05P/ORVXM=;
 b=Jg1C0aPihQeUX9VEZFmOSEMIXwC0aaUNne8U1MtoA/1yN5iOR25PHLJgv0LHxqazyU
 RhJ5bGw0KyenQv6HK3k5k5Basifaa7k0AlasbcgWoHuiZYy2hGDbUtNe1mMUMpyjHmHc
 H/UKJPJsyagPKOxY6LqnRSD6p9SSQ3ri0lWtLyrVbJX0J/Jp2LzdI1WT4ZVbSKwpnMaT
 1RB49qaR8rHM1q+LFbliQfieSGchjlnRVjXmGyXFzqM5/8lIddzUQ+B1w5XXiKegdXtJ
 hL82483VVV/z3e3VlPLMsf3afhV4+undreaggEzW8iyujo1DVtotxcL32WNPYx4BodPT
 rU9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jg1C0aPi
Subject: [Buildroot] [PATCH 1/1] package/musepack: update MUSEPACK_VERSION
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update MUSEPACK_VERSION to match what is returned by
https://release-monitoring.org/project/21865

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/musepack/musepack.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index d4dd08df36..02fe53d47d 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MUSEPACK_VERSION = r475
+MUSEPACK_VERSION = 475
 MUSEPACK_SITE = http://files.musepack.net/source
-MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
+MUSEPACK_SOURCE = musepack_src_r$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_BUILD_OPTS = -j1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
