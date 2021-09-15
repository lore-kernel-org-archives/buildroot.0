Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27754C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C03C76113E
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C03C76113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900E840684;
	Wed, 15 Sep 2021 19:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7mcxbSmruVL; Wed, 15 Sep 2021 19:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED61A40665;
	Wed, 15 Sep 2021 19:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3456D1BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233FA40665
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8hT4tpqLi3c for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:16:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 826184065B
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:16:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d21so5507393wra.12
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vm8GfTp2fW5DkwIT0ZoQZ6za1gOfnPMRHWVfBvpa/Nw=;
 b=OlrZZM8rqj+qWZE0Ro/JjwbPzo3g57ZdxsHbaSJSiwF9sb7R0P/e/UuPpc1t85YEwB
 N3nLr7Wwq3xJ632VYoXa5F26lGVn+KtctUfV9X06x7tS6zXAw0TEHbH0bf1QQpf0m71z
 l6wNJPwYfsNv8+37lyedCftlYqNgmrD6CpKbfHGaSEeCttszFENsU4VZSEZ6lvyN+WHQ
 +0izZNk2LQPEpCmurpryI/TEaFWZYqwDGhhmLJS8DAj25PbXyYFzol1GIVdLFPYAsrrk
 gfa/pU/xboZvucLSDi8sbItZGYS3IFzkA3yUm2eVdsyt/KKcf+sinjpqXWBhhqplnfdp
 g0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vm8GfTp2fW5DkwIT0ZoQZ6za1gOfnPMRHWVfBvpa/Nw=;
 b=aeL8ZgSpH5xPSLQTGmcbHK5vxIX68LJ8YD5S1NOlJFCsYBxGEgYxoxtQMSNjd/uBzd
 3Vx/EQAbNmkZ/f9WQzYe2kof4QrJs++WB83EBukDw80cGicOBfygsE/onT08+Vn4PuJU
 Ie/La0rwzWGpuDGWO6EHO7EQndYq6Wpc4+kRCS6tDDRORpnWB5HGzQ99uBAXMIsBCj5p
 d7qDiKbZkCI1pumstaN+YHCXSCSF2ur2uYvJH9Cb1//yKYSu8UgTYDuSlal6zZja6cpC
 +T3Q2BRfYQRrrYh+OadVo20yAw7JW5rI6aGWunL00jKJpViC9K2auYCQi7WZIRRTlnee
 yIyw==
X-Gm-Message-State: AOAM531payaCYT7N6IyBgdo8I73Q7TmOjn0mVAXA8wJBPPJSAwKbmmES
 JY7qxC7q1Z7dYlKUocWXegu7bL7Ds80=
X-Google-Smtp-Source: ABdhPJyS13pLOSgXH7LC0bjw8gc9z04sFhX15BOUIREKMZb2vmi1B2ggo8xj7fT9VmjN9KuuOjw67A==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr1750046wrn.352.1631733369665; 
 Wed, 15 Sep 2021 12:16:09 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id k22sm923893wrd.59.2021.09.15.12.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:16:09 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:16:03 +0200
Message-Id: <20210915191603.15210-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/imlib2: bump version to 1.7.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/imlib2/imlib2.hash | 8 ++++----
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 3df3deffec..690d836c2e 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.1/
-md5  98569de9b10bcb6fd5d13e4d331ddd81  imlib2-1.7.1.tar.bz2
-sha1  092c66ae0180798a4036e68c68d7f316de192e36  imlib2-1.7.1.tar.bz2
+# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.7.3/
+md5  1e79055a0b8fe27d208b6f8bb1bde60c  imlib2-1.7.3.tar.bz2
+sha1  3d55965f946d0b2754a84c8e57c78ddc227252c6  imlib2-1.7.3.tar.bz2
 
 # Locally computed
-sha256  033a6a639dcbc8e03f65ff05e57068e7346d50ee2f2fff304bb9095a1b2bc407  imlib2-1.7.1.tar.bz2
+sha256  158d0b8c20bc11221af9e77a64a116fca7051b03cdea2c4f31d31f469382f997  imlib2-1.7.3.tar.bz2
 sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 6d973827dc..89b4769f92 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.7.1
+IMLIB2_VERSION = 1.7.3
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
