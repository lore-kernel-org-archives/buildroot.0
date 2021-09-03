Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8542C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 10:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598B7610CE
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 10:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 598B7610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F13104263E;
	Fri,  3 Sep 2021 10:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODjDJExOMQvx; Fri,  3 Sep 2021 10:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D6DE42638;
	Fri,  3 Sep 2021 10:39:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39F0D1BF40E
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 10:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28B71606C6
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 10:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f39FmPn2kxFL for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 10:39:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B2F560676
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 10:39:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id b7so6176194iob.4
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TM0MlF9uU+hzX2ZK8PI0MtEBur2tIzfjBAH1Wg8qOdg=;
 b=mZsciMyilavW393ZFYeDuJWTcpTDpSfVpeJr5mz2dYWLPQ8DYHKK7GGOnXBu4ig3kC
 E25ThLegu4VRv3UeRYkuE9z+9JbHyoPX07If3+R9/5wGEz6uiqvReqI5jNE13SmCeiBC
 pOjR1o36QlJ36iN3B5HW3pGtGvX13AZDXdWEivbfryzeKsZq9XfGURUcjDKT2vJT/u9C
 knaV61SyDnUISonnMEsqdrKeSSSqvDRB7s6HHLK5zB+AJtj58slgdTyIEgJbnxvrAS10
 oA+rkLAJRdQwILpQd+zehOQB2reykbAgIt0ci6OxIxhDwcCyol9Ux7aJdfpKQbOCtuLV
 Ubkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TM0MlF9uU+hzX2ZK8PI0MtEBur2tIzfjBAH1Wg8qOdg=;
 b=Q67chssDnvgQ03u7W8f6O86g4dLyYz5yIewixsqBG+cr4CMSKCn4iT7G/pFTeNNirb
 6/f05N6CIEuv7u/ToL4OhTo4IxAVWhbfRfX11OZ06TjJHGDdcEN7p7nNNLMyjYXaUniN
 BnLlkCaVFc9R8REweooKLX+s7gGXsxz+FTtf2S4FeCJmHs6qBmbyRR84mxFsu4VUrU5d
 lrjLqbV8wWNJuOHOCNPeY1O62CutHvRUnCqwhUTVoufzEiRKiB2qfsnXdvn174Vcg4wW
 xI79SnT4n7gFJsue292ALgwGqRdBk3RmtoJ3x0wHQfvpf4eqAxm8kAAIuNeO8we51kxV
 sfIw==
X-Gm-Message-State: AOAM530VvaiQSQEsL0kUWjFLhocH6QXmkdjhFgAeOFDc3UvdmBcG0nni
 pwW+dG6IZ6IV63dJ4pDLqExo/IiKX3s=
X-Google-Smtp-Source: ABdhPJz++aTbJkaroygUsdXT9PSjGwXjohzCjIyfwkLLVG5EdW3gB7eK2pwmEo+zXWwIKXlHPmpbfQ==
X-Received: by 2002:a02:3b22:: with SMTP id c34mr2071473jaa.140.1630665566312; 
 Fri, 03 Sep 2021 03:39:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id b16sm2209282ila.1.2021.09.03.03.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:39:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 04:39:24 -0600
Message-Id: <20210903103924.2907009-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 249.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index b419dce445..baab5304e6 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  69ca802ff87e316a216f4bf5e5fd787dd9810c8c8c5076917ee817e52bd6c3a9  systemd-249.1.tar.gz
+sha256  f3df809bbe777fcb5ffe2b29aaf6f871de764ef22706940960f88b8a850e9278  systemd-249.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8bfd407f81..5a76f2f246 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 249.1
+SYSTEMD_VERSION = 249.4
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
