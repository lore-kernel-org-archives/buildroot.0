Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD2C021A4
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F488419CB;
	Sat, 15 Feb 2025 10:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jy1J25BEftHi; Sat, 15 Feb 2025 10:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52229416FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52229416FA;
	Sat, 15 Feb 2025 10:33:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36D0772
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A65F419DC
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25nXTuEA2sz7 for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:33:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE1AC416A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE1AC416A4
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE1AC416A4
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f325dd9e6so445833f8f.1
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739615631; x=1740220431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JgDz9i/HeHw56nVrGbI79EsMVxDPuizbHN0CSq6Rbk4=;
 b=KQEVI6Xq+yUYgJKn4Gq4XbiOnmS9N4A1nXWc3rF8NHLn2xdqkYIFtTJIJB0zB+vCVi
 rtPKTL5KrOqZhaV0PPJ/52WtOjR7WPJuIx+EOUdAoeyFLl2nBhEmSrlQyflgHuSA5t3J
 Asp9xdRTr66IsTN6KPrter/cq4Mzp8zwtT7iAD3TuFpY4iuxomJskWXB2k91wIoJidvp
 tloeZ3LGweomfbdiQligbxI2MzFe3vpp7bFNGwit7Dnm1uLULpZOQ/Con2qyv6BM0pDl
 SdGb4fANL4018lJd2MBv21FqGam1zn9V0dFtjb6jaXXSe8bjJufhYF1Nbxr4forGLPLP
 qByQ==
X-Gm-Message-State: AOJu0YyM6syCY0op4agq4713282wPr4qod+oIu0z/k5XmuSSyLO+84Ou
 aOK52eSABlTktLjqKpUK7aYOReQ3pVKILED9UHcICo8FMA2W+h1/055zPw==
X-Gm-Gg: ASbGnctA5mXclPUX+M/YFgMK+sUAco39QRfxUmuqONydNgh/Tv++h9ACYov0Ggl54Dv
 BzE3TUGPCMTM6yQpk/L5lOafeRflEKlkdLp3GZFGBB5YAncfC72fGTD7DFdiBsfMAybpy/w20aI
 D5aNoKAfIUDqbT9+hW3ZMywOkHqOEzcPWhQQqkUTj2lYcn/arG/w0zt2za3FWDlHYsQ4dUfSfIX
 1sHIn2GcSNALQTZGD23HJCBEP9PjvApyExJoCgU5kcj1rrBGWsedul6PlJNTOKRDxWBMQ8KXgVX
 7ko/uzOWR6PIJ9FjFC1DTCJEjw==
X-Google-Smtp-Source: AGHT+IEiXgdRU9chuWdtkvJZ4Vx32P/Qa2mbqhgxv9tD6ZczJX+kAtnAFystieqgaoFzNoMaQif8kg==
X-Received: by 2002:a5d:6d0c:0:b0:38d:d613:9b91 with SMTP id
 ffacd0b85a97d-38f33f68441mr3111500f8f.51.1739615630636; 
 Sat, 15 Feb 2025 02:33:50 -0800 (PST)
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
Date: Sat, 15 Feb 2025 11:33:46 +0100
Message-ID: <6f7da99f22b412afc8f202c8b8053e8fec0da9e7.1739615626.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739615626.git.yann.morin.1998@free.fr>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739615631; x=1740220431; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgDz9i/HeHw56nVrGbI79EsMVxDPuizbHN0CSq6Rbk4=;
 b=HO14GyB2PDARkZ5huRBUYsDBx7Zx17BBc7cKAZyCpQEUSGmVTRagmqChGE2e7v8tuT
 qg3kofmKOy1ZH9I0lxDGIxa3f035jT0AVejlMJ8REnqkH1zYVMWlqzXSRHjPNOnXOzyY
 1CdzyKqQ5ye482VhrRfzr6t1DgRVXjBTb+oEsTwtdG4anguaG5TylY/2sxojZDKbYwse
 /mdOfa9ws69fHpbbx940+skuKenMgOnSPsoJCGQhllP5QM12N/VMtBYABSwKMth1T3tX
 9qbaUiSlY+yDDJMAhFOxhIL6sWts+d4ug1qmMOouiwq8d1+dY2RkDM3i8IO2nOl0wMVN
 YX5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HO14GyB2
Subject: [Buildroot] [PATCH 1/4] package/docker-engine: carry the tini init
 symlink
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

tini can be used standalone, not just as an init injected by docker.
As such, creating the docker-engine's init symlink does not belong to
tini itself, but to docker-engine.

This will also help later, when we allow docker-engine to use another
init alternative, catatonit (already paclkaged in Buildroot, but not
integrated with docker).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/docker-engine/docker-engine.mk | 8 ++++++++
 package/tini/tini.mk                   | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ba4e7a4ae0..7467f13b39 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -35,6 +35,14 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
 
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT),y)
+define DOCKER_ENGINE_INIT
+	mkdir -p $(TARGET_DIR)/usr/libexec/docker
+	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
+endef
+DOCKER_ENGINE_POST_INSTALL_TARGET_HOOKS += DOCKER_ENGINE_INIT
+endif
+
 ifneq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_TAGS += exclude_graphdriver_btrfs
 endif
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 83e86237d4..c195c69023 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -31,8 +31,6 @@ endef
 
 define TINI_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
-	mkdir -p $(TARGET_DIR)/usr/libexec/docker
-	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
 endef
 
 # Tini's CMakeLists.txt is not suitable for Buildroot.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
