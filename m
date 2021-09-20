Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3AFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:11:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5742360FD7
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5742360FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1900A40367;
	Mon, 20 Sep 2021 06:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAZa37ivJ4J0; Mon, 20 Sep 2021 06:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F58540158;
	Mon, 20 Sep 2021 06:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A64B1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1974140397
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9G9GysvbG_H for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:11:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20F4840395
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:11:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v127so1602766wme.5
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 23:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oV/1xerpRf/9ra0JnmBTVfjA5qWqqMplVrfspRVlUKE=;
 b=beBLC6qaSe6xe4aQ3JCrScSdujLz80BFyju57iJqknEvcE2XJ/+3tbeSPucwr+2SVf
 FXTtVCWdG/oPqauCOEEobRSfybyMYcZ9K0GYIpwmDwQkOPWEvQta3bXZx1b7WKCx3+/S
 3CczUap5vUZfwefZj0v5zFg7ZI1GhjfdssjI6yVH5dBb0BwM0kAllohFkOqAEd7q87Ue
 QAQi8r9UbXs/q7yt07excN6PKGGxmzJv09hHgSN1gJpPRvMOt+/toaEw5WXjdC8gid8Y
 29jm1zkzYLJazg6JeDioiDbAPev2HNLfPihVCHtM+TM7SYf2aD8o6WrivWOCBKnXrxfR
 W65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oV/1xerpRf/9ra0JnmBTVfjA5qWqqMplVrfspRVlUKE=;
 b=uH0Gte3iyq7Sv/zLJF0RJPnKTDoXwQWo6isdeEN68G6Seyu89MOatolZGXvYzYaqzd
 VgY01mAoHEefX4bDc+sINk8aqcGyIjQU87huCKCcCqFBWAqKHsI608o9MKoAHVkuSgjl
 BBs1z0iamkHhr/B92ndsM3ddcSVrlgE6PolmLaLlrXs9WAedUWeR1b4csz91z63CLiUc
 g+z6z+2TDAlhNYZTTuGycZv+GBRTiOrjKe7TTOPPcKQv9PBU6hfUQsKzQK7LN3k7XNLF
 HnBfwl91o9eIWxO2p8M6GqqImsDV4QGX4/DFfC9UjWtuApDCcWb8+vPzYCqWsC+JqxdR
 XVhw==
X-Gm-Message-State: AOAM532/oFqVCGZ0mqQQ9S/ycI7sdlsXTDkivWMrp77bLhvvlS+SwWQ3
 HxWwO/PUf20XHpmOUTArsePlLGNRKJQ=
X-Google-Smtp-Source: ABdhPJw89XxFsnEcdHwghDFqDDEwCpdiOi4NU2egIoVEfOLfdTUtaIy9JVakytOjj46dOpKXjutIrg==
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr27263778wmz.174.1632118291215; 
 Sun, 19 Sep 2021 23:11:31 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:72db:d93a:e4a7:fd06])
 by smtp.gmail.com with ESMTPSA id o1sm14622480wru.91.2021.09.19.23.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:11:30 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 09:11:21 +0300
Message-Id: <20210920061125.221541-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.3.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Plus, add LICENSE_FILES and the corresponding hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-aioconsole/python-aioconsole.hash | 6 ++++--
 package/python-aioconsole/python-aioconsole.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index dea2216fcf..45139a6606 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  66d4b05e3bc75267daf0f773d839f62b  aioconsole-0.3.1.tar.gz
-sha256  7c038bb40b7690bf5be6b17154830b7bff25e7be1c02d8420a346c3efbd5d8e5  aioconsole-0.3.1.tar.gz
+md5  b8cbcb6e00d8e535256526dfe4f27db3  aioconsole-0.3.2.tar.gz
+sha256  9355b36d41d5fbdd3dbb01510deb2b985b508b2ebcd5b8bd85af61a707e2f6c8  aioconsole-0.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index b32d2bea0f..75ea3c2a2a 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.1
+PYTHON_AIOCONSOLE_VERSION = 0.3.2
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5a/12/fce04ddc0a8ebd6482e5ec293d8bda47c9e05c82826b061f7b73523b8601
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/7a/b2/747ab3cb965596cd84c5159941613d901d8771acad3c51c4f5da362aa9f0
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
+PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
