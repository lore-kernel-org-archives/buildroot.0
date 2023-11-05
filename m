Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6342C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 01:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 432104037E;
	Sun,  5 Nov 2023 01:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 432104037E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1Nkq7WNgX2N; Sun,  5 Nov 2023 01:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2193C40391;
	Sun,  5 Nov 2023 01:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2193C40391
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E695A1BF263
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFAB41A42
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCFAB41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhoEP1W7s4a5 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 01:37:56 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9AA341A06
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 01:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AA341A06
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7a6774da682so142353839f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 18:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699148275; x=1699753075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBZY3LMqMatTXrjr09NtuU0gWE2iA1Eprx499l0rkwM=;
 b=dRqzddjtLRDg4YKtBXGTKbCUyM1OGO7JBhwWrXz7huLNfuVjj3OOIdKoHyutuzroXt
 jmAqpeoHpFI4KKaaIYdKga85yNDP8Lazvkt91gdXDnF32/pxzCmDGTqROT/lO2LpgoT/
 jhfTSaX44+WtLLPgd1868PeWt/rQfjZgZS97CmURCkZ9gMYh+TheGv3lNltVbR4i1ON8
 gcAfVaD6+TXdP4Yvu3rsdalaeqsX36cCd9MJ4ds4s50Lt/1q/eQXozuOKGuVMnQOCfD1
 QVyuquZiiSDXwAn43aufd7Gn+XAcmO8lSV53WWSrogBolFl9j/RhoDn8A0ldtDxaWwz+
 PYrQ==
X-Gm-Message-State: AOJu0YyXdkyFeb0ouNTpgs/Dke/TwtLBxdZOuCNwIULU8o1nAjh+GKNx
 C2cKve3xPVRnyhLQSxcxgBaWj0mVr4M=
X-Google-Smtp-Source: AGHT+IED4Nono6cshTkFjYDxTI8R0+UHuLltPb/Vt6zOMr5ZEOkjFu2BDcp27KnghyYOjD7dy6INbw==
X-Received: by 2002:a05:6602:2cc4:b0:798:d82b:7b02 with SMTP id
 j4-20020a0566022cc400b00798d82b7b02mr35895371iow.4.1699148275277; 
 Sat, 04 Nov 2023 18:37:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 m8-20020a02c888000000b0044cda7ec75fsm1369676jao.62.2023.11.04.18.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 18:37:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 19:37:38 -0600
Message-Id: <20231105013738.2719075-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699148275; x=1699753075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBZY3LMqMatTXrjr09NtuU0gWE2iA1Eprx499l0rkwM=;
 b=XVWmOI9OLQwfFbJnQn74pWeE3Jc+nYYeexFLrR+2r8i6M4sM1vFR7TcGE7iz7UK56d
 yCqUHt1ooM5f/0RJqwYXrarYzENjIlCevLxQuFC1voIj+bLAf1bUfynCNqh+qTkT/EJM
 y0tVAJEysoh75tr454EoHDz89p2ASmYMvmrdSLBChde+CjHBfRadAut0Gu5ezNURxvLj
 TWYqFJxyjnz53nvAmQbHAJTzdg7X2S1Qkb5/PxW09jBe24+9XrrscK0NnByP+vpW/erC
 EdsN4sXt2eITmj7VQp+nGHGqC6pzVyKWiZcSukVoHjkQon7pMhmqqE3cQK2PJymNWN0m
 tbmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XVWmOI9O
Subject: [Buildroot] [PATCH 1/1] package/python-async-timeout: bump to
 version 4.0.3
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
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 0ecf1ef5ae..d46489396f 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  10571272b2e0fab839ec23f8293bf482  async-timeout-4.0.2.tar.gz
-sha256  2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15  async-timeout-4.0.2.tar.gz
+md5  9bf7b764a7310cb063c1c261c21342e4  async-timeout-4.0.3.tar.gz
+sha256  4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f  async-timeout-4.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index b3c5f79e45..9760b8ae25 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.2
+PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.3
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/54/6e/9678f7b2993537452710ffb1750c62d2c26df438aa621ad5fa9d1507a43a
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/87/d6/21b30a550dafea84b1b8eee21b5e23fa16d010ae006011221f33dcd8d7f8
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
