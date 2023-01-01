Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F7BC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2288404C0;
	Sun,  1 Jan 2023 23:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2288404C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NobnXg-qmW3P; Sun,  1 Jan 2023 23:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6C84060C;
	Sun,  1 Jan 2023 23:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B6C84060C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D199A1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BABD560C11
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BABD560C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XexfCM-w0vJp for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F1D860BFC
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F1D860BFC
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:03 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r130so23852790oih.2
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PkZ7VczkR/8531ovaAnTeBqjb+IOl9e3MHdkP21KlCg=;
 b=Gg063hypiSyyZfsh2hih5prMCEy+6PvE80bwaDEFi/vbie8Wn+vMhj0xxXkgAwYXPJ
 fzjGUeSAmGjz+Wjh+GsbcSFiazSReI/r8LSYDZEx4qLLCz8Wsn4UsRFbldCHIwY3rbed
 9FhQDzZt08gMqCYxYdFlHgdi34bcIAsg+VnYKwVacKnTUwk/qaVVtjYWnzePUOTdWmw0
 LQBco49LjT1U+XW6jypTEvUJ6qO7wJWeJ1wCKxw00/+cIX/eDfJqQO48iZVz3/mD+0FU
 Wzi57lu8dHl63/tFQBtb15RIAPUB+SalGmPuFGOLpD+vD4+xAz5W5Z88cKMpUomJZj0G
 EaFw==
X-Gm-Message-State: AFqh2kqLiTY0KawUN+soR5b1IfxCheJ9Jo/ag/drsGf+Oeu0d2ofVUzL
 4o5KbhQVwCjEBDfh1/mf0dVHuJOssJo=
X-Google-Smtp-Source: AMrXdXsV1LB5eWRVjHK+o4svbhiOKUACqLYROl88sbhgYp1oaiedrmEAnfUgM2XObcV7pN3c4cjOxQ==
X-Received: by 2002:aca:3405:0:b0:363:b22c:4e1 with SMTP id
 b5-20020aca3405000000b00363b22c04e1mr2469529oia.32.1672616402872; 
 Sun, 01 Jan 2023 15:40:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:01 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:47 -0300
Message-Id: <20230101233653.487175-24-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkZ7VczkR/8531ovaAnTeBqjb+IOl9e3MHdkP21KlCg=;
 b=Hp2sY2NANXzxq97AnXsKqzdbIU7trk6S+ySzKbYl7VVD8HdmgaIOxo4SMWKzYzBE4C
 PPv/KYhgKZrUyZJRLBfnk34Cp16zhjePpnboyo2fqpngfypPiNTZSV1KDL8VCrK9H8RF
 0zz336+2X++C+yaMDQrdpGgjheYtuN51h4IIWtQ9tNeMkvH01Yhna/41ltZ5I3x3fnv1
 0J5aLrvqO/OLhg9JobOhGA3zFeXczGZxGxZ9ey52WTaeRdkDcKjLGaOw9tcjfb8H3khJ
 2rGRPzVOOWBd/Phs3Pr4/6gXnoEJwxm8qe441Zlg97iQeA70BJnbvPowR9+xxn3LP864
 SOOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hp2sY2NA
Subject: [Buildroot] [PATCH 23/29] package/swupdate: drop dangling
 SWUPDATE_BUILD_CONFIG
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

"6c63e4de4a boot/swupdate: don't specify .config to munge" dropped all
usages of this define but the define itself was left dangling.

Drop it now.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/swupdate/swupdate.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 8f05b83922..11a3946753 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -208,8 +208,6 @@ define SWUPDATE_SET_WEBSERVER
 endef
 endif
 
-SWUPDATE_BUILD_CONFIG = $(@D)/.config
-
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
