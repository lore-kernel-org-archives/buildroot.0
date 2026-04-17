Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE86F8E4B1
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 07:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F92740D0D;
	Fri, 17 Apr 2026 07:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8N_26xtASdo; Fri, 17 Apr 2026 07:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC9540CED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776409300;
	bh=Kmm56b5wGZiCMbJY+X+d/KtLRE2aUw4dtZOGsZv01lg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSxJ5EjvYPRHw6gQ+5WqlanUPJrx5KwCJ6meWnloq0fO9RvVcG7xvZIi8W4FRcM7P
	 gcqJ1NzoL1uPIE0L6Kf6NbWUTFRsUAJ5mP8y2j/154YUDJW4Pn/N1rbmf1MygD8gKP
	 GB2cIdTV482LfT1mDF55oj7kvZdVGmfhwyCBD4gHBSIE56LwYMhM6jFcIAgB7j6aBx
	 XexZL5woRKVBu5ZI0hOhbHjgOrHF+HGLw1lvyzovq9XC88G/qhobTAQxI1sfa5qmye
	 jy708SOM4aoJv2T6F4GC54iOcmaDfPdyV3PDJeOND+cNhtXoQdP9f8pzPBUl/vLAXa
	 7UY9cycRTWT6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DC9540CED;
	Fri, 17 Apr 2026 07:01:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64429259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 497E660C13
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cRrGjiqEKtH for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 07:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57AB560C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57AB560C12
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57AB560C12
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:01:38 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-823c56765fdso203239b3a.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 00:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776409297; x=1777014097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F/BzZhEsi210f0JKFlCG0zyXq5NQKMDJQfRNhp6VkJM=;
 b=Jnd+9IlNnb1NrM6RrLzdbn4pd98vZsqOqno3EQs0TvpRL36YEHHy0nR/UmTlFmuNJm
 Jx+b910sN31Cj/aQle1Mzrkiupt356lpzRbs4kyrSEEq/JIJKRtnb0uHWP9igKgcl3ij
 +bV3lxK5fMn4lbAwxMA/0WHsIIrclmMVyE684z8gYCOEkrluEedKzEaTu8FOAIP6v5J7
 qdK35ALIxaSrli/7Xwt1Nk/lgeju+Yp1+JGUnGLqW8dwX9IwB8T6XAAWluhmA3+RhFWT
 uYbypGhFB8Z8dnf2zn/N7TNpt3DEnDWjGMWYiQLU9JVU3AjppZIi8Isx6IoZCG4O3ebD
 LhAw==
X-Gm-Message-State: AOJu0YxPOg4H8ET58HCA5fb6ile/RhBK3b0QOuUV/EHilMLfUUiVuPln
 phAAiIxnMbkMqiKzbnV5a7atYTBbe9szuPsDt5sOwCyEGDtbwydQo/NLS5m6MQ==
X-Gm-Gg: AeBDies4ufXwvhMI4gtKnexCESi6dSwviVtBcbAFXbLU1Mi4X9alq4jvDzh4Ju0FOzh
 kprxUSvoKLHZFg3d9oJyGKB2RMAUiQB1XfdJ5U5216q91/jyhSgygHuY0xhZRgkxxTlQJdJdRzj
 XJj7bV1+v3xvnyUnyS1nuXnOvHbnsQUhZxmKWMJLbnSyTUkeaAevkp2YPb1MbzeqIZWGwE2BpA+
 2EeMRw90GR5enU8oQqcQDpo2pcdtB+N6fza8Fe5t5gzCfUo3olboGxtDfLDb7E7TAzMyw7zA2mV
 e+7kusy3rtITZUz9R8c/PXPEPta5zwe+GFCYAnqZLvx/Wc6/Wa13trjb0L4qpIPWunqlSCi1s9N
 epn+N35wwWhWmJ9Pt3GImSfF5gHMfx1SSayl9as/mANc+OlPR/H3rVhN3YQZ/2hyzIFiwSz/csW
 lgtJ8xPMQou2ywZQN7jt3AY8f7UkDM7HeM80d90I7XLKPz3I02V1T7Bh0r
