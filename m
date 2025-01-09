Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B20E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29018607AB;
	Thu,  9 Jan 2025 21:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onY1FQTy-0Pw; Thu,  9 Jan 2025 21:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3925260855
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3925260855;
	Thu,  9 Jan 2025 21:04:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B099776C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92165810ED
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xNUYmqdExxk for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C86781065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C86781065
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C86781065
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:04:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844ef6275c5so42731139f.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736456657; x=1737061457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXt342T0/0F7hLDp4yh9ScF0I8G7ZsIF395UNd9+UK4=;
 b=rlygbVxUYanNk4IH8UzVeO6R+c2N1bVpSxBE6OQYUojuWsMJrwUaiYZ3MRa/uWJYSd
 W8VyFgaKdQVPLqz8uvfRQoExB369kpHHIzYrsHGOkY+Tqn9SGXyYXnjUuBhrOtOSPeAA
 FLhxKOiV00D1eTp+lvpQeRibvFJb/8SCwTKz2xKp9aYxX34mV2Esw2rfg7Okx17uVbb5
 DLpOGNee7lcqZx1zUBsq4hFRt3Hc7NJHBZESMDIpAG2b1z01bxxv1kcu6zGAbsLk1ucB
 TQlLgLbhjVEUdjrhMvTUmTxKpq3K0uKv9Fqhn53yjArllEfLUATRFygv32/EV2XUp7fG
 aCeA==
X-Gm-Message-State: AOJu0YyEBS87kgc9yTj8CzzaQxSW2gzrEZmqCP1/tLGo/qN/Xb9miSPZ
 HkfX4lL+SBTWy3ckIv9mfdHtxiypFrnw6TJsBxfBBosM+Tue/17u8JzZifi5n34=
X-Gm-Gg: ASbGncsl0zIenOMdOqFs9yxDy7iNuPxhVZaeFGUrxEwDjZJ7OtFqFLOGYoT4pFi+Oj2
 blbc2f+U24nWymOPjcnxgR08f5v1VV7oelq8udwUvwkqeROi8AQqR0LSkKkrKeGoksvzMOApB1Y
 WIUepXfhRXRWnCcQiwyyl3epv6InJ+ZeYFAfe9rjBR+FpsDzmmR1jtnjt/L1+yohfU00WxhVRdG
 /HfiYH6earUUqpV98t63e2BAYiiDy4IQF1jWjd3y5Z1KjsrLs0Mmdi/jxyFsPGsX1nwY8gc8GZQ
 4NjKQI20QSBebPYQB9RxWXspnL+fJys=
X-Google-Smtp-Source: AGHT+IHSC3Nsxthy3Bdj4Jf/UA7cq+JzwrRKoz8GZrY5hNi7SaOlyPsMv7IXLqUPqSCifqf+EL0OSA==
X-Received: by 2002:a05:6e02:160e:b0:3a7:e86a:e80f with SMTP id
 e9e14a558f8ab-3ce3a9a5b0cmr73048785ab.3.1736456657248; 
 Thu, 09 Jan 2025 13:04:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adda3a2sm5556975ab.39.2025.01.09.13.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:04:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:04:15 -0700
Message-Id: <20250109210415.2398578-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736456657; x=1737061457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sXt342T0/0F7hLDp4yh9ScF0I8G7ZsIF395UNd9+UK4=;
 b=EzBWmeAdQICGKk568r5UjhymDiR/G7Pr2fZLXk5CMVovKJm0kvCxVT/pJUTWpmLnQe
 d4sROacCHZNQA4HnsvZWLzymjSLK+BjCJa2sVlKtWGeIS+MNazvwIvZxHaezPziROeYw
 1AMwpCF0KNah8UeLB5eFMbEJc7T0SSndfUEvdRKAsIk0JQzLeZXdScNRVGNE2LuJZCRU
 gan1VuE2RfixKOz40O8lQvmwmEgF1OqEsxM35ssitg5hfWCUIu1/E6VH3z9qE+aFs/q4
 Xq9OHlWmwlvKTeg6wqunIrWQRdHfB7zyrDirJU5O4M5g4aut+Idsaidf3ylh55DLi8CY
 fgog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EzBWmeAd
Subject: [Buildroot] [PATCH 1/1] package/python-gitdb2: bump to version
 4.0.12
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
 package/python-gitdb2/python-gitdb2.hash | 4 ++--
 package/python-gitdb2/python-gitdb2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gitdb2/python-gitdb2.hash b/package/python-gitdb2/python-gitdb2.hash
index c70c1aade9..74a7c6ead8 100644
--- a/package/python-gitdb2/python-gitdb2.hash
+++ b/package/python-gitdb2/python-gitdb2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitdb/json
-md5  6071755f2899cd4882b83a070b045bac  gitdb-4.0.11.tar.gz
-sha256  bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b  gitdb-4.0.11.tar.gz
+md5  13bf7fcb906ead5236d1edc6e6656924  gitdb-4.0.12.tar.gz
+sha256  5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c21091c349ffdb571  gitdb-4.0.12.tar.gz
 # Locally computed sha256 checksums
 sha256  efd29f596a08e8857e68e7694a50bcda72839792da7c3f041bcbff5f18009239  LICENSE
diff --git a/package/python-gitdb2/python-gitdb2.mk b/package/python-gitdb2/python-gitdb2.mk
index 424f37f8f4..55ec0fc6d5 100644
--- a/package/python-gitdb2/python-gitdb2.mk
+++ b/package/python-gitdb2/python-gitdb2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GITDB2_VERSION = 4.0.11
+PYTHON_GITDB2_VERSION = 4.0.12
 PYTHON_GITDB2_SOURCE = gitdb-$(PYTHON_GITDB2_VERSION).tar.gz
-PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/19/0d/bbb5b5ee188dec84647a4664f3e11b06ade2bde568dbd489d9d64adef8ed
+PYTHON_GITDB2_SITE = https://files.pythonhosted.org/packages/72/94/63b0fc47eb32792c7ba1fe1b694daec9a63620db1e313033d18140c2320a
 PYTHON_GITDB2_SETUP_TYPE = setuptools
 PYTHON_GITDB2_LICENSE = BSD-3-Clause
 PYTHON_GITDB2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
