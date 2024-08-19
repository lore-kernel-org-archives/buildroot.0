Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C3CC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 04:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 919AE40332;
	Mon, 19 Aug 2024 04:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLKAncKOO78d; Mon, 19 Aug 2024 04:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74498403FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74498403FF;
	Mon, 19 Aug 2024 04:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4871BF4D6
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 04:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ABD880E8F
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 04:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuRxQ0SV77K2 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 04:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0C8B80E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C8B80E87
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0C8B80E87
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 04:02:16 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-39d3cd4fa49so3121345ab.1
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 21:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724040135; x=1724644935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+uGKRPS6E/OS1tricPi1XVkkdQC42mmNyayH5HxuWA=;
 b=aRlAhTpKarD74lzZwCyA3AddWW7ODeR+4mfb8Y95no3gp2cArqiPu0vAu5OSgQ+hlO
 7KvFKEGR2OLnVV6LhlpK9dKLMX3lVhCjXn8hhi74IgtXatdUU1688tclL6EuvnxpW+3F
 FEcNtbMbB0Kk6L7EBAA552WXytBJ4RCVNk42Qnm02md3gXz9Z7+0FvreWTz6KVM4uxvG
 XuvSoWuBYz8gwsDg/598PBAVlRV046WGcxOt/lJTKgN/w7OgB3Gz4qJ2Mn5zA7NlQ+vs
 xfuYmoPjRzGDSu+fVWSpuTTa5hJrGSoRThev40BkARM6I7bOQ1i1WBKO98Razrj8Wnf/
 p09g==
X-Gm-Message-State: AOJu0YxXZ2fSVmi35MJHJ6NfwKa/y46F4L+vRCHo9JTPdlu17OWkqxOi
 6gXxteU//M2wlSQh5i3qBR0NyjI3FNpFaWSBtVDDV2KzQXjfKrN338TtYeD9
X-Google-Smtp-Source: AGHT+IGf3+Hk4h4RiglpDoYm9rslq7ZpYg9ToCGkoOD/H+XAue36nWF3RPH5mppO1g8SkTyTY5HTFw==
X-Received: by 2002:a05:6e02:17cd:b0:39a:16b2:7290 with SMTP id
 e9e14a558f8ab-39d27b3771bmr87172895ab.9.1724040135201; 
 Sun, 18 Aug 2024 21:02:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39d1ed76533sm30509855ab.83.2024.08.18.21.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 21:02:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 22:02:13 -0600
Message-Id: <20240819040213.3563422-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724040135; x=1724644935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+uGKRPS6E/OS1tricPi1XVkkdQC42mmNyayH5HxuWA=;
 b=CATIVZBohmpfEH9klNmWlSvadUjoxwoM107ZJ+PElT1qNdcxiDOyECrVy9wm5o/ZTK
 c+G8pKWqg+ugaTp6hNiYtja7qg3ljMOOialGOdNqZ+bALrZ9kdSOCv9cEAIgaPo1yCbC
 X/hmnHOcUuVN+R6CAOnWHfrryUofireYefrLD096fJ9+dlGyxoq/P1vHTzrlRbTpslFt
 RI8OnYSwvx8lCKPZsz1+xfuPAFNm7xmY7qMqFialS9HN4Y6ZolgLA1pArzdIDlYiU0SC
 AlbxKiCpWI3mNJS/w4qCAg8IInHoiBwMMVKTzmzTxdHxpuODlHDIg/d/Ms9nkwdIRmd8
 aQ1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CATIVZBo
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Flashrom requires --default-library=both for the cli when building
with BR2_SHARED_LIBS.

As such set --default-library=both instead of disabling it.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/flashrom/flashrom.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 1e7d332dae..030f6816a0 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -10,6 +10,7 @@ FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
+	-Dclassic_cli=enabled \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
@@ -78,10 +79,8 @@ endif
 
 FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
-ifeq ($(BR2_SHARED_LIBS),)
-FLASHROM_CONF_OPTS += -Dclassic_cli=enabled
-else
-FLASHROM_CONF_OPTS += -Dclassic_cli=disabled
+ifeq ($(BR2_SHARED_LIBS),y)
+FLASHROM_CONF_OPTS += --default-library=both
 endif
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
