Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B598C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F18F61166
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F18F61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9520740505;
	Wed, 22 Sep 2021 04:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNWE5f5lezYS; Wed, 22 Sep 2021 04:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB516402A6;
	Wed, 22 Sep 2021 04:19:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 360B61BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B5A402A6
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07RVN5UoCLxC for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C81EF40295
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:19:56 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h129so1713391iof.1
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zD7hLKDhfx19ZON6JN++BJdewykOJosVQ3t+AYY0tRc=;
 b=kpuViyO8mPXBFoyba1VPegn+wb5Nq801ZHWrkMAXdSZmmntZ5X/fbK+06kpNuSJsx4
 OzgOvEqMQtvyiwAoiv1udYqSVMYMZ+LKUDweyepo4aSP6o08wB1gkBBhNCYHfXP0jPDp
 aLF3+DYnTfE8IzXIa+gAZ8piDV48PUBCdLgdsOl+4wCYz22S7dZ47AAUVRa2IIqtVIHN
 WRGFGLy2w7r9Zof3uYQVXEsyG/7LTI4s1xoG5YIjQBfS8negYfD2kX5unbHEXiyxPePu
 onR7c0VdIy0L/nxolfw5lOXIa87AecFbGvHOlecsWLe+LdGnauuJSFU39jayv+z0Vj0b
 LGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zD7hLKDhfx19ZON6JN++BJdewykOJosVQ3t+AYY0tRc=;
 b=RByCbD4JNLWE9M7AZILb4UgsMGdCgGY4WBNwH7y6ejD3hYIYaJoUzbXTFUmfov15DA
 tfLSYlR3c0MABj3xxJ4fB/Aodiy47QiVeqiOnTu7c3junLd+FvPuRHoz3ZQkDZjMvXcK
 nwhQXQe6gJ2xZZT1ximwYe3MIl32KA7MUFG4dV2XcimF6UxMoQ4WYTR64TN0VvuYh1gv
 qtT5xHI3+e2qwlqnOYCIJRC54IW0ue0LWHMY7mKnOmajiXQKWch6tR04XlvQPTKw4Q+a
 ZwZrVWY2wDaMJd3lfFZnawH9fOCglOGH8V54vn6J5kZdQxiqTRY2cgM+vSh0yE4oMcj0
 QjzA==
X-Gm-Message-State: AOAM532BsV02f5bt2SEEEIVYu3NgtfPxPjEWPUTy91nYivLfUkjQZsCn
 sCH/QYZE00eGq26YoUecyekSrWhzod8=
X-Google-Smtp-Source: ABdhPJzIjPJsS03KR7lfzwihix2+AQrx9xIJzxGJl2L1v7D/TS2hoO0D8CJUXGd1sfRCdwAa7BFThA==
X-Received: by 2002:a5d:9d59:: with SMTP id k25mr2730627iok.70.1632284395675; 
 Tue, 21 Sep 2021 21:19:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id j4sm489402ilo.8.2021.09.21.21.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:19:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:19:43 -0600
Message-Id: <20210922041943.3269673-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index dea2216fcf..a9823aa7a5 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  66d4b05e3bc75267daf0f773d839f62b  aioconsole-0.3.1.tar.gz
-sha256  7c038bb40b7690bf5be6b17154830b7bff25e7be1c02d8420a346c3efbd5d8e5  aioconsole-0.3.1.tar.gz
+md5  b8cbcb6e00d8e535256526dfe4f27db3  aioconsole-0.3.2.tar.gz
+sha256  9355b36d41d5fbdd3dbb01510deb2b985b508b2ebcd5b8bd85af61a707e2f6c8  aioconsole-0.3.2.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index b32d2bea0f..393fdf6e45 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.1
+PYTHON_AIOCONSOLE_VERSION = 0.3.2
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/5a/12/fce04ddc0a8ebd6482e5ec293d8bda47c9e05c82826b061f7b73523b8601
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/7a/b2/747ab3cb965596cd84c5159941613d901d8771acad3c51c4f5da362aa9f0
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
