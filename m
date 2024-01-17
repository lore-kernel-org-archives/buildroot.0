Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095CBC47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FC242115;
	Wed, 17 Jan 2024 22:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7FC242115
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sXdSGJSo0fL; Wed, 17 Jan 2024 22:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EECB4213F;
	Wed, 17 Jan 2024 22:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EECB4213F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 086E71BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4FAA83E63
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FAA83E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTZNvHqDStMj for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:00 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F57483E61
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F57483E61
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so9674982b3a.0
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531859; x=1706136659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltLQ1sRzG6Jmrio8JOnRBrb2jEqh5ICp68FXNccVbKg=;
 b=Y3+mXFRPArGexgmDnkdDNeJbHYMFoVWcHh3JxkGr4qoeYo/nJhncjD+2szbQ2tfzUB
 8/FGsT1IVP6Xvc/GHjRP+xOz3xVTtaX1gpk/vHz7GvVr08N+4Av1f6P/XQlWlPm4DTmF
 lBHbeYZ/L0i1+GZ0HbEigWreaz2t1KmbsQuL44LeJYJT5j5ocnyuCtJU6NytVAeJRVIf
 aF12eBkps+9je14v6Bcsau1IF4t34zWDig+uMDZqte1nKun8vBBgZjZIVr34xXNwtCb1
 +XQ5ja1YhF+zdGWzNjDafeekMFEAv8SEUwhvssHAyjUkPVnNzzeaSzCmWucNXauW1Z+I
 /LyQ==
X-Gm-Message-State: AOJu0YxoYR2l6RisgISCcQjjcHS0nlCr2jQe0FX//416CdvHrc2OvHGJ
 hton7LwylcnrVO7OmoQybQGF8J2xjFTze7pwuUjyjSOGGpY=
X-Google-Smtp-Source: AGHT+IF96BjZRVpOmxr0V8PLhTV3mEfkKi9Mavh/n5LN1tk3g6Rhen/Dj74o4Ex8Am8i2Ar0hWLyKQ==
X-Received: by 2002:a05:6a20:4392:b0:19a:9a41:d73f with SMTP id
 i18-20020a056a20439200b0019a9a41d73fmr10995643pzl.86.1705531858756; 
 Wed, 17 Jan 2024 14:50:58 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:50:57 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:41 -0700
Message-ID: <20240117225049.28443-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531859; x=1706136659;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltLQ1sRzG6Jmrio8JOnRBrb2jEqh5ICp68FXNccVbKg=;
 b=gE4SnVgLAgnLNnJ6Dw8lCS4xma1kPI7EfHSYTYLZLqqoEtIhocR0kNZB2vUqLV4HIL
 zXYnuH7qqtSxgFRbXCssJvhw6UtM/GwChk7ZMhRQvxwNUYYBMOJT/TrLVYqVHUa2A/fi
 NndhnjbaJAq/FcE6nt8zboggWxHBLZPHjt9xc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gE4SnVgL
Subject: [Buildroot] [PATCH v3 02/10] package/depot-tools: bump version to
 8d14454ba4a35fd9d2483842b08815a2357ec86f
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
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 2109096901..70218e4658 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  5da23d7558975093c6a732f5743c7f224d16dd3f878a6a1b577b1b127a4098cc  depot-tools-8d14454ba4a35fd9d2483842b08815a2357ec86f-br1.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index e3b840f29a..634258ffbb 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_VERSION = 8d14454ba4a35fd9d2483842b08815a2357ec86f
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
