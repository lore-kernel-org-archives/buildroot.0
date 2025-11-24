Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CC7CFD355
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8294980E81;
	Mon, 24 Nov 2025 19:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1ueINfLmrsj; Mon, 24 Nov 2025 19:57:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96067816D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96067816D6;
	Mon, 24 Nov 2025 19:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4271E359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C6A607CD
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBvbhbQSghUa for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 19:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0AB0F607BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB0F607BD
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AB0F607BD
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:57:00 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-37902f130e1so37401241fa.1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 11:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764014218; x=1764619018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIUezBd5+wiRFHFrEfD8sKZCnoBQAlnjwgUXKCGhaPI=;
 b=rX5zdGEMHT7bffshvZTtyHCJ7cdbCbDDEGj0WeiOm+PUijNNlY/QP6sBfQ4YZ/gknj
 Q/LiDtrGHRSa9l2cdLtFeuNhdWnPVx/4zescWnwn5r4uQmA4MYQjguHqjgqDbEAG3p1W
 0uPHGZncQHyqCYiuS1rxAtN/5hDFwkm1f44HneJyexWuscSx2TfkMOv3et19JsVE1wh1
 t+zYEM49MuRkvUdnm11oZYFuy3Dxs+dTFa+jBcyFy58KPNCOJuJNCPwsMsXNFC5OP+3P
 MoqgjrMVOZp2+CNSg3SgKmIBa4doY6e0i3QV94zKyxHlcpjxjI+7pzQa6BwtdGQcHRsC
 1rMA==
X-Gm-Message-State: AOJu0Yw9ohKfR9qWBwY68YHE7QVUql3GYOyF4X2CjvtSSWEL/5W5i3yE
 dDZTTWTUhrWiTNbL4rdwO4v7VirdlRTjPlrsei7mQb4tq84jLDEdzphBB9drkP+oUzc=
X-Gm-Gg: ASbGncu7RNAv4S41nziBTBmU45piap7wcUV3a5pUPDgaYYvSI+dwIrsz3fI0RR70nBc
 iK0osBS8dqbrVguu8gTOYNV0xCbKdDGwVViiJvXv5Qq3md5kN/wWE6KeoSYgAOZ4V/62W7TTwiT
 jIQbSo39fxXMj1hYUmM/o6jwOzp1kcp89m8yrGp0He5BvVyY1dMLHV3Z2uuRhrs7hXthwo+oUBl
 mX7xSVnvzZCQtuCuxgKHTnOvsU+IeTFpEmAThrck0wpH8EE6mthOxWevCr75Jop/Y5aqD2o4KE8
 fwjsy6twsgsNmdO/xEATT0jqOEcobOyo8pP1RouaAktJJOK313F7TWVAGlTUFmZKF5YakkGmMmw
 j4wsdUittxyQNiIaqdm+LK8nyrnSyXTlY2YhxVKcdo3l4HBEoZkLwxKJvcDpoYcKe0X0Aglx7G5
 b1CLdCApdc
X-Google-Smtp-Source: AGHT+IG4KDlni8Ph8Ll4R7sb31NIpyhCz5LnvbJlJgPaFrCWz3o4287KeO+XrNN3OByFShVXUmZsSA==
X-Received: by 2002:a2e:8098:0:b0:37a:3f2d:c05f with SMTP id
 38308e7fff4ca-37cd9244181mr31669191fa.33.1764014218181; 
 Mon, 24 Nov 2025 11:56:58 -0800 (PST)
Received: from nibiru.lan ([85.198.105.151]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6bbf14asm29440771fa.41.2025.11.24.11.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 11:56:56 -0800 (PST)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Date: Mon, 24 Nov 2025 22:56:31 +0300
Message-ID: <20251124195631.234829-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764014218; x=1764619018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yIUezBd5+wiRFHFrEfD8sKZCnoBQAlnjwgUXKCGhaPI=;
 b=X0B2IDFlBcl8kwNuAlD8BJjOLa8ww+qIUqq3G1GpW4StjmXvEqvSdcIW3pAhp4NPTP
 Sco3V+LG5nhiPO3hOfOL43neoL9ai3pon7aefZd/V0AqJbTWk5tAI8VH0QcV1ap3KBzO
 hZMzqpYMstBDJW1zZPcWpFqNvPt5h4UoSyqPQ+Tq14ECXndq+0nnFa/F4V9Ciow7QQkZ
 jLthdyHpXGwtWWe6YPjhKJR/0bZAsIOAheCBF+mExvjIZASyao78MKtAlj6Dx79COLFs
 cVTHIwo6ImHeUlnaUTZwWpTH34hdi0rdALU9O4Tig11Q2DvUXWnaT9R/hDinrLP1QTHE
 ni4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X0B2IDFl
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 2.2.1
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

Changelog:
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.0
 * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 1160f3f2bb..a610b17140 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  6025e5dc6cddd532ff960d14e68ced5f42a1916b23a73fea6bcb437f06992eaf  sdbus-cpp-2.1.0.tar.gz
+sha256  da69a0104beb6e51415a59f1571a47beb1eacc65cc6027b250eb1cf13ff4f802  sdbus-cpp-2.2.1.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index a01bcd22c6..abe12c05b9 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.1.0
+SDBUS_CPP_VERSION = 2.2.1
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
