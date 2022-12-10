Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84243408EC;
	Sat, 10 Dec 2022 18:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84243408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4guPQew68tFj; Sat, 10 Dec 2022 18:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CAAA408BD;
	Sat, 10 Dec 2022 18:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CAAA408BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73C901BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E10F408BD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E10F408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Awfh4tgJlRNy for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFB6408B7
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BFB6408B7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:25:32 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id z9so1469206ilu.10
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5HW//6+ZDzFnA5/JVkCLsLb0qhJ3Uo/zcwVU8lJnLM=;
 b=KVHFKXzqhyqKgPdsORyI9KT24jQ08P5t2texupg1gu0TaVoPxtWV8YczTt1NSlVL2s
 6MfAf7vVO2v7qVILzT0UXIg5FxpVTGiC8uHaRi/Rv4YjFlhEfE1WOK44nP8oS4enMdAJ
 Mr1BWGx0pWDcECRV1n/K9VwhORpiyX6z67b/1goUAPTu9KNWFa2+WAkOz+OwNVzIuHqS
 6Md2rqWYG23GR4ws3AT9QTd/d8VuLU1KbT0upY1o98XurXbb0tiYlAz6KEm2muMWF5l1
 927SUX6N3NDizngJlQIW67LvB9yv9K0JOcKJ+sPBMdCI5O3q8nej3Lg8UaZZ7vuctvqS
 KARQ==
X-Gm-Message-State: ANoB5pmJYP70E2Mkip5XSY50AqeKp6sf3QqfnRyHJetx4H27puSJaDPR
 korstxfIfOKCZPoLlj/hT5zZAkYdkFCJ7A==
X-Google-Smtp-Source: AA0mqf4ovdBBt3DPjR4cwGqtHy0eRdX3KqrapWYYHGY1sdKICkGNP5r9BWGUevdGj4re1F5R061AjA==
X-Received: by 2002:a92:c882:0:b0:302:c516:9572 with SMTP id
 w2-20020a92c882000000b00302c5169572mr5416059ilo.0.1670696731026; 
 Sat, 10 Dec 2022 10:25:31 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 z20-20020a05663822b400b00385f2a30781sm1550407jas.72.2022.12.10.10.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:25:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:25:29 -0700
Message-Id: <20221210182529.2894077-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g5HW//6+ZDzFnA5/JVkCLsLb0qhJ3Uo/zcwVU8lJnLM=;
 b=qKxqwlCVKhlgwShrPoDuWWTUL94VhtaW0ErFuwQD6Z/HAVmGPdYAOKJ7B55WDvy9M/
 wAwh5rIWsB1JRLrhhAr94IkAbGeZD/1zFnf06s5WRvryfKFAf0kRvR2W9yWE4j59vouP
 MLXuo9/odN4dbXpQEO8bX36yjg62ohN4VgAnsPZlkBTmWClhO6OurPSVCJ31uLcl6uwX
 cE9v+4OcMy8xqaeGLLAKxn0qhceVW4gnJILZcNYfu+DXYOhFwLw/PmsszBjl6Hyrp6CN
 wtvUxpM3khsXqhfpsMfXKnTHSKdoqxtDVcPd8AwUOtkntp1abw+Kk+3z2JkH33t9iJWA
 eI8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qKxqwlCV
Subject: [Buildroot] [PATCH 1/1] package/python-lark: bump to version 1.1.5
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
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lark/python-lark.hash | 4 ++--
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index abc168e93b..6e192684a8 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  d7368d8f9fd0b844c034f321f5b52fd4  lark-1.1.4.tar.gz
-sha256  eee86062b149600ef62de0d8dfd38cf85ffc737e16911e7d8c18880f8c5b1333  lark-1.1.4.tar.gz
+md5  b9048974c5ce56997e9e536dda475159  lark-1.1.5.tar.gz
+sha256  4b534eae1f9af5b4ea000bea95776350befe1981658eea3820a01c37e504bb4d  lark-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index 548adcd833..c08fc2cabd 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.4
+PYTHON_LARK_VERSION = 1.1.5
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/1d/08/eb2590d4f824b5a947d866c603799fa70278f1372cbf8d15b7b4823dfb2b
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/a2/25/8e16de418fc83bb00dabaf8c7110bc45a90bf5481a70aa5f1668fcea73bc
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
