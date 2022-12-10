Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A88C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E13410E5;
	Sat, 10 Dec 2022 17:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E13410E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbtI8QZj5a0B; Sat, 10 Dec 2022 17:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34711410DB;
	Sat, 10 Dec 2022 17:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34711410DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5711BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6451640436
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6451640436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSt0GCBOH6J7 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:44:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B9B140376
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B9B140376
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:44:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z144so3725920iof.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5a0xmtzXLwwsUWQSb/mOWLZSLjcuxJu6DaKRUA07lp4=;
 b=trIorkIA1LrgUrl8FfnBz7bhSeFWDWnBlzODKmkOtXs50qhuYI4+305qFT9OqKzeLZ
 4mz+x21L8qrp2yj+O4LGlSI2DmOvuHmGQKxKt5h+CmzdYWzrwWk1nI+cIPc4h0mW+zeR
 GT2yiZm+gDreyOCQN63YJTpgc8aXh52SFlu63P7TzcoY130LG6+JoK5nqti1ajJnWt2Q
 AVXyzYLXoT9ytYBEcIOWDqKNyPZw055btBt742b2qPkApu6M3JzlgrLZTh9D8vomEicP
 wqwtDSuGbt3Ce3gjDMUG+Q3KVdoLQLUkWwyy4pScBKeNl8fWAuh27vjeXo8/Kq2JrHKx
 S7xQ==
X-Gm-Message-State: ANoB5plpMoAn34i5tm6eYf7id6lHwGNPfqhew9qHzhF0YSn+yJO9nICu
 f7HiuCmroe6UfCD7PG54MQN4J4jEb1GzcQ==
X-Google-Smtp-Source: AA0mqf7YrPs2rMQD/j0Iq6nswARIAOfJe3ayXWp7sEPJRdolena6E7yWJGHtfpJuXrt6b0vPYKh/sQ==
X-Received: by 2002:a5e:8b43:0:b0:6df:5b14:61ee with SMTP id
 z3-20020a5e8b43000000b006df5b1461eemr3354897iom.5.1670694256432; 
 Sat, 10 Dec 2022 09:44:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056638112900b0038a79a2923csm1531070jar.56.2022.12.10.09.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:44:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 10:44:14 -0700
Message-Id: <20221210174414.2678429-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5a0xmtzXLwwsUWQSb/mOWLZSLjcuxJu6DaKRUA07lp4=;
 b=J7SStk+gU+x86A5GTHQ3Bz6Kmt20Cd6mrQJES+pUxeeVGcpmgPZou+UJ13T/w3t6gO
 fuwigmwvxJlcS5705XrSamc1H+o5pfzGP3oOnSI9xXm9/aSZF+VCQ8D/J/qNGC6pdKbZ
 qNzySi1MGM/hYPg/GvU6QAIidyVCk2gAgNkr2TlIV/IdftcPNNYXZDqq31U8N97s7wc2
 EMAb5m/EnaVjTsbIdEKoOLRTLgXPh/BcbvPlhBcWIWHsXV9iIeRwKVGsnN0LubW7geB/
 6y+Tq9z5Znl3cjXTY+OmrqIH/RN2olhc5ntgju9rLnWDRwOcuO+IHJw/+UfSJoHquP3t
 OM+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J7SStk+g
Subject: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version 3.1.1
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Always build cython modules as sdist does not contain prebuilt
cython sources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index d4e99a6998..497b5d2b57 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  0172450908573a4449a5937810d512b9  falcon-3.1.0.tar.gz
-sha256  f2760bd18c16393a6fb5e55f371f67921edb72febe693a82b3c5e82195d087b7  falcon-3.1.0.tar.gz
+md5  383673fc6378428d0db5861a416cad0d  falcon-3.1.1.tar.gz
+sha256  5dd393dbf01cbaf99493893de4832121bd495dc49a46c571915b79c59aad7ef4  falcon-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 01b5eca4a2..b5ebc399dc 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.1.0
+PYTHON_FALCON_VERSION = 3.1.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/36/53/4fd90c6c841bc2e4be29ab92c65e5406df9096c421f138bef9d95d43afc9
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/29/bc/c11c9a14bb5b4d18a024ee51da15b793d1c869d151bb4101e324e0d055a8
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-
-ifeq ($(BR2_PACKAGE_HOST_PYTHON_CYTHON),y)
 PYTHON_FALCON_DEPENDENCIES += host-python-cython
-endif
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
