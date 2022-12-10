Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006E0C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DED760AE4;
	Sat, 10 Dec 2022 18:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DED760AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPwM0V2I1L_X; Sat, 10 Dec 2022 18:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A710C607F1;
	Sat, 10 Dec 2022 18:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A710C607F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0A361BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B326881765
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B326881765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqPzn_Q__T1H for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:52:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52DD8175C
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C52DD8175C
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:52:36 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id g7so1526306ile.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rw5X339982no1e5138wTJQ+eg/L7UO2+NjulUhsexGA=;
 b=SKXXmnho74rHSqbdtcyubxuFmIiHSvnuTZRemSwcGMnUABldgOnmbIsNeqn7rdof6v
 TqHkfbHUufVd3zyCfovdFz2ttvAs8qpvO4q5DA94Ks4olchKIjfnWrR5w8pzqFHKVLGt
 n3SyiagXuWm6fykWSV+7J75Ajla6VzuRSFEqgYk0kVrkPbnKhpB2QFnObW2sStcdbJ9U
 1CMosOfmg9rodOl7xDSVqLP97doaDPi3sIrHSpmAWuzBuaCAjVFcusQEJ5nMYrLLwPy9
 lINfGD3aPJ7eE1949P07Hou0p2enLEocDEGkRFbP0tNPIAnvO5TWLoxMsmcZkwYxiYtv
 yqyQ==
X-Gm-Message-State: ANoB5pk6ibs5/LYWhJU3HdLb8WeutW2r+1w+fiJQ9qxusukEogmltUxx
 TAVjB+rU1fUrrOvIK/UdJYnfgv6GQBEpHg==
X-Google-Smtp-Source: AA0mqf5rORrMSqyTUg4wKsT9yfVQMH8IL1/xdS7LlkHt3S2C7wKkeRT5dWhWHaFzTNEpgoJtUICauQ==
X-Received: by 2002:a92:d286:0:b0:303:9e91:27bd with SMTP id
 p6-20020a92d286000000b003039e9127bdmr3289271ilp.18.1670698355713; 
 Sat, 10 Dec 2022 10:52:35 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 j12-20020a02cb0c000000b0038a7fdefff6sm1632060jap.23.2022.12.10.10.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:52:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:52:33 -0700
Message-Id: <20221210185233.2963627-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rw5X339982no1e5138wTJQ+eg/L7UO2+NjulUhsexGA=;
 b=bHU1PMEd+jyLd+RXMPJAHUX44zJTGhkx/EMK0jNUvDVfeWGoXMgbMkPMS/nw+oI5aj
 L0ZEi0nVWNqGgOw54IVw3WnFGcUqov1c1d8oXemeSG5RjvmNojbDGnfVZx6JOJ4HZcBb
 EEyQ/0mrYtJtJk1aYwUOYmXg44GyzNvEOkE0o+SEfxm7djzTTBkUisLtJKGQ6xMvlbWr
 OgL+vsV3nk01ml/lMKc0pgsV2+wqA3WO/oymVlKdc0VcksJ+ckNudVPGDxQwB3rjFRdu
 KEIlkPYQSHWVH2nFyI2UApoSWSTocvlmtWbH7oNGEvcm8JNUVJrhRMV+EkY6bG1gz8ge
 +bCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bHU1PMEd
Subject: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 1.0.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 36b16a1596..21b5794ebf 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  a52df0dc0586abd1592c97a0274d1c9d  asyncua-1.0.0.tar.gz
-sha256  25966e374b0c90da112a96e9dbc5cc36c123b2b60412eac6f26b04a4b0b4d91e  asyncua-1.0.0.tar.gz
+md5  f67770b896d2ffe975adbaea38c5efc9  asyncua-1.0.1.tar.gz
+sha256  515342470022b9c391587dcf526015ff4c7582f566c72406c778c9f9a2757cad  asyncua-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 509beda151..52c5d5117e 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.0
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.1
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e7/ea/6fe0799c740b0fc8ffda42fc97bf45204ffe06fe41d505c02654e0d4e379
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/9f/88/c32bd5904c92475dd30fa2c3130c4f9170a36343d390e2ce5b002fdf1cee
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
