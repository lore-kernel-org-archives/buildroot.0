Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D59DC0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E6B839BC;
	Wed, 26 Jul 2023 19:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9E6B839BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Geqxt-DAkMl5; Wed, 26 Jul 2023 19:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BE6B8398E;
	Wed, 26 Jul 2023 19:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE6B8398E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDD331BF336
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C48F761215
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48F761215
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8ahytMgYM6I for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 19:45:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEACA60EF9
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 19:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEACA60EF9
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55285A4C02CB;
 Wed, 26 Jul 2023 21:44:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60342)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOkRJ-0000pX-2b;
 Wed, 26 Jul 2023 21:44:53 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 21:44:52 +0200
Message-Id: <20230726194453.1462570-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690400694;
 bh=ujJ3GBO2b71G0yIfYPdr0gymSRu/T6NZciibOQ2OVx0=;
 h=From:To:Cc:Subject:Date:From;
 b=nEXQYc3uIdD6v1FNfQRaxOdcJVKq7FsSNQJqxLL+QCBmcU2f3zTOlYhhvNjm/6Txb
 nUozHooOqFOFxw7+LLH8QqntdrdlVWoP21PWX39gEN8PDRX2byRLnbxWyu06j5+16V
 xgMPDMqfKgENBMa/5WqVRMyMi45O2rCrxzlZe/KQWhqJcvU6QJ+sQe8HjBoJmUOQuo
 yuLWU7gi2kPoHsU1z7xmr0XCvd6+mjWorYM5fAjGteETibBhMxN4Zd1IcVciPEdY4d
 J1t4MiY5xtJ8L8nrJSzjAPMBPWdkHImybOt3bAuBiQPBkz6lS8udpOuTmUVyLYt0w+
 O8m0oW2OtkGDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nEXQYc3u
Subject: [Buildroot] [PATCH 1/2] package/wolfssl: disable asm on armv4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting
https://developer.arm.com/documentation/dui0489/i/arm-and-thumb-instructions/clz
"This ARM instruction is available in ARMv5T and above."

Fixes:
- armeb
  http://autobuild.buildroot.net/results/ea9/ea9b19e872b4b20b97fceec3f7e0a6a1109c4f12/
  /tmp/ccdRCOaB.s:27: Error: selected processor does not support `clz r5,r2' in ARM mode
- arm
  http://autobuild.buildroot.net/results/cb1/cb1c7ac68b3379d3f4b5efc897198bea0a904217/
  /tmp/cc72ECAj.s:6764: Error: selected processor does not support `clz r5,r0' in ARM mode
  /tmp/cc72ECAj.s:7110: Error: selected processor does not support `clz r5,lr' in ARM mode
  /tmp/cc72ECAj.s:8934: Error: selected processor does not support `clz r5,fp' in ARM mode

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wolfssl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index c41bdb6888..9d173412fe 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
 	bool
 	default y if BR2_aarch64
-	default y if BR2_arm || BR2_armeb
+	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
 	default y if BR2_powerpc
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
