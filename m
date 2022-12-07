Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC942C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 03:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 172FE40AA6;
	Wed,  7 Dec 2022 03:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 172FE40AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4OuDhDpnDf5; Wed,  7 Dec 2022 03:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365E0404EC;
	Wed,  7 Dec 2022 03:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365E0404EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D212C1BF307
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 03:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA3B96106F
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 03:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA3B96106F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z08QyrPG8ohI for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 03:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B44C6106C
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B44C6106C
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 03:16:05 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id s196so15121809pgs.3
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 19:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkLz6BZqo2PVfa5fJsJgZGdQNqPZd0/YCap4ZQ5XyVs=;
 b=LAn4ixx2cVWCcQO6LgpuEgM3U1UKj2rUEbcwNkQmhKKJlno8FEhUSSAN4rTEWjvhbs
 9nY7jWS3/KmpKKnP69bIrN3Kdpi2IekzMOI/Sm13cpeFR19jENateWASMsJlc/vLAiKT
 Kj9J9DbHq1Da21eGXW6omYbV1OP4l02MR1NDOVHhEuUm3l4OKwPk8bQ84kjkjYBgYBbz
 oWIJkL3/YC7L37fyZIMZJbKZiKhKz0Nq7/a3rQu96pN6LYOfdQVo2cDUUL7gRAn76WAd
 x7SYLK0aW5JinPk9MFMFuYT5Kc/L7+mCgRagUfaMkUHpDOZzG9larx4D9yPL/H+UhzCE
 FiPA==
X-Gm-Message-State: ANoB5plazMXmbd6pT7a74xgS9e8hTmnYLd15xcWbH81M7CdnA3j/fTG4
 D+dkgF+5UFdmyVE7t8QUAPCXBrGzl5o=
X-Google-Smtp-Source: AA0mqf5nEp3yCBFXkzAjoPx7LXYM99m2b1qCiBuX3FGQJbRtuln2Ed20aaR9fIrIPm979ntM5+pIww==
X-Received: by 2002:a63:1e44:0:b0:478:91e1:ff60 with SMTP id
 p4-20020a631e44000000b0047891e1ff60mr18131899pgm.206.1670382964059; 
 Tue, 06 Dec 2022 19:16:04 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170903234f00b00186ff402525sm5128439plh.213.2022.12.06.19.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 19:16:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 19:16:01 -0800
Message-Id: <20221207031601.80964-1-christian@paral.in>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to version 1.19.4
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

Includes 2 security fixes following the security policy.

 - CVE-2022-41720: https://go.dev/issue/56694
 - CVE-2022-41717: https://go.dev/issue/56350

https://groups.google.com/g/golang-nuts/c/rQgaDWEvUrE
https://github.com/golang/go/issues?q=milestone%3AGo1.19.4+label%3ACherryPickApproved+

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 866e7e0d59..d35db10213 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212  go1.19.3.src.tar.gz
+sha256  eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368  go1.19.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fd4caa2e5a..44e0c622c9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.3
+GO_VERSION = 1.19.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
