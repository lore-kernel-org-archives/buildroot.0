Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE28C77B7F
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 00:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD0741E08;
	Thu,  4 May 2023 00:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD0741E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DuJkZSHJRGUV; Thu,  4 May 2023 00:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E6B41E14;
	Thu,  4 May 2023 00:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E6B41E14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC87E1BF3DB
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 00:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2D0961499
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 00:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D0961499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNWRqKcejI2X for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 00:04:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF559605A0
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF559605A0
 for <buildroot@buildroot.org>; Thu,  4 May 2023 00:04:21 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5144043d9d1so4073177a12.3
 for <buildroot@buildroot.org>; Wed, 03 May 2023 17:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683158660; x=1685750660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GSxqUmcYrYvJr0Nse+dmJD2iuTN68rJHhyR/7AHMdiE=;
 b=F0CqBDiiZqjM/wOcMCtKWlXom/5x+ZlCygxMCcfyoQaxmNXqcpyOM5Dze2v01Yag7A
 h37fUxpypkekHGXc941BCTrp1d0pwgUowJa+acWNvaMQUtvO3tkzuiRilu50waCU+KTk
 jiJQTnBaByIA742SMHDHtU0AEm9+tsa9ZGeNzj753PfwpOUut/eBrR40E81G3PxZtlOr
 0vSVC7anayPbD+wm1Cdnd6BVr4hdR9VtZ7jiKYURqOq19ilC2EBOQ0hSopxTGlccTK6p
 TftE0Mi+D8KINjakowUxzs3QbEJPGbI8zYrLG+3NcUlg8YjpAvzT8kgWow3eaw2dIA4u
 WbWw==
X-Gm-Message-State: AC+VfDxv8PQm1/kHNKRdrZIengf9GDhrsGpui/WSVkfLCXcMI5n23MIK
 i/Nmc4QCe7eDuPFWv7zNr258srvj5sx2xg==
X-Google-Smtp-Source: ACHHUZ5kyIwHhvxDlR1SVumTx3biToupRi5/X5xc0yULdkfv10BNc2JVhruEPTpwcc/oGNuIad5gzg==
X-Received: by 2002:a17:902:efcc:b0:1a9:7c6d:abb with SMTP id
 ja12-20020a170902efcc00b001a97c6d0abbmr1825844plb.29.1683158659975; 
 Wed, 03 May 2023 17:04:19 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 4-20020a170902c14400b001a64011899asm22215049plj.25.2023.05.03.17.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 17:04:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 17:04:03 -0700
Message-Id: <20230504000403.1443221-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: bump version to 1.1.7
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

This is the last planned release of the 1.1.x series.

https://github.com/opencontainers/runc/releases/tag/v1.1.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index eee2e34cbf..1a68b74ccb 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76cbf30637cbb828794d72d32fb3fd6ff3139cd9743b8b44790fd110f43d96b2  runc-1.1.5.tar.gz
+sha256  f1885d6dfa188f8112328ac2355e5d67346174a2e2e795ec514a972bcbfcc2fa  runc-1.1.7.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 9c6b5f9b37..805ff23964 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.5
+RUNC_VERSION = 1.1.7
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
