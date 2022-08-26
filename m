Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9997EECAAD6
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 20:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 224934016A;
	Fri, 26 Aug 2022 20:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 224934016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GF75avYbO3-l; Fri, 26 Aug 2022 20:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 441FE40168;
	Fri, 26 Aug 2022 20:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 441FE40168
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 799C81BF2A5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54C1940168
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C1940168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPLmBwcG5MFv for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 20:58:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CB19400A6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CB19400A6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 20:58:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso1425940wmb.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=O518cWRVNVTG9NzEWhADrdkS1lFFlu1YDM0Ec3h9lgM=;
 b=FFzRKA2/rE+me2IcWN7uTyh6lOh5Q9g4Ktosy0a6EZW4zADYXCRbSHj9otzTnzSC8u
 TTgAn4N1/0/7UA6kB6RbUa1/8HsxrdU3c1pVwBSb35bkockVzC/6Z3T8GOUO74+Fjh0R
 vOZz9LhVHPnJCpirkaOdK8Ix1nuOuAt/Z8tfMozpCweXmvoJYWp0sQgDGcrgV/bGV1Lp
 11/u76G3+nSX2vbnZ5PDt5iGNfQaTNdor13B9nqFuiEBo7hMWkdKPXHzWqRM2MCg1cDC
 GkJ3WGpM2YheCVSzQaz6t94G5RSoKghy7Ho2pOxQE+uwsngzjJUUsiMh9c53m+ieuo/t
 xGtA==
X-Gm-Message-State: ACgBeo2OMDkhCkuBs24tLrXOIVKjriJziuphoXzUiMCHdmnGFuoOPdyW
 kZI83x+6wfD09qM4aPPHmPPxDErcq9Y=
X-Google-Smtp-Source: AA6agR7b1bAE2JPQXW33QM9VFms/LJUi6rSyi8zXVKS8amQmEwolCQuclHCo98rRLHuEmxMnbNWNJg==
X-Received: by 2002:a05:600c:3846:b0:3a6:5294:d0a9 with SMTP id
 s6-20020a05600c384600b003a65294d0a9mr718350wmr.28.1661547478360; 
 Fri, 26 Aug 2022 13:57:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f24-20020a1c6a18000000b003a541d893desm599391wmc.38.2022.08.26.13.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:57:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 22:57:55 +0200
Message-Id: <20220826205755.22469-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=O518cWRVNVTG9NzEWhADrdkS1lFFlu1YDM0Ec3h9lgM=;
 b=EMMbRN4tYKN/sykPVbmEDCn7fSdyFvsQMU91YuXM+c1QzIADaYUIiWRbhsCrU3oyd2
 qZEFENypotYks/SzEmrEoxoCT79n6Oyf8GwEzbvzCA7aZpJOxjZs9ZxFwOUatrAwfn+0
 t2oFus08BABYBFRoDNYX/I5ZuUPoaerWrjt/e1j9VpV4VoExC6iLxyrxVXGdIg8h1t0s
 T67P0O+IYJXRHgk7Usts1LPDUtq8Itey5nkAYli+WhoR/BT9wKXAjwMh+qYFuy3nFJNX
 7vbcues4/oZebOPuPSvFdIlFc7olrcNR5kplXgObNwGTB2fxUZHyOzqn0gqbL9JxiOYL
 S1hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EMMbRN4t
Subject: [Buildroot] [PATCH 1/1] boot/edk2: fix legal-info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo: EDK2_LICENSE_FILE -> EDK2_LICENSE_FILES
added by commit 1074a37e783b023bd0491ba4f4f7acab7f289e1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/edk2/edk2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 2b12de53cb..5cbd9d152e 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -8,7 +8,7 @@ EDK2_VERSION = edk2-stable202102
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause
-EDK2_LICENSE_FILE = License.txt
+EDK2_LICENSE_FILES = License.txt
 EDK2_CPE_ID_VENDOR = tianocore
 EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
