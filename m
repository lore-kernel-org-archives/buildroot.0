Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFB0C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 19:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FE06FB10;
	Thu,  6 Feb 2025 19:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z117VjEYuMDo; Thu,  6 Feb 2025 19:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56BA6FB18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56BA6FB18;
	Thu,  6 Feb 2025 19:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4DA6E2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D533D81028
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMlDCLPQ_rf4 for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 19:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 143DC80BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143DC80BE9
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 143DC80BE9
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:17:18 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21f2f386cbeso22890445ad.0
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 11:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738869438; x=1739474238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xYh9ozXpZOlgbGTbKmOd/C4MY362mUW//jJLfSE1tkE=;
 b=lo4BAp3iAhMvX0Yj1VL4MeoNVNq/vsKKVveseztWyfoJ8LG0KnksHaE/cjwMNIQOU7
 Jh0TJ4fV6bftLmo+y86GVCEDrgLIsizRVzobxvEsIix7sYpv1uxSUcqisikd5MbOwQO7
 BGkc2jVynfVuFsR/Aqwo12CXLdojb09iN/4+cLpDzoIxIkDpY2eYGi3c9lDTcRW7Wfw6
 lmbFmg56QxSRG+WiOf3+QH6dTgmQXsqUeRMrlskqh0T4HsxeAfugnf6Era8JXivqhlmc
 rlFbDQf2osStyApoEOEm94GwGhe/03JSE4L76nhnIajajOKvNvAfkRKOaBjxHXM/RQEl
 ACew==
X-Gm-Message-State: AOJu0YwAm1fzf1t8oph3VcEqtOoEtgueky3du6HkWAa6YmPovUZVgrDB
 FQcjnF44MAFqvIZftOPtk7tFFXLchX6ul+fRWhwtUvSEo8wgCOisKHQCcrgv
X-Gm-Gg: ASbGncs+XSVScGlXVwk8tJnRr6OXS6WxQS/k3A+HWCPGKG4GAJwvtCzl9Nv2tadtCJD
 k5CdbNaO3+deNkKN3K18U4iDr8IRtuf7a92QgCWUVuatJccpZtJTfDOOuBeWxV/TFpQlwMjrJQP
 Bmg4S1prmKTWDVnqJSFZOiBZV7EkGiBYQnbwwIp2TChpqFq6cGNxmk1Tn3oOFo2qmLPpadJI2wV
 mZ2u5O1HbFuuDqz+bUKX2K75I+j41f/+MGvI9WCnUNpe7xF5eeLWN/nlkrrn4U41ehY12tsGL0H
 o6aG0RM/Zk+ST0LkJcIPuWDr1iBa2teEpV/lcyxDVkK+jfBvoqlIwhXb+MZo3PHq3aTd7Jb6irc
 =
X-Google-Smtp-Source: AGHT+IFNA60mAPvCN1gh/IDBsmgTklJufG7zZlZrg84uaFR0Vh1e42xlF3+rsKv4s/7GmM19hmtUkQ==
X-Received: by 2002:a17:902:d582:b0:216:668d:690c with SMTP id
 d9443c01a7336-21f4e702d3fmr5778085ad.28.1738869438065; 
 Thu, 06 Feb 2025 11:17:18 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3683d55esm16418295ad.152.2025.02.06.11.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:17:17 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu,  6 Feb 2025 11:17:10 -0800
Message-Id: <20250206191710.8607-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738869438; x=1739474238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xYh9ozXpZOlgbGTbKmOd/C4MY362mUW//jJLfSE1tkE=;
 b=adVKTv9PAMoWMP4ukq3SELKe//Nc9WjwDEX5wvdQv4eq/lzwCQcpwqyZrXsv/1wMqu
 CoNaY2uubnsGVrGd5Kn4jAuB1iKrRDACh5Z7soa9BH/ZZslt5j04q9hKz84LGKSAvOFQ
 bDUoFLn5vIrqnUHycJoWgqhaKziP4tRFKPENhF6wG8V2WvChMmPYEr/VXUv+CIQruCbO
 vnlTrEUr99ZbQXyB8eTZqm+YJZWKQkAMUXQS61dNrZO/WEBokTxCZ7ICdYsKd19ekmRu
 TrDkczn4pblAm/cwsEr5BeLBZ25D3fNrpkdITwWafXdpZTYFD0CcUfptNe4jWmx8+nru
 godw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=adVKTv9P
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.29
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

Changelog - https://github.com/pikvm/ustreamer/compare/v6.28...v6.29

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index d0f07475fc..02b317bc33 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b1f184e72d30e803ca928bc6e31f9e0fbbd17480a2fae78ed2ae10ccc0062a2  ustreamer-6.28.tar.gz
+sha256  34572c241f65866caf458fa1526eaf9510656412f34d41a54bcd7aae0ba55630  ustreamer-6.29.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 112b29be8c..107f647f47 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.28
+USTREAMER_VERSION = 6.29
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
