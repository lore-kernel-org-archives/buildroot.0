Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E91CAC5AB
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BAE781DEA;
	Tue, 17 Sep 2024 22:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-6WrnTyc7Zm; Tue, 17 Sep 2024 22:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E1681E07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E1681E07;
	Tue, 17 Sep 2024 22:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8755B1BF316
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7543841A6C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tczJ83jMaAm3 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 22:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29E5341A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E5341A00
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29E5341A00
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 22:30:11 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-39f51934f61so15829645ab.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 15:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726612211; x=1727217011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qej499ORCGX2Z7CBRgpW986HifSSW0JM6jUyNXGiHJQ=;
 b=kvnisTuoeXXMFJAEDW0H7EHXt2fQOXAQty+Tt6bjiA35st543HcydjjaiIUrsg6q4Q
 jHjLOiDzyoBiszMl69na3S4HQJ2XaqGsEaNDrt6rUGPtvkFFMEdcifPhT+m4MS1BcyHC
 6cnq/jcPYKPh+FyMv775pirA3zLUJXNhxKrbFHGzjfFlNKmku7ZmcIIC1bkaJRJBah42
 HhD6ttZOfsrdVvALM/DVBmiCuy4BuDmHmCt220cxK5sqAz7RzjV6zBd53GKW4NXv3jpL
 MiWHAH/r49SwGUFTNgIW6WE1oauQLsf2inJkln48w78/NIQ63RpyoSwENW0H4cLoXmVH
 hKjg==
X-Gm-Message-State: AOJu0Yx/E89YIzvY8lXulIpKjn0ZY1KbL6wiEH7VlJnR+CwhILlxV+w+
 l6kXSgECP6edDGEaX5Mijb16eql5fGUtvIomLAI6j+dbellV2iUwdSZVSexo
X-Google-Smtp-Source: AGHT+IHE1MqgSa5QtR4fPGMdcqQaIPduUx0x9POVfSF6E+DsWTD5yQ+J6stsk9E7hRystyr1N8DACw==
X-Received: by 2002:a05:6e02:1d8e:b0:3a0:9b27:7d52 with SMTP id
 e9e14a558f8ab-3a09b277eb6mr93816085ab.20.1726612210901; 
 Tue, 17 Sep 2024 15:30:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34febsm2199133173.134.2024.09.17.15.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 15:30:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 16:30:09 -0600
Message-Id: <20240917223009.124484-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726612211; x=1727217011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qej499ORCGX2Z7CBRgpW986HifSSW0JM6jUyNXGiHJQ=;
 b=Uddihd2JutrMHw8AOSAFaowNdqnGq2K/k3Z+7YCw2CuBmVGvRX1j4xo2RGuPNrcBQN
 yIrt77lQWDHdta5LL+t7OBJ5Tk7Cisa3eZ1flVbRrQjWnkPR+MNoCvIlU+OMmrgBJG/R
 DH9m6aqPAaDYKdbtgGtFemPyEtPBG1VMDl1uPxcjo2elvbGbhE2RIoQbPCA09lkmgpsm
 YBng1pAaKPgziXdvfFC1hWPVPeS0k1avonyf93sB4KUkQ7tnQ6MS2h0stiTtDyBUiAXv
 HeMQXhKbFXmn7uR06EWdFj0xAR1H0Z9dh5zmCXFG8eLUYbLaU3Xnc4IBIaBO92BxlTzb
 pVlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Uddihd2J
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.22.0
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
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 4 ++--
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 5d8a19647f..00cee048f4 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  75b63f325b760cc6342b7d35fbb84fde  pylibftdi-0.21.0.tar.gz
-sha256  eb7e2f5052852547f4c6c46022a1665f9d7453439639171eade56fdc80a58832  pylibftdi-0.21.0.tar.gz
+md5  a1d3039e8e09b3fb73cb03f1d6f3119b  pylibftdi-0.22.0.tar.gz
+sha256  85a6aab438f765342843aa2d59bb28fbb0d30847a621fb9800985185990f01af  pylibftdi-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b8a7b113cfaa2c01d0701183de16ba653465692b1e29e0229244eee42fb3a9a8  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 7607c90d4a..b4a9d82ef8 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.21.0
+PYTHON_PYLIBFTDI_VERSION = 0.22.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/d2/ce/ff3e83f3a14eb5b7950ff3657f07cdc3033dd0ded5c8ed093db515e1de33
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/74/b3/a3c333a250143d204a0bb60de7c1e5f841543231f04c71ff4fa65e5b90c2
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
