Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79537C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 00:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0102542C2F;
	Fri, 12 May 2023 00:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0102542C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cerX1qPmsUua; Fri, 12 May 2023 00:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA2BD42C2B;
	Fri, 12 May 2023 00:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2BD42C2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0EF01BF25F
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7E240895
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A7E240895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyXfuM4UO_a4 for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 00:21:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B8A40327
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6B8A40327
 for <buildroot@buildroot.org>; Fri, 12 May 2023 00:21:37 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaf21bb427so67339705ad.1
 for <buildroot@buildroot.org>; Thu, 11 May 2023 17:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683850897; x=1686442897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnPYXDlAAniuK86oIL5wpcLY2zOfH2UJ5kP8UYCLuFo=;
 b=BwVVcHV6dzZKPmQSKwJg/VT+4q2ohnVht6+Oy2Wzm+uMTEtUlFxmfF4nwShMTZWo29
 fwVIgOxVPeL+6vZZgzBY6tfU3WiD+fFXvPq7jK/EH3618gyU3e7S1CWdqFN/N2XD5usP
 B0TcWh6uoYBSYI3152dvmZNC8rpFi9Dw48fv/aQXm8MlkbJxW/45NxTHzztm69GsMiKt
 E2FUwNctCbkqEo1uvcE8IU/t8s8bcIqX21pQPgf6HUjYzztfqPW/cQuDKlGw9T9CUyFd
 uV7NV/7AK9RvfIfI28KDJIIQrlczeY68tFKytC0lsT9k7XcQIjWgfq8yKoSq5+OPlsuU
 rVvQ==
X-Gm-Message-State: AC+VfDwfBIzY4UPuGCNruX7/XukKaE3KH1ytWrPAJBZpKrEjMRVs8+mp
 YK/lOXrFX0NVOsxFu7GygFLacyWCk/8J+dJNufk9tuLa
X-Google-Smtp-Source: ACHHUZ5hZXWUxqiknSTHqplpNzFWVLlTpT76998NPEVRAC8pgUd/EfHZ4YEPAZ4y/7FE2rxoV8ksUg==
X-Received: by 2002:a17:902:efd4:b0:1a9:20d6:3c3f with SMTP id
 ja20-20020a170902efd400b001a920d63c3fmr21769525plb.55.1683850896827; 
 Thu, 11 May 2023 17:21:36 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b001ac69bdc9d1sm6587758pln.156.2023.05.11.17.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 17:21:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 17:21:32 -0700
Message-Id: <20230512002133.1353641-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683850897; x=1686442897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nnPYXDlAAniuK86oIL5wpcLY2zOfH2UJ5kP8UYCLuFo=;
 b=pwx87kl1LOAXL8hbep5F3dWn2twBfPpyNevQvgmZQ1/7MqJC4FpvOIreJV4rDkCrqC
 5D9aHWYDmlTC3aK/CgkvONJ1UsyRcqmHXpP5Gyz8zyawjrCt35yC6sOkyvB+BjBVLbdp
 r2cWEwDNgo2XAXK9lCFMsTCUfoS0gxZwp+uqig7fDsdh4C1Y0l1okQALUIVoLRqfIMEv
 +4m8QR3GtUk47UbUKqHbLHauhn75mzjsux8D0JE6Vu7U53NrrU43I5BpXrGOuNztlUCH
 9ewpfwMbaIVg1rKLem2K4z7cgRr7m/1a+0f7Pueqh2bSbKP2l8cNAakbhzgPzCbnHoqe
 QBPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=pwx87kl1
Subject: [Buildroot] [PATCH v1 1/2] package/cni-plugins: bump version to
 1.3.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containernetworking/plugins/releases/tag/v1.3.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/cni-plugins/cni-plugins.hash | 2 +-
 package/cni-plugins/cni-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cni-plugins/cni-plugins.hash b/package/cni-plugins/cni-plugins.hash
index 0c3e07c91c..90cb184604 100644
--- a/package/cni-plugins/cni-plugins.hash
+++ b/package/cni-plugins/cni-plugins.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f3496ddda9c7770a0b695b67ae7ee80a4ee331ac2745af4830054b81627f79b7  cni-plugins-1.2.0.tar.gz
+sha256  f9871b9f6ccb51d2b264532e96521e44f926928f91434b56ce135c95becf2901  cni-plugins-1.3.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index be02c2ff45..27a31b445a 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CNI_PLUGINS_VERSION = 1.2.0
+CNI_PLUGINS_VERSION = 1.3.0
 CNI_PLUGINS_SITE = $(call github,containernetworking,plugins,v$(CNI_PLUGINS_VERSION))
 CNI_PLUGINS_LICENSE = Apache-2.0
 CNI_PLUGINS_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
