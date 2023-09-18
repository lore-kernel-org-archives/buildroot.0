Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0996CCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 15:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898194009B;
	Mon, 18 Sep 2023 15:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898194009B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BW4LYUlruWZU; Mon, 18 Sep 2023 15:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF814009D;
	Mon, 18 Sep 2023 15:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF814009D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 985BD1BF2C6
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 15:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E5594060C
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 15:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E5594060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBrF7Vc1JEiH for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 15:39:26 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 903F140474
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 15:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 903F140474
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c008d8fd07so20521941fa.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 08:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695051564; x=1695656364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbrCZN+LoHKlDsVggQlbZ/+hkU8zboWkpShbUB0LD7o=;
 b=OXB8lWNvBq+CtcF8oX1head4XnE1S0gOuuvxQZh9AgCSczadWOIck4HRBhBNBezxb7
 nzlQ5QaC9FaLr8W6Ezup22acEocy2kstYgWA+SBZ9M3IoaiMAagX8cIIp7NfTFAXHyjw
 GURT5nPOet6vA3TBKdVCanC+Us34fCanhem8c9g6rPP6mBlYJjhJ/PYfn1+xiAYMk6eC
 aRcj8E4+AFVL6pDvYz51Zz/MJigO/Gb1xvg++/TmrVKqowc5vNWztmLWRMLCwd0hfnwh
 x+N4yQeAwJA8qnNAs49vWUTloJD85QUAbrhmspyxFfTFOwTnZmMm/zpfIj+kX2BEY1w4
 q3Ew==
X-Gm-Message-State: AOJu0YynbF3Jn2cm6XqKXVhZm5jtunJ5yDBj8uFU6xYvs65+N4o5SSXh
 zC/R4uUtyo9Z7bjTqgg0C3l6eEPhw+Mf47dPI+a3DA==
X-Google-Smtp-Source: AGHT+IG4xamoeMB9yDfE9o3I+yOz4mJxE7rC0LMFTpBTEQ3kJJehpm4GOGckdt9gJn6apWGAR4Oc4Q==
X-Received: by 2002:a2e:968b:0:b0:2bc:c846:aa17 with SMTP id
 q11-20020a2e968b000000b002bcc846aa17mr8509288lji.41.1695051563911; 
 Mon, 18 Sep 2023 08:39:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-3-189.retail.telecomitalia.it. [80.180.3.189])
 by smtp.gmail.com with ESMTPSA id
 rn5-20020a170906d92500b0099bd5d28dc4sm6585796ejb.195.2023.09.18.08.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 08:39:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 17:39:08 +0200
Message-Id: <20230918153909.1759415-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695051564; x=1695656364;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbrCZN+LoHKlDsVggQlbZ/+hkU8zboWkpShbUB0LD7o=;
 b=IFAiPFWPawxzmrLZAWe8nbhMYG6hejenJaez3c8t2HhVhGa4otUaSe4ZOxzQ136VHB
 6fvBcBhpX4HYC90+5lbGLDqVKeNA7ys71VnxUNygViDkz6fq/xYaP42P0yGjrbDJs0J7
 yLLVPorzOPVBRNHOmLANFISCBY/jYwI0lDdV8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IFAiPFWP
Subject: [Buildroot] [PATCH v2 1/2] package/davinci-bootcount: update GitHub
 URL
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch updates the GitHub URL, which has recently changed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/davinci-bootcount/Config.in            | 2 +-
 package/davinci-bootcount/davinci-bootcount.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
index e34adde570af..0201530f9166 100644
--- a/package/davinci-bootcount/Config.in
+++ b/package/davinci-bootcount/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 	  SCRATCH2 register. This tool allows to read and write this
 	  register from userspace.
 
-	  https://github.com/VoltServer/uboot-davinci-bootcount
+	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
index 695d39688ac6..884bf420f396 100644
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ b/package/davinci-bootcount/davinci-bootcount.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DAVINCI_BOOTCOUNT_VERSION = 2.0.0
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-davinci-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
+DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
 DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
 DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
