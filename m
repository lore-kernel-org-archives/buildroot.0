Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9386C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 20:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194CA61082;
	Sat, 29 Apr 2023 20:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194CA61082
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgk9W6A2kUEx; Sat, 29 Apr 2023 20:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F24760FD5;
	Sat, 29 Apr 2023 20:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F24760FD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8DB81BF405
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCBD240432
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCBD240432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3x8Pn5Vi3VW for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 20:45:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E70C400FB
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E70C400FB
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 20:45:22 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ec816c9d03so1487791e87.2
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 13:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682801120; x=1685393120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=De2oUTmxVz7mzkO58x5yU/bD+wJmJklir8z5iBUfcPg=;
 b=FhoL9ee6VrkV9n+yQ3a0yweuuIQoKgTQ9yqyp8uoyDMynvrrB1HbnU1+LV9D4CKk0U
 4XVJYAf9RlgAdoj6V9u6G8hM4vrDcv/uKs40ZwPPyVGNDICLooEfICmJuAhVpMWQh4Gj
 WPVcGuhiVkQlME1nBwCloiusWOIIy1lc7id9A0MPyg2GhrTAWfXVtba1Aw0BnRCjOKxw
 f+oIkTB9XDGURYFurr+WgpCh5bHacnI3kq9CJ/A1xvcqOQKb6mU1P4LlHWGi3Opszagt
 blkZRt0tRvwcv4sd/hwc+l2cLjwvA6K1Kbf14UVdO+QMpY4Wtz0hlHF2nnPlvS897Mft
 stGg==
X-Gm-Message-State: AC+VfDzJV5pMl+BC+syy4uqSy2CruAbEe/ub09Vi8UduWCH8u9VxGqpl
 dD/Uqygz9RHwKJam8ii8NUNr53pJhX2laA==
X-Google-Smtp-Source: ACHHUZ4e8PglHyK9pYDG5Bb/Y8PKvGfR6/KXErey97qIvJ0ptw55i0jfS3MLZ61zP69XCiRnkUC1Mg==
X-Received: by 2002:ac2:4c3c:0:b0:4db:25f2:c116 with SMTP id
 u28-20020ac24c3c000000b004db25f2c116mr2868047lfq.18.1682801119610; 
 Sat, 29 Apr 2023 13:45:19 -0700 (PDT)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 z10-20020a2e350a000000b002a8abe6f094sm3721906ljz.104.2023.04.29.13.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 13:45:19 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 23:45:09 +0300
Message-Id: <20230429204511.750377-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429204511.750377-1-geomatsi@gmail.com>
References: <20230429204511.750377-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682801120; x=1685393120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=De2oUTmxVz7mzkO58x5yU/bD+wJmJklir8z5iBUfcPg=;
 b=YM57gafMrgrj7J2meuUgb/JbiYPU/Sx5j2X35W7xcGFh4DpJnoB87cW+eJpUkuaACg
 ES/TdwPJKWBlATsCXf7jhsEAU2zTSv7TcDPGWzpPOk6h8BqiLmGraKKSNH2PuLFI0A28
 mJlbKz286G8MDfEJlEBHVyLseHpPFygOTD38lVGIlq1YTQR+xc4IFnz0dTr1Ho2kZUpX
 wdTURPyBfftmmHCrkiZ8XLQxoGx0bU6VqabFNlvLvlu3tc7ir6naxL2xn7qTaOF+6fYH
 taiy6Ar0qqdy3cvsVodBgvwdGNMlL4qOw/EsZ+gk1Wi1roY9pfxtoASTfI+Lt1ZZXtSV
 qJ4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YM57gafM
Subject: [Buildroot] [PATCH 1/3] configs: orangepi_one_defconfig: U-Boot
 requires OpenSSL
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building U-Boot for OrangePi One now requires host OpenSSL. Select
BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build error:

include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory
 1383 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707115

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_one_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 3f383e337e..ea988e87ea 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
