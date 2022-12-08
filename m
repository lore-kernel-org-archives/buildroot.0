Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7534C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A0C820EB;
	Thu,  8 Dec 2022 21:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58A0C820EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKYKNdnTMVMn; Thu,  8 Dec 2022 21:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0A9820E8;
	Thu,  8 Dec 2022 21:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0A9820E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD2F31BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4CFE60B0B
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4CFE60B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sostznwPOzgf for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B055160A8A
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B055160A8A
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:17:25 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y17so2790584plp.3
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4LE+KdIdGTZqMJ/1uw3006nFccDfij4Ehkj1fVfKusM=;
 b=b0w9awNFpt1aXHhD3bnCtgxz0H+UUpRel0eaMorHPRcFeIg0S8xxQW/f9j94svrYU3
 HrKJ0WOF7MXeHh0XAwv6OPS2o5qBaITppXXNNRJ1N96WpZXok+y6lzliTsXyQz3npK6Y
 QqSj/UxLiBJSKZ+rsKdJtZxI7YmuDIxcgurD6nuJjAKh1zMWPEMteWYi6fL+GKaJ5q2W
 0YClPdcZ28sEyRcQHdkAvZWunfyPcnNqGT/crQv5qL+9UujHlUBcFFFdhxKm2tJKGIoB
 r8cszjdBV7CV2F5m8IjWQ8uGgiYui/hATjXgNzahu2tLXc8v/BYDEywiePqL6xwXaSv2
 E4/w==
X-Gm-Message-State: ANoB5pnEhR4CpzuC2BqvL0rPkhLqVWsBUvXUAtDZu+AtM1ifG8UDwTkE
 meVx321tON/1gfMfkrTwqGKOUQz68HA=
X-Google-Smtp-Source: AA0mqf5X3zW4y8brKLmhBXf2eNTK/DZRrY0UjqrLYoEQx+DNWVn726iRVTxFpFKCqX3/ewTiAfnN0w==
X-Received: by 2002:a17:902:a9c2:b0:189:8b5:2fe3 with SMTP id
 b2-20020a170902a9c200b0018908b52fe3mr2826616plr.54.1670534244717; 
 Thu, 08 Dec 2022 13:17:24 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170903120600b001893efd3e03sm17132437plh.119.2022.12.08.13.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:17:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:17:22 -0800
Message-Id: <20221208211722.4101146-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.6.12
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

CVE-2022-23471: https://github.com/advisories/GHSA-2qjp-425j-52j9

and other bugfixes, see:

https://github.com/containerd/containerd/releases/tag/v1.6.12

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 285519441a..04a29949d7 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  f5f938513c28377f64f85e84f2750d39f26b01262f3a062b7e8ce35b560ca407  containerd-1.6.8.tar.gz
+sha256  b86e5c42f58b8348422c972513ff49783c0d505ed84e498d0d0245c5992e4320  containerd-1.6.12.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 89bbbf5c03..192175800c 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.8
+CONTAINERD_VERSION = 1.6.12
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
