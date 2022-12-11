Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D35C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5455B60B49;
	Sun, 11 Dec 2022 17:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5455B60B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3UGjfSIc-hb; Sun, 11 Dec 2022 17:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B0D608B7;
	Sun, 11 Dec 2022 17:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B0D608B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F36DB1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA76540245
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA76540245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEn9mWbQ_qBu for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:40:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FB5401DE
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1FB5401DE
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:40:35 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id y4so3038774iof.0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8JRz5dKYaSiG4rpjIZrRMvq6irU3zsgxgtpx1hijcEM=;
 b=eyPOTsGyYH2j7RSUpKRFdZQfe7KfqfNISjULABmwHYkWmf3mLxiVfV84000iYr/vn8
 n/WZeldrmslzHdAOPmpEnUn/tlwGBZmClse8Zj1f66BhoscjETUE24Sc5/lNAHX1FFFP
 7XmYdtCXVfa++yVxhB7g29GmHHVfoB3VdN1ZtGdsyYF9tMtC3LrBIny/ao7LyCzGicmb
 GhtpedAxRRrLhyHOL6vKJItaXD8VThD/fHjqyKvWs3LC/zFvnaJMLUpLjHPrX4un673n
 bSXGtZJYWA5x5sWgXFZIS7nELuMjvR1HEIoyJRC2yhj8C8l27N8PrN2tI2x3hz1HOVNN
 CqTA==
X-Gm-Message-State: ANoB5pm1dqhL8v8eAyOujKBnYuDgy5K0Vjh37kYxa88VOyKVy+iezZPt
 AsAKL4JVBfEkUdqDpgUJ3Nlf2L0POG7VWrRV
X-Google-Smtp-Source: AA0mqf5Igq/7GL0zcCx3+RHeueFAhQ3WiguWu3sHRPKVfomgf+Fx2WCC15Jw2tyRrFvJuU3G+BUitA==
X-Received: by 2002:a05:6602:21c5:b0:6dd:5287:7210 with SMTP id
 c5-20020a05660221c500b006dd52877210mr7216627ioc.3.1670780434481; 
 Sun, 11 Dec 2022 09:40:34 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a16-20020a027350000000b0038a41eb1ba3sm2438525jae.177.2022.12.11.09.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 09:40:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 10:40:29 -0700
Message-Id: <20221211174029.1928619-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8JRz5dKYaSiG4rpjIZrRMvq6irU3zsgxgtpx1hijcEM=;
 b=fQlSGCrPi40eWcaLN2mSIdlV5KHnpgeIm+fzOaBK88ajgEX//YJEmVRQRuEa6U6KNi
 RJiZjBW1oHazXPQg/3HGV8/xdoQz0+Y/M2aupJ2UIbHIObSvQ3O6NCrWD4aA+67fcbQy
 IgKUByNicEsI4R5cX+Mnw9gG7RYr8kkwCoVJTbtNm1r3nuChml4bD044yAbG1hrG3+zp
 nv7H/Q/LfjSvqI++k727iLx5+ohbLK3qtTtLBLeW+sR143pQx5bT0DjKAeutN7vmQ2PB
 g4AwuwrIMvQXgshMG6Xj6+FKYnPCmUViu5wA4yDEFLiWD6yNAIiDXwIh+OmobmZ3gIrj
 Vnog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fQlSGCrP
Subject: [Buildroot] [PATCH 1/1] package/python-tomli: drop flit-bootstrap
 for host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As tomli is no longer required for bootstrapping our pep517 toolchain
we no longer need to use flit-bootstrap for the host package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tomli/python-tomli.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index b803d67466..5d259f71a3 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -10,7 +10,6 @@ PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb0
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
