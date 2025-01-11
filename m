Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26163E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE3D41332;
	Sat, 11 Jan 2025 15:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmOZUltGAuI0; Sat, 11 Jan 2025 15:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38574133B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38574133B;
	Sat, 11 Jan 2025 15:16:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F32DC950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFD0E41332
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYy4NEFxCKZ0 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6C1E41339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C1E41339
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6C1E41339
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:16:05 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844ef6275c5so96312139f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736608564; x=1737213364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgP3YqgJLDioplbq6w6pmhYCB+GV/TU3nmsVs8Naz2s=;
 b=rVZZ5SvKu6uyCDxJQE3g8U2XuCdgeBtwOMR/peqnxPwnJe91Qh8/MSOLILmEO30NTj
 Iguj1gDM3Q3+Ypu7KG3RdqlnXwGawimnX/NPvOeVIlckZCwTyddv3VMV4YHQMHalqatY
 GhxBrgdehPbM0tO+7Z4Mv+0YnGTx6Q2wQwEyGvApf5vw9hHs07prJ7ZeMAAqH2LFmxqJ
 Dl4equCrg93HLukEEwJ/lWSmZMOn8gt2+OcXr/JGViguhh8TdUd4KB0jdCLkUJEXdEeZ
 mrvyRivR3gPUwwkg9QbgJQZK2cL88pk0A0/xlXtw8Urvrla7U4c7CIw15R1BEaSTGI2A
 heFg==
X-Gm-Message-State: AOJu0Yxv5wU3rWiKrNCWCXhqUhbG/Pp1gxdf5WeZxJ7oA2pzGHPDaxVi
 P7BPpepAgOpqDWI6CzzkApQ1tBw2EXm990pnmCvEfbBejLb0gigzRd/CGW7FFh4=
X-Gm-Gg: ASbGncs2NTaiWXEc55wFpEsZfF7fh45M9INqntXX6acUIdRGPRsjjdaAZDlhaGvwr9Q
 +dLjW5A1jtq89JhtgSzuUQM2ePa4Hu/hNFzVvQOYD7gcBR+3zNDJMxjYr63tp76cFj5M8/02KmJ
 0cWzG4Uz9eOtUHC0y7smo8cZHY8JbHDgtwpR4pPM1EgJZjjRIK3IZO0tCNEueByZ79sk1JfNw6c
 FyKGHUlIlBjOe3jeMMC3VsFLSmtFhRZAvK6w+RywP1uvHs2e6BnECOI1pxKhYL+xtaUrMHhto2G
 YXgH/Ij17ZUqiwgnku7yf82hD+3tL+s=
X-Google-Smtp-Source: AGHT+IGdZCNIA3hb/6dLbsynUCFRGdxi0KU8xU+fRYsCr73il/oVfmXTGk1QQXh21Q4VhRt+FfiKjQ==
X-Received: by 2002:a05:6602:378a:b0:842:ef83:d3b2 with SMTP id
 ca18e2360f4ac-84ce0166b5bmr1296657639f.12.1736608563966; 
 Sat, 11 Jan 2025 07:16:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d61fa3cd5sm157841639f.40.2025.01.11.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:16:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:16:01 -0700
Message-Id: <20250111151601.2833604-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736608564; x=1737213364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SgP3YqgJLDioplbq6w6pmhYCB+GV/TU3nmsVs8Naz2s=;
 b=WKZCrg2HJsTDXyB/EGu3mC7ilO+pFLJ+4HAJcTm0bxcIsiYhcN9bXXZLujjZeL8bFn
 MU8uAV33kQtiSyEToNF0TL/zaso+AVg5iBBJNBaTS/FJ5lR6EcmNGZYSXN/wuovOrbMZ
 ANX8S3wV3+Zs0H4nUxO9a1HvUByzX152lx8psbBjAzWnJIADGfrbQnKxW897Mom2bwgL
 x8f1XgWtMQUabckJSQVYqhuB+MgBEuT8GrmRKUjv/CscNVlGnDN2kSoxWY+gjwSaBzdX
 PnpU/DSTuImSJyqq0FN8Q/39Z1e4mt7ofUbiVWS3zk4y78pj/+fJrtyKVc0lJmyue+Av
 Ig5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WKZCrg2H
Subject: [Buildroot] [PATCH 1/1] package/python-propcache: bump to version
 0.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 56a491433f..1bda1e96fb 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  70b121a9845a0da06eccfbc42ff74335  propcache-0.2.0.tar.gz
-sha256  df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70  propcache-0.2.0.tar.gz
+md5  c642caac1415818205011277008142ea  propcache-0.2.1.tar.gz
+sha256  3f77ce728b19cb537714499928fe800c3dda29e8d9428778fc7c186da4c09a64  propcache-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index 37ceec731d..92a31a19af 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.2.0
+PYTHON_PROPCACHE_VERSION = 0.2.1
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a9/4d/5e5a60b78dbc1d464f8a7bbaeb30957257afdc8512cbb9dfd5659304f5cd
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/20/c8/2a13f78d82211490855b2fb303b6721348d0787fdd9a12ac46d99d3acde1
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
