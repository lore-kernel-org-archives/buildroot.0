Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5C4C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1338484017;
	Thu, 11 Jul 2024 22:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAAOev5i_vPf; Thu, 11 Jul 2024 22:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2062B84018
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2062B84018;
	Thu, 11 Jul 2024 22:20:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 185071BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12CD760766
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sd8S5qIIr2d for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 282CC60743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282CC60743
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 282CC60743
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:20:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id C1DE7C0008;
 Thu, 11 Jul 2024 22:20:26 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Fri, 12 Jul 2024 00:20:16 +0200
Message-ID: <20240711222021.1553363-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711222021.1553363-1-thomas.petazzoni@bootlin.com>
References: <20240711222021.1553363-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720736427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2EpY+gjjyom0vOhOIU+a1Y4RB4MC9gnPJGpQRCdoHk=;
 b=koBgNvuJZ11U6SXVGqE0cHMllPNCLEmjbLQZI6o1fUyqGWl7NVvJGeYdJo2mJce+68Gc87
 8Hi58BGGXtCql//C605IqU2zmK43CmzORlerw4Qul+z3AMI3kRMGRA5e8emr0O5G3c4xKJ
 Vt8gGZ2Iyy3ub4r8PRYMhDSRruDy7+5VCtVzvCUdS4SloIVOD9AL5X/g8oa8qZIY+09F6Q
 Ad5J10zZVDw0pzaaspgZXSNr/aGZG7ood7ecX6g11P3MVzvMHhLwOE+zjQrDm85H10GwPs
 RoUrg35c9P6El6EnSZdjtnaIdoHCskVP/Ef9Gr+jsLxifgsQyQQHRCp9uNe52g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=koBgNvuJ
Subject: [Buildroot] [PATCH 2/4] package/gdb: switch to gdb 14.x as the
 default
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we have introduced support for gdb 15.x, switch to gdb 14.x
as the default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index cf2a1e4f1f..586001cd3b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_13
+	default BR2_GDB_VERSION_14
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -72,9 +72,9 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2023.09-release" if BR2_arc
 	default "12.1"     if BR2_GDB_VERSION_12
-	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
+	default "13.2"     if BR2_GDB_VERSION_13
 	# When making 14.x the default, or 14.x becomes the oldest version,
 	# be sure to update the target variant to properly select mpfr.
-	default "14.2"     if BR2_GDB_VERSION_14
+	default "14.2"     if BR2_GDB_VERSION_14 || !BR2_PACKAGE_HOST_GDB
 	default "15.1"	   if BR2_GDB_VERSION_15
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
