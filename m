Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D29EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 09:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E1DD60AA5;
	Sun,  9 Jul 2023 09:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1DD60AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXIQqRtknn-2; Sun,  9 Jul 2023 09:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB51B60864;
	Sun,  9 Jul 2023 09:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB51B60864
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5581BF57F
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 09:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E71D414D1
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 09:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E71D414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlitvbpaqmZL for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 09:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9738414CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9738414CD
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 09:51:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BAA6CA4C00F9;
 Sun,  9 Jul 2023 11:50:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60236)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIR4E-0006nw-1l;
 Sun, 09 Jul 2023 11:50:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 11:50:57 +0200
Message-Id: <20230709095058.1547133-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688896258;
 bh=ZwfFxtFF4oanOVX+o03E2PA58S7ITqMQqOKghNjlwac=;
 h=From:To:Cc:Subject:Date:From;
 b=Rwmu+bY0VzqERBrbWC5r5a1IK4/Rl0t4NFSz730yMeBYHxiamZyOE6s9c6Awda9EO
 sw48vsn5YhIuWp46WZWS9bDL1uqX0NgtrhhYCiTz+dU3Zu5o/dbSM+SgqksMNH3B0f
 MoAeLBU/E3KU2i8naxGbOMVvKWRTApbZocjyDoIWdZenm0UNrTUQ6roKPAB3/Pht9U
 Bq27VrKXhH+tOAT4Ob1DXZTpHcrxpclslJjP+x2AJXQS3Vzy7N0nDuBYwrA3wa80Kl
 ol/atSmidK4xdMKPshEEoaY3b3Bw/HTtgxswXuETxyL4qZxIvIOJDSI5j7j5UAWs0H
 z1K8PG1+AWK8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Rwmu+bY0
Subject: [Buildroot] [PATCH 1/2] package/fwts: Fix build with BR2_OPTIMIZE_0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/fab/fabd031d38cb618cdb11b4a86cd853b0da61695b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fwts/fwts.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index f04c7a848f..3af54a1afd 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -15,6 +15,10 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+FWTS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 ifeq ($(BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE),y)
 FWTS_MODULE_SUBDIRS = efi_runtime
 $(eval $(kernel-module))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
