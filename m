Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A492C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C1681A46;
	Wed, 15 Dec 2021 17:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7D2pbKraGqc; Wed, 15 Dec 2021 17:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFED814B6;
	Wed, 15 Dec 2021 17:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9261BF2CF
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB238409D1
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zho9cnZ2vwoF for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 17:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3832402D0
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 17:22:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id z206so2896907wmc.1
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 09:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VDiNyE8yJu3mOwAI0t+eHVyJqT2b8yM2KzkgHUB2no0=;
 b=F2CnrwaRTdOffix6QrZz31ujKO58U9T2lvZAkGlb6tNix8QjNoG+ozRFWbvC+qw+gP
 UId4DbmoIQ51bAWuTCU3smgBJNInHFEG7G1Btd6r7YFgCBoyojgdagbOiJ8i3pO8+hob
 k9sYt1tkwH/OLP9FtRu6JNMXOeM5LoDOUXnwci7nR2+gmaWtWTUgOtQGMALq+3Iuo7WD
 t9AGTnB6n1bz4AcEe1qgTMIYLbOPtESFtmA9d7WxF33IqzUQIHY7tkGC88p3x21ugwS5
 7fwxiFKU4K8crrihoZ2Rs3PZZ6811smcnagR6meNRwLtHaG+N1WMTyIf4bl4ZhR/ZnSw
 M3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VDiNyE8yJu3mOwAI0t+eHVyJqT2b8yM2KzkgHUB2no0=;
 b=pd/WEsMRfN4X1G+FMAzta1yFyEW8iAx/3JTBwHV1BQjfIiaTjuY5k6Y+PDr8XbYqel
 mzCmwMZCR8AkXMglX8jGn+PuGGXQS3AgwR+797bPll0EVdrAFd5nNl5qSjozfrlquxTY
 8BIzdQhPoN15XEt5m9P8aRUX9YGGhHic2U/nbp3clvxdOEWinKPG5sQlYq9RTwI81Ypt
 LYD+d9AtUJUgc/KIoz6dxc2AoMaGlnm/OW0ZPEgnKi9B4aKzZUPWBm9u/27DYL8ztgUH
 IaoLv2HartPHJoyqAPkSxgXA+6qH1ximEV3mmlbG8xJvtmYEjE7qrXlx3SIJbVzxHbiR
 DoxQ==
X-Gm-Message-State: AOAM532gkWIond66jbjBuFJMLj3ydEI5LcaTjfgesFQWAhwMQihymfx2
 Sb3Xou3hOKRE7iRoP+ZVCM5nURNyu3GjXQ==
X-Google-Smtp-Source: ABdhPJxwWBC+Pb9BfHI5Cld07CSB9Uhr6VCnLASfiPlW6FL16hx4LkJt+XxM19JyrGU1Sqv/bilNBw==
X-Received: by 2002:a05:600c:4f96:: with SMTP id
 n22mr909010wmq.184.1639588931773; 
 Wed, 15 Dec 2021 09:22:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id h1sm2532254wrf.33.2021.12.15.09.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:22:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 18:21:46 +0100
Message-Id: <20211215172146.3784645-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: disable cunit
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable cunit to avoid the following build failure raised since bump to
version 8.1 in commit ca2753fd47d47e5ad0eec16ea62f7b7f096331b6 and
https://github.com/FRRouting/frr/commit/749714731ee9a59ae39be77e7db3915ce3ad0bd8:

In file included from pceplib/test/pcep_utils_counters_test.c:33:
./pceplib/pcep_utils_counters.h:112:2: error: unknown type name 'time_t'
  112 |  time_t start_time;
      |  ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b68d3e369e2925938bde39508988aa9b701f1045

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index e707f50ca1..fac9c6692d 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -17,6 +17,8 @@ FRR_DEPENDENCIES = host-frr readline json-c \
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
+FRR_CONF_ENV = ac_cv_lib_cunit_CU_initialize_registry=no
+
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
 	--localstatedir=/var/run/frr \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
