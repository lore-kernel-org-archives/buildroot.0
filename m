Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96943C5B555
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 17:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CCCF61408;
	Mon,  2 Jun 2025 17:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gscbpVAwzyV5; Mon,  2 Jun 2025 17:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19DCD600C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19DCD600C7;
	Mon,  2 Jun 2025 17:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 095BC1F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEEFF819D2
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlHkUmlzN8Hq for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 17:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21CD081AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CD081AC4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21CD081AC4
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:28:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cea01b9cso19199655e9.0
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 10:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748885298; x=1749490098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d2Oj4/XE6eNwxszjMVoDJsLYssmG90P87sNgaEZ1W+w=;
 b=nZVv01AxH2xDtUGO1pzHmyURn0uUcqs8AynhKyFPDtr0Kv5ZUj0BUDldE30bMLApHu
 dLc/DVBpru4YTlIU55arvFZ0E1hPDKl4BtG2MAh31JMnuSsgR+/mYC/yEgBMHmvbt3gF
 4ZgP/q9VAM4lUQLSO5BrIB3VR5zed1POExsiluHRxcXsdwD0vW6jdiniE79Xks9LPw26
 ktMm5d2cITX23OWahtgRJaNO/t+q77esLeqw/R5YxR09bNjLXQLcgJJfHI3Gs+hJmPhG
 4w+wBwEfpCC6qi2wkKwVaVt7UT0dp4tKixq8DDAIMD7qS0A39i05MMLPWe45JAKlkIHz
 8Mkw==
X-Gm-Message-State: AOJu0Yw81xA9DCorZ4bHkhILCnw5ggaObOceuu3C+kWTzutPZyW5terv
 3mo1v27o2wiHltBgESXp1y57ARUDVIMtFxZNuwmc8ir2YEb+B/KpJ4B0lVLrVw==
X-Gm-Gg: ASbGnctMlKRaBZtc0f1XVNh8nmB3uifaFDa1j54p34Pz8mQNbWLX5HpvMQucktAW+QG
 LddJH6FYSLJGXcP6KW2ks3Mw2Tk0o8hF93b0DN2FTFCXHIs9bUy0cfIvOPfPXIdxpsot5oQ1vwn
 NB+R8fpQhLBcztRFUYvtivixpGT/ELK7stupOxAxUjnHjNllo1ucCKv0Lw541sYZMCsR436CdaK
 idA0w91YyUXU9nMGE33iO2SA96uxPNOOx+auVF4KwfHpmHyogVN2lP1aL1T6rqyOduRAnj1zZFu
 c12YGl4FJr9GyL24D4tzTeb5ExxYRHwaqkDg+gcmOfqnwK1GVZ8fVDXtNQi4hbswpg==
X-Google-Smtp-Source: AGHT+IHDM2o+VavEn7aBPkqJN9HZZMbGke5qf6dz1wyMQvmIjQ59QRaN7rVg3zGSIBa/+Iq8bPegfg==
X-Received: by 2002:a05:600c:46cb:b0:442:e109:3032 with SMTP id
 5b1f17b1804b1-450d8867f91mr104687965e9.24.1748885297775; 
 Mon, 02 Jun 2025 10:28:17 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa21e4sm134052475e9.11.2025.06.02.10.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:28:17 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  2 Jun 2025 19:28:12 +0200
Message-ID: <20250602172812.512003-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748885298; x=1749490098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d2Oj4/XE6eNwxszjMVoDJsLYssmG90P87sNgaEZ1W+w=;
 b=b7PjHprKdYxF5NhNtqCFxicWqkGe1DWUIncgW0IuSv47CGKJGG1QqV0VpDLtMrHtjB
 fAI8qyorvqBmBP63tiaNlAWnZhYHz42W/GK/zK31fcLq8tFKwDHgUZcxwdwNsmT2XGf0
 JWZovNMslDnMuHvf9N9JOj9MVkZIq5ZzrnP+n9DuCyX/0KaKPNMo05qfwKfciIgLsKwG
 oNVts8rPDiCZeYs7+4cxC/sxMdxk+aymHxD06fgDDyS7hypPdhJ4FHe0PzToTVO3gymn
 41XOlwzgzl6u0wr8cDw/vVPnfBczhEr+nIroHrI3WeUZXmXiHgVgwq0/P5g4MWSeWxAa
 raqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b7PjHprK
Subject: [Buildroot] [PATCH 1/1] package/iputils: bump version to 20250602
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

https://github.com/iputils/iputils/releases/tag/20250602

Security release, fixes CVE-2025-47268 and CVE-2025-48964.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
At least minimal test:
bootlin-armv5-uclibc [1/6]: OK

(continue testing)

Kind regards,
Petr

 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 6baf433dcb..daa5f81a85 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20240905/sha256sums.asc
-sha256  599cda8e3f5f7ce4c612456ab1101369da8f79aa0f83c8e877290a1c7bb56010  iputils-20240905.tar.gz
+# https://github.com/iputils/iputils/releases/download/20250602/sha256sums.asc
+sha256  178f316c3f102f7c7445dee8bb851838f11214a68b3d5d4788972d8b35dcbbe5  iputils-20250602.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index ec8c24e4e0..391f0e1938 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20240905
+IPUTILS_VERSION = 20250602
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
