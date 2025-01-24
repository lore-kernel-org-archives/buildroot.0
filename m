Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598BBC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C568D8345D;
	Fri, 24 Jan 2025 18:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26RRyOWfDdbI; Fri, 24 Jan 2025 18:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C9083466
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C9083466;
	Fri, 24 Jan 2025 18:36:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A87C194A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90A8942F6A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DamO5ViI-xNF for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EC8742F60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC8742F60
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EC8742F60
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:36:44 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so64710439f.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737743803; x=1738348603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFB7NRgaUSi1+dxRzscQyHpjziiBvnQqTQtdwOAeLxc=;
 b=GvwwZ87JbPG3cg8DAGJVKsdaWgWdH6xF1+i9fSvZlYZ4Xr7dj8KSH9GRcczFAGEk+x
 NayjOILt2/bKoLlYatRjnte8HpTY3hgifXQ3o86fmEtXoZA6e652+h1mcYH4LAtkk96k
 wHN2wCuf1/WN3zVOkEGtJx904zC+K5T8FcFCccY1h+mVsVFoXzIZQAPmq7pCf7fRjX33
 5VX4/4tSQGZF/i0Y75LjDDE22BHM/03d5DtTyav9Jahz7GX3Zhk+DXIZfh8f+8gt+m7v
 BePXSYFxMQzpnqg+PSeWr1gDKeDOa5phOj9EsXR/rWgmU95+5BIkdkE6fB4F47X1B32F
 /m2g==
X-Gm-Message-State: AOJu0YyFDFSgGUplEKDJuQmFeTLJR7SAGo4LVBarnknq5TB1ucttKGT2
 fBG8pqEOL5KJdZH+pFWZsPDjmm89TjAab1hBbwFecXoPlpJjyXajbKT2EgTl
X-Gm-Gg: ASbGncvV5YcOdaGsPt6OZmmo0m8iVqlC1JAhIgR1nDIQRaphULfjpgFCJkf2oCnforr
 rHtJ6rJKZvBLkTlQH0tJ9x9E2Vfbo5kSfQamIxNoSPs3KGZhjNSZV2ekvqnUuE1judvE4ph4poM
 jv2bE+WZFdBI8KDnyezFVOmImi4B4I20zCaoBMyyFgf+r1swhcWp4fjd9PqtJbEgLUf0wSdk2DX
 uzN/OzggeT00is6ABJfW4eWsOKDP/HCqc2BcI8HWp7afq8jXn7nvf1HIt3vAxA1cwO/phZDtTrL
 tP0rdNl63NQa0pBDLUe1+cT722PyJCG0wYG6E0sYutteuxzdKlgT2yg=
X-Google-Smtp-Source: AGHT+IEK1B9XGUVHRqJ7otByUd2vmOTNTOXHaX+7wge7u6u/h0uO/ePe5VE7ku5use/987cyNzch1w==
X-Received: by 2002:a05:6e02:1a24:b0:3cf:b87b:8fd4 with SMTP id
 e9e14a558f8ab-3cfb87c43e7mr96343025ab.15.1737743803202; 
 Fri, 24 Jan 2025 10:36:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc75262aesm8056415ab.72.2025.01.24.10.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:36:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 11:36:40 -0700
Message-Id: <20250124183640.3789047-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737743803; x=1738348603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jFB7NRgaUSi1+dxRzscQyHpjziiBvnQqTQtdwOAeLxc=;
 b=PLcwJv6UQfSBTb/nh1EGHwnAByMLt1V0DwpgsxNirZbFKqkjIat9J2bo6ROzx6JLvd
 Y40EwNEkjM/ql4IT5htZC8svbcsfMGdGbCAzS4TBdqT7g7zvVOmHbbjtpFjV5e5rF8yU
 uABBa5/QRbbrW2Milr05sVrTd1q4lIY24y2wZVuDxE8vaPvkvHhKdiH0R1qg4+f0ccv1
 W0n+hn1yoqvzV7ETz/K0Ncibh2LDqStWQ00cKSmv8XO6rmoN8LfeU6caXut76rphZrWe
 mKeoorfGstBzNAe1PPku8i7MSdq299nmxnNjXT/k3HgK+pkaVqA9FAPdp1aV0tpStc1V
 /izw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PLcwJv6U
Subject: [Buildroot] [PATCH 1/1] package/python-executing: bump to version
 2.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index 8f02628485..ecb64696e9 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  e64dd9916bb0a6c89f88295f4867c1b6  executing-2.1.0.tar.gz
-sha256  8ea27ddd260da8150fa5a708269c4a10e76161e2496ec3e587da9e3c0fe4b9ab  executing-2.1.0.tar.gz
+md5  6d79de70b73814ee0ac523140c47714f  executing-2.2.0.tar.gz
+sha256  5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755  executing-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index d13da22be3..adb8309bac 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.1.0
+PYTHON_EXECUTING_VERSION = 2.2.0
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8c/e3/7d45f492c2c4a0e8e0fad57d081a7c8a0286cdd86372b070cca1ec0caa1e
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/91/50/a9d80c47ff289c611ff12e63f7c5d13942c65d68125160cefd768c73e6e4
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
