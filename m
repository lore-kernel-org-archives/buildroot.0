Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43937C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06F960E59;
	Sat, 25 Nov 2023 06:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06F960E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8udJOHef8gJ; Sat, 25 Nov 2023 06:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F82A60E47;
	Sat, 25 Nov 2023 06:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F82A60E47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4DAB1BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD7E560E47
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD7E560E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbdF2fGM-es6 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:02:00 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E339A60B8F
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E339A60B8F
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35b8fc2115bso5928555ab.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700892118; x=1701496918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KNxwYpfhiTdOpTgQDTmothImViD1nb7R/Ib5wsz0SnE=;
 b=aCG6eL9dfjbPbzvm3FkGXOx6EvVqV2DQYPUIzrlQkRG+x77VSIQO72nmkwA5lxq/Sg
 MsNKeaWy6gte4Qk3trUyCnsPwMPwgu4/fTRwtjhxwjXDo1QD+jjrMD1/VRazDa7jaf8j
 jp+yGkjiOLx0yFsXwOXz3gnT0+BsbhVcqfMV36MYJg4ZLoTlbFgdsrX+JiiIUApshnfV
 WYNKhLSXDe0gMt/pRsWavb1NYb3jhFaZbtSAv6kZTyebr+pd89qinkF2lp1oSBgfhDi0
 H1D9LddMbdQJIwdgHsttIPCyn1TFp7VtKsasknliDpznlXEqxGAI10NjaScIyAfraSXA
 9IOA==
X-Gm-Message-State: AOJu0Yx1uZJHp2LmWV6XSmWosD7Xc7bLpDqKWTb8iPmq9fAQWhsl2YFE
 Rt8GKJPsoCMFsXVKfl6ReYeABiZwHls=
X-Google-Smtp-Source: AGHT+IHXU+MziLtogUc+MTTRo239KXDuZdR+1ud4g7a5Syarwk8JpfxQfRPd7xrHB9yvX9JZfYUvuQ==
X-Received: by 2002:a05:6e02:1b05:b0:35c:7cd3:9fd0 with SMTP id
 i5-20020a056e021b0500b0035c7cd39fd0mr1800473ilv.15.1700892118552; 
 Fri, 24 Nov 2023 22:01:58 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056e021c4200b003579c7d376csm1463005ilg.35.2023.11.24.22.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:01:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:01:55 -0700
Message-Id: <20231125060155.697306-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700892118; x=1701496918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KNxwYpfhiTdOpTgQDTmothImViD1nb7R/Ib5wsz0SnE=;
 b=EhMielaE1Rc1uaKjx1vge9Q2QHwaX5zZKnHFhzR1cM1L9IWEZzOe/NImY5FFAOxe2f
 U5g1EgtWxa48Qwbe014HaP9i4zz5NMT1X4bNdDZkTv6ffmdYldekTetXEMXXPnzjKffr
 ykyA0pIrstHQb3bKpHEM2Q2AZgOxF/0ys1kJIXah/qd34xm3mL3xy5PC3whI2ZSyTLrq
 NEfAiUElGYAOb4i+fGLzW5ZjQmrq1XBOvxvFiTDsFQCzIjGlva6oz8lowdLylwlswt3P
 d0/6jTI9wLN9prbdj17i3uDTtuV8livDx8SyfBLXaiiUpBreBx8B0kTfHJfXL/+2xKHW
 aaNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EhMielaE
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.9.9
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
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 58f98f9d84..6659c6cef8 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  3cec7285f61690633bb070d4bba259c2  psycopg2-2.9.5.tar.gz
-sha256  a5246d2e683a972e2187a8714b5c2cf8156c064629f9a9b1a873c1730d9e245a  psycopg2-2.9.5.tar.gz
+md5  eae35fa97cdc92b910b706c720a257c7  psycopg2-2.9.9.tar.gz
+sha256  d1454bde93fb1e224166811694d600e746430c006fbb031ea06ecc2ea41bf156  psycopg2-2.9.9.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index fa23c2814f..0149b8d185 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.5
+PYTHON_PSYCOPG2_VERSION = 2.9.9
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/89/d6/cd8c46417e0f7a16b4b0fc321f4ab676a59250d08fce5b64921897fb07cc
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/c9/5e/dc6acaf46d78979d6b03458b7a1618a68e152a6776fce95daac5e0f0301b
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
