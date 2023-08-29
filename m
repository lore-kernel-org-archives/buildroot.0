Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CE0C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 22:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CAEF60DB7;
	Tue, 29 Aug 2023 22:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CAEF60DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M__4aOAhhMo5; Tue, 29 Aug 2023 22:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546B360AD2;
	Tue, 29 Aug 2023 22:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 546B360AD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 116B01BF577
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 22:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFCBE80ACB
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 22:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFCBE80ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzuzf-nJnLau for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 22:08:31 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A420081D18
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 22:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A420081D18
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-500bbe3ef0eso300015e87.1
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 15:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693346908; x=1693951708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKw3l7PE5XhNazpgfpTuIynQfMfRBS6f+VDu+R7GvvQ=;
 b=iOfCpQi5+Fras2/Oqqo4ZgsdWzQu68XSAOuE2jnvHd5y0NMtckEKr2JFWK75UzlXl1
 sx37Hl9aMKbRLR2odoC3PnoWnAIUX07su23uBl82Zhoaek7uraoWlCZPbM7sfKhAUmLJ
 Ae2fkCUTxlEtjTmCX3ePn3OemCiYt2+/NKJDuXg6G5oVk4ijjh31s7u9MFxR8ooOnw7o
 SwsMv9X5y8IPI7cZ1Mwwxw67+Nj1sCA8Has31yOM1Z0q6Z+3gS6LVHDYthWiShjyNvv+
 RdWB+uXBsAGReuKXAmYlVwhd3oS5DBtGQWNXU/u2FOxFUJZcwvWPjW/Xz98E2BbXVfaL
 55BA==
X-Gm-Message-State: AOJu0YwJyINSHuGfK2ITyLgiVkdXdq7vp4NbHNCRw49yjXPYhzSKc9ED
 OgDBLydLbkTywfRS3/z03IYMLDJcA8jUXQ==
X-Google-Smtp-Source: AGHT+IGt38FFbLXSz85uWCgDux/fpvDWOk3FgpLpqia41aIh4y0FFsOOSgYeCx3QtFG9LGkLTcxgAg==
X-Received: by 2002:a05:6512:398c:b0:500:b09f:eb3d with SMTP id
 j12-20020a056512398c00b00500b09feb3dmr1478685lfu.30.1693346907753; 
 Tue, 29 Aug 2023 15:08:27 -0700 (PDT)
Received: from nibiru.lan ([109.252.101.181]) by smtp.gmail.com with ESMTPSA id
 m1-20020ac24241000000b004fdc0e37ecfsm2118470lfl.227.2023.08.29.15.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 15:08:27 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 01:07:34 +0300
Message-ID: <20230829220734.414550-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829233133.29a69227@windsurf>
References: <20230829233133.29a69227@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693346908; x=1693951708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKw3l7PE5XhNazpgfpTuIynQfMfRBS6f+VDu+R7GvvQ=;
 b=p90/chGakg5v8huBStRR2grJOtfn92cq3kSd7zuG3naAY5xf3zKBeiNye1mPJIqw9M
 OlU1eyWjTqLOQZkjpv13REtHJ+KlqrIiDq5OrR0a2RpERd8o7mHntzDR2liEIKwY1iX/
 svwh4r56TRjkq6WqCQhOfOOK4UZgLt1F45Ilq1ERjpzeuU0SQypEvjxxF4owdSEKHqLt
 FHc+apWVAijuWY/gxfJ+a4EyTjN3deNnv3tkR7RYXwg1jgoWDL24POCn7isj9Erlvy17
 uScC6q3oIjpHx9/9DQhgQgQTr0GqJhbUg4brTr16xIOqCZencDHTvV9k6GyUW31ETxMb
 qsyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p90/chGa
Subject: [Buildroot] [PATCH v2] package/sdbus-cpp: bump to version 1.3.0
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.3.0

A trailing whitespace was removed in the COPYING-LGPL-Exception file,
so the hash differs.
https://github.com/Kistler-Group/sdbus-cpp/commit/dcd9d46b9c5e5011dc7170e9d081bcf80096fd15

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>

---
Changes v1 -> v2:
  - updated COPYING-LGPL-Exception hash

---
 package/sdbus-cpp/sdbus-cpp.hash | 4 ++--
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 169fad2807..f5fc8d6868 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7f7231904abb6a996b8c18ddc5fb50078ef5dff5191649abf9f127aff41d24e9  v1.2.0.tar.gz
+sha256  d44f59abdd64d8f1ca3af7db58bc6518cb081fc9ff16285c3d75a68f5c073d10  v1.3.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
-sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
+sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 0e8d74cfcd..52e5c50cd2 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.2.0
+SDBUS_CPP_VERSION = 1.3.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
