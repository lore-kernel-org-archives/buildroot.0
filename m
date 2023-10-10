Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC77BCD8CA9
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 17:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D6C6141F;
	Tue, 10 Oct 2023 17:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D6C6141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nk0w1xjuMa3P; Tue, 10 Oct 2023 17:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4310861438;
	Tue, 10 Oct 2023 17:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4310861438
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1E9D1BF94D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53D7B40C3F
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 17:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D7B40C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3o2UKFUFshC for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 17:01:50 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6512B41576
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 17:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6512B41576
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b98a699f45so998958266b.3
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696957308; x=1697562108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbcHI0vnOn9hjGOvR9DJZarWgifqB3Q9m9A4w7OQheo=;
 b=rQyLhA2NYkXjUMNAGqTVQG5AyEzExQEhi8B+e/YTdWZ93yLBiYlYaBKQaTVbt8vEd0
 SZ8POXMyD7ERqMUXKFvMftqR4wRnXb5UlBKpAryU5nUQA0hOsQK8gaYOXcWTllcZzaTx
 XM3pbrOTl++LTQ/GGsS0100gtCaehTCHzCM2M4Hapo5qNjQAStBU5uU41oCe4GRz8fJ+
 nX2w9XQJqVw4ONIv3zna8cLGhzNjx2RyuDZRDiYSWZfd0KBq/zlwY0slJn/AdzawwkYy
 knueSixIqjQoxoucfRkJ+jFXRoO6fViAJ9pdNhn3/J6YNVSzV07h0jd7D7VdhyhQzBJX
 nHKg==
X-Gm-Message-State: AOJu0YyGe6e4/vAmoPaQFmksNdazkdUlSAGGfCN23QSQzhOyMLMyGhZ8
 DMjquRGwTZ8G6kQJuunRwziu6Lr4KyoueLLpBn1evA==
X-Google-Smtp-Source: AGHT+IHhb48jMxy5aQgFt87O8oRdf88SWAL/bYAg9rbjFs5uWZcRmgt+odjeRBsTviGOd+OnUJDuQg==
X-Received: by 2002:a17:906:20ce:b0:9ae:3210:22fd with SMTP id
 c14-20020a17090620ce00b009ae321022fdmr16963712ejc.48.1696957307958; 
 Tue, 10 Oct 2023 10:01:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 ca9-20020a170906a3c900b009ae587ce128sm8651107ejb.216.2023.10.10.10.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:01:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 19:01:27 +0200
Message-ID: <20231010170133.2981698-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
References: <20231010170133.2981698-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696957308; x=1697562108;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbcHI0vnOn9hjGOvR9DJZarWgifqB3Q9m9A4w7OQheo=;
 b=oI4pSMtAGyk7MWScfufq1vAc7tPbr/xvrTY6ftVn0v52bdM1gXtkgqsyXuqULdaJ8X
 zdwRAFoLbg8iD//HBMBhvaKcacMscuuhdMMVhAXT1wOgL8Pj4Pipqw+vnvDRkqrPTIw2
 wahVMFbxX1R3nWnslEPy16LgJNHMws0F5za3U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oI4pSMtA
Subject: [Buildroot] [PATCH 3/9] package/mono: enable selinux module
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
 package/mono/mono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index b88f2b379e..aead85bac0 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -7,6 +7,7 @@
 MONO_VERSION = 6.12.0.182
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
+MONO_SELINUX_MODULES = mono
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
 MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
