Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F24C001B2
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB93401B7;
	Thu,  8 Dec 2022 21:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BB93401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdDrukJRZfpH; Thu,  8 Dec 2022 21:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 218D7400FE;
	Thu,  8 Dec 2022 21:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 218D7400FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08FAB1BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D520F607EC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D520F607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnRQWJ22V7FS for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193D46076C
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 193D46076C
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:24:33 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d82so2270052pfd.11
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oCpmYQCzXLRAhlLSstD5jq/K0rty+cgZmYwukK0k8kU=;
 b=iJ65iL+LWpAZLP0zgj6Arb5tUtgNqKfsU+qK5PJjjeknk2PEjH3zJTwPDCyLct81hy
 Fn/UOocNjxez+tXVXe7sn8QFwk2YZDpDopil7JLhKXZ7rc1Vl1D9zFHoYCRX8kH4EEJ4
 oJMB330u3TTncXDPzEynbsGDbVBmqBS7xKjamtBvaFHphEkFncqU+5K2eVSqjZ8wHvGk
 pHqD7D1uM2he0pVy2bX3hKWB4hhV6IKBZ0Dm38QsjkE18WnCEP658D5rtEKy8xQQLTdY
 tbf2CKNA7RyAkSD5WfqIf3kAujCx6uUrmEKUysURngIUE3aqIRdOi6DowseduHv/Oh7z
 PXiQ==
X-Gm-Message-State: ANoB5pnq684Llt4S04GX/57fyhREjMBNMr4xn9Oj7+KQtkUMGA5C1iLt
 ODeDd+sceVMfErRqmEB2BlXXMwCtsrk=
X-Google-Smtp-Source: AA0mqf5PD1A+2SxIuWKpzAvOoyRthK2+fcQ6biTitJXveOfXicQHFnsK41RherEAJ4VQ8e+nfa6A9w==
X-Received: by 2002:aa7:8252:0:b0:574:c62c:2f55 with SMTP id
 e18-20020aa78252000000b00574c62c2f55mr2940206pfn.3.1670534671933; 
 Thu, 08 Dec 2022 13:24:31 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x18-20020aa79ad2000000b005773bd639besm5688248pfp.10.2022.12.08.13.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:24:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:24:29 -0800
Message-Id: <20221208212429.4112736-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version 2022.3
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes and code cleanups.

https://www.open-mesh.org/news/110

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/batman-adv/batman-adv.hash | 2 +-
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index c5add4cdea..14a92c231a 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -2,6 +2,6 @@
 sha1  e1829e10fc37ea674a20cb9ba1d6c1483042fbfa  batman-adv-2022.2.tar.gz
 
 # Hash for license files
-sha256  8aca27c6f168b137a7ed7031d58169396c1a97f958c2ea95b9c30a9b92576fe0  batman-adv-2022.2.tar.gz
+sha256  218ffb534fead1c9b5b0d90ec1b2fba688209cdf00e861bece1cbf469fe69953  batman-adv-2022.3.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index d279694bf5..75b8292ee1 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2022.2
+BATMAN_ADV_VERSION = 2022.3
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