X-Received: by 2002:a05:6a00:3017:b0:82f:761:2b49 with SMTP id
 d2e1a72fcca58-82f8c92aa74mr1622381b3a.49.1776409296935; 
 Fri, 17 Apr 2026 00:01:36 -0700 (PDT)
Received: from fedora ([152.58.163.125]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e9d6adbsm1257992b3a.18.2026.04.17.00.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 00:01:36 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 17 Apr 2026 12:31:24 +0530
Message-ID: <20260417070125.44957-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414055130.72888-1-chakrabortyshubham66@gmail.com>
References: <20260414055130.72888-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776409297; x=1777014097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/BzZhEsi210f0JKFlCG0zyXq5NQKMDJQfRNhp6VkJM=;
 b=ibP7DQuVC9ZFbhJtW/fRydxiYcD6q2H6eznJox3+pkohN1yaxO4TwPjdPBWUpQlE+R
 4AL2BdTdJCdITSUCrL/SOyE2dS77clAuERWGjQDWoK21dl+6S/cXnInoa69C+cbshyVX
 srpM+ZQK5DWxvaNxZWM5CFxRDTe3AvNsRIOWGdIuovvEHVDBxRY1Fzmj+ZoJodZF6AM1
 52AILhPOJoKUwhEEX+YvLY92rtfKDBAr6kgyoMvBZdZGfSzZ5L8R300ZZFI+BR51Vb6b
 ADvnQhDVtTLi8HmQ8XAOTEKdcd3lfQcRxf9a6o11KcuzzRziyvaCExLm8fN4GTESZ+AK
 9NQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ibP7DQuV
Subject: [Buildroot] [PATCH v3 1/1] package/util-linux: fix LSMT_ROOT
 fallback definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The fallback definition for LSMT_ROOT was incorrectly guarded
with #ifdef instead of #ifndef, making it ineffective on systems
with older kernel headers that don't define this constant.

This caused build failures with "LSMT_ROOT undeclared" errors on
autobuilders using older kernel headers.

Fixes:
 - http://autobuild.buildroot.net/results/ac2/ac2bc633db0c605564c79bfdfa0e257a9b4f1b28/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
Changes v2 -> v3:
  - Replace symlink with full patch file to fix Patchwork/mailing list compatibility

Changes v1 -> v2:
  - Add missing 'Upstream:' tag to patches (fixes check-package failure)
  - Use symlink for util-linux-libs patch to avoid duplication
---
 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 27 +++++++++++++++++++
 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 27 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
 create mode 100644 package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch

diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 100644
index 0000000000..3d0de62bfd
--- /dev/null
+++ b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,27 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
+Upstream: Pending
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ include/mount-api-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
+index a916f99..87e173e 100644
+--- a/include/mount-api-utils.h
++++ b/include/mount-api-utils.h
+@@ -339,7 +339,7 @@ struct ul_statmount {
+ /*
+  * Special @mnt_id values that can be passed to listmount
+  */
+-#ifdef LSMT_ROOT
++#ifndef LSMT_ROOT
+ # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
+ #endif
+ 
+-- 
+2.53.0
+
diff --git a/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 100644
index 0000000000..3d0de62bfd
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,27 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
+Upstream: Pending
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ include/mount-api-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
+index a916f99..87e173e 100644
+--- a/include/mount-api-utils.h
++++ b/include/mount-api-utils.h
+@@ -339,7 +339,7 @@ struct ul_statmount {
+ /*
+  * Special @mnt_id values that can be passed to listmount
+  */
+-#ifdef LSMT_ROOT
++#ifndef LSMT_ROOT
+ # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
+ #endif
+ 
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
