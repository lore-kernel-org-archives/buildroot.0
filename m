Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28CAC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3858D403B7;
	Wed, 22 Mar 2023 00:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3858D403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vjosZo53g9v; Wed, 22 Mar 2023 00:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7458440154;
	Wed, 22 Mar 2023 00:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7458440154
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 863C31BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 614C8408CA
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614C8408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0nmx4f5ZQ2A for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:13:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576654085C
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 576654085C
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:13:30 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id u8so2383666ilb.2
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679444009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uKDawSWJ4J24EVg/tpPd3MpHE7nyG5cECrG2jzCihqw=;
 b=jU0O9l38BOvLgeeO+SxYb68Kfxt4uRK7riY21XPkleKWC0WB1RUh7Kc5VOhW36eFFH
 7058Fp54DUaBqFVYv3dJB4gz7uhOgtR4t49mNU8Hke6DnCC1vBZMX276N1ug1y9gxNJ5
 Hm7iCjq48BMK4HUamhOmR1DrBAKY9NEJJ7UsJ5W2omZezhYL1Y3UR7ZHQm4jFeIsa6OW
 PyOO0cRBvScbz33kO0Z3hIUjGAPxYq+pzRu3Fn/eUVVFD0baz4aTafFxQkF6D/I/YI3f
 Aobe2DQfsUv4vdNmGrvZ+J8P0w3IRcbSotBjFGwz2wB5zbhLMBlfPO+wO6BVI9G23RiA
 gHvg==
X-Gm-Message-State: AO0yUKUlWL/ksCm6T/M6kyFQnOhT8zTTylJ4iLlLr1r60EorZt1nn3vu
 X27DYiHle/MXXB+hWGDOE60Y8lOE/4dgkQ==
X-Google-Smtp-Source: AK7set/vrq5ubcJVhWkIfu119LH84+wQbd8g4DgEcjr4v1qVBz+clGPu852QZ46ZbfHSE+GONmAw8A==
X-Received: by 2002:a92:cf0f:0:b0:322:fe79:8141 with SMTP id
 c15-20020a92cf0f000000b00322fe798141mr2760848ilo.1.1679444009284; 
 Tue, 21 Mar 2023 17:13:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 w130-20020a022a88000000b003f8765183cesm4619344jaw.87.2023.03.21.17.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:13:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:13:27 -0600
Message-Id: <20230322001327.4060460-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679444009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uKDawSWJ4J24EVg/tpPd3MpHE7nyG5cECrG2jzCihqw=;
 b=lmy4+M4AJREqS1Ycb46W+RYC+AV+FlvoXKEiJBmxoYlkQMJ6Peo23MpyI2YtxAT2b7
 V0q+YbtbQOxEow2WK8Z81AnkCCDGjQup/Rs1MU+C+ZXgw4pT9wEUL9R06P5mkzDIeZbo
 75Gu4v+3x6qASuS59F0o284GLehMqaON4CxX8RbYHbMVnoUwVD7wjegZlvuzyoqIKqfq
 IsvSFGhqpWDZV+xEx1gR+q/2NwX9zwFxwcz3pAsyuV67v04GDjVY06BR532JdNJFLItN
 8RUtedClehra+jJsN8nwvo7ZLyt7domjNvAkjcBPoc7boQWAm9Muzr9q3HqHqm9Gjqrb
 EukA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lmy4+M4A
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-jinja2: bump to
 version 1.5.1
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
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash | 4 ++--
 package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
index fbf244e470..0a7b7cc058 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-jinja2/json
-md5  50f74689fd60a5bc0b0a74545277e9bc  aiohttp-jinja2-1.5.tar.gz
-sha256  7c3ba5eac060b691f4e50534af2d79fca2a75712ebd2b25e6fcb1295859f910b  aiohttp-jinja2-1.5.tar.gz
+md5  8f72451a7da006b4b91ef18ec6f75885  aiohttp-jinja2-1.5.1.tar.gz
+sha256  8d149b2a57d91f794b33a394ea5bc66b567f38c74a5a6a9477afc2450f105c01  aiohttp-jinja2-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d9d867affaeac220a60381cc544681dcd37c668ed6ea5ddbf9948617f828889a  LICENSE
diff --git a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
index 371b4f0b3e..17f9a4018a 100644
--- a/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
+++ b/package/python-aiohttp-jinja2/python-aiohttp-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_JINJA2_VERSION = 1.5
+PYTHON_AIOHTTP_JINJA2_VERSION = 1.5.1
 PYTHON_AIOHTTP_JINJA2_SOURCE = aiohttp-jinja2-$(PYTHON_AIOHTTP_JINJA2_VERSION).tar.gz
-PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/15/d7/8bdbdb65e2926de332d3c430839d655db61d30a7b5a4a9b2edafbeb3aa20
+PYTHON_AIOHTTP_JINJA2_SITE = https://files.pythonhosted.org/packages/4e/4c/fadbfcc1269fa79e69fcdb29027840ab022a91471a5aeaa8fd8b27cc5406
 PYTHON_AIOHTTP_JINJA2_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_JINJA2_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_JINJA2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
