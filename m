Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BF1C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD1640133;
	Thu, 11 Jan 2024 07:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD1640133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZqK3Rq0-o7e; Thu, 11 Jan 2024 07:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE5DE40164;
	Thu, 11 Jan 2024 07:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE5DE40164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 774AC1BF3CB
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF44615DF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF44615DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HffQ-F1bH_97 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:21:49 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55CB9615D9
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CB9615D9
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3607bb6596aso21060575ab.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704957708; x=1705562508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2+CoC24HyUmwtscahb7BnAtfKtocecqs3nnwmTlU1cM=;
 b=xNQamkuMU+n7wWXZL5bNgmUVBqARUexlE/boWvuvpxSgYOgUHCX+lWlZAOb4WY8Q5c
 5kaYTAze4EqSqKKhcCw1wVAPrBVvdhPMRw6r3Eky6RwLehn13KqsZr9b2dLNLVoQCFSx
 /+Z9gDPJ9v5mk8f6LTQm+DqYZ+/6TiSBRXT+dRy+KW91r3kbQzFSScl5mdKwiUmgcZ66
 Dse/vgG5RLxoaOgALidvkppMelIE8VEiKr1Oq+EUhgzXEdtruO9zBnKhdrPoTgZiimYz
 zyx+Xz1fsi+fucwcyLrojL04Xaim5DkYDJXz35MEJ01kEWXeWa7coRb0GC/tnXO5v+/8
 yafA==
X-Gm-Message-State: AOJu0YxWfsHhDgIh+0k5263CfNx4CtWEEY0KvgJ/RBjxnpmYBVIgV9Ts
 37qLi/VbO8gurLIRT6+l45MM5+N+smYADQ==
X-Google-Smtp-Source: AGHT+IHNRMMSbaHdm9eQd962U7Dwux1pdQ2sdGG8kzaNMdazxmaYMvedPVBYm/rvMHV18JmgtgX/yA==
X-Received: by 2002:a05:6e02:12ec:b0:35f:f02f:40b7 with SMTP id
 l12-20020a056e0212ec00b0035ff02f40b7mr1160915iln.10.1704957708009; 
 Wed, 10 Jan 2024 23:21:48 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bc8-20020a056e02008800b0035fe37a9c09sm126234ilb.20.2024.01.10.23.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:21:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:21:46 -0700
Message-Id: <20240111072146.3076561-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704957708; x=1705562508; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2+CoC24HyUmwtscahb7BnAtfKtocecqs3nnwmTlU1cM=;
 b=mlnCxq6wd/qScj7iAkPXuDKnUrMHuYgl19hS95FIlpxpju4CGeFQpMnecYVkhlsr8Y
 THdo7pvuPcNYsEaE3uGOPpuKhimqMUd13+USyeBez+5gqOmbMftIooV1EKaBE0ZQ6Saf
 O6wnRKs4sSDuLo/76wr3mO4EGCQ1bVdfIRvLRyGmJinF0xwN4aQncgsDAz8/h7ThcSZB
 4s7xNJyw9t3I4JvBS++cNsDr0XhY7kuogAzhvPZqat57kM6taOw1Ju56kafpXd+/wSgf
 cNWlzOXadlFKGspopvHDBKTeiTlztxAinp6aVUnJ8zpmA/R+lDQRtEJtu8RWQms1iexZ
 nfew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mlnCxq6w
Subject: [Buildroot] [PATCH 1/1] package/python-sqlparse: bump to version
 0.4.4
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

Migrate from setuptools to flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlparse/python-sqlparse.hash | 4 ++--
 package/python-sqlparse/python-sqlparse.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.hash b/package/python-sqlparse/python-sqlparse.hash
index c78fd2edc3..0b7c14d9ae 100644
--- a/package/python-sqlparse/python-sqlparse.hash
+++ b/package/python-sqlparse/python-sqlparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlparse/json
-md5  180fb4e11a3f79b119868d7c102d7816  sqlparse-0.4.3.tar.gz
-sha256  69ca804846bb114d2ec380e4360a8a340db83f0ccf3afceeb1404df028f57268  sqlparse-0.4.3.tar.gz
+md5  67798c7a0dae90f263d20e9ecf62c8cd  sqlparse-0.4.4.tar.gz
+sha256  d446183e84b8349fa3061f0fe7f06ca94ba65b426946ffebe6e3e8295332420c  sqlparse-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c1938235b80d39e93138eae89edc3af67e18ecbc40d266529fa57b2dce426310  LICENSE
diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 23b1338e49..0f9126158b 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SQLPARSE_VERSION = 0.4.3
+PYTHON_SQLPARSE_VERSION = 0.4.4
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
-PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/ba/fa/5b7662b04b69f3a34b8867877e4dbf2a37b7f2a5c0bbb5a9eed64efd1ad1
-PYTHON_SQLPARSE_SETUP_TYPE = setuptools
+PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/65/16/10f170ec641ed852611b6c9441b23d10b5702ab5288371feab3d36de2574
+PYTHON_SQLPARSE_SETUP_TYPE = flit
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
