Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964BAC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 07:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C3FD81FC2;
	Thu,  8 Dec 2022 07:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C3FD81FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id re5PZP-k6Y0L; Thu,  8 Dec 2022 07:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFB381E57;
	Thu,  8 Dec 2022 07:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFB381E57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 683D61BF41D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FE9A400D1
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FE9A400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sw1sY364nQ15 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 07:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D55040339
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D55040339
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 07:29:00 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id n20so1930452ejh.0
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 23:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rL5OUdIWt2rXAvNnZ0Voeq6lYcS8Si2bHata2johc68=;
 b=ZLis6bYBrIFE5Z+tCGF3ZS41U35g9IxGedXuz3VWbZUM21Z+OY1UOsPaOiqtrfvsHk
 UnQjAkfi3gwHZrU6v3oILCb/HHyXerThjg0VJL4Q0gwD3vkzqhKKbH95kg95VbwDHN6x
 4Vc+YOK3F2kK/ujoIoSMx0Zhl0dVJ6PLcWNTpRlM/XJh+M0O1OpOfQobE+O9qqxZtOx9
 aoEShjiA6IQBy8XplIBjca4b2Cknmuq2YEnxzF16a/2DOPEC4uPflZ0UZPDuN+5QeIOV
 rH1fd+j54yR5tDVkOYzyVGN+OjAnkYxZ546pmuSNFFRYnLoR2zSGr3LFZ4tTSPBAKe+v
 +Fww==
X-Gm-Message-State: ANoB5pnPOd0NywtOZu0sOLQQtfrL2cypifIygjuwZ3+p8V/n8kAKKFTu
 xvk3uapvNZxhzQaC97rxBsW5Xgwt9ZgcBw==
X-Google-Smtp-Source: AA0mqf66LyO/ww9Iah1qKP7oVUQ43W+xZ6fvTudgRoakegYRxwd8B9lY1DJBCCSfJozD7niDg4w7cQ==
X-Received: by 2002:a17:906:c04d:b0:7bb:d6d5:76ea with SMTP id
 bm13-20020a170906c04d00b007bbd6d576eamr1518567ejb.67.1670484537301; 
 Wed, 07 Dec 2022 23:28:57 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 vs19-20020a170907139300b007bee745759bsm9336300ejb.20.2022.12.07.23.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 23:28:56 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 08:28:42 +0100
Message-Id: <20221208072843.6806-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rL5OUdIWt2rXAvNnZ0Voeq6lYcS8Si2bHata2johc68=;
 b=FOeUj5k89idigZrPeIlDimHo2/H+zouzBLOVLT0K0Ayj6LfWpeQS1LUf0o8c3nTpHp
 /hR7pGNN93WWoFWSoHVMHhwHwHECgYTEZe9Lw3SACpEo2cMfXoVzK19m6j/Hqzm/+dWq
 Qa8LH1ZvRkxcK6sGbDeMiSsDiHKkPWxOKRZNjw87uUvzJuQksQehw0JASphmqWaTVqEL
 Re+NFKlS+PQeeK6xJ1A2XRj7R2AHPet5L6Rmf8EPxdMApU8AVrrGryByH2X8+ScD7Pkz
 REjc6akRgZkKafBpiCYvY4ZbT8vad0lb5Sriii2/deb5Fuol8BSt5woLYgeJLaNSIX0q
 3TQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FOeUj5k8
Subject: [Buildroot] [PATCH 1/3] package/libmbim: bump version to 1.28.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index e98c53b1c9..2e2b46fcdb 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  58cd9ab1a2af9bbf40f9c02d3152a96baaa34a5f66a4289e928c7cf1c9584abb  libmbim-1.26.4.tar.gz
+sha256  cf74682c56f4c34ca4aee86de3b8c425a89fc2c0782052815295faf6a8e0a9fb  libmbim-1.28.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 1e2b1771eb..1c12b82298 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.26.4
+LIBMBIM_VERSION = 1.28.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
