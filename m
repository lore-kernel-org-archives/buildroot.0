Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9031FC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 18:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB94F60AEC;
	Mon, 16 Jan 2023 18:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB94F60AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rTjUQ_yn2mx; Mon, 16 Jan 2023 18:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8F760ABB;
	Mon, 16 Jan 2023 18:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8F760ABB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8EF91BF3D6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 18:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 816454051E
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 18:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816454051E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NunPkD0fZJz for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 18:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698E140509
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 698E140509
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 18:05:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u19so69841896ejm.8
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 10:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tb4+iDoAzfDVD+bf+prGiAqm45ruOxgDGqf4Z8BKGR8=;
 b=pTb5w1arbzWZw8/b6OJXbPZ68xoBEQ2H2AICqhwffalQdXRzqdJ7Om7og4VDlrJrXH
 uLIdS4U8PvOyZ2kXsxXM5G6GwkFaxJM4Jv4gUkETs48MURytu0gojXpJYRUsGFmW5tZA
 OY+7Hp95QXU2FiYQefiFUJh3WBQzCvGUj47HHpZ274PVOEgemyPtdW3QP7KFVLmmvv+V
 FHSgGulzVTJop/jm/E1M3YH8pj6/+FUTpCcZfaqZD8/2+eDGrT9K/H2bf/eDW2KSxy2y
 509S5rIG85NOqpI9NSr2PQsGViR7RGGBXji9QQgLVAZ7wh+U25skZKEouQaYIErWN4uR
 pNNQ==
X-Gm-Message-State: AFqh2kqvugX3epw07xdjGSKejbnO5nAydyR1sv1sdCLHsw7VL/DfMQDA
 bZIKmDstMBIVECWusYpi2T2RPCxFYppkqj/I
X-Google-Smtp-Source: AMrXdXtsF/8R4jj7QBmTCaAcxjJySHuQKVbOx53fiBJhJRkgU6ZRsGsFOddlqIsO6aPkOQeR1WbCxA==
X-Received: by 2002:a17:907:d30e:b0:871:3919:9a5a with SMTP id
 vg14-20020a170907d30e00b0087139199a5amr3480124ejc.49.1673892328325; 
 Mon, 16 Jan 2023 10:05:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-75-145.net.vodafone.it.
 [5.90.75.145]) by smtp.gmail.com with ESMTPSA id
 ia2-20020a170907a06200b00868c5005e13sm4852235ejc.98.2023.01.16.10.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 10:05:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 19:04:34 +0100
Message-Id: <20230116180434.3090717-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tb4+iDoAzfDVD+bf+prGiAqm45ruOxgDGqf4Z8BKGR8=;
 b=QQ7tYecGgUDMr3HTCXqJbSzaeYNs1k8sETur8x08RG/csmamrJql92UvOoG9MBcpSo
 ENi+ZEWU5jCCCnGTkCRZuRu85iREnJtPw2V6GzAAQ3H2PAE+BIeUx6MWBbHnvTfyjOda
 VSCiqJS4SsTDfv2l4eo8dae9/DSZgnl9Yvrag=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QQ7tYecG
Subject: [Buildroot] [RESEND PATCH 1/1] package/sscep: requires des support
 in openssl
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, thomas.petazzoni@bootlin.com
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
