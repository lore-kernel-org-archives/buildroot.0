Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECADFE6BF0E
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 275A160C18;
	Fri, 30 Jan 2026 13:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dU-MEScYKKyh; Fri, 30 Jan 2026 13:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C052C60AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769778894;
	bh=wCxKZ+qtBFpCiJiqaZCORwvTzT9Mi/OLAF7nLeAjGqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CnyLAVx8BRaa54FEgYQXZ68ubSnpZvxZGASj4bmF8vfvWY9S9TAuv+vDd0uE6UoC2
	 6pTtFBBC522mOWoUiI+EwVY97R1hgg5pvjB6JcIBT5LqNn+vRSp9CalOrA4cjtqZSm
	 cDAqBXmF6MDdNollIuOtxqTvyC45D8iVG12rZ11o59avt+IsSvKRz2GAtG+X06wS1S
	 E06zQ0Qcl7ql5ZBaoW4CvR2TOEK5u9ugzyZFjPTNulNECwSUKH5z0Nug0KvlYYZKhS
	 2tVZA4zQixeLHMRUGOxSF24uBfFw4eRjfZqyHHsuM/mFq8nel9viHDBLCalORIgNP4
	 1pD+AtWEBg7ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C052C60AB6;
	Fri, 30 Jan 2026 13:14:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 017DE195
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 13:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E449F4031D
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 13:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YxdiFlXAyqF for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 13:14:52 +0000 (UTC)
X-Greylist: delayed 410 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Jan 2026 13:14:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 526F5400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526F5400F8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 526F5400F8
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 13:14:51 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 41A8E2C89635;
 Fri, 30 Jan 2026 14:07:59 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 30 Jan 2026 14:08:10 +0100
Message-ID: <20260130130810.1506146-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1769778479; bh=cb6S4Q3fjqmBqxbHNf4xfrykQfUGEwg9lwfNsmNjyqg=;
 h=From:To:Cc:Subject:Date;
 b=bjW+pCHMit5F4viQchFch7o+bD2/rne9LiGe6W3gI7nAdJZurQg1UGjy2ual3gRDK
 iin6SYDuAFW1N24YDWst+uYr8ARioBhRBJcidSjLq59BLgHBYFHBgaeLjIqx/xqLj8
 z7k+skc9OVYMy3Yr4wlDk6D9vt9gj2Y2FC+SOSAsI4dad4DmVIblhyRekKcFBv4KD6
 e12hmLNJQQZ1hYotPttlitQToDoCygMqDf3HpFcCuI9RMZuAuBDWVJ9G6WL3cA6J27
 2ZEZIqOCJzivwmz+gq9w3jruMjowdRukwmuaz/xMdsSqnhrMHMkinkGVJSJMpzFLMs
 sB0IbK8V83bCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=bjW+pCHM
Subject: [Buildroot] [PATCH] package/libgpiod2: add option to enable gpioset
 interactive mode
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libgpiod2/Config.in    | 11 ++++++++++-
 package/libgpiod2/libgpiod2.mk |  7 +++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
index 5a13bfc344..279b1e40e7 100644
--- a/package/libgpiod2/Config.in
+++ b/package/libgpiod2/Config.in
@@ -21,7 +21,16 @@ config BR2_PACKAGE_LIBGPIOD2_TOOLS
 	help
 	  Include a set of command-line tools for managing GPIOs.
 
-endif
+if BR2_PACKAGE_LIBGPIOD2_TOOLS
+
+config BR2_PACKAGE_LIBGPIOD2_GPIOSET_INTERACTIVE
+	bool "gpioset interactive"
+	select BR2_PACKAGE_LIBEDIT
+	help
+	  Build with gpioset interactive mode.
+endif # BR2_PACKAGE_LIBGPIOD2_TOOLS
+
+endif # BR2_PACKAGE_LIBGPIOD2
 
 comment "libgpiod2 needs kernel headers >= 5.10"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index c5b53f631b..62d6173418 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -24,6 +24,13 @@ else
 LIBGPIOD2_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_GPIOSET_INTERACTIVE),y)
+LIBGPIOD2_DEPENDENCIES += libedit
+LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+else
+LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
 else
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
