Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D7CC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF29160604;
	Fri, 24 Jan 2025 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Pwya2v6Fc-L; Fri, 24 Jan 2025 19:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E836071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E836071A;
	Fri, 24 Jan 2025 19:53:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97B1B94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85AF86071A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iA2v9JyP-1zp for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8855460604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8855460604
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8855460604
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:53:21 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-84cdacbc373so75181839f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737748400; x=1738353200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gAAFdwgmqsRGd5aILRB+lrTfd24pjZ4339hvGAWffM4=;
 b=aRD9oEV86bsONtFzVd7WZ8gIZTR/zUiDhaBPSlD/LHdu0I5TS6OPW451cx6O0eGiEW
 lrEDstedxIDR8fbpVaes6YXYyVgKJ3CQn0TXL0qZ8l/NeclLaG+Xl2jq5A+FHr7XNpPx
 pFZzNKNrmS9gOppzdazJI98J/fJ6cgDlDttyrgptHlrB/z12KhqWVQfGLaUkDp9bv5z6
 ACdEBmlIqhV323T34pELF8k+lpDUF/tl8+xqFH/LqHvDKKKJ7EJe27pEk9Q4k9Iwd9QL
 GgTAUgu7qCMD3Bq2+JvatAC+Kkq37M9YKv/w1lBztJu6UP30j9JsLVQZHqXlcggGqAx9
 0RHQ==
X-Gm-Message-State: AOJu0YzsrCATAQy5yBhuxVpIKQfTXyZ0OqMPcGmDolGnYwbdsN8LeInA
 bFEbLUdP17MT7TeC2dcxEhILmv9ye5DQi6vcIPJtAL8jpohK4bHAj9v5sULD
X-Gm-Gg: ASbGncuhsSePV2X3tRuNZKaG0dQADpt+AQ50AqV346By5iUkjySqVoreCC0OM0rv3ji
 60HLbiUvrIgAPDbiT9DL9vEBY+KWYKwDZLws3olMIJAvUb9Ocs9Vcpd8VBqofVOPQ8Zxpw5Ugx5
 ld8db3JmzNSACyY8+XBDqct/2fQCXdlTrv5fNDVM4wxwmZgC1BoJ2kXit9szcqHBTHbwnY68/JM
 WXZv8NxQDKIJVOUI2bMfn1Tu4JhkW9PQT6KciTkSf8IYzv2J3LtuEKsrtmMWv7YzzX1vFdy+25S
 YWU5i5XwPe1lQi/J0iM/VL5NiZeL9iwyAS7Acl2aIgn58C/j689oO9iZAC02llQUiA==
X-Google-Smtp-Source: AGHT+IEm3h6/jRbOX7/Aa++JYcc7utg0ye7iN+Z8UPij/PKcSvvf9vk8N87TnQilk9u6R6HAFyyW7g==
X-Received: by 2002:a05:6e02:1d8b:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3cf74493955mr259909885ab.19.1737748400342; 
 Fri, 24 Jan 2025 11:53:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db85eb2sm817551173.123.2025.01.24.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:53:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:53:18 -0700
Message-Id: <20250124195318.3826029-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737748400; x=1738353200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gAAFdwgmqsRGd5aILRB+lrTfd24pjZ4339hvGAWffM4=;
 b=IqddJ/9PCatZZ7z0zc9MDWq+0rcODB4JvjVewEM3aJeDSA6gh/MD1aY1vwUbcwsA/Z
 /2Tzl4LPNuwW0wEZRuG7dOPltr2VhmDUQKnkCakbGSz2VWhOq26mJfQgHXuPg73g7ndB
 zs2Utal5RV87HJWHcOYHC6aK8+kFOpYkNBzb+mpXNyKcBVcxiBNW8sG3rxIsN3X5aT79
 /WYOz2BGxIPgbW2CYyAY+KfRF0/6UT6EzI0kWQJXV2sxGBTk676Xz3gtFR/b/vHFewvD
 lcYKPVvwhvPuHnZ1vrYEOtwkgKvqvs84pgRiap4EfQODVkJ5LJO7JQ7OuSmko762ZA1Q
 M5zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IqddJ/9P
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 10.6.0
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
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index a7983a4449..a9b5d00f6b 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  43150affe17a010264115f2caea5de70  more-itertools-10.5.0.tar.gz
-sha256  5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6  more-itertools-10.5.0.tar.gz
+md5  48da05632079828fd2e89e238192bb69  more-itertools-10.6.0.tar.gz
+sha256  2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b  more-itertools-10.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 8fac2abac2..8c520c790a 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.5.0
+PYTHON_MORE_ITERTOOLS_VERSION = 10.6.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/51/78/65922308c4248e0eb08ebcbe67c95d48615cc6f27854b6f2e57143e9178f
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/88/3b/7fa1fe835e2e93fd6d7b52b2f95ae810cf5ba133e1845f726f5a992d62c2
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
