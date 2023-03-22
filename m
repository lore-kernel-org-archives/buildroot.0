Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D85C6FD1C
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 17:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A07C96148F;
	Wed, 22 Mar 2023 17:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07C96148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a4q6AdK3c_S; Wed, 22 Mar 2023 17:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D043661481;
	Wed, 22 Mar 2023 17:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D043661481
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1821BF2BA
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 17:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4645C41B81
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 17:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4645C41B81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2aq_hPr8Y1N for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 17:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E278D41B57
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E278D41B57
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 17:37:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso6432126wms.3
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 10:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679506631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XAbVCnKau/wwo7oeM6za2E8152SBHO5xPPUvPJjPxFA=;
 b=1yIjo5vO0vb4kK3FhS/KucZ2g4Y+60xv0Gd8ZkOYPqDgtkg5F3p8DJueX/6thyiXaf
 JDWKJEGVJpibriCfLiFA4PoQyNxK0BMG6jEY6lw3VeIaddd9S+qtE2bIxi1xACRONL4G
 eBDpuFuhS4xhfIODJqV6sg9m/gyu/yLpYUNCXzM5ID2vSMyLJuZlVCK957OYxLqroqTn
 BNIHa0wIS2ROwMf+iqyC1737+0is42pDURP6NqgeRHWCmKuqRpQgBtbkOAsfurnsWD2F
 Q3/9AeeAhGKiDburt+wMenNf6SGerbDneI1yFmJvVUd9u91kf8IWgwKQzzjPt5zk2l4Y
 bH2Q==
X-Gm-Message-State: AO0yUKXshWOt4Cba20+qtwynochrWp2x04VM5EXFPNBlKhVFJl8yzUoN
 Ecxb49RlwJAARciVVa9wtO8PqINndHlZRRmsNps=
X-Google-Smtp-Source: AK7set8VTeDjkzs7LQ9jCogtOFGUHhoduFuDq2/CsLxqY6WKMSw/rP3JX54EBN7BLRktPsQuDvKKEw==
X-Received: by 2002:a7b:c399:0:b0:3e2:19b0:887d with SMTP id
 s25-20020a7bc399000000b003e219b0887dmr245504wmj.25.1679506631572; 
 Wed, 22 Mar 2023 10:37:11 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003ebf73acf9asm3178259wms.3.2023.03.22.10.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 10:37:10 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 18:37:07 +0100
Message-Id: <20230322173707.355775-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679506631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XAbVCnKau/wwo7oeM6za2E8152SBHO5xPPUvPJjPxFA=;
 b=XYL47puLB+mz/QfKfX1Rz/G8eTTeotaVp98ea0Xj/DELDUDFxol6+ePdaRW/BONIKC
 33lheid7c543OdARAh5+GHYkEaX1s1ULS4XGJ0Qe3qlnOyJjIeY1JtEq4eW6brFaiU7y
 zPuLbHuAvtMrxflneiNy17+kbcNa6lnV1wdJE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XYL47puL
Subject: [Buildroot] [PATCH] package/cups-filters: bump to version 1.28.17
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update also the release url because the OpenPrinting https archive page
is out of sync with the current release archive on the main github
project.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index b910cdce13..7fb3badf46 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0ca77bb820719a040ff003ecb478d0c2ceffc94e8bd1cd03ddb5a199444127ba  cups-filters-1.28.16.tar.gz
+sha256  01a2acbd6bb78f09638047e4e9ce305d7e5ef4cb9ed6949672b5d901b7321dd4  cups-filters-1.28.17.tar.gz
 sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 3250649e07..19c859e602 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.16
-CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
+CUPS_FILTERS_VERSION = 1.28.17
+CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
