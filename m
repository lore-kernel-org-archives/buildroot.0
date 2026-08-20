Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB21C5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC83B80F9E;
	Thu, 20 Aug 2026 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YBMbLdcccCG; Thu, 20 Aug 2026 20:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787257670;
	bh=ax8TW3YBbTRd4xylWb409aa+wA/IT+V0RaFKmwI3esg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TP31LS5UKA1O83LwjIfxna3MXmiX8ZELWQxVA9Ae3uGdiFAPRGap5MzGMOcw1lTaJ
	 yQ8+6ouEPTg6HmMWNTcU+sVGrL9xXfSL/tkFChEsiQ1IqBc4Xha2ROBZQbiykM7GoY
	 DrIeY1cOUuniIJhawUGSkOUXzaoiem2UMs+uZ4rCkdFj7VH6bq35Xv5vgQDDW2O29T
	 /AIxhehgyAyY6CeuWiXXSn3/QbeAtDIJ6AtsPLBtxbTgmwZt41eDtWJjLWABTzMVkY
	 EVNRZuLmHicUv2WzoDjV6Jgo1bLJE4M1Eorv4LJTAV7f1p3h9bE/zpP0FFfrruTxPT
	 8ZOhK8xpdKLYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B15B480E7E;
	Thu, 20 Aug 2026 20:27:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DEE239E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 625F24083B
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjRUPYRHSG9G for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:27:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9234E40839
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 178041A1776
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E06675FF59
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2AC2E11C767DF; 
 Thu, 20 Aug 2026 22:27:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Aug 2026 22:27:34 +0200
Message-ID: <20260820202736.1301073-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/igh-ethercat: backport upstream fix
 to build with Linux >= 6.19.0
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

Fixes:

  https://autobuild.buildroot.org/results/9b270904b2f7cf9eaa661c98370c582a61ff2342/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Linux-6.19.0-support.patch           | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/igh-ethercat/0002-Linux-6.19.0-support.patch

diff --git a/package/igh-ethercat/0002-Linux-6.19.0-support.patch b/package/igh-ethercat/0002-Linux-6.19.0-support.patch
new file mode 100644
index 0000000000..6a6af5508c
--- /dev/null
+++ b/package/igh-ethercat/0002-Linux-6.19.0-support.patch
@@ -0,0 +1,36 @@
+From 2c947e90d93d9c5a0129b62744de9720b48d2a17 Mon Sep 17 00:00:00 2001
+From: Nicola Fontana <ntd@entidi.it>
+Date: Sun, 8 Mar 2026 15:39:41 +0100
+Subject: [PATCH] Linux 6.19.0 support
+
+Commit 89aec171d9d1ab168e43fcf9754b82e4c0aef9b9 (part of linux kernel
+6.19.0-rc1) introduced an arbitrarily sized sockaddr struct to be used
+instead of the classical one.
+
+Closes #200
+
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/c42c9cf8bc31c56cc20ae630605495e3f19f3f9a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ devices/generic.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/devices/generic.c b/devices/generic.c
+index f6cef9b5..a08af54b 100644
+--- a/devices/generic.c
++++ b/devices/generic.c
+@@ -234,7 +234,11 @@ int ec_gen_device_create_socket(
+     sa.sll_family = AF_PACKET;
+     sa.sll_protocol = htons(ETH_P_ETHERCAT);
+     sa.sll_ifindex = desc->ifindex;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 19, 0)
++    ret = kernel_bind(dev->socket, (struct sockaddr_unsized *) &sa, sizeof(sa));
++#else
+     ret = kernel_bind(dev->socket, (struct sockaddr *) &sa, sizeof(sa));
++#endif
+     if (ret) {
+         printk(KERN_ERR PFX "Failed to bind() socket to interface"
+                 " (ret = %i).\n", ret);
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
