Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B9BC3F6B0
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 21:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41261403A8;
	Wed, 24 Aug 2022 21:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41261403A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id my4OtRpbA3He; Wed, 24 Aug 2022 21:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1211C402AD;
	Wed, 24 Aug 2022 21:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1211C402AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6311BF681
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 21:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 698D582F51
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 21:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 698D582F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwE0pxYhU9dc for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 21:53:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4205B82F50
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4205B82F50
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 21:53:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so1647907wme.1
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 14:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=UyazyBPlNLNy4l1B1vspr6vibyumkZrG7cdeGRt5eis=;
 b=r2KXT337iyqIBTA2wWZsCFk6YlahgxtX/HDobxvbw3ZLEOvstgdbrgAi7qH19WVkam
 BSwrSdhRZBJg2pwcmlqOUtmdZ+wIbRB/O/NggSO2TBob4wOOQzqZJTMpH6JIyhz0KhmY
 1E3qvUi6J5WSQv1/nThwZF9Emq7ROtSNmtZElvkoMwZrGWxgRcCea0TppW4Njs5m0Q5F
 VEtudZ7Deb/X87xMMuNisfr4ZiR0HBoE+stsBxcKCqm+v7Lhf/bE5JRanITj/UNFRwmt
 R/ZL0rTXK54kPXSQPjyYZwp04vCKs239rS26gEyeqoLoF48VvihNt9NOA80GNfZh+knf
 sAiw==
X-Gm-Message-State: ACgBeo2RUhvi3i7By0MHTa56zuAr/83b14xR5a2+S2bUyhazeBrQ0Mxm
 3orSdtn8CNStXnqZj5hRrFIEZkSM2x0=
X-Google-Smtp-Source: AA6agR5N/b1tb1iU6ipWsaDK1K0JZuoQAno14nPzFNYDqk8deC2aNiiIDipT7QjkA5+lpNiqer1A2w==
X-Received: by 2002:a7b:c391:0:b0:3a5:de98:f559 with SMTP id
 s17-20020a7bc391000000b003a5de98f559mr402051wmj.157.1661378004018; 
 Wed, 24 Aug 2022 14:53:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c35d100b003a1980d55c4sm3051939wmq.47.2022.08.24.14.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 14:53:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 23:53:18 +0200
Message-Id: <20220824215318.389653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=UyazyBPlNLNy4l1B1vspr6vibyumkZrG7cdeGRt5eis=;
 b=R8Hd10i0kpWs6T9Z17eFnEFg6a2d2n/4bV6CgpLMlCEnJqrJxZi4pH6CDqxhdpd2t+
 fktHkTXZLb4jaJV0cb5muyg41RjY5/jxYuOYCwcGxL4Ag9GnNSKsMm4KHzZCyREGDxp0
 fQ4UFFg18ADVUZz31PIxiJOH6ZgzlKeDcWhD9cJiEzVhg5Xs8ZGYw5omyKwLMgDOmgV2
 QA3/E0z1yoHFDCDd/UHZgTVO38FWbo69fsTUYXSQsNhk+dEyZFNrl3o8lcRn933V7SC0
 7i6m680TnPEuCzKaRjcJuOvU0GssOdcgCc46Ay3jOD1XfYnFfQk2QWA2yfbMl4apy8xf
 xllg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R8Hd10i0
Subject: [Buildroot] [PATCH 1/1] package/igh-ethercat: fix build without C++
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tools needs C++ since the addition of the package in commit
27ad470d7df5509ae4a96edd04521211900090e4 resulting in the following
build failure:

no -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I../include -I../master -Wall -DREV=`if test -s ../revision; then cat ../revision; else hg id -i .. 2>/dev/null || echo "unknown"; fi` -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -c -o ethercat-Command.o `test -f 'Command.cpp' || echo './'`Command.cpp
/bin/bash: line 1: no: command not found

Fixes:
 - http://autobuild.buildroot.org/results/89d096006839f32a3d03786e69e51ec3c5ea70f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/igh-ethercat/igh-ethercat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index b9771e8f8c..5004e4aa75 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -20,6 +20,7 @@ IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
 IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_INSTALL_LIBSTDCPP),--enable-tool,--disable-tool)
 
 $(eval $(kernel-module))
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
