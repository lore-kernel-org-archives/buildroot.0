Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72C0C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 22:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7367060A69;
	Mon, 25 Mar 2024 22:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVqdS4OESqir; Mon, 25 Mar 2024 22:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE8EF60A3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8EF60A3B;
	Mon, 25 Mar 2024 22:35:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D85E01BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D204940551
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 22:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZalXEJQxXgM for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 22:34:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E284040721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E284040721
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E284040721
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 22:34:46 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1dff837d674so38325085ad.3
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 15:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711406085; x=1712010885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjD4fipgzXEytUzMj1RpWqlyCczBIqc0RDqUDTwu5nQ=;
 b=XFyBPbzNu41yWgvQtwGyp9gXJRVZhsjPw4AH9C1dbWvs5Ssm8Uozo/cwPiSs7YbkwJ
 q8+CxqV+JVKy1QCtNjnB1sQkwBbOKNU/z16BWkTPUD9o2S3RwBHo9XFwjlg4/8pUqLFP
 6KExE4BFxH0A6MyRliF7j8lSM5DAt77t9AqdbQY0Q8m+iVEtN00lyc76CGmzbTO+Zf0o
 /i38SexNtZt2BaposiQGSX1UnJP3XxlhA0cblDHiB/8e+wCFqDuwyJhIqR3MNtm8L8u9
 F74x+TWbpzUw2DKdU8X8mQFDwbBifwxNmFcURksRySa6RjIDg0dedjjKsgoNEJNvf0Eb
 fWTw==
X-Gm-Message-State: AOJu0YxVAq8ILAGuqJc7XSRSIystaJ1gzt+Y4buTRrj1LGPr7vXP3J2C
 p1aWz7JEY1r4Rz+XpTT1fRnaaT26xFQ6waQiO0FEJY+WklakBjeYeGmBKSCIMeOCbHHUQOEhp7d
 a
X-Google-Smtp-Source: AGHT+IFR8ypsJa07qqHQE6SIkXjfa4DHdjTrqpn4YkYTXGwm0IbfZsrl9RwxmKdOIOwRMmw0RBPNqw==
X-Received: by 2002:a17:902:7002:b0:1e0:a97:90bc with SMTP id
 y2-20020a170902700200b001e00a9790bcmr6679492plk.60.1711406085440; 
 Mon, 25 Mar 2024 15:34:45 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a170902f54a00b001dd7a97a266sm5245323plf.282.2024.03.25.15.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 15:34:45 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 16:34:22 -0600
Message-ID: <20240325223424.108702-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711406085; x=1712010885;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjD4fipgzXEytUzMj1RpWqlyCczBIqc0RDqUDTwu5nQ=;
 b=FYc9Nij6bBfjLGSwqAnL+5zSRm/oCKNVTuW1FV/TSxA74wpFao9PIpV7aOBxLFftYB
 yWbok5WlpjQq8z+Ij4Zejy+NmJBdWnBG0ZoHr/lHDsX4Rogmc3IuTynnS9lxlPnFJf3a
 /DIN9OT3vxlLqrHjTO/8WZ4YK5JGQGFILZZgE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FYc9Nij6
Subject: [Buildroot] [PATCH v2 11/13] package/flutter-sdk-bin: bump version
 to 3.19.4
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 48c9c7d7e3..1102c50cc6 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7cb12032cf615a92a7bc9042100f3f2af62df7df3ca3bee27f4b153fe218b239  flutter_linux_3.16.8-stable.tar.xz
+sha256  66adfe6b6559a2e2f1fdbf89c938d0af53add3860c854c79dbbd5452f5d2290a  flutter_linux_3.19.4-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 0d9a44596d..f8453c3090 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.16.8
+FLUTTER_SDK_BIN_VERSION = 3.19.4
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
