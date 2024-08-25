Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3889BC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 19:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0FF40289;
	Sun, 25 Aug 2024 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PI7e5coCxWfm; Sun, 25 Aug 2024 19:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6ED140265
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6ED140265;
	Sun, 25 Aug 2024 19:41:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD451BF33A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 19:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27E9F80FA2
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uO15QEcvrNhk for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 19:41:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23C3C80DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23C3C80DB9
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23C3C80DB9
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 19:41:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5343e75c642so2061488e87.2
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 12:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724614894; x=1725219694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FguxlINKo5uj4BAiBs2CcCGsG7+hdBdMkqf5AHiU9MI=;
 b=sGgzzQ1psIDs9FqxAK6BMqz5rBt5INYyopsiOPYgmZozaJsCFEIV97Dq9IkaoeInUl
 onDYXy+Py5f9Av/VR5NAkDYuUkENF6J1Xo6jgM5uNkQaxvnnxiBQ6k32iIO8agtdNBIK
 1RGI0TCoZdALjLiIeYIzATrZ0yLVMd6oIeIJceTp3cG+woOvGhc6ezJ3mSVkBIgMFtGU
 T/NU406uYC4N9btiB8L+KjkI0YM+Aw5cUMsz4RiC/wbYZKqjesCjvPwx2XzzZHGCrXwL
 7jGphyfo+k2zrTrukRYVVqGd/pUn6qVgYD3/2iC08aUPuoJDaJxCpA7G0tMcC4ZHx4bQ
 E/Ag==
X-Gm-Message-State: AOJu0YwDKjOBTP0haK+FYvW1GjD7+pQQ2+Ig1W5oNsrdpk4lIS7iby1P
 WCLymNJ635KMZYoMpVtlih3Y0eSmhrkOxPEH17hsLObINetq2gkipuY2zTlL
X-Google-Smtp-Source: AGHT+IEf51vsewy602ZsOAy5SqFKMRL0DJ/Z+jKFhV1MqeOzzt+vOXjKitRXbzxxpYJxfnOI3eD1ww==
X-Received: by 2002:a05:6512:3992:b0:52e:9e70:d068 with SMTP id
 2adb3069b0e04-5343882e1c6mr5190089e87.4.1724614893912; 
 Sun, 25 Aug 2024 12:41:33 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-534365f8061sm1004737e87.250.2024.08.25.12.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2024 12:41:32 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 22:41:09 +0300
Message-ID: <20240825194124.4719-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240825194124.4719-1-geomatsi@gmail.com>
References: <20240825194124.4719-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724614894; x=1725219694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FguxlINKo5uj4BAiBs2CcCGsG7+hdBdMkqf5AHiU9MI=;
 b=fD6+kq8DkmtPbGhfnf6hI6l9wVMQR78dKoSoT98Rz66We7MR6ImO26/zcvJEkNzMYN
 53yfuej4Rudv+OLTAMh7cGbKGaqUD+7LLaloowOt9UxjBp4Hy9fJPm8IKKzUJ64WOEeD
 HvZn1qR1MT3R62ODnwtyHwDe2a3JjVKuw1b/eU6TivFQY7tt6AKC29z3/JPI54pQFdTO
 bsApZk4ZY8Y5WqdUHARfBs/8mg9q/dVxK//phrNwq369qSIO5j8rc8Iq5FOSbR0PefIP
 q8UdfLf77tO3wUheHMI6ALLe3gy5UUVkS5zLqgGAgjuHPZSl8BCcDILUrOSWivOTnJF9
 P9KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fD6+kq8D
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: perf: explicit option
 for libbfd support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Before Linux v6.4, libbfd support in perf was opted in by default and
could be disabled using NO_LIBBFD=1. Starting from Linux v6.4, libbfd
support in perf is opted out by default and can be enabled with new
variable BUILD_NONDISTRO=1. For details see the kernel commit [1].
In brief, the reason why libbfd support in perf is usually disabled
is license: binutils is GPLv3, so some distributions can not ship
perf linked against libbfd.

This commit adds new NONDISTRO option for perf to explicitly enable
libbfd support in perf when appropriate. Note that if binutils is
enabled in config, but NONDISTRO is not enabled, then legacy option
NO_LIBBFD will be set for perf in pre-v6.4 Linux kernels.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd317df072071903031ab5f91b4823858445c4a0

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/linux-tools/Config.in             | 6 ++++++
 package/linux-tools/linux-tool-perf.mk.in | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 5a38f6dafe..e87a1d571a 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -112,6 +112,12 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
 	  enables zooming into DSOs and threads as well as other
 	  features.
 
+config BR2_PACKAGE_LINUX_TOOLS_PERF_NONDISTRO
+	bool "enable perf NONDISTRO"
+	help
+	  Enable building an linking against libbfd and libiberty
+	  distribution license incompatible libraries.
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
 	bool "perf need python3 to build"
 	select BR2_PACKAGE_HOST_PYTHON3
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 65aba2e9fe..c26a3eb31b 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -96,7 +96,14 @@ PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
 ifeq ($(BR2_PACKAGE_BINUTILS),y)
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_NONDISTRO),y)
 PERF_DEPENDENCIES += binutils
+# Explicitely enable for Linux >= v6.4
+PERF_MAKE_FLAGS += BUILD_NONDISTRO=1
+else
+# Explicitely disable for Linux < v6.4
+PERF_MAKE_FLAGS += NO_DEMANGLE=1 NO_LIBBFD=1
+endif
 else
 PERF_MAKE_FLAGS += NO_DEMANGLE=1
 endif
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
