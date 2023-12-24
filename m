Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA0C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C20840470;
	Sun, 24 Dec 2023 16:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C20840470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNG4ttxIXnyC; Sun, 24 Dec 2023 16:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A510540481;
	Sun, 24 Dec 2023 16:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A510540481
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBA61BF275
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ECB58141A
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ECB58141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aKy5Mgn0GTO for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:08:36 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 190E7813EE
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190E7813EE
Received: by mail.gandi.net (Postfix) with ESMTPA id B156DC0003;
 Sun, 24 Dec 2023 16:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 17:08:28 +0100
Message-ID: <20231224160831.871650-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231224160831.871650-1-thomas.petazzoni@bootlin.com>
References: <20231224160831.871650-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703434113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2W1JA0Z4APvjeZ9Ww9MxL8r+uza+cQpdypNlrlq4Pb0=;
 b=QmI+2z2uvlM4h48A7inU3jvE9I6iBu3h5z3qX1rA5b4rTugXZtAg3HSdGB++6OyRkMelli
 bp82/akd9aZwmheLl6XnBFstKBftYIhgbjZ2eVPkn9wNMaciLw3EKmI5EGOXbYgkzTxk70
 WQrqEpFRqvl8t7kUdGe9s1fmCfUjJIuf6eoXegJJNCeWxlT9j+jq77lhn7H5QlhoRjgu23
 ZfDHDEYZbE20UIJq2LDZUVym0nJqrAKNmywuYtXLETqLpUdQmPRrznj1xF+OrRELVSIEYY
 MHF97SMMHtr907ZLSoOSsNbwno+R8tiAT+gptoyqscMOvAaA0/HnN7tKyasrvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QmI+2z2u
Subject: [Buildroot] [PATCH 2/3] package/gdb: make GDB 13.x the default
 version
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

Following the addition of GDB 14.x, let's make GDB 13.x the default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3f81883005..43a85f1376 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_12
+	default BR2_GDB_VERSION_13
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -69,7 +69,7 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "11.2"     if BR2_GDB_VERSION_11
-	default "12.1"     if BR2_GDB_VERSION_12 || !BR2_PACKAGE_HOST_GDB
-	default "13.2"     if BR2_GDB_VERSION_13
+	default "12.1"     if BR2_GDB_VERSION_12
+	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
 	default "14.1"     if BR2_GDB_VERSION_14
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
