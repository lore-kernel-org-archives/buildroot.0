Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2FBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 09:34:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD126105A
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 09:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAD126105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB87403CB;
	Sat, 16 Oct 2021 09:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZPhyXLIGEDe; Sat, 16 Oct 2021 09:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB71540327;
	Sat, 16 Oct 2021 09:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA3C21BF309
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 09:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95A8838ED
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 09:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7Bw9PCEBG4B for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 09:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 441DC8386F
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 09:34:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so4049770wmz.2
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ippDMEGdJOhU+tC3CkE1NerT+k3Tfu8zOWr/aaxEftM=;
 b=L4woP8sfWJ3f9/qXnza5hE0CFdo+8hf4fTyAmXxhy4KYgWo9TYp47sehErDXBPVF7l
 Qnc5CUDa/8vN19xy6Cl59uDbV1nrMkprggbLP1jPkq8e365jGGq+ro1wywcSB0M90Kna
 pBXAV+8zU1FCxhXLkW2lP6OWbxCCf0g9llFYLSFy1t7KKgUFML4ymy/tRh4fro6EHBYQ
 bZxj5/hnFiZwQy/WaGv9JzeYHLSKcf5c4Ru6c5mjzdB0BJgxxe7mMLAAYi12LDfIlPbC
 /daEWpO1RV4VxVi2YB+pmuZE0dG9gycglhqpamzwH0MEQ50JSuHsJzD+Z1kj+MzL2XOz
 zRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ippDMEGdJOhU+tC3CkE1NerT+k3Tfu8zOWr/aaxEftM=;
 b=AFXqVwomMZJWdXmoWZ5S6nz0ElMOcjjjXNzzXPojdt8bwCC2BsiB3jl3c6EwX2lgD0
 YbpevOPQVvBs2CkCREXaWMIf7Heg4Vo6Tq679jhYtHqCFOdps75kL9FeXU2gUD2QGIcr
 nulyJcqqloY9+ntfHuNCShOPMkxX0rSLrMrkw5UTHGn1oIrsC7kkgJfNLDEOW8E79Ymf
 feP2DaBbIsBZad7a+VvyybI7MrkliC2OjdzxeG64oEfVVZyx5KFyrootfpzvYpeHDIG5
 qFEOMNMd7dKH9QtCE1xf/86fNhuQgSTM4+4KLP5uWBhiLm1aWkyqD3+1xNf8gtyFAIzd
 7u5A==
X-Gm-Message-State: AOAM531roLVjVCzmGJtLYizo1SlERZJmT1wwk1mfsl1zKuWU2+9QPM0z
 We+qA92MOaxX7HR9bJpSJuF+r6m6amM=
X-Google-Smtp-Source: ABdhPJwz1uhA2u2mhYM0iRnWCvg9O2vMZQZIec59drCaqGkYV4rbcaO2OFxZH6VT+0EdnoruOA40EA==
X-Received: by 2002:a1c:27c3:: with SMTP id
 n186mr17734159wmn.192.1634376838055; 
 Sat, 16 Oct 2021 02:33:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id d9sm7023037wrm.96.2021.10.16.02.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:33:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 11:32:33 +0200
Message-Id: <20211016093234.2477835-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/2] package/knock: bump to version 0.8
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
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jvinet/knock/blob/v0.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Don't use official tarball as it is a complete git working copy

 package/knock/knock.hash | 2 +-
 package/knock/knock.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/knock/knock.hash b/package/knock/knock.hash
index 0b9a0918fc..fb8d9aef78 100644
--- a/package/knock/knock.hash
+++ b/package/knock/knock.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58  knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
+sha256  7a82c276ca1540faa7f5bb25010f4a59d45323a31c44a30fbe4a6e484dd18b1a  knock-0.8.tar.gz
 sha256  d747e19206e41702e40822dd91d37cbf40edd86f364ea416d667a0e3013f7189  COPYING
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 55f5bfdf36..2cfa738074 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
-KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
+KNOCK_VERSION = 0.8
+KNOCK_SITE = $(call github,jvinet,knock,v$(KNOCK_VERSION))
 KNOCK_AUTORECONF = YES
 KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
