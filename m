Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78AFC4706F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 07:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24DEF60BB4;
	Thu,  4 Jan 2024 07:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24DEF60BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujTfG7Xk5gXz; Thu,  4 Jan 2024 07:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7D360B42;
	Thu,  4 Jan 2024 07:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7D360B42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB0A51BF3DF
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 07:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFCA940B64
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 07:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFCA940B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOr1gl3HAyyb for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 07:00:36 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60BA640530
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 07:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BA640530
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so17795266b.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 23:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704351633; x=1704956433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQu16FoRFx2CqRqpGRjFT/2c0fYUbqxxKRFArqGjArs=;
 b=lvljqjLt6kFIQLP4v3PRkivgcUYPkv8hvv9vCNnT42GD05t7Fa3ztYy5AocBSa//Fd
 uXWQowTTOpuJsI40LNsJaF/b6y/M87CWTfEkBJiYf6tJglUVXGHyklpNqKhp16BUIQU5
 q55YS6dumENzxZDeexE2pQkveE4Rk/9u2J5SeZ6Q6iC7e1ISrkIAt4U3WtYYphDbAuw2
 QRyNEdI/tFevREOGviqiNZidwiWWv3Bm7IeGCM9xhWOVFJ1oCvFhzUrMr8ad+yCaz846
 nstKNfaV+vGVXl5181Tcw0kXg/pUz4ai7ct1B+EzNk9b8DXsx57pbx7/na71Ws4a5yAR
 xx0g==
X-Gm-Message-State: AOJu0YxnEmf6sNXxCR74ZIxx1EBPdaVwj8hjIp+lIxDbCmPjcaI5VDtm
 Lnlm7woP3AiGniFxWiTfQqtqNp0TZX4THQ==
X-Google-Smtp-Source: AGHT+IGvAECdsPRTdzEhuVpAfMhvDwQA8Z9A4cfN/Fd5nFpZuOnN7NsVmmE2eX3i4YudkX1pp5+Fcw==
X-Received: by 2002:a17:906:1743:b0:a28:b679:7248 with SMTP id
 d3-20020a170906174300b00a28b6797248mr41691eje.62.1704351633014; 
 Wed, 03 Jan 2024 23:00:33 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170907910d00b00a26a63346ddsm12975609ejq.87.2024.01.03.23.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:00:31 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jan 2024 08:00:25 +0100
Message-Id: <20240104070024.3034-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704351633; x=1704956433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zQu16FoRFx2CqRqpGRjFT/2c0fYUbqxxKRFArqGjArs=;
 b=nlhTVsGCBVA9a5ZGotdm/YTQTOf2QFsDfnbjzIKE14S4DxhPkEK0xE5pfc6NfA2BFm
 lqErtb9MPjnkdKhKPI9+1oNKzXi1BiFThciBo45UjDCkky6f4buUpsI7j6zwjEyVi1BP
 b9U9dIFbDTgJVU4mlpIlBjuCZrM4JsTru0Bl8dR6b+z8qe4IwXqCTF/p7NbmuquQuMRN
 RVDnZXnqR1RLjJjfz3fyc0c2rtgqU6ogErVMQQUGl0OdDVupubhuSzspn+drksVDnlI8
 40MjqimUfzncTQNpRpWuZNFC0zCiadLGiEUdw7PhQjoZLVGv0vLEwqzRaMEN7ed3kqH7
 pAjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nlhTVsGC
Subject: [Buildroot] [PATCH] package/rauc: bump version to 1.11
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/rauc/rauc/releases/tag/v1.11

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 38fea45b8a..8de309f8c7 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aa99164c5f54fd29b5c8456221b51f92c900884af66de3e1b7f15a25b7db98a7  rauc-1.10.1.tar.xz
+sha256  a28f415c580390dd9e65016a5d90a63ee1cfd7e1b3e864cbb13cb3ac3513391f  rauc-1.11.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 4211abdcc4..aff5ead281 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.10.1
+RAUC_VERSION = 1.11
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
