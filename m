Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C3CDE012
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A125141E78;
	Thu, 26 Sep 2024 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzbZlbUsPP5h; Thu, 26 Sep 2024 15:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A37541E7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A37541E7A;
	Thu, 26 Sep 2024 15:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D18631BF30D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF99040338
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YOUZxcVyb6J for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 15:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8158640275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8158640275
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8158640275
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:14:20 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a0cad8a0a5so4732385ab.1
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727363659; x=1727968459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMdR3S05bAV+PlJktDks6Z8vCePQp6CwO0z9p1HV60E=;
 b=Hk9DVDLcLxW++EuUvR6S7sha8q+wXrDKBjAJAdpbyj7Pc3zM7HQJ4LIO8/m2hw/aZG
 DMNKODIc90yXzSFGY7yfYmR53RlwTfIiNKgCgZfKLpyrXizR6J+Eh4E1qRBQLFwroOGO
 LVusf440F7fl7r5QmpTiMn/EQbv0ypdMLyVN3jjFftyw3Q7CCifPgwUNwKeRuN9Yld29
 77NIppakmWZupWQkgAEJqaSBxrqi6b9srI5ORFEssUfWSTuTg19sFbnUCZ2ybOnpO+15
 p3OPLIFfW1k9b6prbvryGpyc/8iQePHN9UyvsFm/6eYmvQMUVr7rV5WZSqIF4S49mS5F
 msRQ==
X-Gm-Message-State: AOJu0Yw/wfe/A1cQwFckMOlqO3NcANypVbq34KpMoE1pfRRuU1n6o9MJ
 FVaIDX6zoOrNo3UiRebeDPqHrJYYRAMx8q5Q8aUgRY0jSjC1F09kyO23pw==
X-Google-Smtp-Source: AGHT+IEt3yd4oEbAuqW9dyFWIS/KSZqGH5vZBJlW2oxiHoB1zzyLlkk7cTYZty2zh6CHtpQEeE5Wgw==
X-Received: by 2002:a05:6e02:170a:b0:3a0:ae35:f2eb with SMTP id
 e9e14a558f8ab-3a26d7a738emr70175005ab.19.1727363659042; 
 Thu, 26 Sep 2024 08:14:19 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a1a56db894sm18349395ab.46.2024.09.26.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 08:14:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 09:14:16 -0600
Message-Id: <20240926151416.7799-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727363659; x=1727968459; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eMdR3S05bAV+PlJktDks6Z8vCePQp6CwO0z9p1HV60E=;
 b=f5BOkT8RREIWBZBhhcGBLxrTHLicCe00daBpfm3XlnhhmVS7eCFsxdg3S1Z4pkAOBu
 xxkZ8I/PgNxqv8G5JjA1GkvoNY91BMUYLvEVIGHHS8XcXf2FXekG1Mpg7sPoG9B0k5lh
 cxkXD17m5NMDkWsfyflLESugnIbNorGPxAYRIUJs+odrmwVFIFQuQ4IeSsm80JXAej6A
 5LH5MuICle8AjjaK1wzEcitWU8E2zq4bEfyrKtKs49RfSAnk1hNXYppBwgq0YYm5wp2k
 6MDZ3BIaCm/Mbo9pnC3habe0T70aFN0E4mXkPL9xWQJ4c6fO/3zJ9JAtIPMqQm3b6bzD
 LdBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f5BOkT8R
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-sessio: bump to
 version 2.12.1
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
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index efdac39007..8559df057b 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5  b89bde69f6f3c61a991ff408d2733838  aiohttp-session-2.12.0.tar.gz
-sha256  0ccd11a7c77cb9e5a61f4daacdc9170d561112f9cfaf9e9a2d9867c0587d1950  aiohttp-session-2.12.0.tar.gz
+md5  ff7a0c880ed7cee24e0a141c201adb8b  aiohttp_session-2.12.1.tar.gz
+sha256  15e6e0288e9bcccd4b1d0c28aae9c20e19a252b12d0cb682223ca9c83180e899  aiohttp_session-2.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 55bf0e87f3..8b8337e68e 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.12.0
-PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/34/87/8dbc1385c875497d6bc16c9d94e25dbd8ff62599843b73fb4048ba74c867
+PYTHON_AIOHTTP_SESSION_VERSION = 2.12.1
+PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp_session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/c2/c4/d73a7f19b1bd3149ba5bccd22e3ab580c19e4d9fcb83114309e8385ab807
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
