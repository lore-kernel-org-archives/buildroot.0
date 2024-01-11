Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA13C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B2D400AE;
	Thu, 11 Jan 2024 05:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B2D400AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HI2Jj0q1pL2; Thu, 11 Jan 2024 05:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44FB641BD7;
	Thu, 11 Jan 2024 05:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FB641BD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76BEF1BF313
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58C7683E44
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C7683E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8afEkkN0mKhx for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:47:44 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65FC6838AF
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65FC6838AF
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3606c7a4cb5so33960155ab.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704952063; x=1705556863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8dpAyNA9WDP+K3KMRGefJyDhz8Scl4rDpQqU95cBvcg=;
 b=MTtTzlP+ZdclCn86/PZ5DHqWlvdLLTkohjl0UWHU19HR+QrOhKUZ0w5TUwhFdXO0Ty
 FGwYYUUxueZOcNityy9bGHD1+Oiwv15AVzgNEnEJ7doxrq+Fuj6m16S9f5n9EJUC/pNd
 a2XEwNSf3kolCWoHvriIFLmvIvAv4A8IuJdbPYCP4Fpp/BZd7jFDi1bzx9gw3YJ1Y8Lf
 PL9Z15tlQft6S5BtIuSTHU8neb25ifFw38xRzGSPdNe3L6vtFbnKDtCrT6x39AVvrrRs
 PmS2b6Va3DxnNX1vi20EkJ0WVASZFa193P0PFrfoVvvJH9Tv0FQ0qNpPpj2H7XiyK08e
 Gr2w==
X-Gm-Message-State: AOJu0Ywc6Ue5BZUakoUbjYppPCI+KvNaJyG/JwaFEhCpiDPRq8l85+on
 R3BKQ5nbmw2jhhb4NoCEV9dRFDCP3EvJQg==
X-Google-Smtp-Source: AGHT+IEqAiu4lMyQoCyfQnIYRONATYJR433ntsXtNejm109bTJIXyvaefooUcF1avbqKIpnrlWip2w==
X-Received: by 2002:a05:6e02:1146:b0:360:8ee7:5ff with SMTP id
 o6-20020a056e02114600b003608ee705ffmr664696ill.112.1704952062949; 
 Wed, 10 Jan 2024 21:47:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056e021a2e00b0035d6f8d02d7sm83045ile.7.2024.01.10.21.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:47:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:47:40 -0700
Message-Id: <20240111054740.3015662-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704952063; x=1705556863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8dpAyNA9WDP+K3KMRGefJyDhz8Scl4rDpQqU95cBvcg=;
 b=hGB/A4vpjG9mcyd34x+FVnDiBpm05WxiAaWdlLzzkaiZvLII9L1JItp8DsAuJ5kgKo
 QlqgVgI5NdgaftMuRh6EDlGIfK5iqUmbb5pF7RE3Bfpe8Chp3dMWq3NxGTBlBorbsQnm
 mXOBexECTHppnQPMdGl5owNlYFUsrCrqzLEcGnCHbIje5NmHsDTCiqhezOxEWDJYDuJd
 IBAkDs5HWDBy+kKdqqfOPHpa3ICOzz+E/CHAcvDrMzWhdFbn5+/e/Ht7V6B8G1MwFBo2
 0PpiaEv/ZLRbedSQnUD3FSBtEaWTVXJC0b8vl313tjbvkvzhVzoLzz8aKfhz9pLfaSxN
 gHsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hGB/A4vp
Subject: [Buildroot] [PATCH 1/1] package/python-scipy: bump to version 1.11.4
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/python-scipy.hash | 6 ++++--
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 9634771139..bee5d698a0 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,7 @@
-# Locally generated
-sha256  f9b0248cb9d08eead44cde47cbf6339f1e9aa0dfde28f5fb27950743e317bd5d  scipy-1.11.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/scipy/json
+md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
+sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+# Locally computed sha256 checksums
 sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 3010cfbd54..6626826e33 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.0
+PYTHON_SCIPY_VERSION = 1.11.4
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/fa/d0/724c8204f87b6f807e3e67de32b8b4922d579154a448ce94e89129064bf1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
