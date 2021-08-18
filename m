Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABE1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:04:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC316104F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEC316104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A71F7405A1;
	Wed, 18 Aug 2021 19:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGBLFCe7p3ve; Wed, 18 Aug 2021 19:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488794078B;
	Wed, 18 Aug 2021 19:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4D981BF287
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94E6F405A1
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYz34jA_yK9z for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 19:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CB334078C
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 19:04:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 j12-20020a05600c1c0c00b002e6d80c902dso2430083wms.4
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vkPl8e5iJ2y+QGO1szfuZs3z6dqEMjeOtlwLhUwWiuc=;
 b=VTd139mhx0IgzoGMwMwDjzyImnm1org2qPjqzB4tJYA2nxHGPOFLmI964VsDWC1rR4
 awPfxbVdS1FmXCx4YqPTPN+gFloVMlXmc/69FdKhB4ia5EEJ8bYufrUGjAlQE7gO4ry/
 AoUTNp6TNgbLt3OMimLioOHGuc9QxQ+xBkSYZlsSNpLihNk1Cg5pNLPSl+dq+WZhkFQQ
 1p1IvBpYjCcjz7ALJO7rH2eeQ7kmXUZUoW+DfC4uAX9IcgBjCPO2S/WTA1fMYVvofK2m
 xDAfTFO6091uj3r9fs7TJ7g/cvHY3jEjhSAl7EYbGY0o1Jfx8fA586zkWOrqhAcNKAUT
 dr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vkPl8e5iJ2y+QGO1szfuZs3z6dqEMjeOtlwLhUwWiuc=;
 b=GBgzXGwhdP/jVgTpqNZA29L2FCU/zBHlrvhK5vsQBUb8164yqWfLYBOkySSI4cibcb
 5guc7+UD1knXCEDEtdNCvp8KXgDwo1rqfGJ6+O4o+7SHw9/LQ0j/S1UJP1t5x9dGMf/G
 ZPo8/cELGrbWAjl8oR0fouPQ7ttlm4JuNSUYSKviXmP93MVxoaUliM94eUK2CgluKW5g
 OXoZNDzvDYvT8yZVkEwae0GxUqyKqniBGaD04fMxFPJuWIp5z8Sfg827cwSwmwDx52s5
 K8cfZ/6dCsjFyITdXRZOX1VZ6dWWjxArQ8jAEsK2fJHay89E3rsva1+CG8iE5MeGUtS7
 B+0w==
X-Gm-Message-State: AOAM530uAaWMeDJKMiFV7OXqmR3JM0YN0ytya5YE+kZQxPi27YUxkj7s
 x/4xcxwnWU/6mEH90FqcuAxnWa3CNlPo6wtJNNw=
X-Google-Smtp-Source: ABdhPJy9aLn8ycQLNZpPpF9Pw9/YJd+0LoC7R5tzFqIvBpZfy91l/viImoxpzD0uE6PS31gUrzKExA==
X-Received: by 2002:a05:600c:2c4a:: with SMTP id
 r10mr10049653wmg.68.1629313448325; 
 Wed, 18 Aug 2021 12:04:08 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-81imx1fvyhv506mzmvr.18120a2.ip6.access.telenet.be.
 [2a02:1811:c06:d300:4108:6e3e:b367:4c97])
 by smtp.gmail.com with ESMTPSA id k26sm680679wrc.33.2021.08.18.12.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:04:07 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 21:03:45 +0200
Message-Id: <20210818190345.2081421-1-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mono: force internal libatomic-ops
 for some arm variants
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Illia Bitkov <illia.bitkov@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes:
http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/mono/Config.in |  2 +-
 package/mono/mono.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 44b8cf8581..3f26bd4092 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_MONO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBATOMIC_OPS
+	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_xscale && !BR2_arm926t
 	help
 	  An open source, cross-platform, implementation of C#
 	  and the CLR that is binary compatible with Microsoft.NET.
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 27f7886224..e697ed7ea2 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -43,8 +43,14 @@ endif
 
 MONO_DEPENDENCIES += \
 	host-mono \
-	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
-	libatomic_ops
+	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
+
+ifeq ($(BR2_xscale)$(BR2_arm926t),nn)
+MONO_DEPENDENCIES += libatomic_ops
+else
+#force use of internal libatomic-ops
+MONO_CONF_OPTS += --with-libatomic-ops=no
+endif
 
 ## Mono managed
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
