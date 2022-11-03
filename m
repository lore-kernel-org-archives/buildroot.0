Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8ECC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF3A408DB;
	Thu,  3 Nov 2022 13:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BF3A408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttOo8MIUiKZy; Thu,  3 Nov 2022 13:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5262A4086E;
	Thu,  3 Nov 2022 13:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5262A4086E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B03E31BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B54760FD6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B54760FD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4HoU00F2K0O for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:15:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AFC26072A
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AFC26072A
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:15:47 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id p184so1238268iof.11
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=muq8xBbToLGJECLtboWk2QJMlQHNylab6aguxswAPcI=;
 b=wNU2zdtiPSIGrsg4Gt3Sw4bGhWfSyD/0IeViFRDCnYDa4xHG0y+/7+qJwrAistyaS2
 FESUiO1W20YbdawiS1XCZ/rc0zuNkmTEMUL3FB8nkfCA+2gWTYKlxhUFD9BuYqjWevEl
 fsIglDNOShRUeCmgVxBpjbE0y0S6JlxqKZzaGLy2O0tazsvM4691RRNuu9dwO9r8rB77
 MX7jJ3aToa2tW4oFty2hAsTMBWKbZeKIOZ6ZIawXuowDgs6F2pkZTmciX1VI07P/dMrG
 HNHAYfOeLbsqzWbODfoy340mQkPUEBtoKzq9gpZDqCz7t/hPBABNb0L9OjpF5BhCMgPq
 gv4Q==
X-Gm-Message-State: ACrzQf1VTPT4mIpGYloFUzCNSG8sUxPs+yjLfYmse+wULCnBZiFxCHKg
 saAZGi2HH1we2wbdhomQ1xyUcBo6h8RdQc31
X-Google-Smtp-Source: AMsMyM4koiWmHor9IMGqE2DGFgzti5jtVb/undRjK12sI0+NTe7ZBmojtCRCQBH0KHbRxc9yS0ZYtg==
X-Received: by 2002:a05:6638:eca:b0:375:5d65:ce6d with SMTP id
 q10-20020a0566380eca00b003755d65ce6dmr14529266jas.63.1667481345931; 
 Thu, 03 Nov 2022 06:15:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s3-20020a02b143000000b00370decbbff3sm196731jah.148.2022.11.03.06.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:15:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:15:44 -0600
Message-Id: <20221103131544.627805-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=muq8xBbToLGJECLtboWk2QJMlQHNylab6aguxswAPcI=;
 b=G5UBLx5iqAOm+4DMEkJlpKlEKi8qnnZj2XMswands7lQA7XMujZ5P1sQ7aY61UNLon
 yB9WoBjmyqhJFZOfdvsWlSE8cW2q6JSopVx282DJ01Rb0DVLAP5i7XVYLwM9BEbbtmfa
 qBIOIKlahptwp9nM51T6YSPquEi695tx4XfSDc4ucWGDgIMu9a4Z3IxXqrn9eSXT+7nd
 PF4mw7mDcjepO8hdzaFWpx2emXqedbwEEI9huFlMC+BCr6W3PzZM4ttOv64Rz+aU27gx
 BqCUZKCC+bttCinbKz4e7y2+C2eZhHrLqjaxSDM6EulZvmfYA25iD/w76I6xtigcFMRe
 t56A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G5UBLx5i
Subject: [Buildroot] [PATCH 1/1] package/python-mutagen: bump to version
 1.46.0
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
 package/python-mutagen/python-mutagen.hash | 4 ++--
 package/python-mutagen/python-mutagen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index 0cf25fd5fe..2e1a588936 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mutagen/json
-md5  76e1f7fc2386813c0ff2716695fb06e1  mutagen-1.45.1.tar.gz
-sha256  6397602efb3c2d7baebd2166ed85731ae1c1d475abca22090b7141ff5034b3e1  mutagen-1.45.1.tar.gz
+md5  648c9f38b8ef46ffb0d5135524650b87  mutagen-1.46.0.tar.gz
+sha256  6e5f8ba84836b99fe60be5fb27f84be4ad919bbb6b49caa6ae81e70584b55e58  mutagen-1.46.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index 627ec70e96..07ac9542c6 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.45.1
+PYTHON_MUTAGEN_VERSION = 1.46.0
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/f3/d9/2232a4cb9a98e2d2501f7e58d193bc49c956ef23756d7423ba1bd87e386d
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/b1/54/d1760a363d0fe345528e37782f6c18123b0e99e8ea755022fd51f1ecd0f9
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
