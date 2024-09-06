Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C76E6FE49
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF69E84E42;
	Fri,  6 Sep 2024 20:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eI6mBX-P7_sX; Fri,  6 Sep 2024 20:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1DB84E36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A1DB84E36;
	Fri,  6 Sep 2024 20:11:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 183811BF328
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91EC26066B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m91fM_90L96k for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 20:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F222605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F222605E9
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F222605E9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 20:09:17 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82a205810ccso105114739f.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 13:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725653356; x=1726258156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NexsFbzigGU0StZx3eUDUxHmTU4ugIuAxtCbDboJ0jM=;
 b=kw+hlM7hLQyE0YLwJgJ8hEWJ45VxLgGUOwqywJjt6ZgEi0Y0LniysOfepKoZct3gQp
 5tiloh8zNuzgG3j+FPH4foMH5+2TQkae9DAMylDMwow6Epv3nIbw4JXpP8wDVYTpZ0MG
 89kBG/8Yq2sip11zqPFegRiUEILs7tdx233AJK/IDix2AJ0/pNXJyj/zKQGtmV2BwHSd
 HODbRR2q59ZDDu2rE7tsqLZFCfVxdgoSPbhnXu9sNWBKNTOQcUwQ0M2DLM3WfuV4Ic3h
 P/HLs019x1w0TYTjEaEvvJfBsG9XQZtDD2JUPWa9pKBOCLmpSswzGkatCB5rmBVBPCW9
 mgAA==
X-Gm-Message-State: AOJu0YxjhsjZ80ypmZ66zUt+S7pQhUWiCTZ2PI+6KX9WTclcSM6j2aJY
 y58bN0k/l2I+HOKUhE07q3hGGFZNBqlSX3mqZNSVrvRbbWlVMWdc4VcDHA==
X-Google-Smtp-Source: AGHT+IHyVBNq2TvamKc8FxlsNYB8dzjpJodQn9/hBP/tzwIJ0MskvgDGCocFveplS6tX6tb6wj/TtQ==
X-Received: by 2002:a05:6602:3c5:b0:805:3d47:19d6 with SMTP id
 ca18e2360f4ac-82a961a117fmr501666439f.6.1725653356356; 
 Fri, 06 Sep 2024 13:09:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2ee8e59sm4216042173.178.2024.09.06.13.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 13:09:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 14:09:14 -0600
Message-Id: <20240906200914.3730398-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725653356; x=1726258156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NexsFbzigGU0StZx3eUDUxHmTU4ugIuAxtCbDboJ0jM=;
 b=DL1Txf90ry7Xf6BnYTlsKnKRiXWvEeWPZGUPDsrp3731YeDW/NSX3XGCfyLpHw4Gcj
 1tqWsccWia0VMoMEChHaLnucJpyEQbeb6vCWf2pgZ/4811f7YkgfyuVd+PsMWf4kL/hM
 HTnIfn0vXVkQizoWehl3K9BfiZ4NezZXu1E3hszaya0Ygoly5onnFhsE5AwpMy6pDHvk
 oKsr0P/mAorMLgn6VVkIPjApEdaJFyuYQrFlHAJNivN5tfI/XLGxjyscc/7f5wfYP+MH
 ccpk2LY7HA1/1Vs5L4qXTxVcZArPx6Ik0AzoxTDQQfujlIQzXkW36ARYNckx1AwZTtzZ
 3HNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DL1Txf90
Subject: [Buildroot] [PATCH v2 1/1] package/python-fastapi: bump to version
 0.114.0
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
Changes v1 -> v2:
  - rebase
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 810f31023c..061266cd6d 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  c9d319aa5b12df82e51b77573e419e01  fastapi-0.112.2.tar.gz
-sha256  3d4729c038414d5193840706907a41839d839523da6ed0c2811f1168cac1798c  fastapi-0.112.2.tar.gz
+md5  02d748d7fbc4a8e474c13471bb441cc1  fastapi-0.114.0.tar.gz
+sha256  9908f2a5cc733004de6ca5e1412698f35085cefcbfd41d539245b9edf87b73c1  fastapi-0.114.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 210abcfa3d..b6332e9de5 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.112.2
+PYTHON_FASTAPI_VERSION = 0.114.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/9c/11/4874d165e7ef97aa803a567a4be8f9c8b0bd7cced6d536d44033ef7d4bfa
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/20/1b/fb621a3bab915ac1c9ad06943eb5a2b2aa01cd63228d524bd45261278787
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
