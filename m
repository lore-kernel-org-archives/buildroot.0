Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9506AC25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E85240338;
	Thu,  4 Aug 2022 20:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E85240338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyN6M3qJOAl3; Thu,  4 Aug 2022 20:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51B6440141;
	Thu,  4 Aug 2022 20:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51B6440141
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 118DC1BF402
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E000641CCD
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E000641CCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RejchM7NRuPF for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 20:47:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA4C541D0B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA4C541D0B
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 20:47:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8DE8720003;
 Thu,  4 Aug 2022 20:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 22:46:55 +0200
Message-Id: <20220804204656.31915-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659646021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oXhJaJSAPx5HJLVe/H0Z0vzAIUktmhcYnbQIilKQ1+I=;
 b=bg2ZlRGhEgEzwrk9iLlrVLb31dnqmoUwC9BtnCk4awprba+F5MH7jO45x8T0Ndri9HWzaQ
 24ABEZtJBWGyXLKVYS1Q35R87wibFCPKPzu9kJCYZhocOAgKFXNvBLDfpfoUC2/X2WNfcj
 ldgKp/WjKif/ehuWtyWs+lv3/7gooIsefF2N3nd86NVrFIkOyT85tFmrxrYa0zqLlap2D6
 vUaa4OB67w4CKyKuP4q+QHdHEArTO/8npebenBjSu2o++Hdd6qE7JvP1pkKh0rKzWjvQ+Q
 j8ICCt0vhAIEFd1BLvezlJAC4xcE75ICdfFN5wzF42cF+5LbMikIRoT0CwFmUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bg2ZlRGh
Subject: [Buildroot] [PATCH] package/weston: add option to build seatd-based
 launcher
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 10, the weston-launch command has been deprecated, and
can only be built with -Ddeprecated-weston-launch=true, which
Buildroot does not do.

So the only launcher currently available is logind, provided by
systemd.

But weston provides an alternate way, based on the seatd daemon. This
commit enables this possibility by adding an optional dependency on
BR2_PACKAGE_SEATD and using -Dlauncher-libseat=true.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 76df9bf2dd..e6c54ee7aa 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -35,6 +35,13 @@ else
 WESTON_CONF_OPTS += -Dlauncher-logind=false
 endif
 
+ifeq ($(BR2_PACKAGE_SEATD),y)
+WESTON_CONF_OPTS += -Dlauncher-libseat=true
+WESTON_DEPENDENCIES += seatd
+else
+WESTON_CONF_OPTS += -Dlauncher-libseat=false
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
