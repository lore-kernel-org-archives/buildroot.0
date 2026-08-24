Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A10C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40266405E2;
	Mon, 24 Aug 2026 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRRATnpgBFPC; Mon, 24 Aug 2026 21:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607214;
	bh=qZdqVXTMFp/h4F5BthczcBbq7kdz57yjPP1tLo3P3KA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d970viLlurww59QRSgsQLOYQaQZWGBRsB/GwPWIVCDdrqeHJrEIM8QuicCI6yJkS8
	 cO45LNDl6Oxkt0nnfnB1GjEav2cy/AnWxpzLfmKDOWafJA18LX7LaAchX2b+2V8tXA
	 vBtxqUe7Um2pKSONgCME6JymspqEr+8cNAFgpuFD6WY6PR8U69Pl4NHMsv62Tfhjyu
	 kbQGgqimbenmkvH4/xU+5N4RKjlXhXsFgWu33gZsjFu3leAV2Aad3tJD8wbd484mvZ
	 gqoTVgJlhXOE35E/gukUlUA4pEtnycbPxIFU6NO6ediwPmVApkCUUHUJLlelwm5uS/
	 Aq56iqj3bJGUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1EE40602;
	Mon, 24 Aug 2026 21:33:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA8229B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEF5C40083
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk5fQTillny3 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7D984004C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AC9A44E413A2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 812ED5FFC1
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:33:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 064E411C79C3C; 
 Mon, 24 Aug 2026 23:33:24 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2026 23:33:14 +0200
Message-ID: <20260824213315.3323882-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
References: <20260824213315.3323882-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/gdb: handle xxhash optional
 dependency
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

Since gdb 9.x, gdb can optionally use the xxhash library. Since we
currently don't do anything about it, it's a potential "silent"
dependency.

In particular, for host-gdb, this means host-gdb might end up being
linked with the system-provided xxhash library if available.

This patch handles this dependency:

- For the target package, by looking at the value of
  BR2_PACKAGE_XXHASH

- For the host package, by looking at the value of a newly introduced
  BR2_PACKAGE_HOST_GDB_XXHASH

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host |  5 +++++
 package/gdb/gdb.mk         | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 823c2e9966..61fe32d8ff 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -49,6 +49,11 @@ config BR2_PACKAGE_HOST_GDB_LZMA
 	help
 	  This option enables lzma support in the cross gdb.
 
+config BR2_PACKAGE_HOST_GDB_XXHASH
+	bool "xxhash support"
+	help
+	  This option enables xxhash support in the cross gdb.
+
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ebb80072cf..cfec0585da 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -217,6 +217,14 @@ else
 GDB_CONF_OPTS += --without-expat
 endif
 
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+GDB_CONF_OPTS += --with-xxhash
+GDB_CONF_OPTS += --with-xxhash-prefix=$(STAGING_DIR)/usr
+GDB_DEPENDENCIES += xxhash
+else
+GDB_CONF_OPTS += --without-xxhash
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 GDB_CONF_OPTS += --with-lzma
 GDB_CONF_OPTS += --with-liblzma-prefix=$(STAGING_DIR)/usr
@@ -301,6 +309,14 @@ else
 HOST_GDB_CONF_OPTS += --without-lzma
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_XXHASH),y)
+HOST_GDB_CONF_OPTS += --with-xxhash
+HOST_GDB_CONF_OPTS += --with-xxhash-prefix=$(HOST_DIR)
+HOST_GDB_DEPENDENCIES += host-xxhash
+else
+HOST_GDB_CONF_OPTS += --without-xxhash
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
