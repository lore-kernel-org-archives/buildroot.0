Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8911C27C6E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 07:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A962406F9;
	Mon, 17 Jun 2024 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2i_n62xgF6N; Mon, 17 Jun 2024 07:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22231407C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22231407C3;
	Mon, 17 Jun 2024 07:55:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE591BF2A6
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 07:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A628404C1
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 07:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zB8gqzlKFc2B for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 07:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=titouanchristophe@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA54740136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA54740136
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA54740136
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 07:55:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-579fa270e53so6070037a12.3
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 00:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718610931; x=1719215731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ve9wcgsgUHQhNViULDcOXw42PPW53EJBepo++1TWOOs=;
 b=unKEP8WTWvtmyN7JLRb3IETNiwRJY7imhqRH1VXkAa1RWks4FI4Q5sXqCaodebaIqx
 tHGL9dilip231YSDYhI84bST4BlvAlZLqXXm7FxFR5XNyHbApeetjmzSWFWfLwWxNh3j
 zNuvKqSUCXUo9Zy8v5UfSyvn93/EaaxJFO/r9U1vWo2W5/+TWrX2k5+By8hdACWRY60e
 Azh3jThLhLU7owlA/1vJ92Oqw1+qtYvXiP/eOAwfO1YdQbaw5IsXuay8a87x+D8KHh/2
 7rJdBHNvWC/Ez1WAvlvP7xX67HOMZOo4d23WAV2kGZ62JTfDTWonOsg9KsSMWHrBRYZY
 U1+w==
X-Gm-Message-State: AOJu0YwwCcL/RqrPKRbsS8uu1k2KExkbx+oEwUB/i65NZFhYmLgj8deX
 TBT98aAuqu+D7KOWe7pOmaoOHD6V7V1QZLw7SsloAkf+s993nHcXW/ODGw==
X-Google-Smtp-Source: AGHT+IEWz5v6V5UHqUzPnsb8X2ySJ8S8NhijaegbB4Li9buM7+Zzyxvs3tEbvP1saL58QAVmtoGr9w==
X-Received: by 2002:a17:907:8743:b0:a6f:6f4a:b25c with SMTP id
 a640c23a62f3a-a6f6f4ab56cmr555091166b.14.1718610930547; 
 Mon, 17 Jun 2024 00:55:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:63d3:7700:b737:23f:c590:d252])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db682bsm484967766b.62.2024.06.17.00.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 00:55:30 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 09:55:03 +0200
Message-ID: <20240617075503.938411-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718610931; x=1719215731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ve9wcgsgUHQhNViULDcOXw42PPW53EJBepo++1TWOOs=;
 b=TrBOVQ7S+kEnPGM4Gz7VIs1JEVmCmzNa8gylAhLoINCFeoobAvccpA1cpNC+5tDCWc
 RvXXJbPdLyIrmMtoQlcV6grOskysX+jzDYqXAwZomZky+lK9s+OTIXQ9t6pqrGwmPa3u
 nqHT4uW5kO3guqAGyqFmn9x8/AeG3gSfJnkjNpwbcpDVAxpKLueytYlsqf8rPwivhPmY
 zhxE7rcCK4tkgXx/JpGJDEAL9llHfE/QTkiWt3kNMjyDYs2ooBq6sAb5WZyBxwx3Nvl9
 uKIFtCHmLUWqLYWm9POnoGav0tzFQhZZ9A4N7V3Q3cIphrYN82pp1TktJPp7itin3SL9
 j6iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TrBOVQ7S
Subject: [Buildroot] [PATCH 1/1] package/waf: bump to v2.1.1
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 1ad535febb..543bea5d7b 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  e310e29a44f23f80591f2aa6c2d4c30e5f1a26a8  waf-2.0.26
-sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf-2.0.26
+sha1  9ee587d802ffd15a2e7cae579560d00754db4fad  waf-2.1.1
+sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf-2.1.1
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  dcec3e179f9c33a66544f1b3d7d91f20f6373530510fa6a858cddb6bfdcde14b  waf
+sha256  2e66e01fd564f09106419389119c78143327c89a35f26ee3ed376f0ee410a14d  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index bffa27a926..a12d15a228 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.26
+WAF_VERSION = 2.1.1
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
