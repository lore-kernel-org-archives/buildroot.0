Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A17CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F97440549;
	Sun, 22 Sep 2024 05:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MA-sWO8KW9_s; Sun, 22 Sep 2024 05:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A174055C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35A174055C;
	Sun, 22 Sep 2024 05:13:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33841BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B2C812C4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CoOfVDsTFv6 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6774812C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6774812C3
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6774812C3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:13:07 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso173877239f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726981986; x=1727586786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3uka+UlEscOqrxQ+7ZNufGLCxhxfMzCgO9NRyN2Ego=;
 b=trsqd/Pne2H+1RGOX8gyRg6Vmd+0cIWhqErklIJsrEmaG3rBOrNjIhdBtWa+t9H3bQ
 chasnvDg0nzMWCC+fvr1QQCPL6g286BIGMKywSAG9SSp+G0YqGntp1ow0/JQ/8pL1e0X
 4yeBhs7v1L0tfxds5XAVouc8jWQaMfmlZOdmlNNGL9Mpv8OncmPLcdVNmCsC0Wh7OeUP
 rmqlZrp6DIniY8diXw/o3W8S/aTMVEvWgi7j8I7fPeWeTcYM0O9P2Z6OKAimpMbFxirH
 BRlheiLibruf/HkHchfRmqLcfi2monD+aY74m9BxkURrEfdTsyIMS79I/lnicJwR1EHs
 UPvA==
X-Gm-Message-State: AOJu0Yx1iJ6+AHI0xpsSzkCbK3Ws/QJe4IkchClyu5dygwOjs+03ST6e
 9ZT6wIXtZiL11/Vl/isGIVgMpLhU7kdH5pH8zRMzsqS3puVxVqTf+H9vpQ==
X-Google-Smtp-Source: AGHT+IFwH5EpYMkeMC1v2Bai+nikRxrysgbIGD/LD9th2HNmtQECm/jhVompv2IXwjjbDr8eRCiD0A==
X-Received: by 2002:a05:6e02:18c8:b0:3a0:9ed2:67b8 with SMTP id
 e9e14a558f8ab-3a0c9cd094amr72006275ab.4.1726981986284; 
 Sat, 21 Sep 2024 22:13:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10281sm52847625ab.20.2024.09.21.22.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:13:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:13:04 -0600
Message-Id: <20240922051304.930359-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726981986; x=1727586786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v3uka+UlEscOqrxQ+7ZNufGLCxhxfMzCgO9NRyN2Ego=;
 b=kNO43pLcLmnZLclVFeeqobWrSLat7ZIryN6AH3KN9zqVxr9mottTEYXJVVvs14DzAJ
 YWgmZfWtshrz7frsZkbMwU5gSbMWQwBs4m/xbZfgJVJ2TKxdUeUF64quM2C89ATDuEEZ
 wVGPraSsBsuS3ZDD52IAx4cftWcvHCtGkVivYj1FEQaXkeYbjFqE/uLN/o/NOcVj5cQs
 x5OBjePPdqtp5AYAYtHLJQ3h18/mm4PAiu2ROYMHI0yOo+adOVGdcvoNqJcC57d0GyHl
 4hkP+mkzntTF86XvOEDWZ7hy9go4mghS57UZvIq0TYbsBzNbJHoejwbH1h7vfxqN76YF
 5Rmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kNO43pLc
Subject: [Buildroot] [PATCH 1/1] package/python-trio: bump to version 0.26.2
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

Drop no longer required python-async-generator runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-trio/Config.in        | 1 -
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-trio/Config.in b/package/python-trio/Config.in
index 0aa53c90ca..02931aadb5 100644
--- a/package/python-trio/Config.in
+++ b/package/python-trio/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TRIO
 	bool "python-trio"
-	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_OUTCOME # runtime
diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 487194662e..2ef1851f25 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  f7dbfa6a8722065f09da188641d8ed93  trio-0.22.0.tar.gz
-sha256  ce68f1c5400a47b137c5a4de72c7c901bd4e7a24fbdebfe9b41de8c6c04eaacf  trio-0.22.0.tar.gz
+md5  8f9ed35c130e802b7561edd7f32fc305  trio-0.26.2.tar.gz
+sha256  0346c3852c15e5c7d40ea15972c4805689ef2cb8b5206f794c9c19450119f3a4  trio-0.26.2.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 80da203c15..58c28bb757 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.22.0
+PYTHON_TRIO_VERSION = 0.26.2
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/0b/b8/1b81d2149c3e2c25900d40b8e6c8d3ca502a3cc844b90c962b0854aaf3f3
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/9a/03/ab0e9509be0c6465e2773768ec25ee0cb8053c0b91471ab3854bbf2294b2
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
