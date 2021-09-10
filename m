Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EB9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:23:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B3B61026
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4B3B61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5729F40179;
	Fri, 10 Sep 2021 06:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US5ujqgP4Uru; Fri, 10 Sep 2021 06:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F59D40165;
	Fri, 10 Sep 2021 06:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 694971BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52720849DE
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ln8WqHZ4lxlX for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 06:23:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77192849E0
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 06:23:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w29so264747wra.8
 for <buildroot@busybox.net>; Thu, 09 Sep 2021 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dV2nm3twhksuJC/JqDMMDW2XiDGACHgRIfbzUbOp8Dc=;
 b=b8uuIoKrUqr3W8x3Lgb7bmNvCmWEUX5vtwVEyKH9H/SpCX2pLe6I6sdlDMJBHwottG
 paSg6iGEXtUyjSMuiwj9k+oJWHWgqmkuvxW43qQw7fE/66QC2pQR+fmkQZkJ4aT0tUdm
 ScXiVo8zS7rG5wY9nnH9N5qdZEgRdPp7cdeTmzoApiW0S1x5CyW2/A43k6wkj8BpTPk2
 DzHv9Zr8dkIprrJqxM/D0+7xjqCUJzid+SDRRlVbeBtVev7dKjmN5ZeBQ6dvao3vx5Yl
 3J+qTZ6diGSkBnGK/vTClFqz83Pse+rrfgHJqmPgQJHN7Z3fJAhYrm3vWKX5LHsJ7F8u
 6NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dV2nm3twhksuJC/JqDMMDW2XiDGACHgRIfbzUbOp8Dc=;
 b=4H9p3Tk7xPyQqVaG+dwh7brC+tJCbxyrSkdb/gIa0Udqfc7Ck8pWWuKMkaAyKOHQUs
 El4SrEnOuUEsNTOrhbKmNuqmygFAAp+oKOFxi7gSezpbg0p5t30Kt4f/tOPZ1h3WgN2a
 zcqowoYrPdskMXgB/eCL1sMNqAXphPUGlXqe6DJb3zCBlYWqtAGCLsmm1NtEUoyCny9K
 PMMQZ/gLClIas3QxUufSGK5d6tUFE5xkrxYqDJrSDAUCIOMFDKJW8UthtC3QMdZLsta+
 PNcozuVF/lLr6krTdFm1zgBhFNXLzMEZMj7vg5UXOxT/ySUpQD/lMLv8jciEZEIJQw2/
 QE8w==
X-Gm-Message-State: AOAM531n7rmNdP6fe5QH6X/Qb00SnQ5LBZWbiip/g2sJmn/M97VkjxMs
 yiF+4DmSpGuhHfk0fokgWwQPhpQvXSY=
X-Google-Smtp-Source: ABdhPJx1VVw8FQkVcoTxblr5lRYiiSLEuQBBnu27WcZ61IWSVZ6ewGpNA5pKSnZSojdP8ff5FLsxwA==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr7621665wrp.351.1631254982484; 
 Thu, 09 Sep 2021 23:23:02 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p5sm4023001wrd.25.2021.09.09.23.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 23:23:02 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Sep 2021 08:22:54 +0200
Message-Id: <20210910062255.2162777-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 35.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

diff LICENSE:
-Copyright (C) 2006-2020 luaposix authors
+Copyright (C) 2006-2021 luaposix authors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.hash | 4 ++--
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index 54617853a..ee76ea103 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a4edf2f715feff65acb009e8d1689e57ec665eb79bc36a6649fae55eafd56809  luaposix-35.0.tar.gz
-sha256  e5d496c903dc3989bb2f6f175cda52d26e3494ad1fdd67ae1c3b3e5f76ffb86f  LICENSE
+sha256  1b5c48d2abd59de0738d1fc1e6204e44979ad2a1a26e8e22a2d6215dd502c797  luaposix-35.1.tar.gz
+sha256  f50bc0f3197523b1709f31707425f2de95f8a45534b081a6b564179ab059e850  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index d04881dfd..fa2670915 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 35.0
+LUAPOSIX_VERSION = 35.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
