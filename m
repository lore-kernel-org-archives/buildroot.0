Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078BCC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FAA040150;
	Sun,  6 Nov 2022 15:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FAA040150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLVCSzVZOkTH; Sun,  6 Nov 2022 15:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C6D400E7;
	Sun,  6 Nov 2022 15:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C6D400E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34DF31BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E7A640629
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7A640629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5zvs3F-l1G8 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:48:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABB3E40591
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABB3E40591
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:48:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5so5573819wmo.1
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lU720D86YTeaKqSCGyMh75R/0d9/5FkMVtTmdiKfMrw=;
 b=51bfe519+1DnKgIOzvO1d3pmpxoqpidHDvffw0FHl7xKXxe14yBlG0TltylHmbLGa9
 ZBWRmRxNNPPnkudg2PztQ7CuWGCW8tJlTDpMPX84Xe0MqXaIS15JLehfMBcb/u6LPU4R
 bEptuXaanK4oq3YAtru3/Oswtreze5vI3ox5SW7hK+oELDeCJB9OCuAAVI2NJRwoCEyf
 6eam2KApIYKOwC7w5KBt4YYkkyq0XdnbWPH8Bk6qTSBsOKHo7BAEcIah+Wwe5eNtALl1
 gLZlm/E5j4gNCv2Y8341bEuubRyNwZAz/pb7CuEh1olrU4tamtZRSpvrL9xrK0v3Dx/c
 KgWw==
X-Gm-Message-State: ACrzQf1MlLTbNmGIobJyyxwDmbkA4R05lzXaG00ZynMXpTD3sGwdp6Mo
 3Qk/T2jCiiPr2PoOSqUiPik1vrnlVM8=
X-Google-Smtp-Source: AMsMyM56LKFgbi5r4f7qXL7S5xX4HwiJy0zlaQAJDUh7oZj7oML3dYPJHl/w0RMFZsX4r7mdVEklPg==
X-Received: by 2002:a1c:5454:0:b0:3cf:7521:3543 with SMTP id
 p20-20020a1c5454000000b003cf75213543mr23887663wmi.172.1667749715419; 
 Sun, 06 Nov 2022 07:48:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g12-20020adffc8c000000b0022cd96b3ba6sm5714285wrr.90.2022.11.06.07.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:48:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 16:48:31 +0100
Message-Id: <20221106154831.293218-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lU720D86YTeaKqSCGyMh75R/0d9/5FkMVtTmdiKfMrw=;
 b=O45hJvwe0yGsk9PnHXXfEubeE13Kxa8epM65x1JLv9E1pVGaRhueR8A1JEpFCMdZLb
 nrGqNCXpKtv2X3ru396r/aoOVxsIlT5z+7+dQ3hrx1a5supdo3A8wLEHCBwpOxhGYEnU
 PIkD23Jb1DpkAqiVcR29F8N/BSHLWH9kmjOM9SqW1PIjAkE4gjEPjlCgmvrp+7oZdW2m
 dfxD8GIolpq6e7IHgq0auocKTPsPlGhX4RfP9V1qn99nrrO6BbWx4ANT7zzYHMaKplBh
 SsnG4LL6xoSZvEK8C1jZgMwyGYiZglnEtRXRA9rsY/MkbQlLc/pBysUpHgszgSR2qVzd
 n06A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O45hJvwe
Subject: [Buildroot] [PATCH 1/1] package/s6-linux-init: bump to version
 1.0.8.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of
skalibs to version 2.12.0.1 in commit
0f7bfc80814e90918b9527cab4cbf6afedd22195 thanks to
https://github.com/skarnet/s6-linux-init/commit/6696cee3bd309f61fc6c945ef747262a845e9267

In file included from src/shutdown/hpr_shutdown.c:8:
src/shutdown/hpr.h:20:40: error: unknown type name 'tain_t'; did you mean 'tain'?
   20 | extern int hpr_shutdown (unsigned int, tain_t const *, unsigned int) ;
      |                                        ^~~~~~
      |                                        tain

Update hash of COPYING (update in year with
https://github.com/skarnet/s6-linux-init/commit/42a91a98b780759257862642c764c2102237fea6)

https://github.com/skarnet/s6-linux-init/blob/v1.0.8.0/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/4382beeb0f94d583ba605c70a47f34b45c76e311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s6-linux-init/s6-linux-init.hash | 4 ++--
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 23f02d5359..f70a4f87b5 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  29e368516b1a3c61a6d1f8680645cc122a2e02127debec91738f170a3b93b8c5  s6-linux-init-1.0.6.3.tar.gz
-sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
+sha256  92055a7964cf66604066ad964a2c2392ee7c5e64821be03146c1341e0d8c3dc6  s6-linux-init-1.0.8.0.tar.gz
+sha256  1898df1e8703bd9c1350d2ec3397880b9b4c1451038a9ce5e1c4b2e58622da39  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 95595368de..6aec220de4 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.6.3
+S6_LINUX_INIT_VERSION = 1.0.8.0
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
