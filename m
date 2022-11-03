Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA33C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A49ED81F6F;
	Thu,  3 Nov 2022 19:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A49ED81F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cU_Tt91bnrl; Thu,  3 Nov 2022 19:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71E581F6C;
	Thu,  3 Nov 2022 19:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C71E581F6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 392D71BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1496E81F6C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1496E81F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3DmDZgeZBfW for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:04:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AA3B81F69
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AA3B81F69
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:04:01 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 11so2190995iou.0
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AQlPW1WqWIDmI8laFFQKOgS3NdR2U6kiIU7QLnt96DQ=;
 b=F8vqMGnxnMJsQWqKaAdrXsf4gzZdmikb7AyC48peYaT8ZCJI3CeOQKv5ujYL3WBDRX
 kCcA9ReKFaCv1MetLByq8A0AAzpMcW1SPfgNZUik4GO0DQe/JvYNim9DOA/r7ZpSne0m
 f5d0JLvUfRhpe7jP0tp7imRIMWWlmvXbwWu5OQWl9RzwDIe2gIRO9m+R6FyLGV5oFSti
 oI/Y/zib7QkUsq887vxaoprAydeTFj9RatOrigFEaLXxqkTslQKJeB0pY7UymIB9p1U8
 Gid1DgdBFjqG3knff+v3lXZW8lXkopnmGydWIlAOlkcc6QV0YgyAaypRZxBB4thMtgzO
 gvWg==
X-Gm-Message-State: ACrzQf1ui8Vv0hy+DrzxbuosYBQGnn13xWKCIV2Q+y79wNirWpHAaeRA
 +LwgrcbAALzHXZUpkpXhdH0HulC1Z19CdsXf
X-Google-Smtp-Source: AMsMyM5wr5oEMPsXVbwjBUta2T+yTHvNWs1/XrnVug3+HJihbI5Na/eQjXhTYmUaopGiCtlU+iPPJw==
X-Received: by 2002:a02:c9c1:0:b0:375:631a:92a6 with SMTP id
 c1-20020a02c9c1000000b00375631a92a6mr13038750jap.9.1667502239833; 
 Thu, 03 Nov 2022 12:03:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i9-20020a056638050900b00375217ea9b6sm463977jar.45.2022.11.03.12.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:03:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:03:57 -0600
Message-Id: <20221103190357.3531351-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AQlPW1WqWIDmI8laFFQKOgS3NdR2U6kiIU7QLnt96DQ=;
 b=nr73o6VHjf9KlcTshCQ6X0KeeivfN+dg888GHPeFiepWmzDpLxbdRMzEUqtNm64t5U
 CJ23HaqYwklCdnZxynDBQJyn20BKmME/Bo7T7lqvML2JaOJT5PMTpAMKuBMEDl0i0jp7
 fuwcvGBeTB8azqaJtbp0od/Ik9kVkmmZBAYMAI6PKlZEOuk4VpTPYfDHrKGxb4P6nGd7
 qstymzqlMI3GznpwRNvjIxzIYxospmrMjlqpq2VnYooQ7RKJa5k1QOqLvyjia8Z6gXSd
 UeoMAPAE5USOUz482/3Ho18ElF/SBF8IdBXJk/eQBssVq8mu/mCUAjKiNUwh/2YgY0vn
 ur2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nr73o6VH
Subject: [Buildroot] [PATCH 1/1] package/python-rsa: bump to version 4.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rsa/python-rsa.hash | 8 ++++----
 package/python-rsa/python-rsa.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
index 2ea1245667..0e2b3a9119 100644
--- a/package/python-rsa/python-rsa.hash
+++ b/package/python-rsa/python-rsa.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/project/rsa/
-sha256  5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17  rsa-4.8.tar.gz
-
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/rsa/json
+md5  26a1efb79164a95c363e550c3eefe683  rsa-4.9.tar.gz
+sha256  e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21  rsa-4.9.tar.gz
+# Locally computed sha256 checksums
 sha256  073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index 0de35fe43e..01b5c49b50 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RSA_VERSION = 4.8
+PYTHON_RSA_VERSION = 4.9
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
-PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/8c/ee/4022542e0fed77dd6ddade38e1e4dea3299f873b7fd4e6d78319953b0f83
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
 PYTHON_RSA_SETUP_TYPE = setuptools
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
