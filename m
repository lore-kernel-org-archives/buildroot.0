Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752B9CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9EAC40664;
	Sun, 22 Sep 2024 05:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUGKYLj6ET-p; Sun, 22 Sep 2024 05:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D7684067F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7684067F;
	Sun, 22 Sep 2024 05:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 621151BF40B
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C04D4067F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu-THl0FRWgz for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAAE040664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAE040664
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAAE040664
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:01:28 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82fa0ccb0cdso141931939f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726981287; x=1727586087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdDZYukLIPITzA5oGZbkXoCvZBNGvf3N1+9kJ59igoU=;
 b=MKss88/0XvcydfzJRT+LqHOMjqgBfLubMCII2TmVgWdm2UvqKgmgqP1cxI5cfulK+E
 /9nmFZmxPGH05DQi82mZQez1ccyNEuBC8btEDitSdw2X76Vl/lEWccNY2Ei+wqNxsBSl
 aO7sxtFXRkksu0foN3raqL5+Dxess6RvwRKs390Tlr17w8Lhu5j9cBr9tJUMC8c7woco
 jiWzqzqYufqcO5mNmVaIg2UX4j6RYwu2yoed0Bd+Sy/rX93dwLSkFzPBg4MKRkHjmx3S
 y3hxMEcVApiFKgf98OmGReMpJ7IrWDToMy7wFakkzEDsKyMXmUp5wgmImnSFaZ4MOFJC
 Gz+Q==
X-Gm-Message-State: AOJu0Yxxx7GZO3reiYf513CltDdbRnyqMJD7Rm/XK7D3ruROtolynwMZ
 pwK6bHT/YwNdud6KkCSdgAXBtgi4AEvnFlQZgZsdx2hTsL2o3SLqES2Nfg==
X-Google-Smtp-Source: AGHT+IFxrM/iICbOkmyjlZjFwXsDEmEiqgIO2uopIofyYvRhFMC+9ANzIFG/4vqtAXeKKKTWUFf6BA==
X-Received: by 2002:a05:6e02:160d:b0:3a0:98e9:1b5b with SMTP id
 e9e14a558f8ab-3a0c8c8c9a5mr69832955ab.1.1726981287423; 
 Sat, 21 Sep 2024 22:01:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf42casm4464719173.17.2024.09.21.22.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:01:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:01:25 -0600
Message-Id: <20240922050125.925616-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726981287; x=1727586087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdDZYukLIPITzA5oGZbkXoCvZBNGvf3N1+9kJ59igoU=;
 b=CAXQ3h+P2vRa0Zi73Fr2gdFoWWFvT7C8BZUtR+F5BE1l1xCphRzZJubjZJCwuTYRX3
 pnYrl/VmFExSSEVXNxf2VbvUJHJQD7TQjBgMgNHMlv27qRJw5a80xQk4PkDoKDCTuWEa
 Wo8k+bqB4gtLlUsN1SLo9Z2j8jBIreN6OElpXrgR2aWv77QDXxnxBH2HXaOwlj20TCb3
 tKISrrTZm23AjHCOgo0CNGtImz+SzjEWYc0OQZHRoEYZJjMsB13dS7+e3imcAm3ONXem
 ne89yepwBaBGdo4Uc5qoI6Rbfle/N7J2XhkSRxL/0qAV/zfz4Yya1bwVApRxlICdTZsn
 lh8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CAXQ3h+P
Subject: [Buildroot] [PATCH 1/1] package/python-treq: bump to version 24.9.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-treq/Config.in        | 1 +
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 5d76a5cdd6..9b75ff40d6 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents. It provides a simple, higher level
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index aecf71aad8..b44aba35d3 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  43892086d556e7596392134f1e10bdef  treq-22.2.0.tar.gz
-sha256  df757e3f141fc782ede076a604521194ffcb40fa2645cf48e5a37060307f52ec  treq-22.2.0.tar.gz
+md5  a48996ff540651deded304b638ba54ea  treq-24.9.1.tar.gz
+sha256  15da7fc404f3e4ed59d0abe5f8eef4966fabbe618039a2a23bc7c15305cefea8  treq-24.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 57dc50ee74..65179246f5 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 22.2.0
+PYTHON_TREQ_VERSION = 24.9.1
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/08/94/424f3bb11eaf464880d076cca2e9d0ee21a1be805fe9761b87eccba5b3ae
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
