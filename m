Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2BFD33A29
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BAE060878;
	Tue,  5 Nov 2024 18:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvNr-FM-pwKZ; Tue,  5 Nov 2024 18:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1B760835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1B760835;
	Tue,  5 Nov 2024 18:49:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B54883B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96D45804D1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da2LnhACzBcf for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4D3180D4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D3180D4F
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4D3180D4F
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:49:30 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83abcfb9f37so237396539f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730832569; x=1731437369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fro8fLUe9nD7WAC9wfx3A199ebZLtaPmURy7fjVYWQM=;
 b=xLt/VIEHn7901HG7HXtKk2h+LHywb4P/2Zv2H+xt3qZV+x/XOnlS74OSO0PdpGgMjo
 clQGs6GJ1kBQMaTE6TLZF8WSuvLsToK2aWVKK/5MFUacOXOQ88YaBmncc5G3AHcNDaIT
 rjjizEy+JNlKVERN/LcFnlR0lI6IMPM3thasycJbc35zOfftD7rfuxfbcd7vKxzRj8E+
 /nbt+xKNgbKLFjMjZ34VJNFclm3UH8ET1pChV5/uPgPDpMJuqOxpMNmMoHKw5axumCyd
 GLaA9CJf6zA+1eCbd4kafwJaFmm1chJBztp4aR6xW/sX/0fDQTpT/TRvTz7n7V6N/MuD
 akAQ==
X-Gm-Message-State: AOJu0YwTM3nWCmg7Nh1w4BkruvbDdKtN4/qMIFP6/lUzBbxg6J15sgKu
 C4dMeb3NrMQ5kGXnQVsdUWA/cK9cTnJsqz9qlX3cllHehhMDTJ9JQ0RJrQ==
X-Google-Smtp-Source: AGHT+IGMvRzWh3cZRVFe4IRESSqGmLYyi0Yq9ishpd55ClenePsL1BNLHJgqT1aYDTZQo+997437JQ==
X-Received: by 2002:a05:6602:6d16:b0:82a:7181:200f with SMTP id
 ca18e2360f4ac-83b1c45938amr3882566539f.9.1730832569140; 
 Tue, 05 Nov 2024 10:49:29 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67bbe8ddsm279150639f.32.2024.11.05.10.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:49:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:49:27 -0700
Message-Id: <20241105184927.1534541-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730832569; x=1731437369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fro8fLUe9nD7WAC9wfx3A199ebZLtaPmURy7fjVYWQM=;
 b=TK4jarAkw170c4FITPycIb1FkA4AV9iqENAQTNCluEYlOF/ghsVrIoRYpAxlBHy1zK
 FMKMshFbdW9sWW9FLDcWvXc4jV0+/vVAd6OTFJRvrFKPUHn9ea8Tag56kJccDwmVI5GO
 o/N8P9d17epD+teMv/+UdlEdlHVrZDDHq0Ahdzxnt7NoZmxQcfe/hkKvJSY/JPcnuWij
 Dk+UKj6RsCcBqkKXgI17m/UxSB0u5T7OCHXmrzxqY9abPjd7cUBy1YHJRd4jTfAcK6Vc
 MzYQZLEsIppFmu5aOC3IrdiKhZui8o9zc/dFUl2Ok9KtT4VfvDxervwzqP8t6EIcG+h9
 aJ7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TK4jarAk
Subject: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to version
 3.10.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flit-core/python-flit-core.hash | 6 +++---
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 2cc8032194..f8e71bf398 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  38fd365dc980d99107dfccadc96d0c4f  flit_core-3.10.0.tar.gz
-sha256  6d904233178b3c924f665947ac7d286f2ac799fb69087e39e56ceb4084724a97  flit_core-3.10.0.tar.gz
-# Locally computed
+md5  a3381dd58e23e9826c5199b1f70318b0  flit_core-3.10.1.tar.gz
+sha256  66e5b87874a0d6e39691f0e22f09306736b633548670ad3c09ec9db03c5662f7  flit_core-3.10.1.tar.gz
+# Locally computed sha256 checksums
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 855bb99a93..bfa80af3e3 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.10.0
+PYTHON_FLIT_CORE_VERSION = 3.10.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/52/92/89cceb9c49f3e6c72091304636c5ebc2fc48c546742bbf8a6a474e48e666
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/d5/ae/09427bea9227a33ec834ed5461432752fd5d02b14f93dd68406c91684622
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
