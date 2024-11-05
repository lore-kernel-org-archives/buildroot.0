Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1C4D36107
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD7380F26;
	Tue,  5 Nov 2024 19:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cC_K0GzTSmz4; Tue,  5 Nov 2024 19:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2881A81053
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2881A81053;
	Tue,  5 Nov 2024 19:09:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6610D3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533ED80D6F
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0e6ZK26QeRdK for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B7C580F26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7C580F26
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B7C580F26
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:09:17 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ac817aac3so217741639f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730833756; x=1731438556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C3Fhv3/rw/eQtFpy8mPYWyL8ZIyWMVsTOKtaiQ7ZjHs=;
 b=LAHvsqGslA530Oib7c5n9PCg92sXJCl9BepMJp92fOlC1dgRqJTurhzn8W7nENY1/5
 jaYwp0PlyBIQg8v7znvsimISTD/VDMVz3dHnyu0b1QgoEN9LrWScRrwX2I7/bT37cYg3
 qIL3kQEM6pqEnaldtLsId18t8gNDd3wr+zPDHIgXu+vyatbS0l3sGl0u9TdKgVw+NFh7
 5Ga7MvpMM9SQHO5ij2FpGSVHaAp3GlPjAU9gF1+sVg4J+mYS9h+iH0jNT/wFn+nHZSAT
 1KWmFXziLQPTHdmoU+LnWm7pbAjEv3ORhRuSWWVFuiDGX9lFYtNyh/jAv5pp1BRsyv3I
 +Xrw==
X-Gm-Message-State: AOJu0YyRxfkJ/4xYQN0YbzvceV4npHagVHyr7WQKXgE2ryTSTEbLFljz
 tamfnJf5oUfs0riGpv7Be1ZuZmDuykC7mqrPeka6dHx6LxRLq3YoKHZQaA==
X-Google-Smtp-Source: AGHT+IHw2swGIUDNbLb528nnfRIiVy2/+PCMB0PVs/PE1TEe2mKv88JtCAp+SSswKoaLzvJxqYFjsw==
X-Received: by 2002:a05:6602:1507:b0:82c:d67d:aa91 with SMTP id
 ca18e2360f4ac-83b566cc65dmr2996947039f.1.1730833756079; 
 Tue, 05 Nov 2024 11:09:16 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04978119sm2500820173.115.2024.11.05.11.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:09:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:09:14 -0700
Message-Id: <20241105190914.1578045-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730833756; x=1731438556; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C3Fhv3/rw/eQtFpy8mPYWyL8ZIyWMVsTOKtaiQ7ZjHs=;
 b=fBlNAPWO3Orah5FPmardBiufV/JAiQ2ZG09vMNo7oc2z0N8Q4wZMcSI+vqCJIkbwxt
 O4TAFddWM9jZ8iCYqKCO1FGgeoj1X2xWnX2FDXM6grYCSslYP0Qgy3sfi71E4iwi+0oW
 jWNW1vWtDycPB8+9XmRlz4k9pm3fPb9vc3ngYLosYh5hU9gWmnE/bLiPtR/NYyACWYE3
 FjP5WS1kmacEjXY4Hy3kbf2F7+Pe+hNoHMDr5BpbHvd9Qof5ozQxUUdjKllw8tqkf00r
 CUgy7WkwR2PyL7AJ181gs/Q8/B6smpiWXNBSJxdw95ZMOij9Q3EWXUavp0ewpN0k+xbZ
 W2wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fBlNAPWO
Subject: [Buildroot] [PATCH 1/1] package/python-pyicu: bump to version 2.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 74eb1fe1b9..a765897601 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  5a1f54231db3dcd3230a80b40e8013cd  PyICU-2.13.1.tar.gz
-sha256  d4919085eaa07da12bade8ee721e7bbf7ade0151ca0f82946a26c8f4b98cdceb  PyICU-2.13.1.tar.gz
+md5  7ec5ad0d62a2a27f919ca8a775352a71  PyICU-2.14.tar.gz
+sha256  acc7eb92bd5c554ed577249c6978450a4feda0aa6f01470152b3a7b382a02132  PyICU-2.14.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 6652268df4..413f595414 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.13.1
+PYTHON_PYICU_VERSION = 2.14
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/60/b8/1540a0a0cd74aa878749d442e19916df946e3b187c9965a991ddc77cc39c
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/52/21/4e9b0a3ace3027fc63107fa2b5d6e66e321e104da071d787856962fbad52
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
