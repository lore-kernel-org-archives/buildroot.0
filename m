Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA5C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D481E80DD6;
	Sun, 15 Sep 2024 22:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXHySexvikJN; Sun, 15 Sep 2024 22:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E034780DDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E034780DDF;
	Sun, 15 Sep 2024 22:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22CE31BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE4580DDF
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Xp28itJnL7S for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28F9D80DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F9D80DD6
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28F9D80DD6
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:22:57 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a08dc09ac6so15495785ab.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726438977; x=1727043777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mmEIx+E9iNYGtjYR/w0w2RSKMAGmxAgxVhxKDQcP100=;
 b=a0xaNqfrKYt7e4aySoqGx2rzIUi+KENImoltxSfDfxOIvuMFCntvoHs6VLv0j+n+KW
 6XIc3UH/Avh5p7ezO0zquVKm2LURFQSVcURf06TkkzS3HSWK891uJHKcb48CjCG1PfAz
 QM5p1YmkBb7XmCgNQs4uNV5HT3xA/zoakwff7hgrFawbAVPft6DliweB9Vv12kTcMw7X
 5l1DzCuzXlEAxgEmeMbHQU+MzhKnmZTAVpbKp9AaOfiBl8BF6aWPqrj81ZDSwvCA6Q8s
 D1mScEmpwWHPXbCZFYt3CS3kcmYzuQ8IdbGFEY2W27Fx54SQ/+jrS68lG+tFxuL2m3YT
 yAQg==
X-Gm-Message-State: AOJu0Yy1vcs4mmnuJXtF9qHG5OSqZr3sfR+HlhB4yPoyxATXPYDJZnoB
 fv5dpI5qR8+sZQUT4p3PWHkvP51NcN5IAeCaDtGvS1AXn+5s1hBrBoyxNQ==
X-Google-Smtp-Source: AGHT+IHxip4BZdr71QLopiATPuSDvFtq32u3X9t7phe6d699B6X3Ck5ohYtpHz5TtBzmL/IPMjQflw==
X-Received: by 2002:a05:6e02:160e:b0:3a0:a3cd:f239 with SMTP id
 e9e14a558f8ab-3a0a3cdf40emr9323715ab.8.1726438976637; 
 Sun, 15 Sep 2024 15:22:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3cce9sm1155390173.76.2024.09.15.15.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:22:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:22:54 -0600
Message-Id: <20240915222254.1661725-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726438977; x=1727043777; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mmEIx+E9iNYGtjYR/w0w2RSKMAGmxAgxVhxKDQcP100=;
 b=UXp/53vFLuYe6XgHMK7i4Xo/4tdaNNC0hv+Nbyf7pi04jFtVyCU1Z7MsOA1a4mQVTp
 Fwqd8fn4rkSFmayXNEUQJYZlwbP044AI6orjw8MWMiZyAPSCVzNZywjWhz5pwgSSIoYr
 Uo0Itfh4ztwvUHbFlhlyzBEGuDaPlV3sL7yIkxBavAPmGKIwaW3nbiKNgFu/pm0LrZcB
 bAtnttJ/bO9eN7W1MSPFHldE+EhbzXWMRdE9nvmxeTQxjRPCyFusLb+cG3WDgY0x9EdA
 Q9VpQGfCZueVd5KwXXgVZ5bqbkfXC8KFZHOQHdY7IAcfvUh7NJD0YwKpnRYp27u2c26S
 a7QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UXp/53vF
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.5.0
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
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 0a76499185..cef737c2e3 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  69cdd2c9ee1f6837cb173a44d6a0622d  markdown2-2.4.12.tar.gz
-sha256  1bc8692696954d597778e0e25713c14ca56d87992070dedd95c17eddaf709204  markdown2-2.4.12.tar.gz
+md5  4f9f633a30dd452fa4bb764f39fb0d3c  markdown2-2.5.0.tar.gz
+sha256  9bff02911f8b617b61eb269c4c1a5f9b2087d7ff051604f66a61b63cab30adc2  markdown2-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index a78e6ea0d8..b3d30cacde 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.4.12
+PYTHON_MARKDOWN2_VERSION = 2.5.0
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/3c/e4/87a454674ac303e2ca6c25713845d2ae1b59c1a88576054cbec25aaebad1
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/da/00/3c708de5bffa0494daf894d2e8e2b6165f866ef3ae7939546fae039b5f0e
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
