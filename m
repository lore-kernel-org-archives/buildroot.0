Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3E5C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C974B4030D;
	Sun,  1 Jan 2023 23:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C974B4030D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ht40N-mtZTQA; Sun,  1 Jan 2023 23:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFB1D410B1;
	Sun,  1 Jan 2023 23:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFB1D410B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 993391BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F949402F5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F949402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8cE7DGHxE1J for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E6DF4018F
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E6DF4018F
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:25 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e205so23800704oif.11
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjqnLI+ZBjn4auE9kIUfbSAI0EYanysy17DiRhp7Wls=;
 b=udaBRnZevpFhi27bH+EvWCNsGBVyvjPqCCuOWp9H3ujqXGVa3AlW0qJN2clGqW38R7
 a0uJai687YxlMlv4OxoJEB9gxEXf+sZFx/2I/0qtyDi4vWk+Uz0XJR+Wcn8RYWmnqTZ0
 wg3sYGiT5vTAfsUP69hWjLEgvD4L3hqAFWVKO8c5y3WE9d5kWw4XsK18QKyZpi45Q0hN
 VVt7RSMUUe5i9oaghJof3jqDzdduZNoJoHAK7sM2rn2UdDOoWI6yK/Z5Z6bule2EvSgo
 D2w+dQK4EgGcthvISOE1mRJcVj/MNmtkP9sMB7Y01N3dNHsvz+M5gsk7bgsBTJIc1zT/
 M3Yw==
X-Gm-Message-State: AFqh2kpkGM6ie9/XzLK+Zd8kBzQUPmkD9P6APEOjBqjti7NIEcyMkjnu
 U7dtLqNcTtx4opf5SdO7FeVH71+JT/Q=
X-Google-Smtp-Source: AMrXdXvJySc69dF4yrySQepAgvWeYNLa3pAWkKTBPCy6sDd/3+2b1MgF4qeS7/LtPmd8+/yWI8UYvQ==
X-Received: by 2002:a05:6808:1290:b0:355:1df0:9b84 with SMTP id
 a16-20020a056808129000b003551df09b84mr25275635oiw.2.1672616365230; 
 Sun, 01 Jan 2023 15:39:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:24 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:33 -0300
Message-Id: <20230101233653.487175-10-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjqnLI+ZBjn4auE9kIUfbSAI0EYanysy17DiRhp7Wls=;
 b=d0pxGpqJbLlIsLmBqvFo5KXv4BsDxP+qzz9yc3qR+lhhzHMLS6LtxZx9cgxx0M6Lvu
 SMuwB2CpI/edlpw/IALej0evERDZIOmInnBJKw5FscnCI+k/xjjzfJ4U8ukNpdQfWm4n
 W90Ubtt6wZvZqTALrI4Cx6Ul78w0KhDtl5dkPuF7avfyMph9jgCKEKUZ2qJ4Ijwhprua
 UXAgUQVy3VmcXg28cTCJPf8npJpBsKjlY6gUvl9v60qXqJm+hw+6EvUpLhnSuUvmoO5Z
 X6pKW3jc2EzKYDgMqLAe0LVtQen32kgD/PfArjz03lRSKGBWBKb+1Lheup14b1WqFVCl
 d51Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d0pxGpqJ
Subject: [Buildroot] [PATCH 09/29] package/tekui: really disable parallel
 build
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "c80789c917 tekui: disable parallel build" added TEKUI_MAKE but
that is not a symbol used by the generic package infra.

Ensure -j1 is passed to the build and install commands by using
TEKUI_MAKE explicitly.

Fixes:
http://autobuild.buildroot.net/results/c6cd0d488581013a8b215b0ee2fd8f549a868d4b

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE: I was unable to reproduce the build issue locally, in current
master, using a few times:
$ make BR2_JLEVEL=99 tekui-dirclean tekui
either at the output of:
$ br-reproduce-build c6cd0d488581013a8b215b0ee2fd8f549a868d4b
or with this minimal defconfig:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_JLEVEL=99
 BR2_PACKAGE_TEKUI=y
 BR2_PACKAGE_LUA=y

Testing using this defconfig:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_JLEVEL=3
 BR2_PACKAGE_TEKUI=y
 BR2_PACKAGE_LUA=y
and the command:
$ make V=1 tekui-build

Before this patch:
... /usr/bin/make -j3 ...

After this patch:
... /usr/bin/make -j1 ...
---
 package/tekui/tekui.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 13000edd3e..3cb7ff51e5 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -59,11 +59,11 @@ endif
 endif
 
 define TEKUI_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TEKUI_MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
 endef
 
 define TEKUI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(TEKUI_MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
