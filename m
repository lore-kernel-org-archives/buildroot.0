Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9BAC5479D
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 01:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D924081FEE;
	Sat,  7 Jan 2023 01:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D924081FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2HBVQftojzb; Sat,  7 Jan 2023 01:04:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1894481FB2;
	Sat,  7 Jan 2023 01:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1894481FB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B02861BF59B
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B8654026A
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B8654026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJOIUOmi_4Mp for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 01:04:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E14C540022
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E14C540022
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 01:04:44 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p66so1639445iof.1
 for <buildroot@buildroot.org>; Fri, 06 Jan 2023 17:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eKFV2b0eedpsySzLR2yqZCM2V/FpAQ2RSRycv6APphE=;
 b=dtLCYPNF20TpVkjX9vBh6kqcETaFjKxeqHMrDIV1ypkNBsm62GdxWr8jq2t0UViASx
 zgIbTZ/S2PoaBxnSRCDz3YkmNF4grHEkw5C2Yo4qdamWlXpkJtLd3IRCeJvr9TtIXvJx
 NSV2BhNiDskWlTYfm3MGC+yRiuFI3birci/xHSn5BlPiXCterpFt72jsLzQGEHFoZyBP
 Y8Sp+wm3cbvPYubEmu3gDD52IcVdsPkd06F0zIlCeKfTm2379MTKCQe334EvuqNihgo9
 kpj7LIofQbONK+o16g74A0vX1+RGOZiBa5qVJgmlKNL0j2HjdevG62xnC6rLxh1GGcxS
 LG2A==
X-Gm-Message-State: AFqh2kr9M1sdJHyb3OptqDk4m6w7DWrIfdrAh6BkhorTgXJuqGFwWmKY
 LhGhnYGVW7SbLpFniUr9McK9fCPd06PvEw==
X-Google-Smtp-Source: AMrXdXt+ckZ4OXo18FzphTsfB5Gkl7YwKr891GOqquMulttoBQ5Cz9pRcy86kr0J2sAQ7bVDlc3qvw==
X-Received: by 2002:a5d:83cf:0:b0:6e4:720a:2391 with SMTP id
 u15-20020a5d83cf000000b006e4720a2391mr36463826ior.2.1673053483557; 
 Fri, 06 Jan 2023 17:04:43 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e26-20020a0566380cda00b00363c4307bb2sm725938jak.79.2023.01.06.17.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 17:04:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 18:04:34 -0700
Message-Id: <20230107010437.2471513-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eKFV2b0eedpsySzLR2yqZCM2V/FpAQ2RSRycv6APphE=;
 b=kbOxDCnKb/WBPA+MkuLxdtxV7obeHEGmSx2nwVFyFeDwxyuTSRvr9O62Jr6tsUcYx8
 9hsxLNxg+y0HgqhqdmU3Tw6Ai3zt3LdRA+Un+QaL+BoDXsy164PqDHTmPi/QCKFQ2MJc
 5UQQg8y7NcA5Doa9x/Vf2gZ6aGsE3a4XvphQGXvD/a1hBQGIt81u5z6tolKZT86nXd5a
 YuzC+Upfa2Kr8qk/8DLlvHxUpSjYRMiVBhK1amTVKXk5cDysmTduMxLX4Ibj/ArIbQna
 6cF+Qe6+DIq/+2isXLvDDPxX3nGRVegBRpsC+mAI9LoHAuNZ813x/O+pgzp6sgB2is69
 7O2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kbOxDCnK
Subject: [Buildroot] [PATCH 1/4] package/hiredis: enable host package
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-hiredis package is needed for the upcoming ccache update.

Note that we must disable ccache when building host-hiredis itself
as host-ccache depends on host-hiredis.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/hiredis/hiredis.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index f79b6c757a..f2a4836310 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -22,4 +22,13 @@ else
 HIREDIS_CONF_OPTS += -DENABLE_SSL=OFF
 endif
 
+# We are a ccache dependency, so we can't use ccache
+HOST_HIREDIS_CONF_OPTS += \
+	-DCMAKE_C_COMPILER_LAUNCHER="" \
+	-DCMAKE_CXX_COMPILER_LAUNCHER="" \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DDISABLE_TESTS=ON \
+	-DENABLE_SSL=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
