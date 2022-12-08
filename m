Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7BC34022F;
	Thu,  8 Dec 2022 21:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7BC34022F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0j2vKFu1TKig; Thu,  8 Dec 2022 21:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C1C40213;
	Thu,  8 Dec 2022 21:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C1C40213
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD841BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552BE40213
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552BE40213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8b8HW7ZluPQ3 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201E5401B5
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 201E5401B5
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:29:44 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d7so2799055pll.9
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=omC4Vla3gW3Awk7nmYEGxgwZVFr4kOlVJCuk5kFo0O4=;
 b=Jay3bKayuH76s3B5adFYYycxX4rQZC5CQ4ADXlLVeahw5uq6+heKSPCR+a0dtk1shb
 UOEVKquuKNMHh/+mgIxefRVvq61p8I/PA/HWQipq8dXtqZnZKDKmsmIPtYFlDgyHM8r1
 /hgqygCWxoF3TOZ1j8sOGdLlhzhPbLU5Q5yIE2QRmHqzwFdIeJeNCuv85cjyaMzb3uhg
 8pOKx2ejrNBiXZC/An+cZq9bVpx7cWgHy7bvlLPSyilc9Gzpn65ppFn8hoYJMZnCkhHE
 z3idYmsKDqKZawDQxthNSqSnsOYx34HveTQCXBB8oFE12f0tVpbgSyWJqj119cBf5TmV
 y4Pg==
X-Gm-Message-State: ANoB5pnG2jX+TBTUYUb98rNpa2oFl3DZLh4y+CWiZjE10d4QKjlpDSOs
 witHesV1ZsdW7S/atik2CBQGSUZAwjU=
X-Google-Smtp-Source: AA0mqf5nLaYyCQx+r6HOuOHF1kwpwA80DAC0Yvlw7msxh1FdkT6V8Cirg4oKyfxJ2sKYwRCIZ6D91A==
X-Received: by 2002:a17:902:c244:b0:189:7e79:d92f with SMTP id
 4-20020a170902c24400b001897e79d92fmr3537280plg.40.1670534984119; 
 Thu, 08 Dec 2022 13:29:44 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 o8-20020a170902778800b00189a7fbff33sm16990040pll.170.2022.12.08.13.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:29:43 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:29:41 -0800
Message-Id: <20221208212941.4134613-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/delve: bump to version 1.20.0
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

https://github.com/go-delve/delve/blob/master/CHANGELOG.md#1200-2022-12-07
https://github.com/go-delve/delve/releases/tag/v1.20.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index 04ea4954cc..bf730b9047 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  086106a4776fa155bf20c37d27b9caed55255be6359c7f0bda1893d3adbb614e  delve-1.8.0.tar.gz
+sha256  39d2e3ae965abf5e71f3d8efbef368b1ee1d7154ea6604ec71d508350d419d03  delve-1.20.0.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 4ca1786ffc..b43d0f03c8 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.8.0
+DELVE_VERSION = 1.20.0
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
