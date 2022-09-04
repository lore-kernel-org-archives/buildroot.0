Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F2C6FA82
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 17:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF5D940886;
	Sun,  4 Sep 2022 17:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF5D940886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hmzxJts_h_c; Sun,  4 Sep 2022 17:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC754087A;
	Sun,  4 Sep 2022 17:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BC754087A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44B5F1BF395
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 17:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CF284058D
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 17:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF284058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jf9dNw2P3Fmo for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 17:12:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CD52402F3
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CD52402F3
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 17:12:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id se27so12898257ejb.8
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 10:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=cV8ra3Kz9Xk1k4wP2n4HY51x3uWZxDOTLuFJgM4NFUY=;
 b=Wm51mJOWHsHFQC1gVV4TSXgpAWr2kWS59hTM2koYQVvNTRNSomsp56fxmQRJqxVvNq
 31g5QV4sPYSu7qWRuMsLMb8fp7t/75EVH0bnSVFhTXRut7PZ6xvUZ3hoRlrnaVSblLF6
 gRAzJcFkEOW5eLhnxlceIyV7QsLVA8i6EfJBG2dPuUOJao7dlFik/kbnlAFQgMx45SaI
 +Pb6nAq1sXykDzdh6k4laaJWqnyTgP5uA1h06TRRjxBeyNPZ/2FBXSLbB91ChjiKjKw2
 QN5dsxzEQpSWevTCAYIvq56lfvjzODS47S0U7A2nPC2aofqmc6NlGSaHoOahqoE2bB8X
 iLvw==
X-Gm-Message-State: ACgBeo2txjFsmiYYNchmYz1nXzA1BARv1Gxg4eH6OeZJdcfBN0UZIRxc
 3D2xzM/xFmoWw2Y3tZZd2eN6OUnzCChNWw==
X-Google-Smtp-Source: AA6agR5dx+iGFs2UVEDLuJm0SyDfFSLpbwllmm5zjoSsGLJH9sKSU2trCnCn1KwsnIEr7R8/NWqi7g==
X-Received: by 2002:a17:907:1ca2:b0:741:cb75:78e5 with SMTP id
 nb34-20020a1709071ca200b00741cb7578e5mr19740850ejc.384.1662311577636; 
 Sun, 04 Sep 2022 10:12:57 -0700 (PDT)
Received: from sprado-office.spo.virtua.com.br ([2804:14c:46:297c::32fd])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a17090631ca00b00730860b6c43sm3997325ejf.173.2022.09.04.10.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 10:12:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 14:12:17 -0300
Message-Id: <20220904171217.2528472-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=cV8ra3Kz9Xk1k4wP2n4HY51x3uWZxDOTLuFJgM4NFUY=;
 b=FOEdduOQAmBJZ2lC2SLk5+gPTkza3uwGUgoucSxHzCXxS7DpE9ULDcS5bE5//VBh1V
 uYVYzfOmnuGBMGZ6jmZMJ/Vy5zMroKpmMvL09GsdZ0ZoHxAIk/Xo3wcg8nKmrqctt6og
 drzQrglDy/0sLvfB5JAtCCFyXhKGm5zmM6AA/jXFCC/Wg3uARpUWH+DKfJTuOjd7rUZf
 271vLtdnuH5O2aXpCr0r3FxcwT7XXX7j8ymLLFr2eDXFR/5fft8Vph8AEZ1cMwC91NpM
 0gvW9+B11tATx3GoubYbc3Ae20g2V001//DoaWgE/QoQIWmvFcWEIoAgK8AFOD7TEwOH
 2ojg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=e-labworks-com.20210112.gappssmtp.com
 header.i=@e-labworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FOEdduOQ
Subject: [Buildroot] [PATCH] package/tio: bump to version 1.47
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
From: Sergio Prado via buildroot <buildroot@buildroot.org>
Reply-To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/tio/tio.hash | 4 ++--
 package/tio/tio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index 5058ccca8e71..cb0311a752ed 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tio/tio/releases/download/v1.40/tio-1.40.tar.xz.sha256sum:
-sha256  beafc4763552ff7cf3a368e8af36258018ef85fac32133c4635051d7615ab527  tio-1.40.tar.xz
+# From https://github.com/tio/tio/releases/download/v1.47/tio-1.47.tar.xz.sha256sum:
+sha256  6f39ac582de747feb9a64c14e6b378c61cb0c3bfa6639e62050022c1b7f5c544  tio-1.47.tar.xz
 
 # Hash for license files:
 sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 5c469667f642..0035ce445ee2 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIO_VERSION = 1.40
+TIO_VERSION = 1.47
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
