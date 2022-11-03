Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5834C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7668A60B04;
	Thu,  3 Nov 2022 13:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7668A60B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41XgZn_NFr15; Thu,  3 Nov 2022 13:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D56D60AA4;
	Thu,  3 Nov 2022 13:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D56D60AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0B61BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBC3C81E01
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC3C81E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOJXIKlIABhT for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BADF81DFD
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BADF81DFD
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:55:52 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id z9so1051527ilu.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t27cXPcVhsUvORfT229NFK0IHITgbnX+z1mQjuuDP68=;
 b=ryLn966Apk5/cSdJ6zZK2qg2uUhaE1hIrbsBcaj8tAFjPPLIhf2Y+pnNXHy7FCGah4
 u0sfvOh4hFRq3BTFSfDrWX8If6TmWo1/8OmarZSp5h+rLI6vLZzBEXnWw7cr/pSBDNO9
 /ukMTu41RpdW7vaB6AnOf0CKs5Btq4zNItdj0U/rSEGN+xu/CYhV8oRkAuo7alWq8spK
 g7APK8lwcyJsVfqH6YdwM2nRzwa+6zWRE8jMofMpo0FcyLNhRoxfSvcjP2zCDy7M5Sg8
 A3LAs7lMRPhHa3A+c+bnXkX5D5SUXO4C4tasenlTn8JTU/CmKvFkRpgWLKZeKCkHKDaS
 iEkA==
X-Gm-Message-State: ACrzQf2nuAiYgxBMn6Q+kL02GpvKLMyQSxndkk63KMlSw/f8G8bZEriJ
 WU+jEmhcDVFCLkNXJFr9z2OUSYm4Eh2RhipT
X-Google-Smtp-Source: AMsMyM6keoA4i1koUgWlSDmqAbnVM6awwJPrIftrt3dr15gpqtR13BdrCnGQ8w6Y/3aXOncXnO6emw==
X-Received: by 2002:a92:1947:0:b0:2fc:6475:5113 with SMTP id
 e7-20020a921947000000b002fc64755113mr18096781ilm.196.1667483751403; 
 Thu, 03 Nov 2022 06:55:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c15-20020a02960f000000b003739e4d381esm232414jai.141.2022.11.03.06.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:55:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:55:49 -0600
Message-Id: <20221103135549.3336213-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t27cXPcVhsUvORfT229NFK0IHITgbnX+z1mQjuuDP68=;
 b=JPjQZVDMLU2wAKT+b2HHVR2ivi8hdNjJCBAOte5zIUC+wYvTzs3s6d/6eaZnznqh0n
 7mueOEKAI9n9G504jjjVT0QAmGkpRIYF58oWAWUU4OFuq82ShEQp742TVRJ5wlTx65q4
 6IKXmtHru5ingbpQuUEBKzeK4H2At6v1vAKGekHHXnT0RefQWtWgXZnzEAv4LwiP43LK
 4ubSfNOqpYYjpD6Hn/teJyeVLDopAob6iajy54Bv8ylW87YF2ueT+2cZuEbt86N/js42
 ATxLgBK9Cun6bCaDKQt9rW2CplGndvdQj0Sj/zeyoTkk/J4ARh/n4STSH1L7YkI7mb8r
 RaPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JPjQZVDM
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.9.5
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
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index d02ffc2ec8..58f98f9d84 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  182e3e8cf3381c254f65f70cad4976e5  psycopg2-2.9.1.tar.gz
-sha256  de5303a6f1d0a7a34b9d40e4d3bef684ccc44a49bbe3eb85e3c0bffb4a131b7c  psycopg2-2.9.1.tar.gz
+md5  3cec7285f61690633bb070d4bba259c2  psycopg2-2.9.5.tar.gz
+sha256  a5246d2e683a972e2187a8714b5c2cf8156c064629f9a9b1a873c1730d9e245a  psycopg2-2.9.5.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index de466e2c59..fa23c2814f 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.1
+PYTHON_PSYCOPG2_VERSION = 2.9.5
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/aa/8a/7c80e7e44fb1b4277e89bd9ca509aefdd4dd1b2c547c6f293afe9f7ffd04
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/d6/cd8c46417e0f7a16b4b0fc321f4ab676a59250d08fce5b64921897fb07cc
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
