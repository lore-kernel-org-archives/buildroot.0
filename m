Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D7C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5324053B;
	Mon, 12 Feb 2024 22:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4-cut2J8QWd; Mon, 12 Feb 2024 22:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188C54052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188C54052D;
	Mon, 12 Feb 2024 22:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B84CA1BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A54294052D
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBkGSmxdzypD for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A6994052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A6994052C
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A6994052C
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:35:54 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7c00128de31so9815139f.3
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707777353; x=1708382153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=WkbNAwvWMd/J94Qgyt/dNC+Mjt1rCE539XcW4tCbTi7jaTuhToxcOpdPyW0ynj4RQc
 ar9++LztqBrUY9G/YeQChVJ5xqsVisKsOIS6SBInekUiT2BXFk9hpGjYOsZJyZBIxeWJ
 Uenw7+gCU3DbibxQVOBCvWGW5YkgzyEe35wc5J9fiXBLruXS8gds9TUhpJSQkrgQSMBB
 ikID4ag3DSw9+9CVplxgWMfsuuyJppjqI6xoywHyeMM48CzJDNZtNw6SFaMpBC19iIqd
 5/OaNuPKokcair9k+qpGMvzlktPUuLLFItgbSP1h6tc+p3IcdX4+zlWXMzMeNcxJrnQx
 YCzA==
X-Gm-Message-State: AOJu0YwTugidqL1CcG+LbeapeMb6FEhguJqkoBUeGRhq8H+zBstUgU+l
 Fnf4nIbHUMPA7FEz8P5j50qusDjQBWhQNdCUb0Uidmmf9/GJ4TSS6ndtvWVFCXfmPA==
X-Google-Smtp-Source: AGHT+IGUc6gWO5SgCK9b5IfJ0YrjRFjDbuayRyDGSMjZNcxSgqFOEMqMzHaDgS31tb1SIqfzrBSucg==
X-Received: by 2002:a05:6e02:eeb:b0:363:bcae:f77f with SMTP id
 j11-20020a056e020eeb00b00363bcaef77fmr8957164ilk.0.1707777353512; 
 Mon, 12 Feb 2024 14:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVwGeb+K56yVqGgEhkuhIVCB+z1RrpClDnOL7s8LfqsnqEYLeLeVwwDcv/ZIJ3QjpSaIVlBR85tqpFlFtBzI1zcz241S66jNNatY9CGi2DlVbRkegFz7alWBhsSoq584dbmmAWQFRrSmhX9SR7kyXyjtTb8q8qJI4pWATn6gZx2i7k6hLUuFWyeJyayw30gHVEQ7usOuGQXgCWDDNPI+KZVERE7SlSBK7/+c6//Wa2Pf9u+1QfgIEINg29v+atuwzZUY4U4zTFoCL+nr94QmL54s5c+sbNKIKvirl/53wuSNDx9Ag==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 s11-20020a056e021a0b00b00363a91effdbsm2132656ild.76.2024.02.12.14.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 14:35:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 15:35:46 -0700
Message-Id: <20240212223549.3665464-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707777353; x=1708382153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=dIoi00LUVu1x/Xe5DFiNmcwpRcWtw6t52XFFthi5Uukgxog9gd4+QnrTbNCo/ZaoPK
 SScbsYPsOGvXXuKpF05T14lBt6DOZ/DUsWlHgVrhNuNsA3F/4oP+hCEH16Cr3++j77GS
 auiQjvFnRDy59AeWfl8afFGleLCF/pKNLMcV4adyPu1gGRQOtZMkl5Do40Yf0+pT74zq
 l+tn5f53Tgddd+F/kll1fTfN7VgFabT/C87jOv4v/fLFx+oI6YPfcWY9lJ8Rp15dJhnf
 eNcKT95J7Nftt/La4hihXdqH19aiNmV3OUE7byIDsbasJBsC5FZuK+fz1KsEcqOBDikD
 KVaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dIoi00LU
Subject: [Buildroot] [PATCH v7 1/4] package/python-poetry-core: new host
 package
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to 1.7.0
  - drop patch which is now upstream
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..c6b180c852
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
+sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..4ca587b11d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
