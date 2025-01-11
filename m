Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B32E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 06:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D5A40753;
	Sat, 11 Jan 2025 06:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9i8_QZ0JVvJ; Sat, 11 Jan 2025 06:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7364088F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7364088F;
	Sat, 11 Jan 2025 06:38:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F06940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65CF407B0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qw-ekwz_OAK for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 06:38:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32765404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32765404D7
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32765404D7
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:01 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2161eb95317so46680395ad.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 22:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736577480; x=1737182280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brCFohrGYSURFfy9RfVFIe2j0kYqy7Qkc7qtsXQy9dE=;
 b=hKI8c90hexKdU8NlO3sduUC5ycWv9aJH9Owd1cG8xFsS4a0HfIk5WrCaxLN6QCLbF/
 gPgKZgvleEbyLHf+a0pE5oGh0FgdfjTnqft+W1LTGLGyoaVn+YNp4TpP5cJcppRkWdO6
 1ps2k1IWVkx1DeUZsaDPNkOtenrZMEBqMvoieSeJEAAblF7yN0yR4gqnnb9rMS2YSdzZ
 BqdzZhLk/X8T3XsILkU4sggXaUDil9mfw1eQd7Elho/5hN7FnncNvLlJuCbPFHHv48l2
 s2MVSmQV2BeRGPovSeM7gJnZuj327mabU6jnHMabitYdbH+CBq0DJFNbKw4Td++JBitl
 grBw==
X-Gm-Message-State: AOJu0YybJkM0VG6fB7CGVmVMrZr5txeFfO5IpC23dt9PkgtGz0zu1jhy
 Qdk5XZrqqG3mSS5NOroOdelxs7VHos9bxvEpZ5p6FqDd3JyaSF7lXVEYHIq8
X-Gm-Gg: ASbGnctiCCzM/vAuZJJuNrvXilPpQu4LPoMo/+U0RctU30H5/nkFo9o/kGDMHwBksHG
 +BGOPsMmcQMXlCJdGRTitdSmU08fz+gdGcJVGOxq4HPMuYfCqXSm6dCXZm12jXEPSzU8GoHk+Qk
 aXNqUhJrPdbCesz2ZVKqYrSy+oydjiixwAcUgC07Nvwb4EavFbYxKlFnkI+e1ms1mxNDr+GC3SO
 pUT8Zk8mRpU6a/cu1RayaK9pB9xrLR5M0SYLZjxu6KJ+tXUXHx4k5q6i8472Gc6nthG0/uGgsyJ
 o9zyJYEQ9mKVUbP4KLNUwYJbENgMoju8ZtQM4Trp
X-Google-Smtp-Source: AGHT+IEDwkhAzib9p5pP+s3FreIctvLgnoS1gDIn+Bp+Q1lJoAdbn+1RWJd6Ongq+/1vM0Oe/PRM4w==
X-Received: by 2002:a05:6a20:841b:b0:1e1:ae9a:6316 with SMTP id
 adf61e73a8af0-1e88d09cbbbmr26506285637.35.1736577480141; 
 Fri, 10 Jan 2025 22:38:00 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406a9433sm2477488b3a.176.2025.01.10.22.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 22:37:59 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 22:37:50 -0800
Message-Id: <20250111063753.769689-2-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736577480; x=1737182280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brCFohrGYSURFfy9RfVFIe2j0kYqy7Qkc7qtsXQy9dE=;
 b=M6DXYr3qE2+lazx/sw969CF9bJxb+j95qPpdLQtFifS75iUHaEXxDlQPYL80DQChM4
 qurlnP6/4O0m0KnBFxii1OvAd8KzHOGeLpzXn65mP6ssTCh0Ui30+p9juAfsgVeDdkbw
 YquzkEVKE/GAncV3xzhwZq+pCmkKur/GNnHnFUgL/skhTBijXTyqx6vKd51m9gjJGmSj
 rbAY/Qx7iOoMVRXfARAibAYh2KS2YIw/xe4V6WhSSwuFlfA74aDgU3eQabvyMZ+zdU7d
 KV8ThBpgGvKFMVFSSlxbaXC9/aZipqnwyDWa+5F/6rxHBXCkmZE+yq0BxeikANK+nRxu
 Ablg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M6DXYr3q
Subject: [Buildroot] [PATCH 2/5] package/qoriq-fm-ucode: bump version to
 lf-6.6.52-2.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package is unchanged; a new tag was added to match other NXP QorIQ package versions.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 67efd675cc..bf494b177b 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
+sha256  6b9e2a5c383fb9288db1459821fc696f3abfeddd080b04c11cf9f712f0d36470  qoriq-fm-ucode-lf-6.6.52-2.2.0.tar.gz
 sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 84360533eb..71904e5b13 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
+QORIQ_FM_UCODE_VERSION = lf-6.6.52-2.2.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
 QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
