Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352EDC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F158A83B38;
	Sat, 15 Feb 2025 10:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tpb_EuVOy5hY; Sat, 15 Feb 2025 10:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E696383641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E696383641;
	Sat, 15 Feb 2025 10:33:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78E19DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 661A76077D
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwVjc1k_5mmz for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:33:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89512607A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89512607A6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89512607A6
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so1488475f8f.3
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739615631; x=1740220431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=io+YDN9/LGYIHY/9JQjB6ikjBy4xVNkujZ98Yw8MhLo=;
 b=Qeex9xuJageDV4Fkrk/k9Zt7eJTUPYMp/be9C08+LnW39YHDlWcwX/Oq+8TmBABVcL
 /2qAigCccdogfZmM6vjtPXC4fstFYdu2231s5xEPuPFrB+DshrHaBjjO9FtgK81Coc2x
 /KGmyBfEXeGzA8GS2oqyYlge7YvNBiWhsgKKrUyYozsq4LtC7LMep7WLO+S2Bye9W6Fm
 OAGs4zcPfL86fy97DD+a056Xr3DMjTbLrFpQI8iYHpxmsvJ7hA9RYt0aagX0hDU80O5K
 hYZU53GKcShblJ2xWkPmULu/Zk3G+eEb4bOES/Efw9sT26uVydj8GNan+B7fk3tNBgCS
 RMFg==
X-Gm-Message-State: AOJu0Yy1rkMQJB6Eq7K9epmnpPJoJ42IzWtc0pAISnudkPD+advh8h6G
 niTklXyBRyw8j+9V4IM+ggLoJwW/40uaYk6A7KGwNcmQkIjk5cqhCeA0CQ==
X-Gm-Gg: ASbGncspSo6ZHL27ZCftgXEYKw7yJoVNvpxys7uafDO1KN4KRfMZ8AjwFCYTaOJM4Dr
 w534mXQRwwBIqH95wBM+M5w7fWMaw/DA/MbYNjR7a9fyTeqBN1NEzyP1ZOdj1ssWaTN/F4HGrUQ
 vrrkfIcfhYVaTbjOIMQKjjhE092gQd+4GcITLwpEe+VjDtedqPMwWgRK1exzdEUSz6DkPatwqGX
 R/wM0HhVZ/pIQ4TFBPLMub6OKDJVwhWFr4agm/rrC+eaoK0gKgraaoNQCq9lKyEQMsgWXgGli74
 NYQ4GeKldGChmP9elL7p/XiJZA==
X-Google-Smtp-Source: AGHT+IGWacaGqyH2s1uhOpMluNBFHUJLdZTJ5O7IgJM+FFdcO85t58ppOXVzTwMN/rLMeM7qq890cA==
X-Received: by 2002:a5d:64e6:0:b0:38d:e092:3ced with SMTP id
 ffacd0b85a97d-38f33f1193cmr2947283f8f.7.1739615631157; 
 Sat, 15 Feb 2025 02:33:51 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b432asm6774941f8f.6.2025.02.15.02.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 02:33:50 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Sat, 15 Feb 2025 11:33:47 +0100
Message-ID: <9f1441b0cfb92eb66c6d379e2723d52000e35c9f.1739615626.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739615626.git.yann.morin.1998@free.fr>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739615631; x=1740220431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=io+YDN9/LGYIHY/9JQjB6ikjBy4xVNkujZ98Yw8MhLo=;
 b=hTZk0suyEZM06/Em3FSqnpvdah22c9EPkebmPJ6lSE0k9dPqcSeIK1Y79uSzLUC+35
 OHhCvkCFhb1Ywlte08de4lgWGXLUqP1quQjdMsGt/yTX9/Uw2M/QUON24AuAYD6fAUvx
 +Lk8jEzEaSkQa/gMEW/yrU6aIq+hwZeK89PiXt1j4zAagA1DDoh5NjCHS8eiWOopMfZo
 az+6oK0QAlnmMsjLLASM3Dz8c7JUvbwonBvenNdGKs707Kbp0ffDiJ1//cmOxqFkHYN0
 DVCAkXenFr8tU1zpv8dHce7bQu4qJM8HhiEnF6SleEEi+vDGcGEEAPucJS64Gmr0g2mf
 I8Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hTZk0suy
Subject: [Buildroot] [PATCH 2/4] package/docker-engine: add option to
 support catatonit as init
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

currently, docker-engine can only use tini as injected init. catatonit
as a package exists, but it does not create the symlink that would be
needed at runtime [0].

Add a choice at the docker-engine level, for which injected init to use,
bringing catatonit to the integration level of tini.

[0] that could be done in a post-build script, but that's not practical.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 Config.in.legacy                       |  9 ++++++++
 package/docker-engine/Config.in        | 32 ++++++++++++++++++++++----
 package/docker-engine/docker-engine.mk |  6 +++--
 3 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c302b73423..eaf4d708d0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+# BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT is still referenced in docker-engine
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
+	bool "docker-engine init support is now a choice"
+	select BR2_LEGACY
+	help
+	  docker-engine init support is now a choice. The original
+	  setting has been adapted; be sure to review it in the
+	  docker-engine package.
+
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop has been removed"
 	select BR2_LEGACY
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index e03ecceeff..6338eeeef1 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -48,16 +48,38 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	help
 	  Build the vfs filesystem driver for Docker.
 
-config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
+choice
 	bool "support docker-init"
+	default BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT  # legacy
+	help
+	  Support providing a minimal init process for containers.
+	  Required to use "docker run --init".
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NONE
+	bool "none"
+	help
+	  Do not support docker-init.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT
+	bool "catatonit"
+	select BR2_PACKAGE_CATATONIT # runtime
+	help
+	  Support providing a minimal init process for containers,
+	  using catatonit.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI
+	bool "tini"
 	select BR2_PACKAGE_TINI # runtime
 	help
 	  Support providing a minimal init process for containers,
-	  using tini. Required to use "docker run --init".
+	  using tini.
 
-	  This does not change the Docker engine build, the
-	  docker-init symlink is provided by the tini package
-	  itself. This option only adds the dependency.
+endchoice
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME
+	string
+	default "tini" if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI
+	default "catatonit" if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT
 
 endif
 
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7467f13b39..c39dc2b440 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -35,10 +35,12 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
 
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT),y)
+DOCKER_ENGINE_INIT_NAME = $(call qstrip,$(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME))
+ifneq ($(DOCKER_ENGINE_INIT_NAME),)
 define DOCKER_ENGINE_INIT
 	mkdir -p $(TARGET_DIR)/usr/libexec/docker
-	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
+	ln -sf ../../bin/$(DOCKER_ENGINE_INIT_NAME) \
+		$(TARGET_DIR)/usr/libexec/docker/docker-init
 endef
 DOCKER_ENGINE_POST_INSTALL_TARGET_HOOKS += DOCKER_ENGINE_INIT
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
