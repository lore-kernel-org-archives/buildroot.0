Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA7C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 22:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB9980F60;
	Fri, 28 Aug 2026 22:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pO-hzzibIfkf; Fri, 28 Aug 2026 22:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787955123;
	bh=z4PCRY+0XhCh3O/u31UYRU8gFxqXV8oOMfsRzyr6HQ0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QSz+XF9So7sLWHak1nW0c0UC3CkxmaY+qeQDbpzBePoZwcdM885ow53Q8APUm27hu
	 vB0wROVIBYOp/2XOev//KY1OVrSbANNyMjmerFA+ryYkpizH9mK4Fd0F4pYYjT8D3F
	 ACfhMS3jbADkB8qBOPxINThj7NHWKTQiqAfJUXPiGwwpamwpUNXEhQ7adk9EOOdRjN
	 Z6SJDTsQSzFRoSfjEshNm0b53abwq1uxxQuatopbpnmZYlDMtwaFNAs849j2lJlLPG
	 MOAoIAQkzHJPKJLaDqZhp6MOEAtuXvkriO8TVhvM5kRn604/BBpkny5IlH2MP2U7ya
	 LBF/eiPjPANLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E882F80A82;
	Fri, 28 Aug 2026 22:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 945CB23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A8DC4086A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id maTVoeHOwT95 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 22:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C506040856
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 22:12:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9BF684E4140A;
 Fri, 28 Aug 2026 22:11:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AC5F60537;
 Fri, 28 Aug 2026 22:11:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9E2D11C7813E; 
 Sat, 29 Aug 2026 00:11:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Date: Sat, 29 Aug 2026 00:11:44 +0200
Message-ID: <20260828221147.2883191-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828221147.2883191-1-thomas.petazzoni@bootlin.com>
References: <20260828221147.2883191-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/dpdk: make the libvirt dependency
 explicit
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

examples/vm_power_manager/meson.build in DPDK detects the presence of
libvirt:

opt_dep = cc.find_library('virt', required : false)

and then builds some examples or not depending on the availability of
libvirt. Let's make this optional dependency explicit in dpdk.mk, even
if there's no explicit enable/disable option for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dpdk/dpdk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 147bdb23d3..968a5a877d 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -112,6 +112,10 @@ ifeq ($(BR2_PACKAGE_LIBBPF),y)
 DPDK_DEPENDENCIES += libbpf
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT),y)
+DPDK_DEPENDENCIES += libvirt
+endif
+
 ifeq ($(BR2_PACKAGE_RDMA_CORE),y)
 DPDK_DEPENDENCIES += rdma-core
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
