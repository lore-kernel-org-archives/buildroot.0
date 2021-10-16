Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8BDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 14:15:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152ED611C1
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 14:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 152ED611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AD1605B3;
	Sat, 16 Oct 2021 14:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ok8setOzfLUN; Sat, 16 Oct 2021 14:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248AB60726;
	Sat, 16 Oct 2021 14:15:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29F8B1BF30B
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 14:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1920B4021A
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 14:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WYAdDG0e08i for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 14:14:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F37B840163
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 14:14:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o20so31659028wro.3
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aM1DxnUG/pmPEntZIXwLpdxHp7CG5gZHVdEoAeOhFtU=;
 b=UGSO18Vbe2RMM0kEm4aRdR6aeOwx9n9tSDfXAqBjjnFFVn0NYiavdHKRE3k64PchoY
 8ENwz92zBpHexkTHOmRxrLlLUt7mRFiZpU3uk/BcnCD9Bvo2dUgU72v1yAZ3VQbIduFV
 i5Ir7z1SeMaUMdj/ryU1KH7H6FWYmiUfO2RpryQk1+ixDY2PoNlO608wbkRK6043/utL
 GLn8PZGigcRWZOxk2aba5+P9N2OZ5WORSLc1d2jdC9+Nz5Ini+YIhP3Nhz9+cdkQVays
 DcRPHMchjpSN2euTeA47quk/7clBX9MCDPAQMC4jtcpnAhoE7YEpOXWkpGmvWZfZIozS
 q2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aM1DxnUG/pmPEntZIXwLpdxHp7CG5gZHVdEoAeOhFtU=;
 b=3ZClEsNMijLMpO+BMw/MYiyXgxaXfTRsJPFmcChTEdMOvdJZNAMlGvNT8cuCet7zA9
 grJ9g0p5tMSLvB5xcAtkQ1XQI3dMNOK8qTyF2XKAMkkWhebMa9sBNnyY5wMqaYpcGimx
 SUhouSxmaOB3e0Q+OkB83JtFty0jrLBS57TirPMhQ4SDok28bVTs4gjKPevpqUfYHENW
 NSDYl4IjJSGrgOPyJ3Dd9BTBd//x68G9UgeCdcn8taxJawXgDa/e11ZPq7i0FUr91WEu
 mRnbcPcMFoSG+GbYlr1NxHcMJ7YApSKdP66SeL0ZnwqnsOFkbthJzvLYch1mksi6pp66
 WG+A==
X-Gm-Message-State: AOAM530BhVVzt9zpA/qYEcxXdscrg0dUQ5Nu9fYKDY3sU6VqUi3ouH7I
 JvZG3+yY52+bMo2OV+kncSQwaWn6m50=
X-Google-Smtp-Source: ABdhPJy8NLU8z3r1NCiTLNRZAcUWrARA4gbso1CtzvQKiW0OvyThZYCTFAi9GRdNEYNm848XxLpRcA==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr21513921wru.290.1634393686969; 
 Sat, 16 Oct 2021 07:14:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u15sm1722526wmq.12.2021.10.16.07.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 07:14:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 16:13:26 +0200
Message-Id: <20211016141326.3198988-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016141326.3198988-1-fontaine.fabrice@gmail.com>
References: <20211016141326.3198988-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/phidgetwebservice: bump to version
 2.1.9.20190409
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/phidgetwebservice/phidgetwebservice.hash | 2 +-
 package/phidgetwebservice/phidgetwebservice.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/phidgetwebservice/phidgetwebservice.hash b/package/phidgetwebservice/phidgetwebservice.hash
index e369049c1c..49017f2994 100644
--- a/package/phidgetwebservice/phidgetwebservice.hash
+++ b/package/phidgetwebservice/phidgetwebservice.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  904af15ecd13ae4e807ed8af181e3a4521e59f8f3791be0aa4ceb1afdbf764a2  phidgetwebservice_2.1.8.20170607.tar.gz
+sha256  aa63cbd2ab87182d6e0c05d553ee4c8cc73d268516d8e0a1e881baed391c081d  phidgetwebservice_2.1.9.20190409.tar.gz
 sha256  ea8af5e789cb2d4e9b10bce3874982ade163b749b6bfbdb32e2df21c4d106de1  COPYING
diff --git a/package/phidgetwebservice/phidgetwebservice.mk b/package/phidgetwebservice/phidgetwebservice.mk
index bdcc388b26..b5f335c4ec 100644
--- a/package/phidgetwebservice/phidgetwebservice.mk
+++ b/package/phidgetwebservice/phidgetwebservice.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PHIDGETWEBSERVICE_VERSION = 2.1.8.20170607
+PHIDGETWEBSERVICE_VERSION = 2.1.9.20190409
 PHIDGETWEBSERVICE_SOURCE = phidgetwebservice_$(PHIDGETWEBSERVICE_VERSION).tar.gz
-PHIDGETWEBSERVICE_SITE = http://www.phidgets.com/downloads/libraries
+PHIDGETWEBSERVICE_SITE = https://www.phidgets.com/downloads/phidget21/servers/linux/phidgetwebservice
 PHIDGETWEBSERVICE_DEPENDENCIES = libphidget
 PHIDGETWEBSERVICE_LICENSE = LGPL-3.0
 PHIDGETWEBSERVICE_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
