Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7D6C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AD861371;
	Wed,  7 Feb 2024 07:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lD1LkblripYq; Wed,  7 Feb 2024 07:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9468E61377
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9468E61377;
	Wed,  7 Feb 2024 07:05:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB0A1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3657B40144
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tA_lNHRbeC9o for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B00B0400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B00B0400B9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B00B0400B9
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:05:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id DDE3F60006;
 Wed,  7 Feb 2024 07:05:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 08:05:40 +0100
Message-ID: <20240207070541.2296330-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707289544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VJClkTwCkxiVNQQ+xiN4orZBAiPTSEEolYqYX2VyvHQ=;
 b=JBrv57eHPr+4Crg232auGFs37ZXXkYiryr2GUtsv69yx5TxuWGOxY2bzrKKPBxCZeF9f/7
 kwxfz9X4YRjtqiGfJRcyOkmSsB+OU+T/UT/7TYcdZ2Ws0EIa6SdZyB2sSPmusbywLWbpxT
 OnsmoScEWC/+066lrbxXxc3pW3gdm5eJGaM/tV9W+aawtvxDaLGQyeqL4bXHEnMayHygie
 +ddAI0YXCo4kykG7NTVxLWd4GjDBEQohE1xVfuGfkS1VixlXhQLm94f5KObJa6Qn2N45Ag
 hi1P7IJ00k7OMf7LE+oBx4XaOFxqExJ7UKD8VSReQmfNtSvSwiGLRGQUlvBSFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JBrv57eH
Subject: [Buildroot] [PATCH] utils/genrandconfig: add default setting for
 bare-metal toolchain arch
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

We recently added support for building a bare-metal toolchain, and the
autobuilders are therefore trying to build such toolchains. However,
by default the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH option is
empty, causing the target tuple to be empty, and therefore
host-gcc-bare-metal tries to build a toolchain for the target
"x86_64-pc-linux-gnu", which isn't a bare-metal target, and fails
badly.

In order to properly test this bare-metal support, this commit adjusts
the genrandconfig script so that it injects a valid target
architecture tuple.

Fixes:

  http://autobuild.buildroot.net/results/6cb1514b19bfe056fb984d3538bdccdda5e174c1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 52edad06d8..eb1f8cbd4a 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -315,6 +315,10 @@ def fixup_config(sysinfo, configfile):
        'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
         return False
 
+    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y' in configlines:
+        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""')
+        configlines.add('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"')
+
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
         return False
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
