Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECA8540A71;
	Sun,  5 Nov 2023 20:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA8540A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukJ7vtibLmXq; Sun,  5 Nov 2023 20:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAC5240A98;
	Sun,  5 Nov 2023 20:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC5240A98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 334031BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18CD1418A9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CD1418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWCej0VczZ4W for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:25 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39E10418A8
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E10418A8
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1ccce410660so2339605ad.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215984; x=1699820784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOpc08pVuC5MIPxbSieQtPdFcjGIpbNb2LoGlWHzlvI=;
 b=BxiblPrc0I++th2wxD4jXIrkqDHCKNihSbtXbGWOgHammzIsANQtIzCG2JrVWyEZab
 h7nMCNosdNxyQgaRZi7F16vKCGAt91lE8n1IbPrpF1gClRcuRceQ4EsK5mx3Bo1qZdwz
 hqz4vZjhqnIFjQlogNcRHSDNIaSKxQZzAnOXiKJO+J4oR5YC8BzuTYX4dQl8AEAI4mc8
 DS2qIqsNySns2xrwmWhYl1SwaUYxTGmAV31CiXBuyNUf9bfC1FzZzWu50pb82bmq5ov5
 eb6yFXtJkCVsZTLLS//oaPsp6lqLN5+G1VELFpqyAN5qRLllakCGyMC6C1PSHmNMl68Y
 v3Og==
X-Gm-Message-State: AOJu0YxNMb4mccwDDIodcbjH8CLhh2cI16g6dap8vzZNn8JaCskGc8Az
 qHrfqj88VeXPar9t/gUm9M9TyI1sIAeHcn6LeUTCO0vioiA=
X-Google-Smtp-Source: AGHT+IGnYDzt6cULBLOVkoM9snbOEnhY1QH6JD/C15I/BXB7XSZXl/Xgfb02ot5ikltc+IrUlgpm8A==
X-Received: by 2002:a17:902:ea0e:b0:1cc:47a6:12bf with SMTP id
 s14-20020a170902ea0e00b001cc47a612bfmr18808865plg.47.1699215983928; 
 Sun, 05 Nov 2023 12:26:23 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:26:23 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:48 -0700
Message-ID: <20231105202555.359391-17-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215984; x=1699820784;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOpc08pVuC5MIPxbSieQtPdFcjGIpbNb2LoGlWHzlvI=;
 b=cDVXIc8OYP3FBST3VgsbGKId0MSkObhNFfrX7SdmOcW4gKyAkGx4NTK4vFx5YmUR0B
 u6tCVEACdNSFSAK5Gfl7EdUNP03YunKsiHhfrbFLDamafMQ2U/LPqoCpePT+sCIdNvyA
 HKPVMOpfvti4WVlgYLVmMXDmAzphCzqOuYC20=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cDVXIc8O
Subject: [Buildroot] [PATCH v2 17/24] package/python-constantly: bump
 version to 23.10.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package now requires host-python-versioneer to build.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Bump the package instead of patching.

 package/python-constantly/python-constantly.hash | 4 ++--
 package/python-constantly/python-constantly.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index 8e646d82ba..7a246e882a 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/constantly/json
-md5  f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+md5  c090579309b2b34be04385b54b0a5a85  constantly-23.10.4.tar.gz
 # Locally computed
-sha256  586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e0efd050b7f1c7cbd  constantly-23.10.4.tar.gz
 sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-constantly/python-constantly.mk b/package/python-constantly/python-constantly.mk
index 783d198d06..466c9bf455 100644
--- a/package/python-constantly/python-constantly.mk
+++ b/package/python-constantly/python-constantly.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CONSTANTLY_VERSION = 15.1.0
+PYTHON_CONSTANTLY_VERSION = 23.10.4
 PYTHON_CONSTANTLY_SOURCE = constantly-$(PYTHON_CONSTANTLY_VERSION).tar.gz
-PYTHON_CONSTANTLY_SITE = https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951
+PYTHON_CONSTANTLY_SITE = https://files.pythonhosted.org/packages/4d/6f/cb2a94494ff74aa9528a36c5b1422756330a75a8367bf20bd63171fc324d
 PYTHON_CONSTANTLY_SETUP_TYPE = setuptools
 PYTHON_CONSTANTLY_LICENSE = MIT
 PYTHON_CONSTANTLY_LICENSE_FILES = LICENSE
+PYTHON_CONSTANTLY_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
