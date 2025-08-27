Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B46C8303F
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 07:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C21EA60DA4;
	Wed, 27 Aug 2025 07:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOQdslQwAfsb; Wed, 27 Aug 2025 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D720360D92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D720360D92;
	Wed, 27 Aug 2025 07:49:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85389B8C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 07:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BE9E40459
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 07:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RIcsEHW3ijn for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 07:49:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D68A4045C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D68A4045C
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D68A4045C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 07:49:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3c7ba0f6983so402960f8f.0
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 00:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756280971; x=1756885771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aCUPD4yB+Xa+ejG2truT5a6VilQ5pBg/gd9fKyPXFCU=;
 b=HhxUSovDh52QpZNQXd7mY+C4RY6K5EsREOjqa9viWG+3nyshVDn/+ksbWVfQzoggC3
 Pcrx2Ot6nQGhiW4g/csmpHfsxjJN9MNdEcSs9Z4+x2GNBuAAGhPDj4J+7crFYxyS3V8T
 DoYaFOldFWy9hyzvBsdC04jcCIiJvZ/cwRipFFOgEYbhMJ7olS64t/PftU9m0OOLpsGa
 qtPG3VzfDtEyDr5INCLZcjMJBQfAGr1dQ86wWH+2MERT6IbMs8pnYAbze+zaY8hA+7DC
 M7Y8FnT42ren5etzD1x5HKFlbb4u3n+72xVHnnJEgxTLITEq53/8j9ZmEXBOgxs6C56J
 avFg==
X-Gm-Message-State: AOJu0Yxmgo8XI84lk95oTLLEtGaZxKwxXRUIjWzSBnTFOE51ZtooOqS4
 ranVM0kY+sCOGRLkJePamCXi+udPmme5wcLaZ/FCLwUVzvFCrlVULXM0u8Z4yA==
X-Gm-Gg: ASbGnctpMtSUg1PIsxZbI6OUHt/JItA0/UJxUSOYak1kneXWAw9gS/Z+RNTcuMFE/ip
 YYWjLg7VNQtNp+6gZL447rEoCsukjoR2OprkznkHv9B63CPYIh9RRRHI46HHP/NCZwqHoH1A5Mm
 Wj78HNKgm8KQtsucndW57Xk+OCpU1oOcEqjzvYcxNTAXuc0Qd1pTQyLQHQVWCJn4q+m5JyotYPj
 wtHAzWxZ8LneF4acLyHoA86OfBvuGPzmYfTkcF8V9pRK3r7o8gQco2tK1FrSdhHW7/dt6WHInoZ
 b4mIyCGzezuCBIrtPIdLTu1LSPxJE8jyiQhqigESB0ghGthxiMcwKI5dVa4F1iDy3RyCxOhD70v
 JJIY0ErE4QEtjLkT7bkEGEDMrHcRhjdPAOYwnMqNGZESnMAK6cRNIT6P9V5Ke2A==
X-Google-Smtp-Source: AGHT+IElk8HnkzEPWVuyuOI81oSpB8EJDk7zrRR2W5CrCkgVznCfp5+KdHbsLRgGZ2jk9wf8cC8HqQ==
X-Received: by 2002:a05:6000:4008:b0:3c6:71c4:15c3 with SMTP id
 ffacd0b85a97d-3cbb15ca4b5mr2958661f8f.1.1756280971114; 
 Wed, 27 Aug 2025 00:49:31 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cce1724939sm1231002f8f.26.2025.08.27.00.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 00:49:30 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 27 Aug 2025 09:49:28 +0200
Message-ID: <20250827074928.2078119-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libfcgi: update to 2.4.6
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

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.6

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index 371dba8939..348b0b6867 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  92b0111a98d8636e06c128444a3d4d7a720bdd54e6ee4dd0c7b67775b1b0abff  libfcgi-2.4.5.tar.gz
+sha256  39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1  libfcgi-2.4.6.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 2348af843b..e0ef6da55c 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.5
+LIBFCGI_VERSION = 2.4.6
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
