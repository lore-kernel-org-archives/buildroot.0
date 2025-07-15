Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87399C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 22:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E22D83C10;
	Tue, 15 Jul 2025 22:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkybknYAQgEE; Tue, 15 Jul 2025 22:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D91283BEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D91283BEC;
	Tue, 15 Jul 2025 22:20:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E7A11AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE72D40571
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L05EQHszcoz for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 22:20:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D5FC405AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5FC405AD
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D5FC405AD
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:20:03 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-876231b81d5so371707939f.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 15:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752618003; x=1753222803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/f4i+8NJqYb8oBPjJtrsNTlFBv61dBmfLtWkZJ+MwBQ=;
 b=s8KxzizuFMhmY5QeWN4IfVqesWGOHS0imGSb3kYCAPfojOItDL+gciqFW4F02+nvYI
 mJ20A7W99RQlMwyaDuqCcK9MWnTUo1SxiD6fm21eHFoJ4zt71TA6zRishPJP2teg94Bc
 /5jZOQg0HCPNFtN9nECBhvNE5tzCbnZfIy6ze6PSjVzstL+dYxHVfK6WN6uYqBPjk/kI
 5UVnR9O8QOf8/fbAt2QDdcE3LLqUOOo5MuAhcF+QF4YhoiY+sR1MY/9WVuZcL7lgeNvg
 q1b5yicCUNzd2Z8sICI8qfcK4d1BDQ302+zK9kPM2oxq+89DtHPqi/0swr7ZcaxFuA4k
 iLpA==
X-Gm-Message-State: AOJu0Yzdx2kU2EmNUlS9Y6a128h9HaAing3yKY9l+K0ulbkmwGXbBxnw
 AFS7tMb3eDEOA3iwrXNbrsU72cn1lvpECrJX3heC6HX/LpXHn0BHa3wtAIkXyY2r7aY=
X-Gm-Gg: ASbGncsPmU25Hkg3ww/XUH+E9UAXfou1MrxnHptqRDSRz0CO7ZzOSryI20R9A0a+g8H
 AyT6ZOQxRnynIMUBqi54eMpEpXubYYURYz2pDtbhjYGVyI5n2pboNsMOD4TMObzDWGbWjZSp+FH
 voqnQHKMGmQOqpjrIu+a5G0YTjdDmwuMRLgxzLwDR4yyLbDQKnp4xj6EyG03maw205kFsVkGfWt
 R7FH3VV29RI6mPGX7ti7AkB04xr884993Qpgl7oO/OMgeNTPYCPIUTZqVK51d+izwSSpE/Ctu9K
 E8iE/gV8svcznQTyN14L1IxHyhVMnuTWKOvCmtSCMDfYDcVquuVZjp2Rx0xZw2OItnW3OfC9vAo
 e+lwowshF6yIWMVXnGGzricZH7D/vpdJURv3w1TKnPnnKz6q3gm1eeUd+5u3DCBTTz1ka2dRrrh
 n4JbPU5PyjRw/C5fOrrA==
X-Google-Smtp-Source: AGHT+IHCFiFNej+ucR6VwqxBgXNYYIktoXoSmTTHE6BEQfPdMH71eKo94iWqt0kpDSHYdzl7RYpxLA==
X-Received: by 2002:a05:6602:1691:b0:876:c8e9:8b11 with SMTP id
 ca18e2360f4ac-879c08c3de2mr143221639f.8.1752618002757; 
 Tue, 15 Jul 2025 15:20:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8796b8c70a5sm335502039f.10.2025.07.15.15.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:20:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 16:20:00 -0600
Message-Id: <20250715222000.731348-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752618003; x=1753222803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/f4i+8NJqYb8oBPjJtrsNTlFBv61dBmfLtWkZJ+MwBQ=;
 b=gOsSIDyHIYhi55P9BRnyXLw1UFyygnV6vL/2Or9GtMPUarB0taA1mobAAcIupPY1bC
 6677bt6TgNh4T7L1/yLqszW2YktYusNTBmtb37RQbaXCRHCIbWXQ770qLPnRZ+XqiYZ+
 2/DVQQUJ2z6hFcakPRj0uSVgA3fm9FHtdODQmnO0ZnGIDTJvWkD43vkG5FI9dDzENtwE
 iSasCxIm5WGYXJb4N86BA0Iia8fkpaIGQQ+lZl6P1iIpUbx2pJeXGvHzwNtD0gZjXD6y
 ZkdApWcYVV/jbI/7r7e2MLJgGjWz5QRw9E5A4FwUk3+BBo0UvzfKeh2eOW96tWaYWfn4
 R6BA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gOsSIDyH
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.6.1
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
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index eb9caddd52..a2798b5c20 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  faef2df5c61d114588fe61c4dac2c39e  pypika_tortoise-0.5.0.tar.gz
-sha256  ed0f56761868dc222c03e477578638590b972280b03c7c45cd93345b18b61f58  pypika_tortoise-0.5.0.tar.gz
+md5  1a80beca2d767b93ff62ebe9fbce6a63  pypika_tortoise-0.6.1.tar.gz
+sha256  36ec2c88c255b9ed7ef49a6068cdeac10dafd4ddfeb828205d3afc092507fc3a  pypika_tortoise-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index b2b10abffd..f0e92faff5 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.5.0
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.1
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/7d/7b/74dce3354d81988f1d69b689f20b28c3e92f2dcc0c46975bdafd3eb37b18
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/db/03/c293fd42c3669e5a79d508c3ed1ca3ffa501600d93abd904a0f86d493ba0
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
