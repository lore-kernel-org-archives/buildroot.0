Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA62C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A8A40570;
	Sun, 15 Sep 2024 12:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmTo6SZpY3fm; Sun, 15 Sep 2024 12:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA5140571
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA5140571;
	Sun, 15 Sep 2024 12:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9C941BF3FC
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9775D40135
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ap_3BwIHWcGu for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 12:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4185F400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4185F400D3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4185F400D3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 12:39:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4B13FE0005;
 Sun, 15 Sep 2024 12:39:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:37:27 +0200
Message-ID: <20240915123729.800902-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726403972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0f9JaBKDRSIeEr75/g55xwmY6FciiOTgOh/gvcbmT0E=;
 b=loTIfXci6kVhgteW822H4Ckfsz0Gi3Voh+q7GYYU7qLHxwCIzN/sJpVw+I2acvLI9hQ6Ph
 4GQgtz/WzVjoOYPecdNddExZ+Q7nVYZfOXo5l/eTB3UQnhqi5w3adA7WC87x3PbUAGJUgI
 Tv5tnA7mV3j0K4VcjuvNMxZWRr3QCufyJIhnyENU6PvnrWjUigg+LHS7BtBSKSX1MJ/wib
 8x4izQxlyCY86bpN0QbSa/6jrOJk/YDE6f02FygOlUotoIBNxBcoTh64u84ToJYZzObgtt
 dAQtlvOK2JnUzeSwHBzeizujoB+s1YGoscowV/EdEvp1Q2njjGmXRI/c7ASWEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=loTIfXci
Subject: [Buildroot] [PATCH 1/2] utils/genrandconfig: handle
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
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

When BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y,
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is supposed to be non-empty. But in
the context of genraconfig, we don't know to what value
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME can be set, so let's avoid cases
where BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y. By dropping this option,
kconfig will revert back to the default image format for the selected
architecture.

Fixes:

  http://autobuild.buildroot.net/results/1d104a051c83bb31e98565369a2ec7badfa21eca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 282a9ebdea..0698cc5ff0 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -248,6 +248,10 @@ async def fixup_config(sysinfo, configfile):
             configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
             configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
 
+    if 'BR2_LINUX_KERNEL=y\n' in configlines and \
+       'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
+        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
+
     if 'BR2_LINUX_KERNEL_EXT_AUFS=y\n' in configlines and \
        'BR2_LINUX_KERNEL_EXT_AUFS_VERSION=""\n' in configlines:
         configlines.remove('BR2_LINUX_KERNEL_EXT_AUFS=y\n')
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
