Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F00C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 06:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C8E340597;
	Tue,  5 Jul 2022 06:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8E340597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkBKtL_JOCfM; Tue,  5 Jul 2022 06:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E43340139;
	Tue,  5 Jul 2022 06:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E43340139
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A57A91BF2FA
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 06:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F5AA40139
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 06:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5AA40139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvSKYsV79Xcw for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 06:16:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20C7B4011C
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20C7B4011C
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 06:16:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id sb34so19774625ejc.11
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 23:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zF5a1qXx6w8HB4ypAmivibDEhQ/zLb+MFqmfITZl8u8=;
 b=AtpxP+uGpVEYN4toO3SLEtc+OatxLB0PYWYbBfkDDrR5MMf0dLPg16kyCgAR56qnKf
 qlq2HPIIV8B6yKQ1wlZIssekaoO6mZWucGzD4Ykg2d0vYRdYVN0qKPmbY1s2NwmWkPa/
 xckq2OZYsp8rs1nS49Ztm0uLqPRsBvA9/rR2K7oEbXNlfCyUvjKdpdJtF5TDZx7sgYjU
 en0pHIbqRrVEVVBDtCdCgWth9WldicKOsm05RJWrFdB933jXtiKKUkVWsazLQFMaLTgJ
 J3+tf5tCdZK2hVoK3GsGGJotsnwUUDK+3TCFv7iJNR4QEz46t55wr7lb06wW9t4GVhDR
 vzUA==
X-Gm-Message-State: AJIora9x/iX/5BiUokF/vgMG6bZ5/7xhX1snA+aPgEaFsyCqYQw7qoEN
 JHTsZ/JPCW4kbjKvCGDI4F09tq2DF6NQ7A==
X-Google-Smtp-Source: AGRyM1tkyyvwd2KiewczFyBWpoWPyhOBHvmoLIgdVXTsXuSuGkBww3iWRLWIO0ZFg5IHuopYjq7kiQ==
X-Received: by 2002:a17:907:2d22:b0:726:34e6:52f6 with SMTP id
 gs34-20020a1709072d2200b0072634e652f6mr30747946ejc.371.1657001792099; 
 Mon, 04 Jul 2022 23:16:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-116-90-174.pool80116.interbusiness.it. [80.116.90.174])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1709061b5a00b00727c6da57cesm8677990ejg.147.2022.07.04.23.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 23:16:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 08:16:27 +0200
Message-Id: <20220705061627.146616-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zF5a1qXx6w8HB4ypAmivibDEhQ/zLb+MFqmfITZl8u8=;
 b=AutOgullaUeMjopKi9QZV3/ukBwvqEZxhAq7x9Zx9fQyrdNLGY+2r5KRsNTvIRCziY
 jxuKFNHeizy4NZhUC5NgeDCkGnlKl+k/bbVJRFU1w9vGs9RKx4/kgZ5k9DVnYiN0oawA
 /omTns1TSRyNr/bDvhntOOpo9IsxNLBie8BPc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AutOgull
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.4.224
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It requires the host-zstd package.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 245c38879c63..a57b4dc46ea1 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  a9b8b74e32e6718d591c66951b8b52276df7862db80ee943e046947f7313e57f  uuu_source-1.4.193.tar.gz
+sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 9bf9ff123be4..647254446fa6 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.193
+UUU_VERSION = 1.4.224
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb
+HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd
 
 $(eval $(host-cmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
