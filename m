Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DF0C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 23:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37B8B83B3F;
	Tue, 15 Jul 2025 23:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrUO-T5drjg7; Tue, 15 Jul 2025 23:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5249C83AB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5249C83AB6;
	Tue, 15 Jul 2025 23:25:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE7EDCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 341AA83AB1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFDRNvPUPsXJ for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 23:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F48283AB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F48283AB6
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F48283AB6
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:25:10 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3df2dbe85d1so46476275ab.0
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752621909; x=1753226709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YQFTeAlweLaFEu2os/fLrqcB/0wmm1FinwedutWvnA8=;
 b=fvUQTVITXsXzEoGQGT831WZ+lvnxVHXxbf43ushr+qRm+YlmE1JhNFfETyI0ktQWdi
 24B9TT7shNY1fCFoYlzkecww9qExFC/DbYlPKHZO+mwcf/g8RA4j3IxuMoi4WwTpI1Lu
 2eDbDu2oJNAgbcqeRNDyXhHmcRIczWs9eqTi9WBXYAF9ZQ2pgQCnlAbN3jsLJ3HN3WyX
 w4gz6h40CZJa5A20WPi1eHRQdJZiPNyStq5utviCEsaYv92bX/VVnADapvE5EEJWUo20
 pnWk+eKzo47hij+IgRvHwaPHTCIbS+ENnn1gqFg03LrqiDpSvc1IY3efVUeezj8E0eS1
 1c6g==
X-Gm-Message-State: AOJu0Yw0A1Z0KD34ZxG06KnYHcrnfpIuM/DfP1pSvFxAF3U0tNParXQ2
 raWil9632mjletZ/7hA0lNCPybeua7f+j8/WziThJzo60Y/UupgUk3cs7Wo03r8xpcc=
X-Gm-Gg: ASbGncs7xWhEvbFN+dFdUHRUpZY3pk9y7tbJ5xBK65TVvb9Jlo/B6xjTwCmfB71yf2r
 4KoVhIzT+pWoYZLeR6ektZDj6ZjXJ4V9MLA16rsDr6zuMzu1gRRRTv1d9xV2swOgcK6qBtcX7fN
 WXyrP0L+HwkpInMSQPBJ1KJDuIMkU9XDb1oFlWqi5inKO3y9+UlArosxsc8IwNWqiHk5Jrk146e
 aWcW4QRdhMUT7koWh1mfgUtR5veaj78Nhju0vmsMPw+T9jw0MtxsCiP7ISGxvUoorPhbCSgy2Lp
 l/vROUv7a1JuI/1qQwl8uVOk7tX78Ae7T6a68QrUwh+81VmHUlmtmXcCcHBEMovwf4FX0allFSd
 wO6IIydHXN68en6HY2BGmGEO6k9DoGliDDVh7ag+xR6ROcVSeLtS8Y10b5Vabk1uC69vbIL+dJm
 W7ATl6Koo=
X-Google-Smtp-Source: AGHT+IG2XgLgk+eugVv0MD4rqsvRaneQG39qoczwUoNf7TAPtMTKC2Z+Nknyn5Pv3BGE90vkrQRqaA==
X-Received: by 2002:a05:6e02:2493:b0:3df:3110:cc01 with SMTP id
 e9e14a558f8ab-3e282e8e6fcmr7004125ab.19.1752621908940; 
 Tue, 15 Jul 2025 16:25:08 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e246134f3dsm40388705ab.24.2025.07.15.16.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 16:25:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 17:25:07 -0600
Message-Id: <20250715232507.835115-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752621909; x=1753226709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YQFTeAlweLaFEu2os/fLrqcB/0wmm1FinwedutWvnA8=;
 b=EW4WM5CCGXwi7frT6lekgh8QZWV51GIibx+GsmAAVJHs42VSzMJGdl+FmQoSMgYpmd
 9KLi2OER7n19MZbAxDOavLrcPqALnTBtjshQho///h48RwTL7iJUu2nNbvTEsRQ4gn8e
 ozes5cojHGIJy2nDUMsNs6sBj9jcM+29kFrAm6DUsEsUIANj1oVMUauSP3aXkxd5VWQh
 LFedaZ6ZKxVs/FxJV86p/eJPR1H8SUvlAhYAMQaShitJLsfef5t0hHWBr0FLBDXOkb/m
 03XlnumIxnJIgPFGzJm+O8rEI+pFHH6+uol8GJ9RZ0p9hrldBwFbYSrrR1YY2Nxjl1eo
 5CRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EW4WM5CC
Subject: [Buildroot] [PATCH 1/1] package/python-cppy: bump to version 1.3.1
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
 package/python-cppy/python-cppy.hash | 4 ++--
 package/python-cppy/python-cppy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cppy/python-cppy.hash b/package/python-cppy/python-cppy.hash
index 73049c6df1..f8fb8b9568 100644
--- a/package/python-cppy/python-cppy.hash
+++ b/package/python-cppy/python-cppy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cppy/json
-md5  522447d934d18484cd4cfe90c1872628  cppy-1.3.0.tar.gz
-sha256  da7413a286d5d31626ba35ed2c70ddfb033520cc81310088ba5a57d34039f604  cppy-1.3.0.tar.gz
+md5  d62122f9d03d1f2cea5d911fe8b17216  cppy-1.3.1.tar.gz
+sha256  55b5307c11874f242ea135396f398cb67a5bbde4fab3e3c3294ea5fce43a6d68  cppy-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  db7a008bff1e63ccec397cfa033109740c4dc6cb12070a70d0cfe69aba27c4df  LICENSE
diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
index 3253956672..28b77963f7 100644
--- a/package/python-cppy/python-cppy.mk
+++ b/package/python-cppy/python-cppy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CPPY_VERSION = 1.3.0
+PYTHON_CPPY_VERSION = 1.3.1
 PYTHON_CPPY_SOURCE = cppy-$(PYTHON_CPPY_VERSION).tar.gz
-PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/1e/84/62a09daa04e732a5763ec22dbc11b988e5140a77b418ea70bba9ab1a77a5
+PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/45/ed/b35645a1b285bce356f30cc0fe77a042375c385660ccd61e0cdc4c1f7c44
 PYTHON_CPPY_LICENSE = BSD-3-Clause
 PYTHON_CPPY_LICENSE_FILES = LICENSE
 PYTHON_CPPY_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
