Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2BC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4FD6849A4;
	Fri, 22 Jul 2022 20:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FD6849A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efqMWtphBKHN; Fri, 22 Jul 2022 20:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBAE384985;
	Fri, 22 Jul 2022 20:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBAE384985
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11DB41BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E10BC8497A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10BC8497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Op18XRJkQV0b for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:22:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2612A84977
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2612A84977
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:22:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 07CAC240004;
 Fri, 22 Jul 2022 20:22:01 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:47 +0200
Message-Id: <20220722202151.76235-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/K587zZVDVdiy617CyqrcDYKmqpJ8r34iDt1g5NLzP8=;
 b=k+k4PqIU8eyUzptJUnBv2EjOS2LDGVZwIirk4fJdtm4IZ7p58HV5kv18FJMWpkDeVluNVX
 jXroN9aK1cHFVcgEZ9G+22YuqkI+39g9rdMRq81WJHBQTkt6dcjcVc03LGYYlLqZJN1FK5
 tHcjD824PQL436a9wQyRzSzkPQNB/wI5h3F0LCGFmF/ellJA3OKvNmsqx775z/B8uyyPD6
 EFxJ540mF1cuR8uxYViZ/Kimnb2xPbK6AHDfTde7tfoug+TQYXPFS2adgtKexeHvVcs0Yo
 CXapNRn3ymz2NCJ0mw9GMmG3hD/1lJiEIvxhM9PsYIK9A2FxfvIS1jX/zc+1Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k+k4PqIU
Subject: [Buildroot] [PATCH 5/8] board/orangepi/orangepi-r1/genimage.cfg:
 use correct partition type
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The boot partition is not an EFI System Partition, it is a normal FAT
formatted partition, so using type F instead of U makes more sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-r1/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index 61d13fe7fc..78b69269b7 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -28,7 +28,7 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = U
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 	}
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
