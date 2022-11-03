Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8D3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C4B6103B;
	Thu,  3 Nov 2022 20:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C4B6103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mVE7tNwL6dB; Thu,  3 Nov 2022 20:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B8D161034;
	Thu,  3 Nov 2022 20:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8D161034
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D73D31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B141741852
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B141741852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0tJq_JqRIWN for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:31:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97C9041758
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97C9041758
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:31:11 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id d123so2345464iof.7
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+q64ZeGcW/N8Qq4cyAsDVSy9rqwgRVP5hFZrrLx+hA8=;
 b=y01iyiknrm1kkJbxdO+y2Q6zt4GZFf6DqdTwgdLF1jHmB8x5cJmpuytBMlabJFLFR3
 fveCLuhnYWf7PlIQ6xDImJKyUGIQOiEMHD+n8uySE2Bu61oZ7LYbok+XsvtqAiVXgzy2
 d0znl73265iD5H2faTv5uWj6MHcfdiw5/8SJgEfchguHAXDfJO5TJWWfomstLfhwd+F8
 +vVLNvvquUjTby5h3eCEpfspsO5oMr1LLpHDcr1dWGa7rZ/MuP6qgFQ5dstQuNbKzTGt
 M+PL3btVvf2Q4Bw4p8Y2Hp1VDaQ+b9VdRZZ4+GsTKRAw62aPTAmrmvsrbZn5OuZF48oA
 nvDA==
X-Gm-Message-State: ACrzQf2BXYPpHdYbvGOscoIgHDifghCYciKDdgdK1asuK1jOUYIrHmOR
 2QDnE47cv5VBeGO+uRPM/djMj5GOpaKTqHdV
X-Google-Smtp-Source: AMsMyM5n+kll6hztNghginUBYcEiNW1iOHYyZE+ki3f8nGaQCbNoPxwvKHX5OntFZZq7ZtgDzBCxUA==
X-Received: by 2002:a05:6602:26d5:b0:68a:db5d:2923 with SMTP id
 g21-20020a05660226d500b0068adb5d2923mr20397920ioo.175.1667507470452; 
 Thu, 03 Nov 2022 13:31:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p20-20020a02b014000000b00363e4730a41sm521863jah.175.2022.11.03.13.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:31:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:31:08 -0600
Message-Id: <20221103203108.442436-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+q64ZeGcW/N8Qq4cyAsDVSy9rqwgRVP5hFZrrLx+hA8=;
 b=WbvHrC1uCD7kESqd02lcCzoqka7JlODgLHOj/98s9WkEyq1soAyKeYO9J5trr6bcGd
 0shUDNJvWPrs0JtzXaa3h/lzSk1lDV1Fsj/1shLAIEiX6dKS8MRHeaRWLakdeeg+GhFl
 8KsjYSIsSYsOpd7B06si1JnTT8Mum1Q2p4ke1j0WIkA/XdllDfkDvKnNsf+uDFZ8Yp8C
 JcqvLeXdNxPxc0mJjlScvQerUiU9GN3oRKqZihQdMXfHEus3eMeacCdsEwnwnxmZ+CPG
 fgbIDEZoOomNIgoNtsRufPqrZfObVlI25EVov8B22nh46DiHU8i7mh2XLjEcQYJ88asL
 ZzIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WbvHrC1u
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to version
 2.1.9
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
index 3b633f9156..59facb8fea 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  6aac660b0f3358c63658806a0579b832  watchdog-2.1.6.tar.gz
-sha256  a36e75df6c767cbf46f61a91c70b3ba71811dfa0aca4a324d9407a06a8b7a2e7  watchdog-2.1.6.tar.gz
+md5  0e60e0a2d3a8c18ba37105f8b44de810  watchdog-2.1.9.tar.gz
+sha256  43ce20ebb36a51f21fa376f76d1d4692452b2527ccd601950d69ed36b9e21609  watchdog-2.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 2dafef97e1..71a3f8a0c2 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.1.6
+PYTHON_WATCHDOG_VERSION = 2.1.9
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/e8/a8/fc4edd7d768361b00ea850e5310211d157df6b5a1db6148dd434e787d898
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/42/f7/da8e889f8626786eac9454e8d2718fc79359ed517be20cdd50c647167d39
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
