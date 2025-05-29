Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14797C54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 15:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA8640DA5;
	Thu, 29 May 2025 15:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLkmbQoiuNF8; Thu, 29 May 2025 15:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8287940B74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8287940B74;
	Thu, 29 May 2025 15:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F413014F
 for <buildroot@buildroot.org>; Thu, 29 May 2025 15:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9EC583C42
 for <buildroot@buildroot.org>; Thu, 29 May 2025 15:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG73wnfAaO22 for <buildroot@buildroot.org>;
 Thu, 29 May 2025 15:58:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2F2E83C41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F2E83C41
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2F2E83C41
 for <buildroot@buildroot.org>; Thu, 29 May 2025 15:58:10 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3dd81f9ce2eso3495025ab.1
 for <buildroot@buildroot.org>; Thu, 29 May 2025 08:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748534289; x=1749139089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FrNEwDy9FdHf5lhuq2dYF8oLU3SlHOn2Al/qIBCXGew=;
 b=wIMpQjJUDBHLuPgYrwlcjlSAbHaKR15KhctHnMOZhnmJVzJzkLbAH31tHMagkttZA1
 /xMTkJ1y3P/OwJp7z2rIYOMEnhYrg2MLk3390Bx4m24kZieo9GRhP2Ac4h5uaxNcC/9E
 3thxMROKqC9NZdmaQzA4OZ/91TZFRZwBBlbSdEbPLcBtA1qSp/qwHTnFGLrILCeFSxxU
 NZQegaSiX7Mt1JnZpqBU/OeanYlPc6GFECpAiMcKGeGBxDlLSq8g3NEp91Qv8yMT8kU4
 iqniKM8QkGxc8ijyfYWP+ZFpZmLUQnCqDPowoJ4T0YpTyfpho7di3SgYzOXoRYssJZHu
 qjXw==
X-Gm-Message-State: AOJu0Yymf2SUmrdbuW4U1p9OfLlVutPt0JatnyuzJeQPWkbz9r/t6z0o
 XhsrwKFbiERm4xlzrMugkAb/JvIZoPExu3952lQl1oT590owmI/JM9x7+jLv/1kV
X-Gm-Gg: ASbGncsHtOtiT0yIR18DII5PHIt4i/LSnrk2632kqW/54A3MwEPSQeMbTlkt3zld0mt
 wxaBsXQx9T0zmSEI3DJ1RWN/DxwNi6H0QN3U1RQBA/NYuvUn16QxAM6aVk1U4fH4qWNIvfb5H60
 7Dk2jrJYUVjA+0d3C2/JSARFRBPL/XCKwWQwiMwSSV2nlXKzOGfPL94bmlasupGo3DlSPD/aCc1
 IMyCxZshe8YLE8n2dBEwlUoU2ZUOgQPVsZyXya4Lq+Sz5bXjE2FdGKtGGpYwrc1qZbgzRLL262V
 BKGcJsa/VFymJcO6nUm1SZxdWOLIJma3RwRhIYU3Hjw4MUUEhPG3jKsRAE11h/pun/tZjBtTYQs
 jGxcXNybagFPGcUFyfpeNw63E3LzJbg==
X-Google-Smtp-Source: AGHT+IHekPrD6DoVncU4oVymIk6UMWeip7aDozUyNHoZQc6KRIuKQEaF2Ao56Ct5N2g3ooIRARCQDQ==
X-Received: by 2002:a05:6e02:1a8b:b0:3dc:a2bd:af6d with SMTP id
 e9e14a558f8ab-3dd90c794b3mr47610455ab.6.1748534289197; 
 Thu, 29 May 2025 08:58:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dd9353d994sm3779765ab.18.2025.05.29.08.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 08:58:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 May 2025 09:58:07 -0600
Message-Id: <20250529155807.3656157-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748534289; x=1749139089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FrNEwDy9FdHf5lhuq2dYF8oLU3SlHOn2Al/qIBCXGew=;
 b=dNrkUHUUTPdpCfW0T4X3K4MZn7f2S53xEkY8HBLfsgbUyq3dufIb2NkhYw5krZe2uu
 EIQE4RoUsCBq+DzoZMbn9FrDbqp3kWUIN2vPf2T6MUuKJJFR+GdEuR8E07yMQWHIw3Ve
 JuRpIJovbkDWfHqv5wdrKSx+CZ0ON/gFaP4MoPUVoaQ/dSBA8olqF4wLsQ50E6PvW3gZ
 Cab25akQNZaRgJX810vFIi/1NbryT3jMamPASqupzcC/LTcHl4IEadsRUFLeIgEi9CRG
 UWmhwhl5YkKotgOWOy6y/OjkDM+tqR9FiNhqJvM+/rDrPWf6WsQd3Mw1pk3/ZuGQdNuP
 YiQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dNrkUHUU
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version 0.9.0
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
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index a2503f899e..bdbea8f66c 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  11cc31e2513118e66fc37c833cdeaac8  aerich-0.8.2.tar.gz
-sha256  0ed2b15bb017785d17323329e5448b4b12fcfec08a20932626c12aa59a8378d6  aerich-0.8.2.tar.gz
+md5  031a5946dcf816e8059459204eb63b65  aerich-0.9.0.tar.gz
+sha256  37c7ca71e947e7de3aa0e778cb193fc1faebf9136a0f1108b52b902918b85acc  aerich-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 8b54de755a..6c6cea2dfe 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.8.2
+PYTHON_AERICH_VERSION = 0.9.0
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/dc/d1/701a44d8f7fdccf700400ce16a26c679b3f4e36de9fb86c3d9f55f64b07f
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/2f/4b/1facb78fea47f790040035b94fdcc31630fabe1bda49ebc7a4f374da1757
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
