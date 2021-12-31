Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CE8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 12:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F508149C;
	Fri, 31 Dec 2021 12:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWSK6a-MH15K; Fri, 31 Dec 2021 12:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 301498144E;
	Fri, 31 Dec 2021 12:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29D951BF2F3
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 12:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1837260BCC
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 12:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLwJgOzLWTzR for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 12:47:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DC2D60BAC
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 12:47:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso14699351wmf.3
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 04:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fcv3wAb8g+xR3ArvaAa8i7XkEZsW1RTzCnVa08vUWAw=;
 b=NPGUZ2V5y0CkX5fo9VjZcefqxOA2a5xkUebEUTgUNN2yV/XCITfzENOrn687mTTAOe
 ueSDJyTAmol5JF989LnT3/7H7akCofFOydFvAQwUMD47bE2EScjar/srXJZw/a3ySE0Z
 zIk5AaVnMlrU7PhAE9QgJf6wGYYbk1k6yX0az7CcILq5MWPv3s3B9TM7OnUZCBp9JQmd
 aV2XiDW2Kf7WzhQkH/WcVcJvojRw+2ZAL3eWmhPUXZ6k2QAN2XfdDWe/gcThUBQf16BY
 xvdenngWgE8jaDDJ2lXQEjhs8cV9+z3plLWFi4C56LDunkuM6Lep5oe7u40Dpq73vaUQ
 tYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fcv3wAb8g+xR3ArvaAa8i7XkEZsW1RTzCnVa08vUWAw=;
 b=4vjizlIWL3H19fECg3mhy4dM5KJjzfHkt6Dtgptrt64dcB22rJOeLJJ/w+f/esIUYu
 w7549Cqe2j73ExdU/JlDDWm0dtYWzAMvJdp4DPsYcGZa05a4YSdOEAI4j3NVQ0xWNaBX
 OT1dBI4R2uihZvjxxaxSa7PKvrr72mHaJlOMry8IqWb8mL0hFrGlBHcmcPS5Je8Yfkmq
 1h/vK218g6TFc+SW5hqoJ2PdcQrb0MlopLBzD4bHeGV35FO2GvtceFa/GSH+utGvW/eT
 R7aeAKPCGZ8FkMDUkPTHBXSpeDfHLXGzFhwlcGCVz+6VHRaCQeRoumbfINlJJvU7+Vf8
 8pUw==
X-Gm-Message-State: AOAM5310Y4NFU+kL2/F2yzOY+qF7Oh1h4IXU/eHxz6d26ksN9xx7HbiB
 xq/Y4zUJ3KaEx60vyiiDXXyWLsILLC0=
X-Google-Smtp-Source: ABdhPJy1/U+YcRoicvRhIEOFHnyuVDiaFI7eD0Y/HQmB3OacBhfLwfxl8WmshDvp3TwaeDW3m1K/5A==
X-Received: by 2002:a05:600c:510e:: with SMTP id
 o14mr29692729wms.81.1640954855094; 
 Fri, 31 Dec 2021 04:47:35 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id b13sm27405653wrh.32.2021.12.31.04.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:47:34 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 13:47:27 +0100
Message-Id: <20211231124728.1692301-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211231124728.1692301-1-romain.naour@gmail.com>
References: <20211231124728.1692301-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/flare-game: really use LICENSE.txt
 as license file
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous version bump [1] added the hash of LICENSE.txt but
forgot to update FLARE_GAME_LICENSE_FILES.

[1] 4d09d1b47672823e3dc2fb3a84e2349f6b19906c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flare-game/flare-game.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index d65e3d6c38..2845dc9714 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -8,7 +8,7 @@ FLARE_GAME_VERSION = 1.11
 FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
-FLARE_GAME_LICENSE_FILES = README
+FLARE_GAME_LICENSE_FILES = LICENSE.txt
 
 FLARE_GAME_DEPENDENCIES = flare-engine
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
