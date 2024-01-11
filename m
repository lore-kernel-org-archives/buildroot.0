Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8027C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92ECC613B7;
	Thu, 11 Jan 2024 05:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92ECC613B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFM2REj6jRFK; Thu, 11 Jan 2024 05:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2336F613D7;
	Thu, 11 Jan 2024 05:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2336F613D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6222F1BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36BBD40888
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BBD40888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqb7moWjpaeI for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:04:42 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56D4340860
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D4340860
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so235196439f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704949481; x=1705554281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+/x3NmDaYXHu31KZm7773hSjH8ABKkptzk8cT4NrSoY=;
 b=QR9lMYpPzf9NhqPvs/kTQ3FVijGyLHmylr4zehIns2qxVG0CVjxSr0BfsEEZayb4xs
 WWV0WDF9E//oFOSyJCTCrUJxUhWxLxvmYUkqdXkE5VAe5gJuac6ImwccEjS2OKyQt4AK
 gACUFAqtXehLvMHwL/WUiikTHrZt/AlJIrkO/6gquJINqR+7dxQcdzdpQ/YYG80jxxbE
 dsHNFF1v5luM1AOGetfiw1mLep7zlb3JKWvmM1u/nupzwZ5NF+h4mKxrGaLYtHnSrVNc
 iEoTaromI1i3Ggp7QK9T2INeLtkLWnz5RYHdL8kOUVMrPBx1smIjsICZBVYb9uWoBdmW
 x9rw==
X-Gm-Message-State: AOJu0YzomBWT+VQW8xEMHpl4WXtb/KR0VwiX6ElE3aUQszkyTa3QviLu
 nCGuikpyS4Pk16or49oXo82W81zP6duliA==
X-Google-Smtp-Source: AGHT+IHRy+4bTHh7FAvZu0OyPYLNV8cBW6w3AGM1xvr9mWDfwsPKlL4COrCKz4G4UwJEK4U+9sXmlg==
X-Received: by 2002:a6b:e812:0:b0:7bc:3e75:74e7 with SMTP id
 f18-20020a6be812000000b007bc3e7574e7mr828556ioh.9.1704949480914; 
 Wed, 10 Jan 2024 21:04:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cs9-20020a056638470900b0046df4bee536sm106378jab.122.2024.01.10.21.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:04:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:04:39 -0700
Message-Id: <20240111050439.2900236-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704949481; x=1705554281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+/x3NmDaYXHu31KZm7773hSjH8ABKkptzk8cT4NrSoY=;
 b=XFnQmnT9hdOVfQ4UZOn/pypKc8S7EPKddga1MvkUgts1G2XTxHkBlF1kTmDsEC+FfZ
 gqxzkM4smK4gjSHsOxuLqsYrwZUbArGSI4ncRPcnxlOVjWlSaRUbzzX9id1k60GJTnhx
 I6fDLau1w+sT4wV/eiLrnOgTBrQdRg2nvkBwS1e+SGlqeO+OtK5t9j6dN9XJxAVqTRR2
 22gEEpZ2QNpUIY67qS6LN53yVpYQgex9kgP/E1PGvQ7qEMUe18t7sWfkx539hsbFaAAo
 mk3WA7JLJ3OhTAn2P57NpqWEsy6OYoBCnjOwv/TVgTgQJES0EZiBaW+eT3SLuspUuk/o
 trSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XFnQmnT9
Subject: [Buildroot] [PATCH 1/1] package/python-referencing: bump to version
 0.32.1
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
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index d4f3dce5a4..2880a47477 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  617d973b9ce86b6f74b2216c6f3af5c9  referencing-0.30.2.tar.gz
-sha256  794ad8003c65938edcdbc027f1933215e0d0ccc0291e3ce20a4d87432b59efc0  referencing-0.30.2.tar.gz
+md5  d1a0a4ae03ebba4b86b22bfb825f150b  referencing-0.32.1.tar.gz
+sha256  3c57da0513e9563eb7e203ebe9bb3a1b509b042016433bd1e45a2853466c3dd3  referencing-0.32.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 4d11c99deb..27d1452e91 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.30.2
+PYTHON_REFERENCING_VERSION = 0.32.1
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/e1/43/d3f6cf3e1ec9003520c5fb31dc363ee488c517f09402abd2a1c90df63bbb
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/81/ce/910573eca7b1a1c6358b0dc0774ce1eeb81f4c98d4ee371f1c85f22040a1
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
