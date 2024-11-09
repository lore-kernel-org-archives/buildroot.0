Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40285D5E377
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E68BD8453F;
	Sat,  9 Nov 2024 17:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50MTYgG3le_C; Sat,  9 Nov 2024 17:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CB1384535
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB1384535;
	Sat,  9 Nov 2024 17:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C07FD92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45E884026D
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mih_gNLEhT3J for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE85840320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE85840320
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE85840320
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:03:59 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a3a5cd2a3bso13424205ab.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 09:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731171838; x=1731776638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aLV6Ooo1fTZ8crP+8GORP198rbkpLMXsMlYiZTkOzVo=;
 b=JPZVeDnzMed5d0ou9jx/Suc0ihOKD3AFWABYzhT0S/MY1sh9fROK06VGwhq+Lxgc7w
 1ec6YmQa3Xsy84gWZ1AIQ0ux4CZTAZ0Flh0N21suFmbJ2/nQrMgUfxEuxOS3ZhA69cld
 RqqW/1cH13QO4+N2XTdxwdxiLyGdwtqHVl4asZt2srvLjkJRxgRQJhQKVdPsQWxFOs4w
 bX4d8Zc0ALDOjsrkXAqa73uq+nsYljDkjfmY29ixdd5sSTU3wk9bJI+ivhcovVEU6v/x
 A8rQKfQ+80DzOxMWZUYZpVVSr7AnoIkC6Q1w9xgKFBOZtXMcLblsrdVhyDpH8r9vDyO4
 gTHg==
X-Gm-Message-State: AOJu0YwRrhtq/PJ520f/EUTRdbvXf7Qh5XFqriOnbkT57d9g91L53w08
 ZmBOIcnJd0FoNI5JxI4xT0D4c1mhD9Lv6920MJSmCS8OBbtqAzGdEWw9B01e
X-Google-Smtp-Source: AGHT+IFZTGLBrd9CU5U3/jsE6MoIFsBAmlMHIYjzu/0BSSQT9iYmiPebZc9SOsjXh8ZVnqCpccwCuQ==
X-Received: by 2002:a05:6e02:348c:b0:3a5:e5cf:c5b6 with SMTP id
 e9e14a558f8ab-3a6f19e2641mr83321445ab.10.1731171838318; 
 Sat, 09 Nov 2024 09:03:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f983718esm4272395ab.21.2024.11.09.09.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:03:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 10:03:56 -0700
Message-Id: <20241109170356.574653-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731171838; x=1731776638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aLV6Ooo1fTZ8crP+8GORP198rbkpLMXsMlYiZTkOzVo=;
 b=T8j57DsGiR+zB9F27cT9HFtAcuicFk+MTcinOG9Y9HwFqVBcCLS4b1buyeIXaV0hXq
 eNtUu0pHRzv9z9zkLQQIK+SZ+dGmswdNmkuRrJ1AnxRfrgK1FGX5lxGSjyuHNg/RWQI+
 TJZ45ZyCk4RQ82rEIMr2Tr9eJFiMzs70/zKknQmVJNwy6XHuJ/hpaX0sZazwOEmcg9wz
 sW4TJz812yG0X7YXhw0hrn/pfCRkUWPkWMJqWAtLi91rCNt8m8fiyKKuVxUESxc9/pdQ
 Rkhy4HNhmbxkfiT7M1L3AFxxJNkYlbZEJ8HrX716Cb4CBHlmWOgSxe173trpgXsDVzmG
 EK+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T8j57DsG
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.57
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 6879cee31c..1076a748b2 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  41a22a0b48a9f4a90f5333fd64bfcb34  botocore-1.35.53.tar.gz
-sha256  e610ae076ad1eaed5680d3990493659bbabdffd67b15c61d8373a23e4bc41062  botocore-1.35.53.tar.gz
+md5  d317006e6032155bfd46a949cddbac72  botocore-1.35.57.tar.gz
+sha256  d96306558085baf0bcb3b022d7a8c39c93494f031edb376694d2b2dcd0e81327  botocore-1.35.57.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3f05c051a2..d8d410aea5 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.53
+PYTHON_BOTOCORE_VERSION = 1.35.57
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/48/c9/d5a1f5ad4024eda0d5d1b4103d28085c13cf42ca377fc141f7df4ad1cec9
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/61/17/65b0a3bb507b19a7a1c6cc7c63e374906891798986f0ba2b6ad174ece86a
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
