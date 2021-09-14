Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46037C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:24:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E7BE603E8
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E7BE603E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D273340303;
	Tue, 14 Sep 2021 17:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhL1gPmP77s4; Tue, 14 Sep 2021 17:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22830402F7;
	Tue, 14 Sep 2021 17:24:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF01E1BF283
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCA8C402F7
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DrR-GnaPvUg for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 17:24:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E92D402F5
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:24:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q11so21454842wrr.9
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAWMeKjsILsGY1XzSAgdShYKBoMW9SlD3o15B7V+T9w=;
 b=KsNU/kU6VMUlY65zkhVmyb47nHaddeAgLx3CQtC72W0RAb6ioiCCIX8E7QSDZGiFXQ
 IJ0m3w0JNiCxf2WjDqgzERo+o7Rhdr00zWSks8lugNHMAbe9WwLTKxWf09gUWwzAxROd
 HPZALYM2UHAr9xV/PZFBLdeVmR44jAgeOILxWnXwOf8njAFkGJZqNRh/5iIa5m8wcvnH
 nBM0OHTrY+Iex2oHyGcDWyZsgit2RkQQJ33/BvMyiQglbDgccpzw45brKwBAgvkHxCNo
 Qev2LTpKEg/0Aee05ZufbRviEizUDTDGERtbDIaVuv9Jz+dPQJj7L6K0IgodBOcpNg7u
 DqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JAWMeKjsILsGY1XzSAgdShYKBoMW9SlD3o15B7V+T9w=;
 b=l7PYKJ2XeNFgRxcALbF+Vf/smjorhv4MPwfWoTD37tL9jvDpfXJulS8fgZrRo0tWGr
 ODYmJ7rIcbl7LOfGncX0j4k1T6bSjIhNHCAxhRAMfx3x5fUWuepYIX6AG1Y7js2iGn3/
 2RyxlALimTMHaF+8BMT/HzgC6Bz4qF2nbiTfqv2f/XFS81HzAjOZ0Af2GCeEFX+YeWLc
 pVaB+Qzxdh72WRprn7YQKA+i3xXdkQ33XCHnDpMZ0q6W07acTl7b79Upta44W/9Or0ZH
 EnyzFijONPORXs+LnOXcW2Dnqsvz+SQi0ofPrrPokyacyOCcLVnAqm2FzkdMPuXdhNLt
 Do1w==
X-Gm-Message-State: AOAM5330fWSjA9ZwvrriZikwAgdtuT+u4s97K9wd6JknQDNlAeeiugt4
 kg/UTcEdMOcR2NzLhRsRWZo7nvDJQag=
X-Google-Smtp-Source: ABdhPJzeLZNEi2pQBhnQAqIV4DtI8fy+h+0Z3IRYsploSor2SzgpBs/IF1TGXRVyGF3582H7+flJOw==
X-Received: by 2002:adf:f543:: with SMTP id j3mr276010wrp.287.1631640265721;
 Tue, 14 Sep 2021 10:24:25 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id 48sm11413087wrc.14.2021.09.14.10.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 10:24:25 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 19:24:20 +0200
Message-Id: <20210914172420.8824-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RESENT][PATCH 1/1] package/debianutils: bump version
 to 5.4
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
 package/debianutils/debianutils.hash | 4 ++--
 package/debianutils/debianutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 16a45d4ea1..bbedb6f72f 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
-sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
+# From https://snapshot.debian.org/archive/debian/20210825T030241Z/pool/main/d/debianutils/debianutils_5.4-3.dsc
+sha256 611b1268bee9d183886c94e5f34920e4b5b67ff45202aef3f6f2ba8f4a205163 103640 debianutils_5.4.tar.xz
 # Locally calculated
 sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index d2c41130fb..3dc9ad6e6b 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.11
+DEBIANUTILS_VERSION = 5.4
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
 DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
