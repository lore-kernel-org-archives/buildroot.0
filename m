Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9820CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BADB404AF;
	Thu,  3 Nov 2022 14:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BADB404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpLPRc_xcP48; Thu,  3 Nov 2022 14:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F83740297;
	Thu,  3 Nov 2022 14:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F83740297
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86C161BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F97460EA1
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F97460EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIsjRysQEki7 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:31:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E00605A7
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62E00605A7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:31:48 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q142so1456452iod.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADm2Leu0qlvuVeeiUB2Tc7Zjq2xs2rT8LGDMDsmKT4c=;
 b=Z9NmiaNkRKuBibwGa5lBCOeyotNXWmc/BwvMkEOMly8hWg/3Si61S7zpPQTDKlmS1S
 CmrAqcDADEMq3+X43eCOqwzyvBiP5zSHL+gY1z5Wf+bRSvxeGaEXBQytQUT7qxVJod7d
 tVKU2f2cDri04IaPjfC2x1c5rX5zwYk6Pes/MHu/moh+gETRWMWztLgv9sw3vluU0DwO
 sw/IS7J5hyP4Uo9Iul2o+hyftAgYs+npNHGGzEJLw45OilgdaJqUPgLTc7YvvMbC/EHI
 68yGPJr9nEFYBYjGA7ZrpPFTMvn1RUfBl0lAy+bvpsVtM8YTAhHMHTCzehLUNW7k0bHy
 Zexg==
X-Gm-Message-State: ACrzQf1jbNeWQ+yDr6ZEkb/T8tOXlWTqT/RgNMSnkY6LvYgRwkxNHC6y
 xOrsWW5WVKeKZt3j1iM/ORa79cBtIFOcn4Ji
X-Google-Smtp-Source: AMsMyM6S6nw81b4WdTeSFvEws48VAmcPgXnVhVAt/kTDwABAYRS94fhFIZF7MGc1pcXE0uZmw8+vqw==
X-Received: by 2002:a02:cabb:0:b0:363:5b16:c871 with SMTP id
 e27-20020a02cabb000000b003635b16c871mr19373619jap.6.1667485907033; 
 Thu, 03 Nov 2022 07:31:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 o126-20020a022284000000b003758bcba4b5sm250020jao.153.2022.11.03.07.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:31:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:31:45 -0600
Message-Id: <20221103143145.1736534-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ADm2Leu0qlvuVeeiUB2Tc7Zjq2xs2rT8LGDMDsmKT4c=;
 b=UbNAfoYqRIhEoc6a9s8zDpqcYSpg3P7u1iAmnhV9y+HXmEOKdQmTbcscJcU/NS2CRg
 f/wpdC+z/PATf5iIuc4x0u7lifrqigbTVZLZwgrn3p9z+kt/HFOhweAsSXlIym+ve7C7
 RxA6Olt8kMXp5oXXYZizeK6ly7RKNxY49H7IaYnDp2Uawi6nSR1i/+2Om33yXWctPP75
 x9nizRUXzjEcMR6vIfoBYFZdvkb/eN8u51rn2HHwLCASPmdkW3EMKZpvS2UixsCmCBhH
 aBMnMmntr1rYFc/TSkqe9h4QyBV1iwiNr1ChTRX6b01o8vqUApnqNSUJwTpNBUHkUZ6W
 Ebgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UbNAfoYq
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.20.0
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

License hash changed due to date update:
https://github.com/codedstructure/pylibftdi/commit/4662ebe069eefd5a89709d4165e3be808cad636c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 6 +++---
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 5570c1c9f6..ee0ba127ca 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  c48e442cef7b1e865b4d96ab92f509ad  pylibftdi-0.18.1.tar.gz
-sha256  bdd04076933959b20b3c8b4fb8be7882d3362675f259e7eeb23ebff03b81859d  pylibftdi-0.18.1.tar.gz
+md5  fb43ade3283b809d4ebe92bf4a60d7fc  pylibftdi-0.20.0.tar.gz
+sha256  f4a87fc4af2c9c7d42badd4192ca9b529f32c9d96fdc8daea7e29c509226df5f  pylibftdi-0.20.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0e40132339e1ef7d17d93837fbc273d1e87302e9295162bd19c9161e5700ddcc  LICENSE.txt
+sha256  0d3f1af06b566a783091422061b60e864fc5d5853418b71643041e254b4ae7f9  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 2f5614867d..34040b72ac 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.18.1
+PYTHON_PYLIBFTDI_VERSION = 0.20.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/50/9b/1e1cdb9715bacfb83e5eaf5e69f4e2fbd92d61f43c5e185cc3935ec01b28
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/b8/03/4f778ce6dceea58dc5bfd555c22fdb265afc922d81d3c4496a791a54c479
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
