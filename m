Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27D7C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58C5840E1;
	Tue,  5 Aug 2025 19:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYHhpghaGzB1; Tue,  5 Aug 2025 19:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B687E840F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B687E840F6;
	Tue,  5 Aug 2025 19:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86618113C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA7E41C7A
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 19:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgYtHEvMmcGW for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 19:42:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FC1141C8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC1141C8C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FC1141C8C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 19:42:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-458baf449cbso33513625e9.0
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 12:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754422972; x=1755027772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFao5n11hvyVqxsWLdxGJgFoW9PQcfrnKBJT6hO4S/4=;
 b=n9ddvj210NQbry4VFA2M1hiFTzCMiscKK53UhRtLfWQtRCD7e7fP/MI8av2uI6Hqjj
 X/wvoDJfoYQNVOvmPEeWp0Mc0KwUpVu0HlE+FtpB/cy/RsS/DFnY04Z6qc8V03FtTJaU
 SsemlTO7kCfRjw2HVRXYNcefg1SgT6ugeaZPWvJWeCaMp16ZlZPnBZSkuDOvZUvuBInz
 Xyb03WR+7IkRa/aMLT/GshF9L12dzVJta96c4qPpb9KycWGij83Q6YuusCaxW04hoYYc
 STpO1jlv4CecEXDGndynwIHzzOLIRC+WKS92nFONbsAQFpagysN4aYgf7e+Z07sbEg0Z
 tbbQ==
X-Gm-Message-State: AOJu0YxET5oyfIv67ALBWIGPDcb9wajgNPmTCh37Dbs2Xfbq9uHuLlmU
 rLqFCObuBSCgb8WbtFh0RKsHXIdSAtbe1KY2awHX0StFkq9x40a+0lZySB4VDzyxHgEanepHUfv
 WSJBh
X-Gm-Gg: ASbGncsI+JtdDIgeU6531W0ssdzmr2EVPacFf8o3/+x3B9ij+TMRl+3mzOLQCdH1bVf
 kwYOzHnGwAUwCWrZL45fTcsjgpqckq7w5itq2BHZ8yC4o5Mjb3fCytGXqXyu1FsYj6p7xcT0mLh
 XozglCLmJrxiNRNxWnRrskzaHOYs9PtvAiQkHrh8xLpLpq7bzbc32329YkNIpsI0HdXYSN/M8G5
 Tc4MSbOAsPHxKBGoJVOTjw6AE4/ksFgTjq0dvn1MreFUxmKIs6PQ6qAiJmmYmWLVcb2dAkD9ahA
 iI/lQa/D5YzQcgN8hFo27PnGYjso5KSdDhbzE4eF7zpJFA4CYQ4wscpEfnKjz8NGjt+loQEWKeU
 zn0iQA5u9MmxC+w==
X-Google-Smtp-Source: AGHT+IEQAarAUaOvfCNYQJzBxuh5jqbY9dXjSnDOSmau+r1yXq0dyWGLlmH7dNaXsPsI4TxLNX0fig==
X-Received: by 2002:a05:600c:358e:b0:459:d4b5:623a with SMTP id
 5b1f17b1804b1-459e708e60emr1312995e9.9.1754422972369; 
 Tue, 05 Aug 2025 12:42:52 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c48105csm20389074f8f.64.2025.08.05.12.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 12:42:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>
Date: Tue,  5 Aug 2025 21:42:51 +0200
Message-ID: <20250805194251.3397164-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754422972; x=1755027772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TFao5n11hvyVqxsWLdxGJgFoW9PQcfrnKBJT6hO4S/4=;
 b=PNgX1ho/anijS/NKFCUZknFA/0N7DhJOlX9DWFo6LwGS+T+n4V4ruywTcxM9JWFutk
 4+qZO9HYIOE5SVqSI7ctVv+C/yupwzgUf/tlYXol/IPnTUpitFOrZEKcG6NK3F8Nm9/J
 eiXn1HFUOD7tLRtI+VVVxPCiDoHrNnzx0BsMp7PWjEkz8NxL92VFR1ncu/vSSt/uEFnn
 tn809rboBay6Z+i9c4ecsKwQ/kh28Ixx/bqPu5C0/7BAMIqNl4i8yGl3s168KdYnnD8h
 dwnz8FTcvRVTLjWV6bcGbiCYoI2wvn5Q6wdGoIrPbnKxqC3enbZOy8gbpfEj8Q826pOZ
 WbgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PNgX1ho/
Subject: [Buildroot] [PATCH] package/pthreadpool: fix thread dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On autobuilder config with BR2_TOOLCHAIN_HAS_THREADS not set the
following error happens when building the pthreadpool package:

```
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - not found
-- Check if compiler accepts -pthread
-- Check if compiler accepts -pthread - no
CMake Error at /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:233 (message):
  Could NOT find Threads (missing: Threads_FOUND)
Call Stack (most recent call first):
  /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindPackageHandleStandardArgs.cmake:603 (_FPHSA_FAILURE_MESSAGE)
  /home/buildroot/instance-0/output-1/host/share/cmake-3.31/Modules/FindThreads.cmake:226 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  CMakeLists.txt:143 (FIND_PACKAGE)

-- Configuring incomplete, errors occurred!
```

This can be reproduced with:

```
cat >.config <<EOF
BR2_armeb=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PACKAGE_PTHREADPOOL=y
EOF
make olddefconfig
make pthreadpool
```

Since the introduction of this package in [1], the dependency was not
included. Since this package was part of the tensorflow-lite
dependencies that required thread it was not an issue.

This patch adds BR2_TOOLCHAIN_HAS_THREADS in the dependency to avoid
errors when built as a standalone package.

[1] f2486a6cf9 package/pthreadpool: new package

Fixes: https://autobuild.buildroot.org/results/35a/35aa100d72c6875350ad10c57f028f04052cbf79
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pthreadpool/Config.in | 1 +
 package/xnnpack/Config.in     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pthreadpool/Config.in b/package/pthreadpool/Config.in
index 194ae33f85..3288b56dee 100644
--- a/package/pthreadpool/Config.in
+++ b/package/pthreadpool/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PTHREADPOOL
 	bool "pthreadpool"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FXDIV
 	help
 	  Pthreadpool is a portable and efficient thread pool
diff --git a/package/xnnpack/Config.in b/package/xnnpack/Config.in
index e4b92f61e8..794c5c47d2 100644
--- a/package/xnnpack/Config.in
+++ b/package/xnnpack/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_XNNPACK
 	depends on BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
-	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo, pthreadpool
 	select BR2_PACKAGE_CPUINFO
 	select BR2_PACKAGE_FP16
 	select BR2_PACKAGE_FXDIV
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
