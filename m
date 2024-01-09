Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4727C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA4941955;
	Tue,  9 Jan 2024 07:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA4941955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDf_RyVuID47; Tue,  9 Jan 2024 07:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88D9941921;
	Tue,  9 Jan 2024 07:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88D9941921
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 563B91BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EF1841921
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF1841921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GoBj4QLgl6VL for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:10:04 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DF19418D4
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF19418D4
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7bed8fee278so18097039f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704784203; x=1705389003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tvpHQQAcY5MkIMHSSXsLRCguauUCWmq84jdXqaQKjVk=;
 b=jnjHFd2NuP1MPHzJKtrZTuMXoDkg4v1baMZK3m2ehgUZsv44UaxEyS2kpNSNFFFkxr
 PGrsKC8EQkJEJoEbPG9mDLM2faE3PoVwnMwUXtHTGGHiJWRnZaCdNKkW6Pil3o/4Ecd5
 4a8Lfa13FDctPyl/LxDDc/DDmhc2+sL26BPXeaokLHY0H8B8x8A8cQSqgPOQ0bYZXUvl
 BVdumQAcXFPJYYE/cVeMRZex8KG+UcZ7bTyd9t5mREu8BdX3gzMmCiG3KTqEgLtI05M8
 ijVJ9dzwWqKyFjZrXzP3aUbtkVvcCEBrUJeod3FVxKKrLeeYiUm9LxYorji6xbJO5M03
 8OPw==
X-Gm-Message-State: AOJu0YxtmT/H0YmDhvmc6Ki8sZKrc0yMUgIsyh3ob35cnfFkcT9/OUn+
 iGY1lwEZCo48ieuTy9g32+WTUjjjRU93Kg==
X-Google-Smtp-Source: AGHT+IGiUYGKKfyWw6dotmpglTfjOFCFosLcTLQSDuDmi1TGc1bUDhQr/nF0DJEvrE/GB3LDc4qxmQ==
X-Received: by 2002:a6b:500b:0:b0:7bb:b955:2bd5 with SMTP id
 e11-20020a6b500b000000b007bbb9552bd5mr5818957iob.10.1704784203021; 
 Mon, 08 Jan 2024 23:10:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 t15-20020a6b5f0f000000b007bc234fd196sm395699iob.0.2024.01.08.23.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:10:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:10:01 -0700
Message-Id: <20240109071001.4022321-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704784203; x=1705389003; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tvpHQQAcY5MkIMHSSXsLRCguauUCWmq84jdXqaQKjVk=;
 b=ZAIpf1xisOa+MROwN9RvUSSg5hZ8NZQuHN0OEeb10CAKUa4y97ADKb5W2iX5THPFs3
 RNxL1OR43hKxU7Pkii8DDy3TKHrFgkSRrJkB47X0fS2oIaSH/WTUiBsvdJPPuze8sr2d
 thhql3ptTMrC3KpIpyxAT8jYrl8dbMsAGPqU4FuQhlutc6PYDG/Z8JRMZm+PZ6efZjMb
 b77JqR4/gfyZ1pNVzXV8dTKj/uJqwpoaqmioLHlzt2FGNhPxNy98SH9EyFn3eQrTCXyt
 glUDatJQ62rzth4JbEnWrbU2UlQlR2W8LgHbJUWv0aNJDTzJso7XnQhGCL1ads6VkxaO
 g9iQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZAIpf1xi
Subject: [Buildroot] [PATCH 1/1] package/python-dominate: bump to version
 2.9.1
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
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 9993dbe95f..26840e5f0c 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  df2d30e7c2e7f1e5b085a58820e4cc94  dominate-2.8.0.tar.gz
-sha256  4c90c3befaf88e612b71f4b39af7bcbef8977acfa855cec957225a8fbf504007  dominate-2.8.0.tar.gz
+md5  4dc4bbb39297999624e2312b6fe2b46f  dominate-2.9.1.tar.gz
+sha256  558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4  dominate-2.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 39e2edb82e..d6301af9db 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.8.0
+PYTHON_DOMINATE_VERSION = 2.9.1
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/13/3d/8d22916c12184f0c4930b9cdfb136a130e8d8eacf5942fc9883f2a189f6a
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/fb/f3/1c8088ff19a0fcd9c3234802a0ee47006ea64bd8852f1019194f0e3583ff
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
