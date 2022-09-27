Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8296AC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 22:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA3A881498;
	Tue, 27 Sep 2022 22:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA3A881498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ja191nRmTJa6; Tue, 27 Sep 2022 22:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D23E81489;
	Tue, 27 Sep 2022 22:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D23E81489
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 493631BF592
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5D3401A2
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 22:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D5D3401A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQ4vOTbRxC2u for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 22:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB59D40198
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB59D40198
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 22:11:38 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id b23so6918290qtr.13
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 15:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=JlZyGSChssnz2xZZHAjkag1DBIUDXbQdBHhlXNu9vcY=;
 b=TJHA6CEHg3uBxXYH4whkzXEnmmrgjX1Spm4ybjKAQO8XfBNuDJPk4y/Vd1cOujf4HU
 T4yxRCCYuNH1xAGHPliB1UkcAe4TVFjviEAzJ79nsD56ujOjdP/bBn8G8I3FX86YzVSW
 xTyvnV5S3v8z+dV4eAwSMH+ZOmXACRPPCjfk4CvfrMnvY17OToyZO34xC3FRdL58HjpB
 W82qKIj1iWX+iq4O6+/TZX5iNgVTPsGqGCOQl/s1jLyHgE54mhcITsiIXS0012WG/ZBY
 0r1EZBrbjOUMHXUKbah3jWm0fZH/vqJEEbJcFDcoLH7kX2pYheOb6E34UU1FoI26YZW8
 lRRg==
X-Gm-Message-State: ACrzQf0Dyb3tFAjzMR/BhONSauIbVuQyFmQO1SbTT97Ye0+QX9OKLBg6
 JVTuVDWEoV72BxdnvoWHUn4YSdetyp8=
X-Google-Smtp-Source: AMsMyM5SNzoSAWSqQzrvXVxKu8SpRcqEE2JUH2+Xy+JVEs47FU59D0+TfBe9nf7cqEWPzowl87/jcQ==
X-Received: by 2002:a05:622a:15cd:b0:35c:c425:bcd7 with SMTP id
 d13-20020a05622a15cd00b0035cc425bcd7mr24270637qty.156.1664316697362; 
 Tue, 27 Sep 2022 15:11:37 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac87388000000b0034367ec57ecsm1571441qtp.9.2022.09.27.15.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 15:11:36 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 15:11:33 -0700
Message-Id: <20220927221133.594071-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=JlZyGSChssnz2xZZHAjkag1DBIUDXbQdBHhlXNu9vcY=;
 b=FYtHb+zV5ExS8UOLCbzGRN/x6jG5z3rBVa/fgI3OMSdYEbCV/VugGJJdlUiePBVOGN
 Q7xKQv0fULQkPTTKd1ErFBxV3cY/T15aNuQn40Nv1jLC0VEHbbmQDKVENzJHFSC4Swha
 cPXZNCh5pfNEBmDPi7nFTh+lNhWW7B12pxSbI+2Yk/sbOlvcVJEp9ZDwmeE6AidWgYjD
 Rr3wvEsAwZ2ak8Hh11X2KIOJUNQ92qU6i454rT+nADWwcKxg0+wvD5Q/nKAAqjdMckm/
 fOLEgkQ9oWma2CW+mKM2HkhHHOPe2VJKDQas6L5Q3VdS1U5KODmTVG7ohBqcJniMW1RZ
 ZaNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FYtHb+zV
Subject: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
("perf tests: Add test for PE binary format support") present in >=
v5.10 there is an unconditional installation of PE binaries which will
be rejected by the check-bin-arch script.

Make sure that these binaries are excluded from being checked to allow
the installation of the perf tests.

Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index dda63cccecb4..c22097316264 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -169,6 +169,10 @@ define PERF_INSTALL_REMOVE_SCRIPTS
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
+
+LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
+	/usr/libexec/perf-core/tests/pe-file.exe \
+	/usr/libexec/perf-core/tests/pe-file.exe.debug
 endif
 
 define PERF_INSTALL_TARGET_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
