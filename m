Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACD8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1A9A43077;
	Sun, 29 Oct 2023 19:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1A9A43077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpjEDR1HXCw5; Sun, 29 Oct 2023 19:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98AF5434F0;
	Sun, 29 Oct 2023 19:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98AF5434F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 749F31BF575
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 19:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D80484850
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 19:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D80484850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mG8pBFLOsGst for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 19:42:11 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20C2584832
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 19:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C2584832
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so53368601fa.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 12:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698608529; x=1699213329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLeG6h6q7v6pMRJfAluhWUkMIos4uiWFSvrzBg6qr0g=;
 b=H+T1BcuWRLtLqxIWt+/oneOmtOxRDSoj58B8esw4EeG1k4oylwUgg78doFDz3I5Hux
 /vqY3QfFTQL+q7DJmtiZ+oht2VAk7bBcAIVe8sci0G77wlnt/Fh8KUyIrRM3pIIXMBJP
 PVeaMREN/RI/z+8VwHF0rDXoZgTamG+y1xkLX3Q7COay+8GOODBfR4hXIOlm3Hj72hX5
 CwJEAL3Q+bDhV0FZEOix77BsODTSc/oAGWwE3Ycg7z7z02h7aQ4rarj7QpdPums/kAL+
 7QbHbdF/HFLsztH75ynZ1W2FDtcIZShFtZKuzHOrJyoItV+Tx3aB5U1ccIBtxfJx0siq
 W5Qw==
X-Gm-Message-State: AOJu0Yw4pm+kSsmwjSAufu16DMVT5IR4s277ngNANRyxQmBE6yDHj9/A
 OUeNcSfw8uUbDttwuSJDhoR33cVxO/I=
X-Google-Smtp-Source: AGHT+IET3yrTlHAIWI4+NoTDwtovN0cBfjYOhJhFzgS1c6iZNB1+1ORyMw7AF00nqVhe3V5s7ELiCg==
X-Received: by 2002:a2e:8ed7:0:b0:2c5:1603:9c48 with SMTP id
 e23-20020a2e8ed7000000b002c516039c48mr6951596ljl.20.1698608528308; 
 Sun, 29 Oct 2023 12:42:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q26-20020adfb19a000000b0030647449730sm6562238wra.74.2023.10.29.12.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 12:42:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 20:41:41 +0100
Message-ID: <20231029194141.684797-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698608529; x=1699213329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zLeG6h6q7v6pMRJfAluhWUkMIos4uiWFSvrzBg6qr0g=;
 b=bE7/KcYdmIzB+4UklqtenizzcngShto7Vb755AcE44GhFwQ4AKJz5qHo+bJhDyBXRk
 Be5vOepnps/DLLVBYPzo87ORHj5Z3RrTCYZyN4MTAuDOIrRZonkFaPZwkU5HFjgNtjSu
 /Q56Maotqdk/5BxUbyL/8AyJHtg/spLvRqow0ZI3N7YVqrNCZmno5JVVttdrwumOC/BW
 qAdJiT4D9z4GS13AWO/U0cdXJic5yc0DNiaN9z5SmFhYUTXu0plF31ElmsKPLSKGq7I/
 cRqJILiHI6jtP2bBC3qUgHt69HhBPd9ZKjtXptZgQjF67sk0wcjRQAcXn2ZDWmHAheuE
 ngWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bE7/KcYd
Subject: [Buildroot] [PATCH 1/1] package/bcm2835: bump to version 1.73
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

 1.72 Added examples/smi/smi.c showing how to use new SMI bus support,
      courtesy Benoit Bouchez. Added support for disabling
      documentation genetration with "./configure --with-docs=no",
      courtesy of Christian Zuckschwerdt.
 1.73 Fixed some inconsistent indenting in bcm2835.c that triggers
      warnings for some people. Added Timeout checks to
      bcm2835_i2c_write() in case of IO problems. New reason cade
      BCM2835_I2C_REASON_ERROR_TIMEOUT added. Patch courtesy Simon
      Peacock.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 2cdc35fcee..802f34335b 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  564920d205977d7e2846e434947708455d468d3a952feca9faef643abd03a227  bcm2835-1.71.tar.gz
+sha256  e67a986462618988a5a86752e36e3ebdd7c5cae66940ff7330aea243b2762525  bcm2835-1.73.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 4870aa10ba..dcf21cb5f0 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.71
+BCM2835_VERSION = 1.73
 BCM2835_SITE = https://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
