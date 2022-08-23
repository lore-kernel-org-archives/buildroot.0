Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972BCC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 216A8812B5;
	Tue, 23 Aug 2022 21:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 216A8812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgugaR-MVBsA; Tue, 23 Aug 2022 21:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3969581281;
	Tue, 23 Aug 2022 21:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3969581281
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B92671BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9238E410B5
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9238E410B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_UzPNqAt_ig for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0936A410B4
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0936A410B4
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:22:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so7227904wmk.3
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 14:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=YcjpHcwK0YVqbswZzN261LhQttxbCf36QhKh0w78TXI=;
 b=tAGqZgsotlg028KVhToBT0YUTlbSQ5fTNqrbPJVnzztPSVzyocwlJAsv04ocTl48Qg
 WPeWxKMNeU+AvMHbJay/zoa168q2P1WeKCHcL2SAKIBS06SxCDTUDIvIX6uWAJdVp9o/
 pUPWsqPwnOHBGdT6CZ6Sta9t94wAHdPjgg8xJkK+8hOSgpiOfXtblTH1sAGW2ByuYemv
 Fg/PuV3rFJz3K1Hw/nlhoy15eujqC4wngQVTADBl1fRUXyvmwZxSURiL7s7Te2Hq4/Ty
 DnTrsqVsbnNk67Qo1ymSAEAbth96KMDhDWQPGJ3wMH3A1A3h3CCnk8FtPnGVljfHk3Jp
 sn8Q==
X-Gm-Message-State: ACgBeo2j8aAm1IbpkvXrYAPH2QXl8qZNFvsGNxFndyBezaeRgsttShei
 8pUb9bnhyiXBxth/5VF+6JJkfQu0M00=
X-Google-Smtp-Source: AA6agR4V1ztqF/IjPg/tdrcaM0SBv5Ham4n1K7M125z66mhcwBUZ0apyyk8ZKCfE6Ti7csSjkb0rFw==
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr3442749wmp.151.1661289742892; 
 Tue, 23 Aug 2022 14:22:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d12-20020adff2cc000000b002238ea5750csm18672944wrp.72.2022.08.23.14.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:22:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:22:19 +0200
Message-Id: <20220823212219.5066-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=YcjpHcwK0YVqbswZzN261LhQttxbCf36QhKh0w78TXI=;
 b=O8etwUVZwfFYq3dPY98DRrhXCvKzGByzWC7P3rrtv/kd9YSD4nLbWP+v7VOqZyHN4m
 n+0Lh40CjJs+SjY7JOBRMDCUSq6LwlAMBi82tc/EG0IWlMlM2h3+dxG8k3p+YBOSZid/
 2XhPD9c9unKqssD1mr1pTzk8a3qfxSlA+5DFfCq7cSNdUyCeuJ8XdHOCRsViLwNjecS7
 eSLZ/UkaGUlAoEKHo8S2+CvvQmxjPqFl61C7X/jsyZZQDW634mbPkilR5zYYbiNo99eN
 0RTnnUXANnhUnrdUA2Y7r9F7FLX3scWPxp+7LGBQsMVNQYCwF9KOJPSh0qmS7guxalwD
 8F0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O8etwUVZ
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: altivec needs VSX with
 little endian
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

In file included from libavcodec/ppc/audiodsp.c:31:
libavcodec/ppc/audiodsp.c: In function 'scalarproduct_int16_altivec':
./libavutil/ppc/util_altivec.h:123:5: error: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Werror=implicit-function-declaration]
  123 |     vec_vsx_ld(offset, b)
      |     ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b772d285f978ff9bc3b07872d009633c943f20b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 82d229903f..7038f4f5f7 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -511,7 +511,9 @@ endif
 FFMPEG_CONF_OPTS += --disable-asm
 endif # MIPS
 
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC):$(BR2_powerpc64le),y:)
+FFMPEG_CONF_OPTS += --enable-altivec
+else ifeq ($(BR2_POWERPC_CPU_HAS_VSX):$(BR2_powerpc64le),y:y)
 FFMPEG_CONF_OPTS += --enable-altivec
 else
 FFMPEG_CONF_OPTS += --disable-altivec
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
