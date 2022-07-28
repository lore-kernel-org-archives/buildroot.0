Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71ECC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 694D240B66;
	Thu, 28 Jul 2022 12:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694D240B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyi6TbXtQ4YN; Thu, 28 Jul 2022 12:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 883D940AF0;
	Thu, 28 Jul 2022 12:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 883D940AF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15AE91BF3F2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E41B740AF0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 12:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41B740AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqAlNkkV-xYQ for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 12:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BC540483
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19BC540483
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:32:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h8so2013996wrw.1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 05:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xbg2Mxvg3ershtL7WylYuIBPvT+3gAkFHQA11CBm2lc=;
 b=Gusm96TeiZGoxREB9LANDoV7/b3v9OsN+bppFt+mCQHdiwlsc/wQjs2Brd9gSHGGU+
 qXfHdXMLW4fZS/4unclo4bvW5fr3fu2OfkhQ4guzwk/rHZDH9rZ1aSUSmTgCMduD0UVF
 TCPHWkmJol52PyXxTaSMsu1TeDr8IF470e/lfsjqZF+lG3O+XSCf3uPG0xEDDXeXXo80
 KtyLieU3UzhEjoBkaYeDqKbmjhK+p/gy7OkH9yMlVaeI6W7dun6XyMiofvEf+geUhRiV
 9VVtdahGdUls2dAGTkaennGGYBuXRNHuIhhRwgjy8q2RnDHp3WP9cy4X4msDAdtZ18Qo
 pF6A==
X-Gm-Message-State: AJIora+9b0iPcwvu1N10sILYodRwIPMXsk9vOsHTX4pMOx060PkQZCBG
 DmkkTGN8pWrYmV1jVaHmZApWku4zYU8=
X-Google-Smtp-Source: AGRyM1tbf6qEw907bMcMbiqYwd892iB0kDN1pmH30cJJxIAHFlruGf19Dmu2nZrJ9FK+iziqsVmkjg==
X-Received: by 2002:a5d:6512:0:b0:21e:cdab:1598 with SMTP id
 x18-20020a5d6512000000b0021ecdab1598mr5082282wru.687.1659011538019; 
 Thu, 28 Jul 2022 05:32:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b0021ea1bcc300sm864952wrq.56.2022.07.28.05.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 05:32:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 14:32:15 +0200
Message-Id: <20220728123215.2617378-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xbg2Mxvg3ershtL7WylYuIBPvT+3gAkFHQA11CBm2lc=;
 b=FYsP4phLBcgcEUY1OanNDaYvViYeiFWDjc1CtxNhGBCf9OhlJjmthJYz1HDp7vFa3j
 mFcf/SpzzjhjIA+sVlnPeO6HK8izoJ9yul7S6fJNbTlhqWZxo1ijSpjl2sbBt+VS/jU9
 zHBt0CUEpFafxCbn2YTz11cRiqq5t3PNIZRBGILmHASyFRVAGdazaEZzkTHGWA6PHwx3
 oZrE5+QFVE/O0KQ7cqQAlu/Y404sM1larklPBMNM062JASUVoYgKEulBGLLdABxJZuIX
 xOElWZh9apgLDVyYUQcTYUepZvNFD1jSb+ZYAltLSAz6W0EiGAGcWwI/8IbuKPd9ZUE9
 wJRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FYsP4phL
Subject: [Buildroot] [PATCH 1/1] package/mpv: simplify alsa-lib feature
 selection
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of having the user need to figure out that 2 alsa-lib features
are needed for mpv ALSA support, have the top-level mpv option select
the relevant alsa-lib features, when alsa-lib is enabled as already done
for pulseaudio in commit 97cd3680a4cc4bc0c71bccccb1459eda4b880159

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/Config.in | 2 ++
 package/mpv/mpv.mk    | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 81b1e24b5f..6811497d73 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_MPV
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index ff77f248e5..f9250070d1 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -39,8 +39,7 @@ else
 MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
 endif
 
-# ALSA support requires pcm+mixer
-ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MPV_CONF_OPTS += --enable-alsa
 MPV_DEPENDENCIES += alsa-lib
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
