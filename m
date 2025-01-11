Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42108E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3F466079A;
	Sat, 11 Jan 2025 18:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLEdtlJW5xHH; Sat, 11 Jan 2025 18:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 025FB607B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025FB607B2;
	Sat, 11 Jan 2025 18:38:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DF3942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94A6A400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngjRNqP8Wwat for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C81940017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C81940017
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C81940017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:38:45 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-84f1ea04c64so192209539f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620724; x=1737225524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//h4VVhk9xjFnmNsTN90ltQdE4QnbOA6SB/mVGR7Xrg=;
 b=Vttlc3Ws5g/OxyO0vhAzq7oZZKY0JRzLTCW06Ved5qO1kkhoi1tH1VYg4sslZ8kfst
 7FivpOTKIkKL/8cYlnULtSo/PtIGLO8YQSvOdU7TwL6Ccf+qCbuOWN8wcICVQMzlCqqO
 5qAkqs8LTzUUKzfvO4hbBmvExAyU4aA24aSNDYryt3uZJ+kfN5ciBk/1mhrc+V1Sy6Z1
 HTHcK+OndAHFnFE5vPKsETDK5Zy8SFefL/LUmqe5mb/lqsBXh1au7u+mAG2TiUUS9ZbY
 pwEml+biKN2QKcSGaTzvhnNM/zHYVYhkBQtzVTWBzwXWfBdn/ds5YJjZ//LB7a0puiAQ
 p8/Q==
X-Gm-Message-State: AOJu0YyysOxFUhp/ok+/vbzOD/wgqp7tRO0eCNT/22sV7gAKiAEt9KNP
 a7Zbe+RNtcEP69WJp8B11jZcavq+JFeHw7zS1Of5JgrhkMjCSp4CqhTcLdlty8Q=
X-Gm-Gg: ASbGncv1Q2wn744Ua6mimIdmFf4KdgP41EHLohvNkXiIXmsplWCCk/NeNckvXKBDUUh
 pICvj0ylOaLNz8wJG1aN83VCPDGjTi13I2/HDcEG9NjHTQR8E9kiDT2BDuXMMBCKxUrKoXkDwB4
 lXmM15hdokOCi5hHHk5C1Y7Y5Hd44lwsOaO4uIk8IcuusGa9Y8qxMoqCKMSvzSB7M/aA4pKgf/A
 EHWRHpVmttjEmtQc4vnJQHeCs4nhv307fFJ5lw3D+DFvg6UgHdjB5GgUHXiBdbOGXMRFyqxTrST
 CB0KsjNtYiYn0qGeRbpIM0SRT3T46vg=
X-Google-Smtp-Source: AGHT+IERD/HPXNXNlSxdjX0m8tIXHagWqhkEmnzMlV5ciRiV3rZeuOnAt2KgBKgUmVvb7Rip5Ci8IA==
X-Received: by 2002:a05:6602:3809:b0:84a:7963:7043 with SMTP id
 ca18e2360f4ac-84ce0033588mr1349734139f.1.1736620724267; 
 Sat, 11 Jan 2025 10:38:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f82desm1669171173.19.2025.01.11.10.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:38:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:38:42 -0700
Message-Id: <20250111183842.2940443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620724; x=1737225524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=//h4VVhk9xjFnmNsTN90ltQdE4QnbOA6SB/mVGR7Xrg=;
 b=InTixEqUnBkj49++w0b7qDg2CKFKz+KvyN9W8rUNjCe+pqKVc3exGMcpMenDa9gvL5
 0hMaa5m5e/OWMx2UgOPemiPoxe6IQEQpOyIW0zsF6ihqhMmnAJGQ5OxUa17/5eOkMdyP
 EKcwbQsOEldu7lN4hl/74ErwOKi7E7BSKoEGqvXbevISUEEH7AxGFeULykv34DXonKl7
 nqLgBDm6yEMDWhYgU+OIdUs7wmQYlvR1CIp5CqGBlaYJRrYN5uXdhhyx90hJ6dDgV8eM
 Hc39s37n58355dUDISu21K44z28vr/tuvNhq+GrrHM6mdyG+7DlI281CsQJ8YDJ41awk
 CJjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=InTixEqU
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2025.1.10.15
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
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 02ea021527..bb58e4930b 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  c2820cfbb09e91d84ade85e0e65d87ae  trove_classifiers-2024.10.21.16.tar.gz
-sha256  17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3  trove_classifiers-2024.10.21.16.tar.gz
+md5  b8c01a04127e7929f588fabbd0352ecb  trove_classifiers-2025.1.10.15.tar.gz
+sha256  be2c7d25e46cd39d5c7151acd389584df3919f61890f5f163c8ee2090ff71e7f  trove_classifiers-2025.1.10.15.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index ab2421cbe5..98ebcc4d1b 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.10.21.16
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.10.15
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/99/85/92c2667cf221b37648041ce9319427f92fa76cbec634aad844e67e284706
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/db/1b/7bb619b31396d550022965673a0c284c914a0a4c68480f78097401e1b3e5
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
