Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A11C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59A1B40108;
	Thu,  8 Dec 2022 22:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A1B40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pcDst3j5c8k; Thu,  8 Dec 2022 22:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4697640145;
	Thu,  8 Dec 2022 22:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4697640145
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F114E1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7E2B40145
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7E2B40145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVxTp5dtEpUB for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C35400FE
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02C35400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:53 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d3so2954480plr.10
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 14:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=noEb7ITd9ReOg9vnXn3/TbDncnZmgmw7JcAHHNyHYAk=;
 b=1yewsYLeAyJXuukGQ3Et4JNXYoS8xJ32kJuln9OqP80tg0O0G3Q1XEAmOjDeAGLIm9
 uQ5xdVanjqXC+plVws7bF7FyfA/Hd0PY3DlKj2VTmeDP3aNQKtjl5j5YoRTVWwndBp0S
 0q9qH6vIOF3MbcbdMvuaT+A37uf6x9r20XGldkcRiTkZkpbpUXC8VS8COMFLIeA4Qgqw
 eymKmewTJjpv2OHaUz4lA/qQnmvfrBJnXS8x7Cb+nKRDQYy7uWrAPrlfAH3sP3120dTe
 eW6dRPudyidW05d0mHEpOh/mHQnFeTQu6p2YgWGooRjwPwwCAC09fn3ZtiD/DhTJnkkc
 D6Wg==
X-Gm-Message-State: ANoB5plF9gyoiNZWm8GSF9tjS+DMrLL+sLVSwWmWvU+smfybcaP1Q9K5
 BrH8MWxZGCMFPS4fpvte953GRLuIjEo=
X-Google-Smtp-Source: AA0mqf524+v60RiZl7ilj+w5cL0d8sX47PXzjjdS/9GwTVQ8UhdE+qLEXH3wUwdz0Dzsw9QQq9gSOQ==
X-Received: by 2002:a17:902:b68c:b0:188:63e1:bafc with SMTP id
 c12-20020a170902b68c00b0018863e1bafcmr3623523pls.0.1670539133075; 
 Thu, 08 Dec 2022 14:38:53 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i17-20020a170902c95100b00189847cd4acsm17273620pla.237.2022.12.08.14.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 14:38:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 14:38:50 -0800
Message-Id: <20221208223850.32191-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mosh: bump to version 1.4.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many new features & bugfixes.

https://github.com/mobile-shell/mosh/releases

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/mosh/mosh.hash | 2 +-
 package/mosh/mosh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index 3558bf9030..6c1d0e7af3 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,5 +1,5 @@
 # From https://mailman.mit.edu/pipermail/mosh-users/2017-July/000357.html
-sha256  da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216  mosh-1.3.2.tar.gz
+sha256  872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd  mosh-1.4.0.tar.gz
 # Locally calculcated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8042495ddc8d99b883335d53552554eccf825fc1f0ba487d0f8e6656baaa8199  COPYING.iOS
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index f9e335799d..c938f70719 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSH_VERSION = 1.3.2
+MOSH_VERSION = 1.4.0
 MOSH_SITE = https://mosh.org
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
