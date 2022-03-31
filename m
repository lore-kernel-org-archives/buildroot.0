Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCF6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 08:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA08760E05;
	Thu, 31 Mar 2022 08:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKyl2L7SRzp4; Thu, 31 Mar 2022 08:53:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 038FB60BB5;
	Thu, 31 Mar 2022 08:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C094A1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 08:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADF9F60E05
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 08:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKz3rGVk-tLe for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 08:53:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A495B60E37
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 08:53:06 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id DE41B5C0632;
 Thu, 31 Mar 2022 10:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1648716783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=pJIdZC+qXs+jHvYKKhLlgliZ+/wcyhhhoB19Ox8YrG8=;
 b=ml5tAQdFAgiclF/m6TFNibuI2tKZ7TjzIQPHcTsu0bCslCzjGw6qTTsCSuiHtFiQl35Efr
 2/ghRPfWJqi8qKiDKGaPgocmDVdSI1YRsYVMKZfU8PWrTMtvWxO7Jj/DvrNqgqGDicSl3w
 JOX53MIUb1J0j5Gg0hxCBtIXv5nW9kk=
From: Stefan Agner <stefan@agner.ch>
To: yann.morin.1998@free.fr,
	buildroot@buildroot.org
Date: Thu, 31 Mar 2022 10:53:00 +0200
Message-Id: <e5af121ce29e88fcca3183ebf5d0e8d4798241fa.1648716628.git.stefan@agner.ch>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openocd: Allow to build BCM2835 on
 aarch64
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
Cc: stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow to build the BCM2835 bitbang interface on aarch64.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/openocd/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index b14f940b27..cef109b511 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -190,13 +190,17 @@ config BR2_PACKAGE_OPENOCD_AT91RM
 	help
 	  Enable building support for AT91RM9200 based SBCs
 
+endif # BR2_arm
+
+if BR2_arm || BR2_aarch64
+
 config BR2_PACKAGE_OPENOCD_BCM2835
 	bool "bitbanging on BCM2835"
 	help
 	  Enable building support for bitbanging on BCM2835
 	  (as found in Raspberry Pi)
 
-endif # BR2_arm
+endif # BR2_arm || BR2_aarch64
 
 config BR2_PACKAGE_OPENOCD_GW16012
 	bool "Gateworks GW16012 JTAG Programmer"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
