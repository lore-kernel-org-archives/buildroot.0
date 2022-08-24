Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39A8C3F6B0
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 22:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2846A40BDD;
	Wed, 24 Aug 2022 22:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2846A40BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksJx-onXcohu; Wed, 24 Aug 2022 22:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30FE0405C4;
	Wed, 24 Aug 2022 22:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30FE0405C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67F7B1BF3D6
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F6F40BD7
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 22:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F6F40BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsqnog4mYQ_A for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 22:14:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4882840180
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4882840180
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 22:14:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id az27so2379831wrb.6
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 15:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=s7rezymfrkDNOIoYGSVERxr2qttuHjVboqTS2uMn+q4=;
 b=F71bkGskSHQl/H9//zEsDY0wrN9B9M89bddfBOUsb9RrJcDRcSWwxqGbfY8tPIQVhY
 a7zUsqoGjE12bWRO0vBefeK91o06SPjVxhyfi9O+RcIYb4WoYFIruTJ3RTmdh2Zrx3DC
 w0+6+xAvm/RifmNQa9gLc1G4dQo1Am3z/LCqwIzf1e2GBPOWKZcQNDRMODE3nQNHlZ/a
 sGS67OTntAs4k4oxP3WmI5rFANF+arb5OjVhMhhspU3hrcj+TuH8NPjRUOMKJ12lTXna
 YU1fsXLZLVm9g2Wgeeqia0RxUWBf+j7Fike5qvsz2G+DsCblzqaA5b4dpTRloxvvnGNd
 VNvQ==
X-Gm-Message-State: ACgBeo1UNlXr8fsskZrHId7wsyA74gCcXms5ROTMiN3zNZK0UA7TG582
 8eH778RXs+MX+/BgQkgyAANR2CNJvVg=
X-Google-Smtp-Source: AA6agR7vjqKrPKn+KZ8kNIc7D/tb0PR1ZMlCNGjviz1d5jgDsceJV+GSHOomyC+RcDUCs8hWMKFEMA==
X-Received: by 2002:a5d:47cd:0:b0:220:70a2:5383 with SMTP id
 o13-20020a5d47cd000000b0022070a25383mr608548wrc.258.1661379268204; 
 Wed, 24 Aug 2022 15:14:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003a32297598csm3079191wml.43.2022.08.24.15.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 15:14:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 00:14:24 +0200
Message-Id: <20220824221424.395516-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=s7rezymfrkDNOIoYGSVERxr2qttuHjVboqTS2uMn+q4=;
 b=PG7Pwb03BkFJHDRV8NR498kxAZva/GrA+kysM4JYMVsgDFCoNb0Jw+1WQeiM+RGmlP
 djb1uenN8HB9dv9ZK/M5TT40aMQi8G+z6MW9vmbLtsCUSq3m2S+McZlr9uW4CiFz64DT
 QUqqG7XkF2miRonEzp5VgEZZZUa201O3lNybTgqIcAO0DYlCFM9xVZkb5GwShWCAZjF1
 xMsnshqyLNeLhmakbYPpP8x+XU7XhyVTGKDBLtfVJSoqgAxVM2iKEpKQMnL94JTBm599
 BqzF9mFDoTj12sM6v0RZd9TPPOjYegOYFu3eokmadGz+SBKaDRRY/hO9qE+6FbXx+FWc
 l2Kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PG7Pwb03
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add mxs-bootlets
 custom handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add custom cases to make sure that a random configuration with an empty
git or tarball location for mxs-bootlets doesn't fail. It reverts to
BR2_TARGET_MXS_BOOTLETS_FREESCALE in that case.

Fixes:
 - http://autobuild.buildroot.org/results/dcbeb73d152c79c18b1fa3bef3b4fa07635d7b36
 - http://autobuild.buildroot.org/results/f61cf3fc58db9ded5ec42ebf4a9847584700698d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 54146a99de..7fd17239c5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -543,6 +543,20 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n')
+        configlines.append('BR2_TARGET_MXS_BOOTLETS_FREESCALE=y\n')
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n')
+
+    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_MXS_BOOTLETS_FREESCALE=y\n')
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL=""\n')
+
     if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
        'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
        'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
