Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A4CDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4A5A40A94;
	Mon, 23 Oct 2023 09:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4A5A40A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZofTxwAPObF; Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B67F41453;
	Mon, 23 Oct 2023 09:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B67F41453
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4361BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E7F4086A
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E7F4086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVjG0xogqs_W for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:07 +0000 (UTC)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99CC74085E
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CC74085E
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-507ad511315so4502438e87.0
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053105; x=1698657905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CDGTLkshaC8jQ2LEmqo2l2jpiSd7p4ijqjgGNHRlq30=;
 b=CJU7dZPaFovwi/V8Tz37UwVZPTgaZMARqy2J3wnZptyiVnNuZwewjjYL9CvnBIIQ5h
 t0tm7hEkit8oQowO0sx3ZNY2d6FUIe+7kss1EmLXgYoXnoo2YFYDKaE0dmSg9xQSBzzr
 nZKLyu68RqSBHhzKy3P3tH2JlgCr4TFU9UleAEbhdOzDhbVZPPVJtVs2Bj+ISblRZ2ea
 3A4GlTUflM6uB6bBMaeJoqrYgI2sAYKFy9OnF8mhmtfJz9JDfBCZci3lkslC7XfeRzi0
 a+kS981DyrMO/2bx1LdkDII+dfSbMgoDTszhBOcMlirE5iE65EfqyPiGrL1Hv8BkCXdS
 SEKg==
X-Gm-Message-State: AOJu0YxnM6b/3d4c9XpF139nfq1C9IK4Hvzo+7TiKlOYgCQBeaA3K7bk
 nFGbI3CthCAlnFTcfUDowWa89qxZPYz+G240SYtMDRXM6ndoFA==
X-Google-Smtp-Source: AGHT+IEOky5x/Y9exffUvSV4mPQl/DPIzYQsWrDdMInxmxZuogl9IsN/3fGsvdQrDerpDxZJxbc0Qw==
X-Received: by 2002:a05:6512:3b23:b0:507:a8d1:6e57 with SMTP id
 f35-20020a0565123b2300b00507a8d16e57mr7096179lfv.40.1698053105124; 
 Mon, 23 Oct 2023 02:25:05 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:24:54 +0200
Message-ID: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053105; x=1698657905;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CDGTLkshaC8jQ2LEmqo2l2jpiSd7p4ijqjgGNHRlq30=;
 b=GnTYu0V2IM6luBHUJGkt9n+u7FwoUkC6ZRETkM8IwT7Nx6nyBi311ik6ELSXZyyHW4
 U0hzb/BZSD+BDFERgBbzhhbYaE1gfBBnGAyiUviOX9PyLWb+3MOscgWNTpOAP1rkAN2k
 WjYyKk/MWV7qDgjADoDR9oqsBDB6nhWlgimTw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GnTYu0V2
Subject: [Buildroot] [PATCH 1/8] package/opkg: bump version to 0.6.2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested in Fedora 39 and Debian 11 with:
./support/testing/run-tests tests.package.test_opkg.TestOpkg.test_run

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg/opkg.hash | 2 +-
 package/opkg/opkg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index b0c0ba6574..c6ecefba21 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256  a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e  opkg-0.4.5.tar.gz
+sha256  ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5  opkg-0.6.2.tar.gz
 # Locally calculated
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 501edcf8af..9b1ffb3c74 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.4.5
+OPKG_VERSION = 0.6.2
 OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --disable-curl
+OPKG_CONF_OPTS = --disable-curl --disable-zstd
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
