Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA20C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 18:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7CB41B2C;
	Thu, 15 Dec 2022 18:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7CB41B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHoU96OYA5v6; Thu, 15 Dec 2022 18:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FE241A55;
	Thu, 15 Dec 2022 18:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FE241A55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9F51BF334
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 18:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DADC941A55
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 18:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DADC941A55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JuIBYsdBfbLE for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 18:35:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A0A41A33
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5A0A41A33
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 18:35:40 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c66so429026edf.5
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 10:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tb4+iDoAzfDVD+bf+prGiAqm45ruOxgDGqf4Z8BKGR8=;
 b=d67V4ZMeJwo5sCZzb6APSsAS+qSE4jj21OPkq7jbZ/BLX2lsivp7d3YpAfPn8NoEvJ
 zDHqHseCsmitrP/+cno8HBvkHX0BIdBi+QLX5AJI19tkmnQypaRXvtObWnGjGYJ9Kofi
 GC5j+zJg7m6G/nEJcO/2ZHf5V/Mf/iF9fSX4C65MuKdcb3NhkTf9aaYh8gXipxO/m41y
 FcvAIqRxY0wzFk0UVcWKhiuIaVvP4n6ZIf4MFrd+3u5Mbws5zi67FyN1osvyy8RRYHf2
 6xSJKFjCRUZmlSGWGNrd9DYXrEBQZj+J1RnIp7yIlpUnWHKKZbTwh1vjECdMBDBWbgYE
 Bk1A==
X-Gm-Message-State: ANoB5pnUx8HgxaWwrekAf0vpo6S7yC4AkqMXL3EiE3Z5kdagSHWVGrH3
 Gx4rHjKTEia4eRp5tmcmTRMIrUw/oPog1trt
X-Google-Smtp-Source: AA0mqf7M7jgf+mjpkiboAX5oLUSsHgWk3KsH0kUWE12MjNnTRaYdKN9PVG0aF6P0qThj2vXZB2YMXg==
X-Received: by 2002:a05:6402:913:b0:46c:fe2d:a588 with SMTP id
 g19-20020a056402091300b0046cfe2da588mr24685331edz.18.1671129338985; 
 Thu, 15 Dec 2022 10:35:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-54-95-136.retail.telecomitalia.it. [82.54.95.136])
 by smtp.gmail.com with ESMTPSA id
 bf8-20020a0564021a4800b0045cf4f72b04sm7680490edb.94.2022.12.15.10.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 10:35:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 Dec 2022 19:35:32 +0100
Message-Id: <20221215183532.3771911-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tb4+iDoAzfDVD+bf+prGiAqm45ruOxgDGqf4Z8BKGR8=;
 b=Buk5uBwFcXOPDM+3KxU2yvW1zhQNQ5xoyWdmV+IIs+3nFn7QgkNGxEFlQTZtf/8Eog
 V0pzlUQQ0+/8R9qItyUzW0kJKTSze+Y9aGqgY1cPRoAiWM+SQe6LHpufKQS11CwSDuYN
 FB2ULPv/GXMpR8kYYzxRnkzSR7bEAMb74opIU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Buk5uBwF
Subject: [Buildroot] [PATCH 1/1] package/sscep: requires des support in
 openssl
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable des in openssl to fix the following build failure raised
since the addition of the package in commit
72fa60dc102679f51b228336ec38f5af78ff7646:

src/sscep.c: In function 'get_cipher_alg':
src/sscep.c:119:32: warning: implicit declaration of function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'? [-Wimplicit-function-declaration]
  119 |                         return EVP_des_ede3_cbc();
      |                                ^~~~~~~~~~~~~~~~
      |                                NID_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.net/results/34bd76e8e5e7df0db31918d610a0dadf531f369d

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/sscep/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sscep/Config.in b/package/sscep/Config.in
index 2e5e29f7c8f8..549c65274b45 100644
--- a/package/sscep/Config.in
+++ b/package/sscep/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SSCEP
 	bool "sscep"
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SSCEP is a client-only implementation of the SCEP
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
