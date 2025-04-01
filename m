Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8530C36014
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 16:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F3BC847CF;
	Tue,  1 Apr 2025 16:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qQzBq9Nqgmc; Tue,  1 Apr 2025 16:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC7BC847D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC7BC847D4;
	Tue,  1 Apr 2025 16:21:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4693F17E
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 16:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D156E608CE
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 16:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0J-bURG6jH7 for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 16:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A1EA360600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EA360600
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1EA360600
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 16:21:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso1172893f8f.1
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 09:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743524472; x=1744129272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZ+DTbLyUgLpfMp0ODeFz3he9TV+PkxSwziaqUxkX2g=;
 b=fZ93BDgRJdA9FhjVST2dLJUAr1IDdSXcVtRV2f7Y5wF6lGtQ7WABEG0w+aFcW89Ii1
 PNEH0Ubncgro8XZquCIUzaS1vH0h38qAPbAWtvrwlLY7LIGpRYprhkBqItDWWjzFa3UL
 ktlh0cY9dQMkXb5H9tHoFM+3h5dmStR8rpOVAjcBYC6OYw4T1OWRDJs0Z1j6QiiTTn4x
 AJ6DVbSDlDNYA6wQS5zO/rXdalnPuWlqOCVEOznkiSAY2lEh8c4If6OYR/v7oLDZwlZN
 vYdh5D24MicaDIZL9fMkCSeQbJ+8T2HBE3bJDmK46vBZvPhsuCWq2zPOsqCw6sOkfXPb
 LjWQ==
X-Gm-Message-State: AOJu0YxGUMxETdCIPGsrlH8oP/HYnVX7wVT7j8lJgx5S7Pwi4RoCSJxk
 v4IAawIGZaGW3gAaaBnbrczFHYINUBCdIi4aG1OQUtMoptS3G73yB6LWLDCvgIg8meMpYIRwrFQ
 C
X-Gm-Gg: ASbGncvNt/HMrkvvlFxj2RD1hGx/dc+8P9lTspM+Zu8nFlXrkTr6h4T3PheaYsJ5wpP
 Unp1avifNqZ/IC7jS8UIhEMrn6mYubOZMfVgLU6ovQck0smu5ytBdRnru1YzQbwtQ0tCrANZG3B
 5uFRMQ6nFoiA6IKnO06dmqjgoN8CCOl5VTg5jEmD7uou1l3tk/miMHhCTnMgN/sk2XPx35V0KFv
 9RWZea8FVMfZQPPFDu4pCmnT5hbRmVwCdB/Wi+xyGtq5w7KTCIXdsrNPiI3MQpgSyfx6iVzbWbh
 yLVP/cFrb9TjYBZPZQ3GnAqh99izKZbrnv14yNaDXqsYrTcdWQkiWiHL8XhRQoQ3KLfLm1g2I4n
 NuW3Qmih8Ug==
X-Google-Smtp-Source: AGHT+IGo4rk4o9VbLzS247DUYfYAm4dBWh0KxESWRgNhYftEdsF1sjp1t0dD6ajYo8lwZDgJcwOO8Q==
X-Received: by 2002:a5d:64c3:0:b0:391:2a79:a110 with SMTP id
 ffacd0b85a97d-39c27f0ce39mr520413f8f.29.1743524472485; 
 Tue, 01 Apr 2025 09:21:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e393sm14720269f8f.72.2025.04.01.09.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 09:21:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue,  1 Apr 2025 18:21:09 +0200
Message-ID: <20250401162109.4027248-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743524472; x=1744129272;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vZ+DTbLyUgLpfMp0ODeFz3he9TV+PkxSwziaqUxkX2g=;
 b=VI1KDpiyoF+3x/sSC+cCOydgBTuXXM/4xeo+czRz1Y7bsryyTgNk3wkowH1aRz9f89
 v2+w0C8bfrvaURHutRcyUe2ipSpDdhLhjT3bqGDpdcqQSYqKyrZ+KkWhcqDLa26yYCtY
 s7cWYD9eY6QYCUjfe7jq6ciyfXV0dFN7vbFyQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VI1KDpiy
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 14.4.1
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 734d0c6db97d..3161d2df8797 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  023242fd59071d98c75fb015fd3293c921132dc39bf46d221d4b059aae8d79f4  armadillo-14.4.0.tar.xz
+sha256  26ce272bfdc8246c278e6f8cfa53777a1efb14ef196e88082fee05da1a463491  armadillo-14.4.1.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 704199ff9148..c41e60625e2f 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.4.0
+ARMADILLO_VERSION = 14.4.1
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
