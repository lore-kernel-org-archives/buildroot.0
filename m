Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6D8CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168D14032F;
	Mon,  2 Sep 2024 20:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZINsRTzdnRB; Mon,  2 Sep 2024 20:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D75ED40337
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75ED40337;
	Mon,  2 Sep 2024 20:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4AD1BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B83780D6E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksNIR67G1mTN for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 528C580D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528C580D6C
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 528C580D6C
 for <buildroot@busybox.net>; Mon,  2 Sep 2024 20:36:19 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-533463f6b16so5846239e87.1
 for <buildroot@busybox.net>; Mon, 02 Sep 2024 13:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309377; x=1725914177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTIH/tm8oIJ7D6vrHua8w64iRoL5xBDZ2yLjuUpPCYM=;
 b=HiVGtg0J10v/NxZiVhJiWfUpaLJHIufvgwPasZ88LMH92R/Hp7Emj7wIF5RtCV+62A
 /ph2tsCpRSNT8k0pWI3xx2wkJjo7dV7u/WBQ9JJuOyHMcCrmYar2gz8+RT2nK+uyQuXN
 v/6+OkoKnZxkHVZ9tnvlju+W+vJ5br1veA6MOejJakxGwEPzgDOTowRFn189LGYmucFq
 KxT9/ebxzikHeMmuFkkuCb2I+8yD+TnteebkQAbJgLpdWc1IJ5qBqt6h+faA9zXhc91S
 tcv5kWIaMggxBe6if2U2xEDSqVme//oM5GqltsuoSYfdfoODxDd5as3wLU4GLWo6GgmM
 Y/WA==
X-Gm-Message-State: AOJu0Ywbzr8Ytyvp9MolpbqyYY4PziCXT8Z2pUyLFPUkmxnSvzv83tRF
 6nH6SbK3I5arO810roJ+yNquC0qMXssY7tNdu6nTze2MqbivXxZ556VbF9VLTIJueSAxmxDui25
 4PA==
X-Google-Smtp-Source: AGHT+IF0sr5SKXOQaaFLEjah9veCfTChaoU/+u2ZxmQ4+d/SlqVj6lXWzqVNxhstgXtWpMWIceWSyQ==
X-Received: by 2002:a05:6512:3f1a:b0:52c:7fe3:d3e5 with SMTP id
 2adb3069b0e04-53546bb0855mr7470186e87.50.1725309376341; 
 Mon, 02 Sep 2024 13:36:16 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407b0481sm1778061e87.118.2024.09.02.13.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:36:16 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Sep 2024 22:36:11 +0200
Message-ID: <20240902203611.2649952-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725309377; x=1725914177; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UTIH/tm8oIJ7D6vrHua8w64iRoL5xBDZ2yLjuUpPCYM=;
 b=iuBMfa9+Mg52NSL7S58A2/96e/b6vLz/4ABNPdsiktkNsaxmKB9Z4X56I9XKN0Od8o
 K6maejHLfFz2U57/Oih/zabTr0EeATYELfvlXmNV42juhmHf0GK0lHzmEVDeWth6Md8c
 rmP6q4DhKuZ+ALeO5saEAFKy4Fdd1Let5BopFhpo9Ga8Ztiv/xYXR1ZKTnZxSSdBxf6W
 HTwVJJVUXDy6V6jGVnBVPz3GrOV1/QM04uOetiPiYW1pXD2ivpbhUZfSnyD37oR9MVD8
 EYYe6+UV/KYwnuqa6GEME8wdbIi7fO9Y3Y/kOMrPIaTXpqlkH8B2MZsgeHD8+KmSWFWO
 Ug3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=iuBMfa9+
Subject: [Buildroot] [PATCH] package/libksba: bump to version 1.6.7
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index e74cde2cc..aca159d97 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  1db4222e052656700021a30d517f5aa2f882da4a  libksba-1.6.6.tar.bz2
-sha256  5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4  libksba-1.6.6.tar.bz2
+sha1  781acfb012cbb5328f41efcf82f723524e8d0128  libksba-1.6.7.tar.bz2
+sha256  cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763  libksba-1.6.7.tar.bz2
 
 # Hash for license files:
 sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 03e455145..dc22d6011 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.6
+LIBKSBA_VERSION = 1.6.7
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
