Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB666C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7E360FED
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB7E360FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7BC460767;
	Sun, 19 Sep 2021 13:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqPsm4F09NZT; Sun, 19 Sep 2021 13:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F242160763;
	Sun, 19 Sep 2021 13:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4081BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DE44830A8
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grtrb_WVbk5v for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:41:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7124B83083
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:41:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso10212914wme.0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gq+p8LF3ZNmLOJdvtNgFNnW00/PLjTfgVGR4P92It0c=;
 b=M1+rZM9pexJlQkEiu5xkfrBSs3HqWjd3Sw7jKI1NYGBY0kYJnFaMuep0uqLeT2juKr
 5hmzBw6VCS5lLmfysLSH/Jzw8Zs3mifV6vdGV39W5AmLbfgVvnjEkaZYXKILSApq4HzQ
 j2rLHZgm0MY082pVM/W7xeU04rfdhIMPLgpi+onchH5p5+fMAI5QnwIt4l4HwP4rzNdz
 bkxZQbLEOATmUrelpvEERjdgzo3LasxruyM//Pw5ZiH3pjHx4GHJQWK1VjeEw5yFV2Xj
 UTWqDrm8t0c9POJFf9Ld9RKxcIcDoC3WtItEZyhHjNhPS2t+v9FshemHANeLC7UMCyu2
 GbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gq+p8LF3ZNmLOJdvtNgFNnW00/PLjTfgVGR4P92It0c=;
 b=fjFOg644zzSUxLa1OBGL/UGQqcwXFb+huB1b9kGD+bUQ/OChwzJuVnqKQoaLAYGGv2
 koLz4PeCazjpVLs3aF8OC7nrPYDDVl5GR/NyGQDZwSMEBc7SMmAGYwYA3gi5J8V7/L57
 NqQarCiTwxC8FMAE1SDFoeoYSe6vFCMnMTRprTZ525wZf1dHCtHo3/YUusxZ7715EmB7
 pdtx2jVjeeKvAUGqlQKdWzJymjIzaqbFu56d1Z0fbaVgOl+uYCFKwTU6m9/SqdEuKDL7
 XnuQ06hxun5E8ivHNcOD8MEEYz/bBOVfy69bl0T5CuXAC9TVfhKTpGc1YHgbD5BtZ0yX
 HxNA==
X-Gm-Message-State: AOAM530uCOJkCr2IhTl/rk44Xu/CELVB2pwGORAs6NXHzEOnAxubDck2
 huA+srE+cGydb8WplX3vlQZNTUk1gdk=
X-Google-Smtp-Source: ABdhPJxCWQfXhZ09IkLs/Yk7871qy9/+sX7HY6th4TJqADErJL/lhsutIpI5u+7SFlCCB90NgaNvpQ==
X-Received: by 2002:a05:600c:4788:: with SMTP id
 k8mr4234359wmo.131.1632058863663; 
 Sun, 19 Sep 2021 06:41:03 -0700 (PDT)
Received: from winie.fritz.box (i59F52931.versanet.de. [89.245.41.49])
 by smtp.gmail.com with ESMTPSA id l26sm16336680wmi.25.2021.09.19.06.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 06:41:03 -0700 (PDT)
X-Google-Original-From: Florian La Roche <Florian.LaRoche@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 15:40:47 +0200
Message-Id: <20210919134047.30135-1-Florian.LaRoche@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump version to 2.2
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
From: Florian La Roche via buildroot <buildroot@lists.buildroot.org>
Reply-To: Florian La Roche <florian.laroche@googlemail.com>
Cc: Florian La Roche <Florian.LaRoche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
---
 package/rt-tests/rt-tests.hash | 2 +-
 package/rt-tests/rt-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index f56500c26e..c731feaf21 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256 3740ad97b164a1cd77d9ee32bba23a4a0b2495a76468bcf40ff60b55c2a3a709  rt-tests-1.10.tar.xz
+sha256 48346ab2b5bf2ffbdb1ed0d4540e9e8e22f6665e6bb3d59c22614f9722b13a91  rt-tests-2.2.tar.xz
 # locally computed hash
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 0d959bda31..a0d7f76e8e 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,7 +6,7 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 1.10
+RT_TESTS_VERSION = 2.2
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
