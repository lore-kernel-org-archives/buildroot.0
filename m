Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F039EC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8681E405BC;
	Wed, 21 Sep 2022 21:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8681E405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CA7H5ylG8irv; Wed, 21 Sep 2022 21:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3691640483;
	Wed, 21 Sep 2022 21:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3691640483
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE04E1BF2C1
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C1441695
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C1441695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uj4M5PxBqpdC for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:49:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 575CB41691
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 575CB41691
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:49:21 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id h14so117214ila.12
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=6B996BpX8EzyEMXZ0rKE24Wax20Yw04wBv5Qig2nMFQ=;
 b=kdbr6AX8pkpdgq+WcEUpMymNudXF1mOPBDOAt9WaHhq7uzCtvWGrbVmNKQl57kODgG
 qcZwllG20rLtO+nfeHlGXKkNKdnMmZnQd2lDa4EQf54J3bkM7GQOBEzsOg1tlt8YyAAR
 LxcyQNmqUJq2pq9JFeUUXYOcx9UQvbhPPVpW2LPPbel+e35EhRaxysECnuq4Ck+zCCQ6
 8VQvutCORPO02ua+Y7Yv7bxaKmKomgymUqN2O1BA7+mleUiOInVAt59CrNeKpAj2aAlR
 +S+pu6ewFMEjhDemxMOAakGx/y7q6F/83gPdUzd3GkdW8Q+bVRor82RgmO1kYGWtig+g
 LcBg==
X-Gm-Message-State: ACrzQf2O1lx4DAdIbtfIQGfPPsQ87OBtKzF42SPIVAEH06/b/Ak5BLyf
 avgGOkr9q0RqSi+rwyBwvV2T1wa0iQJHAess
X-Google-Smtp-Source: AMsMyM4YuDRpt6L7eX1lw22Ly89zI/mBe1bxbjNXRDrx9xX6rQtWSWY/fqaUHuikPxm81dHBDttUXw==
X-Received: by 2002:a05:6e02:1687:b0:2f6:946a:807e with SMTP id
 f7-20020a056e02168700b002f6946a807emr162179ila.138.1663796960285; 
 Wed, 21 Sep 2022 14:49:20 -0700 (PDT)
Received: from neptune.lan (24-212-229-25.cable.teksavvy.com. [24.212.229.25])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056638110400b0035aea8cce87sm1472853jal.141.2022.09.21.14.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:49:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 17:47:54 -0400
Message-Id: <20220921214754.58753-1-kyle@balena.io>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=balena.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=6B996BpX8EzyEMXZ0rKE24Wax20Yw04wBv5Qig2nMFQ=;
 b=MMob+a8qgTLMWpeHbqunHKB9O4iKokVkeD/C5DSTr4Cd+rQFfA7PNIrlbHbya+6OYJ
 Kly5/V5Krgkm+ogWguRMW/tDK0uHuMeMVqaLlm9QmEHf/1RlMDZCokF0WjIBKDtL5CaF
 +5LRD3YYKftM39sNjFpA0e1sqW3pSGDWzDx/fG+nHj2bTK6vu5hvzUHsWwbGyOSJkYwj
 rthAlzkoy/QwKz4TfUWpBvKIUtd/rg9uJXcTS+9F39NdwnRoAcby84daQD3e/3ESh0kT
 +eRhWTk2ueTcEMCTl1DCDFCIYMhRR34WedFa6UunSKTEjGgLSc9GpQ5mMj0pTWGcElH5
 v3ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=balena.io header.i=@balena.io
 header.a=rsa-sha256 header.s=google header.b=MMob+a8q
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.3
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 8bfe48df9f..cef8edc4a2 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
-sha256  2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581  unbound-1.16.2.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.3.tar.gz.sha256
+sha256  ea0c6665e2c3325b769eac1dfccd60fe1828d5fcf662650039eccb3f67edb28e  unbound-1.16.3.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index a3c3ddc8e3..73a460d103 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.16.2
+UNBOUND_VERSION = 1.16.3
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.36.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
