Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A02C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 09:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF314E227;
	Mon, 30 Oct 2023 09:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CF314E227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mvlh13hd5bgw; Mon, 30 Oct 2023 09:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202AA4DDE9;
	Mon, 30 Oct 2023 09:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202AA4DDE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8AB1BF37A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07DF04D7A3
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07DF04D7A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6yxBnBkypan for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 09:39:59 +0000 (UTC)
X-Greylist: delayed 591 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 30 Oct 2023 09:39:58 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A714B478
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9A714B478
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 09:39:58 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39U80E6Z018738; Mon, 30 Oct 2023 10:30:08 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u1d8hcdub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 10:30:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B22F410005D;
 Mon, 30 Oct 2023 10:30:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB7C921A90F;
 Mon, 30 Oct 2023 10:30:07 +0100 (CET)
Received: from localhost (10.201.20.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 30 Oct
 2023 10:30:07 +0100
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Mon, 30 Oct 2023 10:30:02 +0100
Message-ID: <20231030093002.1047149-5-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231030093002.1047149-1-etienne.carriere@foss.st.com>
References: <20231030093002.1047149-1-etienne.carriere@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.20]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_08,2023-10-27_01,2023-05-22_02
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=lS3qnKqT4p6LMm9j9JTedvppI5YMfaxtcPCGI6SaSak=; b=UT
 ejZbjOCOea31yMvf4AAlQATMIiN4jTMAPmK6s7J9eOmNb72DTgBjK1kiNNsk/dC/
 p+ZbC5PP+IxWEtdOhMYh/dwHVpWvVp9mrrWl0l3lGV2B05pQatxpb5RVIl0bq7F9
 cWXzJR4MWcybIjvYNt/+hf9vgt1MPCG4Z1xbV4eQ3YJSOIzPeCRM3zgb6eGsX/lW
 61X36wOLZkOwYcNVHJhwBivtrQZeuEWYIraL9DipEXK2yTDHGugznWNJ/cOuObhp
 N/vI/ivp8Nz9+dztJ1XBvIW229tihjZcIkQJarxZly7x6uQIc3Fa33qyJjs8/QOM
 grVXXbxGBMJ0o1445TPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=UTejZbjO
Subject: [Buildroot] [PATCH 5/5] board/qemu/arm-vexpress-tz: fix info
 regarding Qemu enable=on
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
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Qemu 6.0.0, a warning appear in the log if a short-form boolean
option is used. This was fixed by Romain for the main cmdline description
(see 04afe86cd7e8 ("board/qemu/arm-vexpress-tz: use enable=on")) but was
not updated in the alternate cmdlines for when using a dual console or
a GDB debug setup.

By the way, fix description mentioning qemu-system-arm command line option
-S that is an uppercase S, not a lower case s.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 board/qemu/arm-vexpress-tz/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 3036dd54ca..3e84fe6391 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -62,7 +62,7 @@ consoles over telnet connections:
 	-serial telnet:127.0.0.1:1235,server \
 	-serial telnet:127.0.0.1:1236,server \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
-	-semihosting-config enable,target=native \
+	-semihosting-config enable=on,target=native \
 	-bios flash.bin
 
 QEMU is now waiting for the telnet connection. From another shell, open a
@@ -91,7 +91,7 @@ From a first shell:
 	-smp 1 -s -m 1024 -d unimp \
 	-serial stdio \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
-	-semihosting-config enable,target=native \
+	-semihosting-config enable=on,target=native \
 	-bios flash.bin \
 	-S
 
@@ -123,7 +123,7 @@ Emulation has started, TF-A has loaded OP-TEE and U-boot images in memory and
 has booted OP-TEE. Emulation stopped at OP-TEE core entry.
 
 Note: QEMU hosts a GDB service listening to TCP port 1234, as set through
-qemu-system-arm command line option -s.
+qemu-system-arm command line option -S.
 
 Note: To build the GDB server, the following extra options have to be added to
 the Buildroot configuration:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
