Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F0EC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483F3405F1;
	Mon, 24 Aug 2026 21:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPd9x1DPfaW8; Mon, 24 Aug 2026 21:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607210;
	bh=cFGv4cQdnadQoaM3mscoMAE+I2HAADVdgRH6hQDv15U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kZe8w9vqWYl+Z1NthZCEkeHkhOAV4PMFOI5Cf3eRjUoVtulbbZNCoLOsNByHARJiD
	 4kt27/JfEr3u5VQ0ZVCcus6gqg59NyWTKaTo0juv6aAjMDB8e7LJ5hX8FMoqniSF5Z
	 39Y5x60daJCnEnspJn+XC0JSaB0dljJ2Sq29c7DMexHUUpbEzSJAyS95kSuH2VKyU1
	 oh/058Q4ExgK3VFJSqZB0bBOaYJhZm+uU5dzMiFKJ+7ngG0QDGJzyw6J9cHH14XuOh
	 WSrBHAFI0TESJ1AFDaYzxFF3zH8qNDlrfWM3mNIII7of3bDBsNvXOwOkKkbHtkgcFv
	 mrWUAXsgjo5KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42569405C9;
	Mon, 24 Aug 2026 21:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD23279
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0763F80C8F
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVeTnnGl8ptl for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4966880C7E
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 661DE4E413A2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 278B75FFC1
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31DE311C79C36; 
 Mon, 24 Aug 2026 23:33:18 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2026 23:33:13 +0200
Message-ID: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/gdb: handle lzma option for host-gdb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For target gdb, we properly enable/disable lzma support depending on
BR2_PACKAGE_XZ.

However, for host-gdb we don't do anything, which can lead the gdb
configure script to detect and use a system-provided xz library, which
is not desired.

Instead, add an explicit option BR2_PACKAGE_HOST_GDB_LZMA, which when
enabled pulls in host-xz, but also when disabled ensures gdb doesn't
try to use a system-provided xz library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 5 +++++
 package/gdb/gdb.mk         | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2e1eed6f50..823c2e9966 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -44,6 +44,11 @@ config BR2_PACKAGE_HOST_GDB_SIM
 	help
 	  This option enables the simulator support in the cross gdb.
 
+config BR2_PACKAGE_HOST_GDB_LZMA
+	bool "lzma support"
+	help
+	  This option enables lzma support in the cross gdb.
+
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 685d1fe992..ebb80072cf 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -293,6 +293,14 @@ else
 HOST_GDB_CONF_OPTS += --disable-sim
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_LZMA),y)
+HOST_GDB_CONF_OPTS += --with-lzma
+HOST_GDB_CONF_OPTS += --with-liblzma-prefix=$(HOST_DIR)
+HOST_GDB_DEPENDENCIES += host-xz
+else
+HOST_GDB_CONF_OPTS += --without-lzma
+endif
+
 # Since gdb 9, in-tree builds for GDB are not allowed anymore,
 # so we create a 'build' subdirectory in the gdb sources, and
 # build from there.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
