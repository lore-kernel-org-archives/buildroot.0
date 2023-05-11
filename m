Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3AFC7EE24
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 17:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7F07012D;
	Thu, 11 May 2023 17:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7F07012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILCyAp9kD3Cu; Thu, 11 May 2023 17:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D47D260F1D;
	Thu, 11 May 2023 17:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D47D260F1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B673D1BF263
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 17:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CF5740BAD
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 17:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF5740BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ik_FUlb9SuEO for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 17:59:44 +0000 (UTC)
X-Greylist: delayed 00:24:24 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE1574046A
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE1574046A
 for <buildroot@buildroot.org>; Thu, 11 May 2023 17:59:44 +0000 (UTC)
Received: from 1pxAZo-00038p-U2 by out3a.electric.net with emc1-ok (Exim 4.96)
 (envelope-from <kris@embeddedTS.com>) id 1pxAZq-0003CK-TB;
 Thu, 11 May 2023 10:59:42 -0700
Received: by emcmailer; Thu, 11 May 2023 10:59:42 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3a.electric.net with esmtps (TLS1.2) tls TLS_DHE_RSA_WITH_SEED_CBC_SHA
 (Exim 4.96) (envelope-from <kris@embeddedTS.com>)
 id 1pxAZo-00038p-U2; Thu, 11 May 2023 10:59:40 -0700
Received: from mark-desktop.ts-local.net (_gateway [192.168.0.64])
 by mail.embeddedts.com (Postfix) with ESMTPSA id C7EB0E086;
 Thu, 11 May 2023 10:59:39 -0700 (MST)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 10:59:13 -0700
Message-Id: <20230511175913.2360697-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:DHE-RSA-SEED-SHA:128
X-Authenticated_ID: 
X-VIPRE-Scanners: virus_bd;virus_clamav;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 29564942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=MIME-Version:Message-Id:Date:To:From;
 bh=AMePIQRfHz0zYIRd9ixBVxFjOR9otJywBwcZYoZ0rB0=;
 b=Fu42DJhBvBaJIeMBESWyFy5FN3+Du8sx5jJnBPmDIrHjQOWZriB9uFEyTH9CO2aNI8jr7BblHfS2YcZdn/JxwDy7z+3UkBdu9hdc/lLE9jbZAzXYixVzbjvZOBH6AEEG2k93cs77hapKNHNykZqezcx2M70cJcduS/xm1nwpUZlrvaohyZD3mHF0aunyBe8hV5txoibBsGErDudrzove+1zdSR3cuVFkWFVNrpdR1ms5ahvCjGOUguxdS1yhvCtBd072RBbAAOlZqfXiDl05G/sjFiYHB8R10kNtD3q9AXA0Xxr4mk6X9MQny4mOavMsS/QcsFOIlKFnZDqXVVFCHQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=Fu42DJhB
Subject: [Buildroot] [PATCH 1/1] package/wilc-firmware: bump to 16.1
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to release notes from Microchip, this fixes a memory
leak in AP modes, fixes a failure with an undisclosed but specific
AP, and re-certified with WFA for WILC1000.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/wilc-firmware/wilc-firmware.hash | 2 +-
 package/wilc-firmware/wilc-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/wilc-firmware.hash b/package/wilc-firmware/wilc-firmware.hash
index 6e7850df16..802cb4f9b1 100644
--- a/package/wilc-firmware/wilc-firmware.hash
+++ b/package/wilc-firmware/wilc-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c2e2927a65fe4d7ec2f9872fca35c6b7bf12090ac62116d63c5f17b95a3a786  wilc-firmware-wilc_linux_15_7.tar.gz
+sha256  a06a6a46e03ca00d35da220f7a9f353cc650e5e5657a7988ea732913ad26d9a0  wilc-firmware-wilc_linux_16_1.tar.gz
 sha256  71355eee947a312594dbdaac039827544f93d23949b65c356b7b0ce09e2600fb  LICENSE.wilc_fw
diff --git a/package/wilc-firmware/wilc-firmware.mk b/package/wilc-firmware/wilc-firmware.mk
index e31829d430..12c825cf92 100644
--- a/package/wilc-firmware/wilc-firmware.mk
+++ b/package/wilc-firmware/wilc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WILC_FIRMWARE_VERSION = wilc_linux_15_7
+WILC_FIRMWARE_VERSION = wilc_linux_16_1
 WILC_FIRMWARE_SITE = $(call github,linux4wilc,firmware,$(WILC_FIRMWARE_VERSION))
 
 WILC_FIRMWARE_LICENSE = PROPRIETARY
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
