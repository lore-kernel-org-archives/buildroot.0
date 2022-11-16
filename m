Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00455C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 21:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5149E41899;
	Wed, 16 Nov 2022 21:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5149E41899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUMUWk0PEyXU; Wed, 16 Nov 2022 21:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EE8A41743;
	Wed, 16 Nov 2022 21:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE8A41743
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED371BF402
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 21:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD8F140132
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD8F140132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJheu_oePDPA for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 21:21:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B85E400D9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B85E400D9
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 21:21:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C418F1C0003;
 Wed, 16 Nov 2022 21:21:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 22:21:05 +0100
Message-Id: <20221116212105.702408-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116212105.702408-1-thomas.petazzoni@bootlin.com>
References: <20221116212105.702408-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668633669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziVudG33kroLOZMWJ+4v5tlJFadP5ujqpmhc5qYfZCo=;
 b=hrXu2L5Wk047be5fI/qu6Sl/nfs4z03F3Hs4oH7tLsmz/s5ctTQLjedXUirZLB2BobIhY7
 QDl8q/1v6NIgkjA4R/tAAvQmQQ8QmTY6Ts4uuMP1pE5IBVkyq+ezGkWlZlyGwbbhLN4ddl
 tQvuxcSe9/RNTnoSDTsz60SzHpblrIzA/55oSFlZVgutHoKK7IhuAXuG81C7hzmhf8/maM
 hF9zG9DmW6iy2xMDaBI8TPj6n+XS5zKQAEkjpJBj7FvbaOP4WzYceIZ2riDmqA0+q8XzNA
 RIC2cUmK/yEKyoRkDmFYCq1/HTyzTvZfaRMLsutYxcOqMel+Ppn5Al+nIoYlvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hrXu2L5W
Subject: [Buildroot] [PATCH 2/2] utils/genrandconfig: don't build
 igh-ethercat drivers
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

igh-ethercat comes with a small number of patched Linux kernel network
drivers, which aim at replacing the ones available in upstream Linux
kernel. All those drivers are provided only for specific kernel
releases. For example:

r8169-2.6.24-ethercat.c
r8169-2.6.24-orig.c
r8169-2.6.27-ethercat.c
r8169-2.6.27-orig.c
r8169-2.6.28-ethercat.c
r8169-2.6.28-orig.c
r8169-2.6.29-ethercat.c
r8169-2.6.29-orig.c
r8169-2.6.31-ethercat.c
r8169-2.6.31-orig.c
r8169-2.6.32-ethercat.c
r8169-2.6.32-orig.c
r8169-2.6.33-ethercat.c
r8169-2.6.33-orig.c
r8169-2.6.35-ethercat.c
r8169-2.6.35-orig.c
r8169-2.6.36-ethercat.c
r8169-2.6.36-orig.c
r8169-2.6.37-ethercat.c
r8169-2.6.37-orig.c
r8169-3.10-ethercat.c
r8169-3.10-orig.c
r8169-3.12-ethercat.c
r8169-3.12-orig.c
r8169-3.14-ethercat.c
r8169-3.14-orig.c
r8169-3.16-ethercat.c
r8169-3.16-orig.c
r8169-3.2-ethercat.c
r8169-3.2-orig.c
r8169-3.4-ethercat.c
r8169-3.4-orig.c
r8169-3.6-ethercat.c
r8169-3.6-orig.c
r8169-3.8-ethercat.c
r8169-3.8-orig.c
r8169-4.4-ethercat.c
r8169-4.4-orig.c

Obviously, this doesn't play well with the random configuration
testing done by utils/genrandconfig. This commit avoids this issue by
making sure we never build any of those drivers as part of the
genrandconfig generated configurations.

Fixes:

  http://autobuild.buildroot.net/results/07b7475d780c067d99ee5618a5fd2bb024a5b4e7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 9c6c2b359c..eccd3a228e 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -629,6 +629,13 @@ def fixup_config(sysinfo, configfile):
         configlines.append('BR2_PACKAGE_XVISOR_USE_DEFCONFIG=y\n')
         configlines.remove('BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n')
 
+    # Don't build igh-ethercat driver as they are highly
+    # kernel-version specific
+    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169']:
+        optstr = 'BR2_PACKAGE_IGH_ETHERCAT_%s=y\n' % opt
+        if optstr in configlines:
+            configlines.remove(optstr)
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
