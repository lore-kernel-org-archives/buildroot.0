Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AB4C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 20:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23EC160647;
	Thu, 27 Jun 2024 20:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BOIPrca1Cfo; Thu, 27 Jun 2024 20:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DB6605EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DB6605EF;
	Thu, 27 Jun 2024 20:53:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEF201BF2B9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6D060E76
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 20:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Der3dvNnraXC for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 20:53:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B1C460664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B1C460664
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B1C460664
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 20:53:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4248ff53f04so37626495e9.0
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 13:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719521614; x=1720126414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MlsP96SBOC3VvVE8bNxwvmA834sgQcLm83RvoxcMHU=;
 b=pN58ldmLnfGEF7rA+lpmqo7q10AeU1O3dhu6haoRqMd4X9qmsDm8fXrYyM0CDI23aG
 NUQRZJL+enm/UfzN3WQ+AQhxYCd74oBpIAC37KDO6k2rgWEZ4P49SSlHTIvUQpBnz76L
 ObzKW66li6mHHg/x5L0verVMGuXMSc2G5VTKxoDUndHxsbwGWbm+DCodL7YiIIKGmgp+
 PAWTlumH2u1hEWNz/dGVlii/L5JClZZk4fXLZbHRuMtwqCKpoXPKo11iZSWmytfZmqPx
 AW+wHzMdUMEIOoCEW68y4/9TWAHgmAGbQ37JYtliY/OQjETQZlmwU5OJLpTIf6Dj3aYv
 N3lA==
X-Gm-Message-State: AOJu0Yz7fOdjvoWMYOp3JP/CuCiAEagh9nViwtsHLjh5jGj+Zc7AxGbV
 rdZg8HcBPECMvo2dPkb9ZfTNLSBgI8I4NAXeC6ee2lpm3n+GpPoKB4phdA==
X-Google-Smtp-Source: AGHT+IFzGDUstgPViCPElT5ZCmyO5Y49C51mKKhtbOPVSDmMfAmg+6q2u8osyl1chU6yIhxhAkN5dw==
X-Received: by 2002:adf:e850:0:b0:366:2ecf:17dd with SMTP id
 ffacd0b85a97d-366e7a373e9mr10755065f8f.36.1719521613658; 
 Thu, 27 Jun 2024 13:53:33 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b097bd6sm7242825e9.30.2024.06.27.13.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 13:53:33 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 22:53:32 +0200
Message-ID: <20240627205332.3302187-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719521614; x=1720126414; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=2MlsP96SBOC3VvVE8bNxwvmA834sgQcLm83RvoxcMHU=;
 b=FYlWFUyvsp2ZDLhLapvdgXLqazOXmxmVBuXgEWrYOJn9sZb9uc9ZLlFcXcvs6c/15R
 SaIiEudn8KyS2mxhS/0NKuNEbctmjDqcyVoRx6uwgwvYtiyQ2OPVPtCbh85BX2at0GH7
 2VT3laq7eqafuuDp3uDE1djYvVV6LY4H6OvI/ZYX2aSCB+cfD8r7xWN0Azk9m3aAmF/n
 8ngF+DdFSiUd4AyZdAbLVffBJUqQpJohwTQQboZsbm3EKxbHeh14kCAHlT8OQvOT7O8R
 e+ml1yvSpGWnXi0TkPP0jbBR1Cksls7RPg7LYXsQ0sAIkJtbQriwOIJSaEz3ZcERNM71
 DDgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FYlWFUyv
Subject: [Buildroot] [PATCH] package/am335x-pru-package: fix downlaod issue
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

am335x-pru-package is downloaded with the github helper, so the tarball
is generated "on-the-fly" by github.

It loos like the process to generate those tarballs has changed, again.
The hash for the archive has recently" changed. The delta is in the way
directories are stored in the tarball: it looks like the "basename" of
the directory path has been split off from the "dirname", into a
separate field:

@@ -270078,8 +270078,8 @@
 0041efd0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041efe0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041eff0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
-0041f000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
-0041f010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
+0041f000  50 52 55 5f 50 52 55 74  6f 50 52 55 5f 49 6e 74 |PRU_PRUtoPRU_Int|
+0041f010  65 72 72 75 70 74 2f 00  00 00 00 00 00 00 00 00 |errupt/.........|
 0041f020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
@@ -270104,8 +270104,8 @@
 0041f170  34 61 64 35 37 63 63 31  39 35 66 32 38 62 66 35 |4ad57cc195f28bf5|
 0041f180  65 35 38 35 63 33 64 34  34 36 61 62 61 36 65 65 |e585c3d446aba6ee|
 0041f190  37 30 39 36 2f 70 72 75  5f 73 77 2f 65 78 61 6d |7096/pru_sw/exam|
-0041f1a0  70 6c 65 5f 61 70 70 73  2f 50 52 55 5f 50 52 55 |ple_apps/PRU_PRU|
-0041f1b0  74 6f 50 52 55 5f 49 6e  74 65 72 72 75 70 74 00 |toPRU_Interrupt.|
+0041f1a0  70 6c 65 5f 61 70 70 73  00 00 00 00 00 00 00 00 |ple_apps........|
+0041f1b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f1c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f1d0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
 0041f1e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|

Switch to using a git download, which uses our reproducible way of
generating archives.

Once extracted, the files have been verified to be identical to the ones
in the archive on s.b.o.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/am335x-pru-package/am335x-pru-package.hash | 2 +-
 package/am335x-pru-package/am335x-pru-package.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/am335x-pru-package/am335x-pru-package.hash b/package/am335x-pru-package/am335x-pru-package.hash
index ad386fe04b..157fa566eb 100644
--- a/package/am335x-pru-package/am335x-pru-package.hash
+++ b/package/am335x-pru-package/am335x-pru-package.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2a902f825ccc1885c5dccd83e1ccee104aa30e601c9964a24f49459f76f674b9  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096.tar.gz
+sha256  bd90d57d210c2ec1835d701c5d12e228801cb41afebf591e2c146a4dc49c296f  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096-git4.tar.gz
 sha256  f0fcdf9b2090896389eb4b784f23be96d5544c5ce5282d84f82ae9a8e8331beb  pru_sw/utils/LICENCE.txt
diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index 24a5df4815..9c65ee1387 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AM335X_PRU_PACKAGE_VERSION = 5f374ad57cc195f28bf5e585c3d446aba6ee7096
-AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
+AM335X_PRU_PACKAGE_SITE = https://github.com/beagleboard/am335x_pru_package
+AM335X_PRU_PACKAGE_SITE_METHOD = git
 AM335X_PRU_PACKAGE_LICENSE = BSD-3-Clause
 AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
 AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
