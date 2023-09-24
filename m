Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0650CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7048060792;
	Sun, 24 Sep 2023 12:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7048060792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epnsUi1xb4x6; Sun, 24 Sep 2023 12:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24D160671;
	Sun, 24 Sep 2023 12:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24D160671
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 137211BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFEB241752
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFEB241752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnDpzSz2oZoI for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:15:45 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF4B141750
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4B141750
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32003aae100so4063265f8f.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695557742; x=1696162542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3OmXxrJVoxK+o2ptuUKBIKETxg75AD43+7P+SgmTkc=;
 b=cGtJbmfI+p4oKVNKuzZ3b4h5KlG8VzyGqyUpuB9UWciZR2/RNjJQh3ha1VhNxuUN0Z
 ifZiFpkE+hB88YX9j7QGZgdF7q93gCV7p5bc7jAOYwXO6cdddhG2YFG0MnTTTeQ0r7pQ
 dJvz52ptrFsgEEk7sC7YkFfUoP0jXYQwi9kXJZoFkZXQARnJl9q0ZKI1vHF7qT3ALfCL
 ZyEG8b8byLajGwLsQjuo2SxLOIA1+WRQLmfo8W6889TeNirDBuCXt0XyrU4w28Kz4tlY
 UPKE0YqwHEaz05Nt8NMl/IHwr+acO6H4x/ZSuo27BT8n+Yjy36us16E0tYUJBwdtzpJk
 8zeg==
X-Gm-Message-State: AOJu0Yy6L3BafAAWoIoRJa4Z/ocHLh++1jm0GW9FpWpjB+lp6gAMYCiE
 HN2/aRYFEEfZzlsGN59VL5Fbl6Z1yAI=
X-Google-Smtp-Source: AGHT+IGOSBwO4FPbgxR/QsY5XhjnKIYFKHoEAdQRxsmLkWHlE3yRj8mwz85RJdduMIOhqKDJIsRnrQ==
X-Received: by 2002:a5d:4fc9:0:b0:320:bc4:4806 with SMTP id
 h9-20020a5d4fc9000000b003200bc44806mr3347882wrw.16.1695557742276; 
 Sun, 24 Sep 2023 05:15:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b12-20020adff90c000000b0031fb91f23e9sm9116711wrr.43.2023.09.24.05.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:15:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:15:40 +0200
Message-Id: <20230924121540.119140-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695557742; x=1696162542; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m3OmXxrJVoxK+o2ptuUKBIKETxg75AD43+7P+SgmTkc=;
 b=NkoipDCA4YQ68vJju44VbhIV3la39CHAcuIDrCJyC122cBShy658NQIuFcU8RwpLlg
 TwFRxNgAMDS1SbaIt0QSmxAQYLGwKjIIqn9ahDz3kWv2Iv7gZ06VgK3+qoC45lcWccd/
 oriS2h+yhBJPMvleE8Xkpt6GLmnxR2PWC1Cs9ws7d8F0phY/3j4CK5jwKiyMtZNCxsiC
 hK3qnGVQC/PSmcIclvp45WIsPVGYrzBXEsKRAO3gNJ4P3+cTT/Rg9VK/U+iSwVxIjFdv
 xyD9p3IwKS0s6eRqBYcQ5o3jB1bF3ikBsgh1hKvDRV+T5Ryu9dcBSuOd8t/5xr8WMexp
 v5iA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NkoipDCA
Subject: [Buildroot] [PATCH 1/1] package/openresolv: bump to version 3.13.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/NetworkConfiguration/openresolv/compare/v3.12.0...v3.13.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openresolv/openresolv.hash | 2 +-
 package/openresolv/openresolv.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openresolv/openresolv.hash b/package/openresolv/openresolv.hash
index 7a5fb0e140..c32b856de9 100644
--- a/package/openresolv/openresolv.hash
+++ b/package/openresolv/openresolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96b573e26d145f208d3758c2cd6fbf824b01005fc4cb7cedbdae29b3a3c8cb02  openresolv-3.12.0.tar.gz
+sha256  36b5bcbe257a940c884f0d74321a47407baabab9e265e38859851c8311f6f0b0  openresolv-3.13.2.tar.xz
 sha256  384740bf5e19e7628d20f4dcc22925062fdc6020e9a6f074e567d4d797be57a0  LICENSE
diff --git a/package/openresolv/openresolv.mk b/package/openresolv/openresolv.mk
index 3857ab833d..176f6dab3a 100644
--- a/package/openresolv/openresolv.mk
+++ b/package/openresolv/openresolv.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-OPENRESOLV_VERSION = 3.12.0
-OPENRESOLV_SITE = $(call github,rsmarples,openresolv,openresolv-$(OPENRESOLV_VERSION))
+OPENRESOLV_VERSION = 3.13.2
+OPENRESOLV_SITE = https://github.com/rsmarples/openresolv/releases/download/v$(OPENRESOLV_VERSION)
+OPENRESOLV_SOURCE = openresolv-$(OPENRESOLV_VERSION).tar.xz
 OPENRESOLV_LICENSE = BSD-2-Clause
 OPENRESOLV_LICENSE_FILES = LICENSE
 OPENRESOLV_CPE_ID_VENDOR = openresolv_project
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
