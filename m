Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C61ECDE024
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 17:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02A27405D5;
	Thu, 26 Sep 2024 17:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcgKAteJf8Vy; Thu, 26 Sep 2024 17:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F16C413F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F16C413F0;
	Thu, 26 Sep 2024 17:00:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A061BF3AF
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 17:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C774241E
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 17:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t55gAtL4js7Y for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 17:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15CC242413
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15CC242413
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15CC242413
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 17:00:02 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso78390539f.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 10:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727370002; x=1727974802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6WR8dOF4E5xKOKmgK6YgQaLn/yjFqjyz0Cn2KUWhaEU=;
 b=RcvfV/0km5KrQubmxvhxOI2hdV5VnZHB/EQm131R0rHKXbPivfJrzyWtKxGJPH1hdt
 SzO+Rluu5zIY92r6spqk0PJhMMc2NGo0qyt6P1D6WUCZJXl4g6o7qC32E+3riqrl+kHM
 wl89JU3detMeQWNe+0eKnArYSwkDKeDKTKHKq6gFhn+EVfHS44tHnlFCC3qwFu5P2ruK
 bs14dMqhM9Dz1DZlKtf1mHK6b6oclXTbYuT4OKTffRzawH3JN5mkaHxo1qL6KngxTzpg
 l6+0ssFVnGMk34qIqQmwDX3OclpPLMhMa6i72L6GV8N9AfANKH0jo2Nz1S6yNAc2mQaH
 jIjQ==
X-Gm-Message-State: AOJu0YwgGQu/SnLBvri4XDsVY+BoJNi63oNiMxHJTi5aLzV3ODWrntSd
 ac156fiuvupV+L2iHQ7fUuE2x86dHYzmlM01tyItwZK55xm0e7FpM9WseQ==
X-Google-Smtp-Source: AGHT+IG6DDAp3p7McQWPikY7aGKvYr35QlCFqla/mWvLi8Q4grqxtC37kyYuPJODrSOk5OsJpF6p0A==
X-Received: by 2002:a05:6e02:1ca6:b0:3a0:4c24:7045 with SMTP id
 e9e14a558f8ab-3a3451bc487mr645405ab.20.1727370001751; 
 Thu, 26 Sep 2024 10:00:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d6071dsm327605ab.14.2024.09.26.10.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 10:00:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 10:59:59 -0600
Message-Id: <20240926165959.48462-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727370002; x=1727974802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WR8dOF4E5xKOKmgK6YgQaLn/yjFqjyz0Cn2KUWhaEU=;
 b=IMglv71bMwhDP1213lGmcBZ/Xv+izurjTqgHdtbbnoIq6JX3TOpGrXq0uTXkytwdc4
 8XbU5rusg3UN8+efDnia8VijCLCeuCdUWrYzslCz4jsYvGd1NSHL4yDjL6vHe+j8Xj59
 h7f05mUjW6kwNodJqOpmUrrihnjtg/JesLGkSZw6zyccK3UENqM5/BUTSTYxyAnaAwIY
 XbF0TH6hf8/dVGlGii7sRQWtoPKjFEoS6BsxfWjAvNxKZKhqmFnQbFXP9loI/FwvbSQE
 27dUIRPP291nktiwH9wqxsXMa+eIQimyW4xNYUGSduxerK9lZvdT2uiySCu6t8S9/reo
 turg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IMglv71b
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.54.1
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 2319c55913..3c691fbd89 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  2601d5b066fc9f388a6816725f52f368  fonttools-4.53.1.tar.gz
-sha256  e128778a8e9bc11159ce5447f76766cefbd876f44bd79aff030287254e4752c4  fonttools-4.53.1.tar.gz
+md5  ed2b78a3c9b7982608ee605f1fd952b0  fonttools-4.54.1.tar.gz
+sha256  957f669d4922f92c171ba01bef7f29410668db09f6c02111e22b2bce446f3285  fonttools-4.54.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 23588cd755..ebb7f14302 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.53.1
+PYTHON_FONTTOOLS_VERSION = 4.54.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/c6/cb/cd80a0da995adde8ade6044a8744aee0da5efea01301cadf770f7fbe7dcc
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/11/1d/70b58e342e129f9c0ce030029fb4b2b0670084bbbfe1121d008f6a1e361c
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
