Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C79DCDE012
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 15:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 413B040B53;
	Thu, 26 Sep 2024 15:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vUcSyfgyyWS; Thu, 26 Sep 2024 15:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D36A2410C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36A2410C5;
	Thu, 26 Sep 2024 15:30:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8CB1BF30D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CF1040160
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhQvj5jel9-8 for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 15:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D453B40339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D453B40339
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D453B40339
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:30:50 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a1a3090f39so4165985ab.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727364650; x=1727969450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYRMkSzYIqrGWz6KXbUxefL0Pps9gR3jTAfCoqlsIk4=;
 b=JWV7uEN/ft5FAPR86GjKW+V1jY9aFRLDiwkPNi5FwYk0DtMz4U/nDpEffw0fnqizqn
 3coWtdJ9YW3PW0Tvof70XzDzxahjnMDurcibFFohZ4m9TT+HhPHCr1Y1UP+T4DFpYvrS
 b2ZfBe36KK9J75NR+584Q7DWtlwNV/eXHw/29TlO+ku4+ssr5FBiwof/OkZ30/R0tCKL
 G/0jdaXI6EAEKG5pRb+UFPkXq239FdYI8dM+0W4J2B8xBIQAR4KoE2nK3rMcFMsnDx1W
 9r+SpZfpnB0dt/4fVX6REdyjCt/sZpEx4J15ehbuIETif5rG54gBrbrws5HQTV/soMvc
 24tg==
X-Gm-Message-State: AOJu0YzXbUwoxaGIpJHDEo8Ex4jC6HrR9wqI9QZ4olUXl8/VK+fMY0mP
 4t3oPQQWaHmsYDshvEPwT7z+w8I9e0wT9VGulXi1v+VAydHn6eea+GSyDQ==
X-Google-Smtp-Source: AGHT+IE9IFZjSk0vOsSEy64+EFtq1WW8L7Iy5vG4Rn2oiyw2m7BKiqenac60TCbi8li0kRG5oIOGiA==
X-Received: by 2002:a05:6e02:144e:b0:3a0:9fa5:8f1 with SMTP id
 e9e14a558f8ab-3a26d7bdb2bmr82596315ab.24.1727364649390; 
 Thu, 26 Sep 2024 08:30:49 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888d9661sm6896173.135.2024.09.26.08.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 08:30:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 09:30:46 -0600
Message-Id: <20240926153046.17235-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727364650; x=1727969450; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cYRMkSzYIqrGWz6KXbUxefL0Pps9gR3jTAfCoqlsIk4=;
 b=BhsOmWdUbX7onWVQYpngz4f4A9bwOpAHImvNvz49isOQETGciQjIGK3g6mIrfabiNy
 K4vTWo9AG1sVZ+CEBgZMt7JWXzx8wqixDsn/PAlYhTBtqs3O2A/p4FAycdKvnUxf5Ni9
 iaaBvrEiBI9NtQmAcwJy0APvIAYnSrY7wN8cCgqPIOcRTO/ruVKqy1QwsfT/QnP+7H18
 K+CLfumCcfb9ycQK2098jBP7nesnztmCuNxr1ZhIpxTeFaD33T5Zuz3y0Sc77EU157/8
 SVpz+s86rduBjCaz2t+GnYQ9eAgBDXsU1gan26+/QCRK6sveYM/xlsqL0CYNHh0xYtUa
 XHwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BhsOmWdU
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.13.3
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

Drop no longer required --skip-dependency-check build option as
upper setuptools version is no longer pinned:
https://github.com/sqlalchemy/alembic/commit/9d6e212b77c8ce5ea1164b6d67f2ba491beba413

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 6cfd327f6e..c03236a105 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  0118e72e5ffaf9752d995fa7d6c2a565  alembic-1.13.2.tar.gz
-sha256  1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef  alembic-1.13.2.tar.gz
+md5  c56a6402b0601a8c2d844a08928d752f  alembic-1.13.3.tar.gz
+sha256  203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2  alembic-1.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 79ec56ab65..a1e45630a3 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.13.2
+PYTHON_ALEMBIC_VERSION = 1.13.3
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/66/e2/efa88e86029cada2da5941ec664d50d9a3b2a91f5066405c6f90e5016c16
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/94/a2/840c3b84382dce8624bc2f0ee67567fc74c32478d0c5a5aea981518c91c3
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-PYTHON_ALEMBIC_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
