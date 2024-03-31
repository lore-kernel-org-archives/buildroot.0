Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0421CCD1284
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 10:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC45405C6;
	Sun, 31 Mar 2024 10:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQW8CTlUXS8D; Sun, 31 Mar 2024 10:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AA1C4033C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AA1C4033C;
	Sun, 31 Mar 2024 10:10:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 642641BF3C9
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 10:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5140660622
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 10:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXsJbvuXPc8l for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 10:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D684E6067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D684E6067B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D684E6067B
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 10:10:06 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4156201223bso1025995e9.0
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 03:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711879803; x=1712484603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1NO62NpAjbtNWXzJPLO0LHjltnLKfoOo8zoXsulvrgQ=;
 b=P3K9uvjeEjmP6s5kubDdoWDLb5oAHqIO7hQLbsrzmldlVTDUxBacVXP9lDAnNikbin
 25iCQUnApp42z1xf39aW7m6l2a0iQJ2CdkF8IcNLtfHw8+7FKInA0UNEdUwB6FtqBMh5
 bPUZfDe5XBMDESo7G4sjXyTbZpaLF2FgDavi35TpyBvuOaZ+OtH/9prMPjoX95cmiWEf
 LpUudskkCCzz7O9+3gGPCr2cfxF+qGnqWlI+u2qXq18G8GLzPlkmXBbe9HJ1GjXcLnrg
 EX1OKMiWGdkZZqx5pGunY2TaymKf01qMdgMwT//uGzTNur+iwoNcsiXcy3lavVqz/HkA
 JoFQ==
X-Gm-Message-State: AOJu0Yzaode23ZzK96lFS3IzSsCdZQf2mLNdcAff3BJsCizw4upG+j33
 OGQw8zqur3UF6gWl7NmBWr2ZQ9w8d0ETFC/62lxmuaGnhlE9wvO//ztT2Sfs
X-Google-Smtp-Source: AGHT+IF8uBR61irPQT0sGwNoLOMPIW9FFMZ4HDU3GIMjiEfmD3oOsNdww3c7q2YPjnVm8aNtlfMOJw==
X-Received: by 2002:a05:600c:4f13:b0:414:8fa5:b9a1 with SMTP id
 l19-20020a05600c4f1300b004148fa5b9a1mr8759195wmq.5.1711879803176; 
 Sun, 31 Mar 2024 03:10:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p31-20020a05600c1d9f00b0041563b32309sm493374wms.41.2024.03.31.03.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 03:10:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Mar 2024 12:09:55 +0200
Message-ID: <20240331100955.793371-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711879803; x=1712484603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1NO62NpAjbtNWXzJPLO0LHjltnLKfoOo8zoXsulvrgQ=;
 b=WwL2L82vDRPJO7itLDfeIx2U6ZIdjEY8mcQIsPcuWrXDuvgRWj0i/5n3JY/JT4c6v/
 fuBPYmS5JJmJWYpjxjleR4HgJ6nOCulw/kcJT1y5koWuzgiJyBmK6pS7KMu4SHVWUZp/
 IW4GeUR+KePfkrE6NWidcObb9x4HQ7/QnOh9gy7UIyaH5LZti/TlQHQ+HJk6Qeud+Myj
 uc6Rb5+ck0evgJlbVUf9OgIUC8u9ALor0ph9/AfBrBR5yCmr9fwpZjtSMk7dzZ22xaTv
 Zm7AyOokFuhffcsQhVsm5pcdJQb7OviXpLhFlNSQCxM40bUAJQBlk7Hl/auKgcX/jaSl
 RAmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WwL2L82v
Subject: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: disable tests
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tests to avoid the following build failure raised since the
addition of the package in commit
d8a729d1731339da141612be33c5e59bc9928748:

../tests/intel/kms_pm_backlight.c: In function '__igt_unique____real_main257':
../tests/intel/kms_pm_backlight.c:320:32: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
  320 |                         name = basename(full_name);
      |                                ^~~~~~~~
      |                                rename

Fixes: d8a729d1731339da141612be33c5e59bc9928748
 - http://autobuild.buildroot.org/results/ff5de58ca9408f3a4fc6b6d5bd8c62093c1021ad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igt-gpu-tools/igt-gpu-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 927a1225a5..5250950ee4 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -10,6 +10,7 @@ IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/
 IGT_GPU_TOOLS_LICENSE = MIT
 IGT_GPU_TOOLS_LICENSE_FILES = COPYING
 IGT_GPU_TOOLS_INSTALL_STAGING = YES
+IGT_GPU_TOOLS_CONF_OPTS = -Dtests=disabled
 IGT_GPU_TOOLS_DEPENDENCIES = \
 	host-pkgconf \
 	cairo \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
