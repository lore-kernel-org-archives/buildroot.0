Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B12FD0BB41
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E285F40156;
	Wed, 23 Oct 2024 22:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gArU6da2r8tP; Wed, 23 Oct 2024 22:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A4F4017C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A4F4017C;
	Wed, 23 Oct 2024 22:16:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F987972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47ACB40102
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJEFlLDiYBdb for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:16:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F01F400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F01F400FB
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F01F400FB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:16:23 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a3b0247d67so1425985ab.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729721783; x=1730326583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pAYwWG2c88U3m4yH281X6hUk+2jikqqPOyxBpjt9SE=;
 b=OkJ1If6LYYoQ/9F3SefcLw40z51gGMI+XrRjNlL9nSbnsJtrQNX5sZYKMtSs2K5b2t
 2CXv/0XVhK5tDv7moGwYLQGPd1sr6P5TnWA+vUh2aHbE7PCrY7tlRa0moyJO4LvJNl2s
 TDA8SkpeMssvrM/UB975v8ca2msxWn2q3TKk0VV1o5B354216JzpjTwXR3c/5ep8Whkx
 XN4mEZYGlWtqA4gmOl1j1Ml8gIpF7AK8hGrst0u1nZLK+7M/nzRRrd9ZqghJbgGf4URI
 1unSXDt2bqU4EKz30PtjCSc+5u5dINCep5CttgARgUITpJthA8gEsiynahIbbGk7lQDE
 8DpA==
X-Gm-Message-State: AOJu0YzqEG+mDu9PfjQP6cq9R0iYbt2i4pGFQUMnPWY5hFsJDVgCQLHk
 fcbv3QHoBqjDVli4MvPGvkEhskwPtHHI/TPuLHGaSehSgqkNgsntOAfTvg==
X-Google-Smtp-Source: AGHT+IHJ6ccuQjlbicvrNo+tgyaJu2E+2ZuShfJrA4hlN03ZEquM9s5QJHooQalsQXUOuQxoQWg+Zg==
X-Received: by 2002:a05:6e02:1b08:b0:3a0:8c5f:90b4 with SMTP id
 e9e14a558f8ab-3a4d5930093mr42980495ab.4.1729721782664; 
 Wed, 23 Oct 2024 15:16:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4da9a14a3sm5106595ab.63.2024.10.23.15.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:16:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:16:20 -0600
Message-Id: <20241023221620.3328510-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729721783; x=1730326583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8pAYwWG2c88U3m4yH281X6hUk+2jikqqPOyxBpjt9SE=;
 b=OW17xvpBwi/Ya6IUkrF5zAUo8sQQLuXVcNDSdlrH8oHbed3RWHaE2y1MtICrCBoPHq
 wQPCgoNJK7ese5kepFaEhVUzs8bkL7oGnjqOM+Y3+Q5C2yauISy0ZkWWlyTHT5oVaQys
 Et4i2IOtTV6cYry4cIqQ06o+4kOJmHA9xawnkoUy/bcLMV7LwOuM+Ei8kelEq4mJ89fJ
 Q68m9AECe2Tdv+H/dM197yjcCOlv4ZjTiL/OSo2dyRwK0n3s9LtEvH94NOOGOT/lVG/o
 7HkpYnlAtsQi/Q9s7CsPdhBNkvoNjcthbFeNFOZ5+F/PL4BZckYltln9VqCfWaRGR4NF
 EoRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OW17xvpB
Subject: [Buildroot] [PATCH 1/1] package/python-sqlparse: use hatch setup
 type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlparse/python-sqlparse.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-sqlparse/python-sqlparse.mk b/package/python-sqlparse/python-sqlparse.mk
index 57cef1d672..de5ee15bee 100644
--- a/package/python-sqlparse/python-sqlparse.mk
+++ b/package/python-sqlparse/python-sqlparse.mk
@@ -7,10 +7,9 @@
 PYTHON_SQLPARSE_VERSION = 0.5.1
 PYTHON_SQLPARSE_SOURCE = sqlparse-$(PYTHON_SQLPARSE_VERSION).tar.gz
 PYTHON_SQLPARSE_SITE = https://files.pythonhosted.org/packages/73/82/dfa23ec2cbed08a801deab02fe7c904bfb00765256b155941d789a338c68
-PYTHON_SQLPARSE_SETUP_TYPE = pep517
+PYTHON_SQLPARSE_SETUP_TYPE = hatch
 PYTHON_SQLPARSE_LICENSE = BSD-3-Clause
 PYTHON_SQLPARSE_LICENSE_FILES = LICENSE
-PYTHON_SQLPARSE_DEPENDENCIES = host-python-hatchling
 PYTHON_SQLPARSE_CPE_ID_VENDOR = sqlparse_project
 PYTHON_SQLPARSE_CPE_ID_PRODUCT = sqlparse
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
