Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A4DCAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 16:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58C460AE8;
	Sun, 21 Sep 2025 16:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q4ljtb4nVJQ; Sun, 21 Sep 2025 16:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D122960AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D122960AD9;
	Sun, 21 Sep 2025 16:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCC1D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D926812E3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zezDZZIvQ1gx for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 16:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F61681587
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F61681587
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F61681587
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 16:18:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-62fd0d29e2bso3028834a12.1
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 09:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758471519; x=1759076319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NcaG51DTLVrksbbrlPxL9avBTAxL77xMA/kg5oIeg4s=;
 b=u1dsswchcGZg/qQ86KfTQN9l9NNiaeS9w72jb1PQsheJ5Ev31PzlcObLbcvXMnXvjH
 tTVkqNxSeZkN0dYTyTDU6tJ1reeo6eMXCettt0ywuYWxhHY49kXXcGxpRG0c3ScMJFgA
 DaZXS9AWH9iuCpQqHn8mQdsUWwZjlnSvVbtDlmeTqG3fi2C4rv5/I9k7kH+aX9ckUzBU
 6ZMAjJLj8GU1oGoIz1HtutpK5eIuTiTVZEy/RpZGcQJU+g4VzBkeE4cuD6aqCPDHvJu6
 D+zrcfQiN2S2D8PtOkr4ejWVDFc0iauEWVkThKuUXastSBislciYLke7wJnF2ohAe44W
 SDOg==
X-Gm-Message-State: AOJu0Yzx7oAivI930/dUyKwnUmxmCRgAsUQnobQyPY08X1pKDjKJ4nq5
 wa1Pm6w3yaZvSgcaeNUTcBPl87TRL5C60fq62P0kXfw5VL5/PivtUvTMJM0NyWHK6qE=
X-Gm-Gg: ASbGnctnLbkCYXiU9lBHrxojpLRldNNaWH4IvrSiSgEuppbmkxIQFXEVotpHex2rWFs
 LAMMfX/nMmpEN5qY33zL9tGDD/Vtr6qAvcKKfXX7c93nvyE1NpDWQyOj5MiiNVzOA7NUz3wRmQ8
 Zyh+2NRcQ19ShGqwtdqOhl3CQMmuYlq2urz89PbcBJda0xIn1io9MoyeEf7hdKv1Al6JA9FCP5V
 9X4Zx2PgfJNw7bCMzjXN5MCP9Ue4JdXhR3xXMhw2uJjx5up8dc1MpsBTbYJ6bbrEMo7DAKODHPD
 li+E+YHXy55HvzBV1CQJxb8aBIwK3ep3KY+UtGvfAxDLs7kXT03DGUwRWo/XSGowPdnMRqjXVW7
 an1H4ayI/znPI
X-Google-Smtp-Source: AGHT+IF80Iry9ZuyTy6IYtZg4o1SetKpjzb+1PZM6PozRmQU0QqZETfT7CdEpXPLwfpfVyVqWHyHug==
X-Received: by 2002:a05:6402:a0c2:b0:62d:cc47:cd69 with SMTP id
 4fb4d7f45d1cf-62fc0a90f60mr9088062a12.34.1758471518809; 
 Sun, 21 Sep 2025 09:18:38 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6300fd080b2sm3938245a12.46.2025.09.21.09.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 09:18:38 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 21 Sep 2025 18:17:47 +0000
Message-ID: <20250921181748.416113-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758471519; x=1759076319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NcaG51DTLVrksbbrlPxL9avBTAxL77xMA/kg5oIeg4s=;
 b=TM23ZH3GS26kl4GoIWSU1cuhFaAmw8uZTO5pfO2rmbLvvaRvq9M9QRSNbWKNL5AR3f
 l8cpgR+1w/TmA4bQ7sygoPWtPmDQo3LcrXi9B1nh2bqEcf4cWLYx6jAwABBj4JGgnol3
 NwO/nwjc2tdiCum4QyYXc6NTTAHbTlfV5544rSDktY6kIdiCyXR189TdCqAZ5Yuku2GG
 hHIeAxn/w4Bb0+ZgaWQZiRx6qSTiJvp9N8LbWnFNAB5RBeHbg1RHOa5gp7SeaYMPX4Wk
 iqRb+Qv8e1E11j8Zs+1OInDurzoFE6VWvUbBYKB1zcGEv4CkCIJA+03hg6AVpuIgjapm
 dLjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TM23ZH3G
Subject: [Buildroot] [PATCH v1 1/2] package/wlroots: bump to version 0.19.0
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
https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 68b5dbd6d2..77d5c4552b 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.18.2/downloads/wlroots-0.18.2.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0/downloads/wlroots-0.19.0.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  cf776c169169f279808d9eabc6583f484338dcd454c966a285ff178c88c105d4  wlroots-0.18.2.tar.gz
+sha256  aefb0fe2633b0aad1d66123b2f41afab004fb625e2a7790492cdd39a805cac91  wlroots-0.19.0.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 81f76fcdc7..689662f536 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.18.2
+WLROOTS_VERSION = 0.19.0
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
