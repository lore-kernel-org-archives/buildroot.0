Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF23C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761E060F5A
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 761E060F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23962402F3;
	Sun,  1 Aug 2021 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvijnyiu8gUM; Sun,  1 Aug 2021 08:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE4E4021C;
	Sun,  1 Aug 2021 08:36:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABA11BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05CBC4021C
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U47b1tbq4PnU for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:36:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5282401D7
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:36:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so9122752wmd.3
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhH4ucAdWhHof4aZvxAbMPehUypEO4K/YQLlCtqZ/Us=;
 b=LpN662gAA7fSw0E5KuSbUCDlWcy1EfLWjFMVS4KRI37B/q9/9+/poO9anV5zJqup0S
 wWaHeuesCo0a9ZBvET2mxOddgis9ZJzRremHsYOR3hxZxOtaxGuVJill0tzIkpHjM8uI
 yhTvQZwwB4BA3ghHCxTGb7YdPjeA/pmbZxjDt0CAGiIaz6US2GhNHEDBVzWNOcPIRl3M
 yyZwUjgnSDbeqJfVL8pe5S92oPo3iuqHNLeLM9TifkTbCiYz3O87OeKLbu8CfAcQ4rtL
 cV203YtvnbCvtkQ6rC8k8QUW6ruEd1t2YANHpDkzZ4h3Rfpz2B+UrYnQFKJK2UbdcAmH
 A7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhH4ucAdWhHof4aZvxAbMPehUypEO4K/YQLlCtqZ/Us=;
 b=oKwa7yqxGx6qsTPkUHXX1uW1QT72VG+Modx2N07DJEaP8kHinLq3WzZ8jiamiEUT2Q
 HKX3gk/hdmJwK5qe5HMpDd5+2R0QIr4igmyncNmGTRRuzCn8uIM4+/QMeoERzTqM2KvV
 yR9QG+9Qd8OAoxUalY75dMClU6zvcWqO+SQ9zZp1IvKPbp+RU+sboDb+yFLWODQJV7+M
 PNkqT+YsNHFKpKUw3g+8/xjcEXmvIW04wcH6WVOWQIvWwquW6u6aLMohgByby2ipakSf
 CqS+urEcYltDAw/cwqpbcmz5U70Pp1vj2/KhRoQGcAuMWPLbxWyJGsE3dnN6io2ZBCKo
 9B0w==
X-Gm-Message-State: AOAM530fIkbFR03njLaJu4RbNqLb0mge2WlBx2L37U3pS0zx4bSDFPMM
 a2zZNHcizcXU6L1t/UBYizM5RjCVYSpsWA==
X-Google-Smtp-Source: ABdhPJzJiXOtideZLZamksRtFNjH7nX36tRy/tYXJIl43hQd1RbRp4swBMDv88TD0lr+T20fXz804g==
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr11343601wmq.71.1627807008809; 
 Sun, 01 Aug 2021 01:36:48 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id o17sm6540710wmp.31.2021.08.01.01.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:36:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:36:41 +0200
Message-Id: <20210801083641.2761809-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtest: fix host build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit 9dfbbbb4105c47602da048c9bb9499fb8862e768 wrongly removed
dependency on host-python3 or host-python resulting in the following
build failure:

cp -rp /tmp/instance-2/output-1/build/host-gtest-1.11.0/googlemock/scripts/generator/cpp /tmp/instance-2/output-1/per-package/host-gtest/host/lib/python2.7/site-packages
cp: cannot create directory '/tmp/instance-2/output-1/per-package/host-gtest/host/lib/python2.7/site-packages': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/a1d2e100a65d7c1c39c20bdd5bf687a804c94305

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/gtest.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 474d127312..6447954e36 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -21,8 +21,10 @@ HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
+HOST_GTEST_DEPENDENCIES += host-python3
 else
 HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
+HOST_GTEST_DEPENDENCIES += host-python
 endif
 
 HOST_GTEST_GMOCK_PYTHONPATH = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
