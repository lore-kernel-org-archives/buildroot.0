Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85677CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 15:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D458404F3;
	Tue, 24 Sep 2024 15:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewai4uM-pAKy; Tue, 24 Sep 2024 15:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA374059F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA374059F;
	Tue, 24 Sep 2024 15:37:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1D51BF401
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 15:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AF1C40C67
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 15:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evRYMMSoUIPx for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 15:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B62E040C57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B62E040C57
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B62E040C57
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 15:37:02 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 54772C2E01;
 Tue, 24 Sep 2024 17:36:59 +0200 (CEST)
Message-ID: <7a7eb00c-ce72-4a05-adf2-7229578c0030@grenoble.cnrs.fr>
Date: Tue, 24 Sep 2024 17:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1727192219;
 bh=bF8YJJYDuNPnY2K8GUQaLiCG5YDhN1+iI+GG0130248=;
 h=Date:To:Cc:From:Subject:From;
 b=JWZWQQcRJBm3lhja00x0QFXRQJSbgVvEgGfJqGKIINHhDD47/c6VxUaaeZRe4nb/f
 tfSW72zbBIgV6olT8tpfAF06DArl+IygMAalMceWrl6+1fNlqvrOSDM7+8dyPKhNP1
 Z+Yr9BsqpVDkn712B7+ppffMpWpLAmxVGs6mRiG9QCJsc3oCHtrsmb90d+fLBlniR6
 Kz5aacvrbFsUcqUa0v/blYw4jNcaCHdTmYrBIIFYFq5N4T+EdVa8RTzHYA6ePF9qoX
 3HflRXHRnkHHMOeXnRL0jGpAawPsQCxMr/HmuJa/wR09JFAZrR7z5dmPgsETYppvkk
 ILgDWNHTd4wuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=JWZWQQcR
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: fix build failures on
 undefined FE_UNDERFLOW
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
Cc: Michael Fischer <mf@go-sys.de>,
 Anthony Viallard <viallard@syscom-instruments.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gnuplot carries the implicit assumption that, if the header fenv.h is
available, then it must define FE_UNDERFLOW. This assumption fails on
mips, mips64, nios2 and microblaze.

Fixes:
 - https://autobuild.buildroot.org/results/76a97b62e01c9778b31c52ad8d391ec54158643e
 - https://autobuild.buildroot.org/results/184d3e6ff0c2edc6511c55c858e7f8567a6c4738
 - https://autobuild.buildroot.org/results/ce018eef26faca25c260be94afc49e06a8b6ba2d
 - https://autobuild.buildroot.org/results/d43be86091c9bd9163c145264151532f0f485528
 - https://autobuild.buildroot.org/results/8568504e6b217c75f3309f5389ad55dd338d8600
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 ...002-only-use-FE_UNDERFLOW-if-defined.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/gnuplot/0002-only-use-FE_UNDERFLOW-if-defined.patch

diff --git a/package/gnuplot/0002-only-use-FE_UNDERFLOW-if-defined.patch b/package/gnuplot/0002-only-use-FE_UNDERFLOW-if-defined.patch
new file mode 100644
index 0000000000..d288d01c0a
--- /dev/null
+++ b/package/gnuplot/0002-only-use-FE_UNDERFLOW-if-defined.patch
@@ -0,0 +1,31 @@
+From 0e2af8ab7ee444f30beda91151fec7d359ccffc6 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Tue, 24 Sep 2024 15:38:56 +0200
+Subject: [PATCH 1/1] Only use FE_UNDERFLOW if it is defined
+
+According to fenv(3), the macro FE_UNDERFLOW is defined by fenv.h only
+if the implementation supports handling of the underflow exception. Do
+not assume the presence of fenv.h implies FE_UNDERFLOW is defined.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://sourceforge.net/p/gnuplot/patches/816/
+---
+ src/complexfun.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/complexfun.c b/src/complexfun.c
+index a87d773c5..1d3c9aaf0 100644
+--- a/src/complexfun.c
++++ b/src/complexfun.c
+@@ -86,7 +86,7 @@
+ 	int_error(NO_CARET, "%s: error present on entry (errno %d %s)", who, errno, strerror(errno));
+ #endif
+ 
+-#ifdef HAVE_FENV_H
++#ifdef FE_UNDERFLOW
+ #define handle_underflow( who, var ) \
+     if (errno) { \
+ 	if (fetestexcept(FE_UNDERFLOW)) { \
+-- 
+2.34.1
+
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
