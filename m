Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901FEC3ABB9
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 00:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49282403D2;
	Mon, 16 Sep 2024 00:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFREPdeOEYMU; Mon, 16 Sep 2024 00:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9160403D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9160403D7;
	Mon, 16 Sep 2024 00:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFF81BF215
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36215403D7
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ve9pCnFIB8Kf for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 00:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0248C403D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0248C403D2
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0248C403D2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 00:13:03 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82ce1cd2026so128979039f.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 17:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726445583; x=1727050383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pg4uWIOMmwhm621qSV3V3WW6M+0+l6iw7NLd6alls80=;
 b=QogpLlDrKD/BQm87aWTaoxdHGHSGIFEN03di8HJSB7JuK0wHalN6OVj4Ixrp0raO7C
 HNg8/ZrjWDSYq4sszuo6uJdBFUTZ3vdXecJtu/6m7WScnvmibpLE4iQdRnOyCI0G6m7H
 Z9Um6c7QMLMnakrKJlZe7qHN6Ci+sqa/aGCQi4Gf7DHiXQAmUv8q6kvWIL/X2LVfnlXf
 xYjVEBr4yol7DuH4g2je4Wf3vMMJo6If2b/UX0LhqlQZ7DglAjZx6p3OF6k0DyL6YwKj
 AHoISyasxOc+oVj9R7lT64DYnEDCUUfLIQeDqTmIW6OwUJBJDEHSl97sytPvgZSqK27Z
 HEwA==
X-Gm-Message-State: AOJu0YwuPWUCkPIGk8uwUaKPNlLbWJh1s3TGuGHmzqnM+2FTsct6kly/
 zITIUL7gLIwJ+b0Bm8A7v6AFxmILoyW0LWvCgiEN4Un7mU8XDof4b9PiHg==
X-Google-Smtp-Source: AGHT+IFGBA4tbMXHA7Ppj0ny/KK21HSIGJ9hJw+hR3VY7o/TRSlog5vu7ECuIrHSaiCoXxchpRKZsg==
X-Received: by 2002:a05:6e02:1c0b:b0:3a0:926a:8d31 with SMTP id
 e9e14a558f8ab-3a0926a90bemr50863495ab.16.1726445582493; 
 Sun, 15 Sep 2024 17:13:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf484asm1188354173.33.2024.09.15.17.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 17:13:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 18:13:00 -0600
Message-Id: <20240916001300.2142570-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726445583; x=1727050383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pg4uWIOMmwhm621qSV3V3WW6M+0+l6iw7NLd6alls80=;
 b=FnPvxD/JJhIR2AtROeCZSlc5A1KLLOLfobY7Ve2m6A6GgEk71EvV8e3Esjm21AQXbn
 MYWfHbXoXQI4gc8LJ3yvdUgZPvzIOCKvrHHIbRLkKqdZebmIv8nqcpef7y/6gXlpMo3I
 KKB3oxcgTafbaO+5mnGDu/RAGnaI1mjAeYjOLTga+jhtZX8uhVckM1lw06ZwV+Nun8OF
 UZZoPgCgZYpO8W1AZKfDv1CdPOTvHJPXzhLG++m32Vby6ospgPy1mafFIxqRc4CmrUec
 n2kCBBg57Ub64/KWSU07q4sIBkChNVbdIacQKuGUEx4tgC7DWjboVpsBhv+8SCD/P2Ro
 bNDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FnPvxD/J
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 10.5.0
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
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 4d119cb203..a7983a4449 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  1737bb4d9d09501f75f498538efe3cf4  more-itertools-10.2.0.tar.gz
-sha256  8fccb480c43d3e99a00087634c06dd02b0d50fbf088b380de5a41a015ec239e1  more-itertools-10.2.0.tar.gz
+md5  43150affe17a010264115f2caea5de70  more-itertools-10.5.0.tar.gz
+sha256  5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6  more-itertools-10.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 98b499c3c0..8fac2abac2 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.2.0
+PYTHON_MORE_ITERTOOLS_VERSION = 10.5.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/df/ad/7905a7fd46ffb61d976133a4f47799388209e73cbc8c1253593335da88b4
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/51/78/65922308c4248e0eb08ebcbe67c95d48615cc6f27854b6f2e57143e9178f
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
