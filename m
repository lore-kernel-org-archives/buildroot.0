Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6978C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9665560F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9665560F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67F4C4032C;
	Sun, 26 Sep 2021 21:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQ3LbvRhYSeS; Sun, 26 Sep 2021 21:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7B8A40328;
	Sun, 26 Sep 2021 21:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 317B31BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DD0540328
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBc_YDRVdl-C for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1753540327
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:26:23 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w29so46048970wra.8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SiAdOLtyCmJshd2UjxtqLct4CM5SM3Eprvkgf0vStsU=;
 b=qrIeaU9qj8sF97EWLemRc4L3AzzYWoVY/CA/o97rpz3QxTMgGt8Ds9KITwiIFBDp61
 S2yXC++J0SUZ83PXP80f1ylKraNID5Z/YaxF2qzxsw05kqC87Ar75yYcscPpcRPrZehc
 JwL3hZFC40nQtoyUEHoCsp7VcqtkOFtbxz5fyY09EV7+QpryMwxDn7ZXfpMAG40qgCZG
 fVmfkCYDdYTKOM4EaaLu02jUX+DuJbPrlFsTwL4xa9pxGyDuws6d0yRGgGtpq7EoXNC4
 d7s3WT8kM66e4o1exrr6X9MALq+bjn5cSLsBGvqc73QNSo9yAx0bt1FjvXX2o6DEZVjU
 mKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SiAdOLtyCmJshd2UjxtqLct4CM5SM3Eprvkgf0vStsU=;
 b=5CnDSCHs2JaRKQzRwtFBJVMaDp/+f9b7EmIsXIBSrH7zzi10JqAqVudzGsG4WLkR4e
 bde+AQocJwJPso6rsv1fNRIBFMasmWhGOHq1Y2ig0Rxxpuz3g4YXsTsQ27nQ10V+a5d/
 8NhQV4wRJqwl3f0VfluH7FDzkbuL57o/nFokZrEDM19cVLoNvjVA8sSQQF7uASxcrfbY
 OKyi7X8KemGzOuucNu0b/+A9S5qgNIRLod9ICDI4A5AIWHhFhHUpHl5iGz+sGbclI6Wg
 dxSqVTutlCey5JyjbEl3ZCoho9Uy5mnMG0qJCmZ40xkCdla0LS5qCuSyo4y1mA5kX64m
 p2sw==
X-Gm-Message-State: AOAM533pY5mQpTXSBCsNjeAYDp0sGXnbD8IAsI/+mkU3xrAZKbJRI5be
 9lGK+ni9ldwXXFktpb+XmkqjSkDEe1c=
X-Google-Smtp-Source: ABdhPJwAZuf6/laddlxsQEyg73WNtDfi+iDqFfKir+2bHRo4ZVEM/pesOTBdWRPrpuv1Xk7Ud8bdQQ==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr24311274wrs.179.1632691581256; 
 Sun, 26 Sep 2021 14:26:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id o17sm11430234wrs.25.2021.09.26.14.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 14:26:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:25:56 +0200
Message-Id: <20210926212556.915231-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wget: bump to version 1.21.2
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

https://lists.gnu.org/archive/html/bug-wget/2021-09/msg00005.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 11071566aa..03394f55c1 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.22.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.1.tar.lz
+sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.2.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index ae036478b8..f30fa39917 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.1
+WGET_VERSION = 1.21.2
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
