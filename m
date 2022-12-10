Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03882C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8B960B3B;
	Sat, 10 Dec 2022 21:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C8B960B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a80xITKF3Gh; Sat, 10 Dec 2022 21:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD7660AE4;
	Sat, 10 Dec 2022 21:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD7660AE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B69541BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92313404A0
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92313404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXrwSywxL07Y for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCAFE4044D
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCAFE4044D
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:07:40 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id m15so1619149ilq.2
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ISXvQdemHuqk+0oRl/ZYuLu3mO1UMTZhmiCdZPTbA1w=;
 b=aEw/dxFhkt/DcXeyRzWQ1dlQeeEkLN1JM6QrJCQMVGu0/S9hF429yAXp1JJboKxkOf
 nkE8MvMbBMqh1bAk92qMAO+AwLb+bNKH+TOlQuqm5s1DqBrgb98jsCBbZ85R1HtGEMDR
 Mj9cFldb+Oe0j3aZZWXGSmRq1Ax4kOw58QWAPdgPRblSIcEAbHAQGy3XWMoPG3UlXSch
 M2AAOeAoTIbV6DdEe5AlZHPwVizUh6AweYoptBmjPvODsyc5KmaAOKI+k3BgFVhDH9Z3
 M3CpQ0Y9WqcI8aSQmKOH+GUvssvMdGa8Pro0mPmkJ8nVBvsg/IcJNTAiE6DzwVqmIUZk
 li+Q==
X-Gm-Message-State: ANoB5pkka2Cs5NZDRSZ4EKQZXHX+xYR0o8+e1F95pQqnOscXWK/iCHef
 3fbOW/KphRA2Z6DMzS03+/0aL2cGRVvTf+o4
X-Google-Smtp-Source: AA0mqf4fzkVrrldU0Mz5vAYxXFJCKx2aDfKjLLc4enTPePXy0VITqTMxroxh0yvJS8Z8dUrQduiniw==
X-Received: by 2002:a92:d141:0:b0:300:c1b:8e4f with SMTP id
 t1-20020a92d141000000b003000c1b8e4fmr5787715ilg.12.1670706459704; 
 Sat, 10 Dec 2022 13:07:39 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056e020cd200b003030d8b3cb7sm1578954ilj.42.2022.12.10.13.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:07:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:07:31 -0700
Message-Id: <20221210210731.3658517-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ISXvQdemHuqk+0oRl/ZYuLu3mO1UMTZhmiCdZPTbA1w=;
 b=bdSy7eH13RgP5YZEOsefKIsl1hjzNdVmN+5zC5tiLARZHR/jgLotRCYTASgRASbhfd
 pPxN9NnW+gsLdLkdxozclRW9eDiBQNl4ACi4cvTMj8Nh5xTpUNjN6Z6wi5zhxxmQnKFK
 g3MvOdipS160C85mjFXYi7qpLoRLnkzgO/JX3ClBfedpkTriw/+Hgd5TfAq+pae2xL8N
 +A0Jrydh8qdzNy7eJ22eK5hJrKsAbVUx1sX8LxFmh6l7dqJ5AMA/aV8LbV5lkpR8xSZH
 3DJf5bSovyf/oATjFeq0nkkg4OecmoOm8SmJJ06kxnV17WH3mR/TBPOw1Yw06NUXjWE/
 PqwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bdSy7eH1
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to version
 2.2.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 59facb8fea..3bacccf2d6 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  0e60e0a2d3a8c18ba37105f8b44de810  watchdog-2.1.9.tar.gz
-sha256  43ce20ebb36a51f21fa376f76d1d4692452b2527ccd601950d69ed36b9e21609  watchdog-2.1.9.tar.gz
+md5  d029b806814bcba26745c26769a847bc  watchdog-2.2.0.tar.gz
+sha256  83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01  watchdog-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 71a3f8a0c2..bb9f145e16 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.1.9
+PYTHON_WATCHDOG_VERSION = 2.2.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/42/f7/da8e889f8626786eac9454e8d2718fc79359ed517be20cdd50c647167d39
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/c3/fb/bd960970258366b0704307ccd12617d64201407bfb6d31ae412d2762ccf1
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
