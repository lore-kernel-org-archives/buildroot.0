Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1BDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 09:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D88607FC;
	Sat,  4 Dec 2021 09:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wkx0Xgjs4-eg; Sat,  4 Dec 2021 09:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BFD6072F;
	Sat,  4 Dec 2021 09:19:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 789711BF5DC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 741DD405C5
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q74dpq-7fPxj for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 09:19:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C22440376
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 09:19:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so5720674wmi.1
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 01:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NnlWjWRjW61LcSuVzNXs5eBz5NEdFZxyboXFuSFQgNo=;
 b=QFACnI2oRN0u3MWt3g/wR/l4Qx/Gouz5GBRkToNYNV8tH17Z3UPGTrbmMgCc0RY+/P
 kRv5B8995A2slYYRVRhZvttvWooOeFwpbvUMmGC8cHF7d9mqRjqG1Byna1qzOSK0N6Qe
 lqeeP8T3dnwc06tPQpuLUznDjCFnLMoASJ3I1JRUkfXjxwB1xUcn7mpPIUvIrwpMi/wI
 GCZWSz4x3N3H6uBXZOjx+Cp/P+9WqSGjrZ+Ry2xKIiaryUp8KsY3PsHYNb/Ay1y+3zK0
 sjQ8d05pfbFJBu4vLBBnLyN3gABxl/xALgyu61mv95PiuqCCS+96maEjQ9oiEZJoMo0O
 wugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NnlWjWRjW61LcSuVzNXs5eBz5NEdFZxyboXFuSFQgNo=;
 b=vSMTuHO/x2zxLPMg1zEGL3CSORqVz0RlYIpsJtBBFDEutkqmiu+IGnOYiALtSp3lxO
 jxi+/8DwVY8/7Oc0wkeUXiirwtqftqqkl0pcrpDpYmC3s6jH9fMAINS+kIjgTtHAfTpn
 +H+ddA60ZW6Vh6J32pUsSkx/3Ef86xPTDdUedUoN4LJIHVcu4ZX0iC53p/qbEpKRCg/A
 PI9kspKQDgILJVMGIcdaNeEuc+dptZTcRqDXf58LUFiUtr8LrVcq8gRIkXsyNTNn9WEO
 UIH/gm9YgLHAERkJjy5r7F/W6NAhUmAeYlv+DhN4J79T59oGh3iRgVyCw1zmxyZh5AoF
 zWDw==
X-Gm-Message-State: AOAM531BflYdQmxtMYttyBjDf9IiXz6Gjk28fS+VQhTfnSrMzbCMKMXf
 aU94w+X2SybgTSnErTbrx70cfZ0G2tSR8g==
X-Google-Smtp-Source: ABdhPJxFg2gfGMFHDfFHpjjN2qOGopWZTPPbudUnlh376qt/c/SgNPK4tV1JSPTnwR3xhXCJbzHEFA==
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr21368277wmo.179.1638609558134; 
 Sat, 04 Dec 2021 01:19:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r11sm4971589wrw.5.2021.12.04.01.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 01:19:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 10:19:27 +0100
Message-Id: <20211204091927.2016305-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/motion: add MOTION_CPE_ID_VENDOR
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

cpe:2.3:a:motion_project:motion is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amotion_project%3Amotion

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/motion/motion.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index dae812b9a4..5d54ecea01 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -8,6 +8,7 @@ MOTION_VERSION = 4.4.0
 MOTION_SITE = $(call github,Motion-Project,motion,release-$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = LICENSE
+MOTION_CPE_ID_VENDOR = motion_project
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
