Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF34DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8431840272;
	Sun,  6 Feb 2022 14:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yb392GWSZ-an; Sun,  6 Feb 2022 14:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74011400A8;
	Sun,  6 Feb 2022 14:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 768261BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 649DF40255
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFk--ARRsFP9 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:43:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66DFC40253
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:43:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso6926162wms.4
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WEesUWMVH0TtgrjKTtQ06ZOD9RKYYP97GhAaSVRFjSY=;
 b=c0S1W9izSr63QKlbbsxz+XcGbFqDJLz8ZH0FfEb7xWIAgWZy0C/1iPAOBG3YXbAX3M
 RSxGEu/I6L9sQX59UJmmgBZS1KCeyVRLiYNz1Au6tDYGQRRYPB153ktGactemYftRhtt
 esTwe5F/I8ckp4v5wRR/LY4MH3XJfbCfFwNl4gAoaV/a7Wd13NF1k3hFRjekd/HMBsAM
 CC8Bkucyc9htUIZRzgUD4AkGkCIuSq9uzsJhL16M0mzXEJFawsn7eK2oWb6/RXmNMAE0
 CCItgQpuNE4v95Oz976fIjPfmGT0QQ0LYLq+IbpmQfXVmm7zml/IgZ/aE9qwiJC3D1sK
 1wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WEesUWMVH0TtgrjKTtQ06ZOD9RKYYP97GhAaSVRFjSY=;
 b=q60KFMi35sf9HzGtNtN9AmUShk7XZ3Y5EfBlc9wlmiWNlb7iVrXwswVuoDWF5gDNGP
 957lL+N9WT3qgQOAJRWNu33uJ4URPUNys96dcYC7VHGpirI53BeMkKPGOp7i8ryj0QlQ
 OfdlCzeVcDz3WSw7+nPgFUkMRVQcDb88VCHuKdExWhLnrRKWtJ/EB34DZxvkGO8GEtQg
 po8livUZ1ZG97YzFwm5gz09WTo3CcpIcam0MgNwpuPqn/3f1sY4vl/qgQd/naWdcaXta
 uvqB3xf+F221iIUfFnavXmWW2LU3DPw5s0WWIwHk/t3FXdzRF3NDZc2ZxFYG0U3hQzJ+
 M5NQ==
X-Gm-Message-State: AOAM531XgX/A5yZqZre80Pd2NwWvw3WU2zIGXZBObec+R+wMUyl0sVwB
 zjWRkat117vaS3EwO8boGTD7oFxbpYU=
X-Google-Smtp-Source: ABdhPJyRNRRQshdi+9Kkz7XFdR5JOtE5Lykj4igNLNoCp+xhrTwyd3uImRyjoJimfdhQ//psOHPo7w==
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr7229819wmq.152.1644158635412; 
 Sun, 06 Feb 2022 06:43:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o12sm8317966wry.115.2022.02.06.06.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:43:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:41:48 +0100
Message-Id: <20220206144148.1755592-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version 1.3.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/jnwatson/py-lmdb/blob/py-lmdb_1.3.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-lmdb/python-lmdb.hash | 6 +++---
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index e7b8ae3455..e50c35df67 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  b8f4a2cd1748e8a5f5e352d1cb3d4350  lmdb-1.2.1.tar.gz
-sha256  5f76a90ebd08922acca11948779b5055f7a262687178e9e94f4e804b9f8465bc  lmdb-1.2.1.tar.gz
+md5  3c955c49be10a7a07a2fcd54d180c3af  lmdb-1.3.0.tar.gz
+sha256  60a11efc21aaf009d06518996360eed346f6000bfc9de05114374230879f992e  lmdb-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
+sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 33c48cc8c7..fba168d340 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.2.1
+PYTHON_LMDB_VERSION = 1.3.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/2f/df/3aea5279753cb8ab0c96dec43106e24f388d4179d5224f6d3e652016c095
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/ed/61/41f3c7cbd8a67202ef24fad3375ed936093a0547dc645581dd11c09581b7
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
