Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F651C5472C
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 21:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3898480C19;
	Mon, 26 Aug 2024 21:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21wTAUNeqo0B; Mon, 26 Aug 2024 21:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1180880C30
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1180880C30;
	Mon, 26 Aug 2024 21:44:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2195A1BF331
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D8FB80A82
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 21:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsQtAcwM0Y2E for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 21:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DEF7808AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DEF7808AC
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DEF7808AC
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 21:44:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5333b2fbedaso8000507e87.0
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 14:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724708680; x=1725313480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RA5SPCnfH+dCPd/OzzCN/arODWEgVw6UeUfS8Eu1eXE=;
 b=dU4bzRbaKZ+ge75Vm1/c4ATq2+XrU7ejRIw6Qp45Dcin0SbZMjF9Us1SjHRwVT1XGn
 5RVf9NB0Lw0ugaqgPiJpwuXG0T9/7RxnQ7biJNDXJdQUNqrTpnaVVnlPernunsqkl8nl
 Rvgf8aVakjRvAu9qAK/XQJO5WGUmdt8nXugla1DFtZXL3x8vbwQk0WOEcuSEoMjlUMNU
 aa5gpVzgO9Lvc3cBzAQ0zwCqosxZzJJK9LyuNkObnhK6icEwZk01lBwJfF3ZIsi78p9o
 R11yeP/b78UHnOjmvzYcV2W0u3XDPniM90U+Nv4fBL5XOkiyNCJhNsfiukGwxo2Q5XzV
 GTdQ==
X-Gm-Message-State: AOJu0YyDoiE4bzJnrrXOUkFlrcn1406X9KB6iV/KGol6KAOMkzdN3g8l
 cfpKw5kTcMRFTIbaJgIhfGMcd5dJVyt2W4U95hZRvccS7sPHqj718CrY4Q==
X-Google-Smtp-Source: AGHT+IFETQsGYTgNVk4zxXiNvkSY3NTjFAP4reVT9/0SqqWLaVYfcdaAfqsVNTv7FyuCk9dffu/lMw==
X-Received: by 2002:a05:6512:23a0:b0:52e:bf53:1c13 with SMTP id
 2adb3069b0e04-5344e3bbf8amr442375e87.7.1724708679717; 
 Mon, 26 Aug 2024 14:44:39 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5334ea59583sm1580182e87.169.2024.08.26.14.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 14:44:39 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 00:44:23 +0300
Message-ID: <20240826214434.1530363-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826214434.1530363-1-geomatsi@gmail.com>
References: <20240826214434.1530363-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724708680; x=1725313480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RA5SPCnfH+dCPd/OzzCN/arODWEgVw6UeUfS8Eu1eXE=;
 b=h1heZ4tQmZA2G+4YZZO/Wl0ROA5uTgYvuoW1LDgLkGo8BEwyoafaEgMaIKEpIryKAq
 KvwctzDuYvPru54WpTqEKl6AHVDPtCBMF/IpUGDYX98MoSYIiXfQH9f145ob1p98lF/2
 0ixcu5It2veBB2bcyrmZy92W+hmh7KtcF6OWcF1Q2BHQPW1LaV/izM8cEX9TW859pG5a
 G9KHFBuvxccalWEYmoqn9SsKZGx9X+G2b6qoHZogJDcjIaVc7k/+rS2ualBnZJGuX1yA
 K6Nwuu6zkwdT0PJrwn7sgCaW7cDSx8fIBLPm71Z01ujSFD6wGzg4Y9BPSs9xPgWuFD1V
 DDPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h1heZ4tQ
Subject: [Buildroot] [PATCH v2 1/2] package/linux-tools: perf: add explicit
 option for libbfd support
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

Linking perf against libbfd library may significantly speed up perf
report and script commands for data recorded with call-graph information
based on DWARF format. Without libbfd perf executes a new addr2line
process for every address it needs to look up. However perf linked
against libbfd may become undistributable since perf is licenced
under GPLv2 and binutils libraries are licenced under GPLv3+.
For more detais see Debian bug report [2].

This commit adds a new BR2_PACKAGE_LINUX_TOOLS_PERF_LIBBFD option to
perf to explicitly enable libbfd support when appropriate. Note that
enabling binutils in the configuration does not implicitly enable libbfd
support for perf anymore. Also note that if the new option is not
enabled in the configuration, then the legacy NO_DEMANGLE and NO_LIBBFD
options will be set for perf in order to explicitly disable libbfd
support in pre-v6.4 Linux kernels.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd317df072071903031ab5f91b4823858445c4a0
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=911815

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/linux-tools/Config.in             | 10 ++++++++++
 package/linux-tools/linux-tool-perf.mk.in | 15 +++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 5a38f6dafe..de89238bca 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -112,6 +112,16 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
 	  enables zooming into DSOs and threads as well as other
 	  features.
 
+config BR2_PACKAGE_LINUX_TOOLS_PERF_LIBBFD
+	bool "link perf against libbfd"
+	select BR2_PACKAGE_BINUTILS
+	help
+	  Link perf against libbfd library from binutils. This option may
+	  significantly speed up perf report and script commands for data
+	  recorded with call-graph information based on DWARF debug format.
+	  However the result is undistributable since perf is licenced
+	  under GPLv2 and binutils libraries are licenced under GPLv3+.
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
 	bool "perf need python3 to build"
 	select BR2_PACKAGE_HOST_PYTHON3
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 65aba2e9fe..ea98e56450 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -67,6 +67,15 @@ else
 PERF_MAKE_FLAGS += NO_NEWT=1 NO_SLANG=1
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_LIBBFD),y)
+PERF_DEPENDENCIES += binutils
+# Explicitely enable for Linux >= v6.4
+PERF_MAKE_FLAGS += BUILD_NONDISTRO=1
+else
+# Explicitely disable for Linux < v6.4
+PERF_MAKE_FLAGS += NO_DEMANGLE=1 NO_LIBBFD=1
+endif
+
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 PERF_DEPENDENCIES += audit
 else
@@ -95,12 +104,6 @@ else
 PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
-ifeq ($(BR2_PACKAGE_BINUTILS),y)
-PERF_DEPENDENCIES += binutils
-else
-PERF_MAKE_FLAGS += NO_DEMANGLE=1
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PERF_DEPENDENCIES += openssl
 else
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
