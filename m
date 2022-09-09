Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD20ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 05:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09B3C40BD9;
	Fri,  9 Sep 2022 05:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B3C40BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtwtPsDchDQ9; Fri,  9 Sep 2022 05:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45C6340BD1;
	Fri,  9 Sep 2022 05:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C6340BD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2E561BF5DC
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 05:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A71E183E07
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 05:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71E183E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8orvguLXvtf6 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 05:08:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C98D5830E3
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C98D5830E3
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 05:08:15 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-12803ac8113so1189942fac.8
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 22:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2/Fe0TEKcI7Y5bU4H04bQ3QyXnFjVkYrpPjLxCURKY4=;
 b=d1l88ppzoVz4mnokt20qAI5XN+Xw9DIjr2mYsJzApG96+BUxd71jQxG44cGEOYYowl
 um5Q1TLnmCnOzboWydUdubvrUkrokLykVzafOPBWRxtEQJnxctQuqpTPIIFRyx3hpmMB
 P9ZgUDtn47Vo6eNbHGyhbIcPL6JUeCIVHYxZxqDcUcGLYEPNaJhxJzgSZzjAh0OVfMX5
 WbdNZuKpocPwz19qcWUGOCu4ctPcT2pqgTFsQ6rwrwUHfyZWwrPpu6/IrGlglWIX48uC
 qTZM1x/s1ruSkvpqbCa1QtrnfhE2wSHqY7sfr4OHXZ14mdrjg9NoZkee+Pw/ATsyFbqn
 DBmQ==
X-Gm-Message-State: ACgBeo3/UH8JnCg6b4FfaAff79LojOsnClG460u62q/mDdx786wpwCQE
 jXVxH+NcaLLVgKMLAHreZywmSdus5o0=
X-Google-Smtp-Source: AA6agR6MVWCX3JLwYsN7+ueH44el3ddMWV9N1YUM931LrXYA+MnT/jN1qxsJm05I+6IzLqpYvb68Mw==
X-Received: by 2002:a05:6808:11d0:b0:347:ca40:66ec with SMTP id
 p16-20020a05680811d000b00347ca4066ecmr2772460oiv.214.1662700092967; 
 Thu, 08 Sep 2022 22:08:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 d85-20020a4a5258000000b004320b0cc5acsm283125oob.48.2022.09.08.22.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 22:08:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Sep 2022 23:07:59 -0600
Message-Id: <20220909050800.3520691-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2/Fe0TEKcI7Y5bU4H04bQ3QyXnFjVkYrpPjLxCURKY4=;
 b=lLLnvEz+d8mfkvSeobiO8YlsTSMuM0VOtlSafEG743uUwImfFwHRPnNDa9IWY3o77Y
 h0Dv3GE2cO/mQqP9A1bhoTlNefAicNzXWaY3NsoV40OIjnt+SKIVPDYyA8NSXoBODMtk
 Md5pClond4F47StKJjDKdkt7/2TZLS81zdLczoLbD5SN8scHzi7Ma886AOg6a3cIvM1F
 SYTpxTZgtKwlchrwYj1ca8MWvo4lk/4U3NAJ6mlXGtmQrEYxEe6GJvQB+iDwOZN3MfOa
 Sd3d3WI72fHas9/jTn93avQ+vxrUkiQR/OC2fHNyJg4G+jkgPX0hIPNyQZIjttZXlyad
 anDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lLLnvEz+
Subject: [Buildroot] [PATCH 1/2] package/weston: install to staging
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to install weston to staging so that applications like cog
can use weston-direct-display.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e6c54ee7aa..5e71473640 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,6 +10,7 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 WESTON_CPE_ID_VENDOR = wayland
+WESTON_INSTALL_STAGING = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng udev cairo libinput libdrm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
