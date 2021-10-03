Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4B0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:13:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C0961269
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45C0961269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D584761787;
	Sun,  3 Oct 2021 08:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGYdCKD-L0SX; Sun,  3 Oct 2021 08:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF0661710;
	Sun,  3 Oct 2021 08:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE9E1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C2A4848CC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZXL_M8h7xUR for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:13:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 964E1848CA
 for <buildroot@busybox.net>; Sun,  3 Oct 2021 08:13:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so16155860wmc.0
 for <buildroot@busybox.net>; Sun, 03 Oct 2021 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fjdfW3CqOGbSLqATR5EOGJ3BdiwMW45DPYSVAeZcxfc=;
 b=JJmEXZaOBG47XEwt1Yk6U3Csyr1RT/RJZ4cUEX8AxHOCzV6TUowrSJYP1mr3tkyWa6
 IIYOeQ6Tf+nCLphm9cWMMW7n94bYo+ilSzC78tjUHXMP5DMcSgIpbB9+Mr66gWpmHnsY
 nIXbTNCguKBoTwHpG++0wZCc3HCvj37vs1Rs+WgJ+prSwG03QhQL8xSwliTvESMrrJ5E
 xxh0UZt1b75znoUs6Vyf94pGUPxz+MNgg/senQna24cfILTtfh6LS4AV+NVy4Et26Mhp
 /MkIvu4zQNPMu2cjxRBmqToyS1PL8oNCst0FdmwTafLxx3iREaoduRYTATu7jJbvY5U6
 CKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fjdfW3CqOGbSLqATR5EOGJ3BdiwMW45DPYSVAeZcxfc=;
 b=CLr3qRk71YuxYAINWfKeGCnPG/oWLQ3x/h0H2aN+w6uAwvXkP9TNF2DMrfc8+DJdER
 VE3XQRxEvnMNtmVC5OT3595vosoWOITE0Sp/fSb9o5Qj/hsikYwg8Q/ZW6TO4dJhMdVK
 5z471HVC18/TGn2XRIfkVXB0sneW8NsoK8Q33+1RAKoBaP9PAFcQBt9bc7KN0RKrisf5
 H6DswKKT28rBkYWmqct9oFTDCiJzRYABtSwgC9mSUJgtZU069Y50a56xqL5WdT7C/ImU
 /uVyFBkDPNHNKq/WcYpKyjiiCa7y39Zg3cThrX8HUFXbKxf1E0s2/lMi4aIc105mxDQA
 KrMw==
X-Gm-Message-State: AOAM5312iJb1xpAQAJ3/c1XkQbGomuF8j8bWn3H/qT14wjZthnzXCyjp
 TyFT2M7vIdcclkRziSR1hWzU8nPl2yc=
X-Google-Smtp-Source: ABdhPJxZMOKuzgfIbvfBURpJTtoRup0wNMNqZ8WIu/CCjTHskhvqP6rwwVsP6Vb06o8vieNH//etkQ==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr12796841wmb.30.1633248820722; 
 Sun, 03 Oct 2021 01:13:40 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id v23sm10649304wmj.4.2021.10.03.01.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 01:13:40 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  3 Oct 2021 10:13:24 +0200
Message-Id: <20211003081326.465560-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/htop: bump to version 3.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated COPYING file to remove the PLPA exemption (appendix 2)
With this change the license is now GPLv2 without any additional wording.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 7 +------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 34d95eb7a..812392340 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  123476d56a5e6a219654eebb6b2ec747dfa364f39c01a6475bf8030a25c81bff  htop-ce6d60e7def146c13d0b8bca4642e7401a0a8995.tar.gz
-sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
+sha256  200a4f9331d0e5048bf9bda6a8dee38248c557e471b9e57ff3784853efd613a9  htop-3.1.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index bb2bcb29a..22cc739e2 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,12 +4,7 @@
 #
 ################################################################################
 
-# This commit hash corresponds to version 3.0.5.
-# htop sources were moved from bintray to github and the sources tar archive
-# was also changed (the build process requires `HTOP_AUTORECONF = YES` now). We
-# use commit hash instead of git tag here to avoid breaking existing source
-# caches
-HTOP_VERSION = ce6d60e7def146c13d0b8bca4642e7401a0a8995
+HTOP_VERSION = 3.1.0
 HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
