Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD5C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F48832B3;
	Mon,  3 Oct 2022 20:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F48832B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35ihtfCBrza6; Mon,  3 Oct 2022 20:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51131832AA;
	Mon,  3 Oct 2022 20:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51131832AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B514A1BF362
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 437FE60E5B
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 20:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437FE60E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibX9Xqx3swfT for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 20:31:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD66F60E46
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD66F60E46
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 20:31:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w10so3285060edd.4
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 13:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=6zlRXnBVRXKoTZVE8DWTQKOFz9FkPBCTe/bYjgM4p0M=;
 b=3oldUZx12qIFjekTrhhM3uheYsof1TjgDHJ9TFWThd/Ll7GMI9oubizjjdhc1R5D+i
 uxuQ65jdel0NOZObAZnoORicO0g1E1+KfK1wzUZV1jl1uLwgWsIGzWRsUeMJOWFwsTrW
 2Lkvh37QbmBxzATFIKzt2kAB5xm0FFkYqNHgJkDx78IQs7/SARqdYlZigxossEMWyTZE
 7/wF5+rN9oSV9X8XwV6UftQ8Tsb+jAj+2GgKe4Gz6qfGrQfV+LNzlR16McSIORf3BfXg
 vPVXol5GGm9SoIypObafS8LP9aSAcdDgYmjqsWTkuAbLP7+GmscY4QOud3CP4NDbdwBQ
 Qygg==
X-Gm-Message-State: ACrzQf2tVpUoCG+npuXZX+Ry+5mmIef8bZS0nT2W5vpjOSOYf1nudXQa
 SV/HW4RSY4k0FAhJkYUAzNKHcBwJlC1feA==
X-Google-Smtp-Source: AMsMyM6jVt/5obiRbsWpuM5yllSX/a2XaS3AUBjGiPeGcIEC3FqMpYaxzb9JKh27kkubRf534apo1g==
X-Received: by 2002:a05:6402:159a:b0:458:d744:8975 with SMTP id
 c26-20020a056402159a00b00458d7448975mr8754868edv.200.1664829067727; 
 Mon, 03 Oct 2022 13:31:07 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 b40-20020a509f2b000000b00456c6b4b777sm221624edf.69.2022.10.03.13.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:31:06 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 22:31:04 +0200
Message-Id: <20221003203104.3384703-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=6zlRXnBVRXKoTZVE8DWTQKOFz9FkPBCTe/bYjgM4p0M=;
 b=JUHPX2e4ke4R65hMYKlKuW/7AnfUdrWfnQIKL+L9JJYb0xGwqFlaLYu/25Ict6vya8
 cInOB4cnIpbPNkJUaI+wVBny8QOuxkUiFeQCYJHVtvyHbEUwIZM+teJmBm63nHfz+jq5
 FeSuKqlABaMgaOT3dfAoxj80QCy8owBxH5uTc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JUHPX2e4
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.29.3
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

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/sysdig/sysdig.hash | 2 +-
 package/sysdig/sysdig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index c953421f27..cda3de5e7c 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  38ea602085f706af5d07630189216fa240064122650a81456cb092579313ae8e  sysdig-0.29.2.tar.gz
+sha256  6b96797859002ab69a2bed4fdba1c7fe8064ecf8661621ae7d8fbf8599ffa636  sysdig-0.29.3.tar.gz
 sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index e9968d9fde..bafe534a16 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.29.2
+SYSDIG_VERSION = 0.29.3
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
