Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6500C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E9C840017;
	Sun,  7 Jan 2024 21:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9C840017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKLVgHg--hRV; Sun,  7 Jan 2024 21:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4799D403FF;
	Sun,  7 Jan 2024 21:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4799D403FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8B781BF381
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1E7F41591
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 21:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E7F41591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3odpkjlsd02 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 21:08:50 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6797410B5
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 21:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6797410B5
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7b7fdde8b98so69633539f.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 13:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704661729; x=1705266529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VTVWYsVl6vgBTRY7P+nDAkIQKUQfcuWn3kiT2M36/3A=;
 b=qvbPzM5jTxSLtuUveY6qCdm4mEAi4MPalDlYGJmKc3EZPG7S5+2LTf99fGh3txgTFx
 97G1Dct4VOhWKBalM8UGAQ1755aCYit7Aa4B1ra/fn3qQaXcJY1uLhMW6XER5eg0c5B+
 XXHulOXQqupDoVn9GIgL0/NO0Kqm+pN2GTX3nZ2SrXiuYEnl7P9gpOQk5KJSP4CQeD1V
 CsCYrSlaY6/fv3V8kZxFvPr/baxplQ44hAfHM6P5JCknLXLASnphXm9BE7lzLUPClJC7
 saKr4mGihZ/xqDO0EZRym2xgWbCrQQtwFQnMtUnU0r0wyBN4k/a8abqUzB+fM/rYgRoV
 MUGg==
X-Gm-Message-State: AOJu0YwmsUOev9PuVX9fpc5tH6LLEMHfw/yDOn4r3P8uQCyMmK7cD0Ul
 qL4TpEQAwga7YoSBwmSAP5zWFQz4HF7VWA==
X-Google-Smtp-Source: AGHT+IHP4innmAOB90pr8eg+QhAj3gMv1JVPbM0QlNu1u/npk5K4+RVnIILXywfdMdm2mi2SkU9aUw==
X-Received: by 2002:a6b:6f16:0:b0:7bb:15b:4630 with SMTP id
 k22-20020a6b6f16000000b007bb015b4630mr3155829ioc.6.1704661729150; 
 Sun, 07 Jan 2024 13:08:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a4-20020a0566380b0400b0046dfb833ea5sm1890808jab.17.2024.01.07.13.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 13:08:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 14:08:46 -0700
Message-Id: <20240107210846.3319912-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704661729; x=1705266529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VTVWYsVl6vgBTRY7P+nDAkIQKUQfcuWn3kiT2M36/3A=;
 b=KeTtCmnbQn9BI9WqU40jf4n8N9v9PtnapffGTtseJzEqaopLVYdw74QCJvJFfN6Iwf
 JHA51FbZYIBYkAFSNsFeGM6r+mwBHvIC0lRvmr22IDLCwjXaMpgyrmqA/J0UVksJ8yDf
 6WDp1m7AnmDgtsc32OzfofMHPun/xnJ5Hq+KsZVF9Buj6qB3XszJNrz8DzIUOzc62Up2
 n54SB66fdShdqD1/M5cBDMp+htN2gyqPV3Mhdaz4rNSYohOBVogtvgWujgwgv9DINuPO
 9sd30AQpPVPCfMDhvWTFRUyXkzMTxE8eIyuzWocpmfuYbTxMKx9IOTOnzrQm1MHXUTpb
 ra1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KeTtCmnb
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-security: bump to
 version 0.5.0
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
 package/python-aiohttp-security/python-aiohttp-security.hash | 4 ++--
 package/python-aiohttp-security/python-aiohttp-security.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-security/python-aiohttp-security.hash b/package/python-aiohttp-security/python-aiohttp-security.hash
index 2c23df14d6..6a76070298 100644
--- a/package/python-aiohttp-security/python-aiohttp-security.hash
+++ b/package/python-aiohttp-security/python-aiohttp-security.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-security/json
-md5  1624f982d7a779e6ed396ef2ed20acc7  aiohttp-security-0.4.0.tar.gz
-sha256  40d4bb150454e392c2dfa3620f6eab28e140e94cf0c2d3b4bf43aef653ec9405  aiohttp-security-0.4.0.tar.gz
+md5  b34fb62c6f4dd130f3c94f74c3bdc150  aiohttp-security-0.5.0.tar.gz
+sha256  50cb724d310e1d0289798bb98ae852c3b75b77e8f51ce5159c57b7261d0638bd  aiohttp-security-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a1cc8ff7210897d55d2552fa0792340f8e59720e0160b6918699d40f9a782b1c  LICENSE
diff --git a/package/python-aiohttp-security/python-aiohttp-security.mk b/package/python-aiohttp-security/python-aiohttp-security.mk
index 9ab3b16b30..274f60423f 100644
--- a/package/python-aiohttp-security/python-aiohttp-security.mk
+++ b/package/python-aiohttp-security/python-aiohttp-security.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SECURITY_VERSION = 0.4.0
+PYTHON_AIOHTTP_SECURITY_VERSION = 0.5.0
 PYTHON_AIOHTTP_SECURITY_SOURCE = aiohttp-security-$(PYTHON_AIOHTTP_SECURITY_VERSION).tar.gz
-PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/36/01/d85be376b7c1773b3cb7849cd56dc7d38165664df7de2d3e20af507ef5bb
+PYTHON_AIOHTTP_SECURITY_SITE = https://files.pythonhosted.org/packages/31/49/56c131fe3dead875ab5907b154dac7fb6ee727662de80b7da0ff045030d4
 PYTHON_AIOHTTP_SECURITY_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SECURITY_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SECURITY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
