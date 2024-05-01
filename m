Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617DCC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2407E80A81;
	Wed,  1 May 2024 20:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYpsEz9WXh8G; Wed,  1 May 2024 20:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A6B80B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A6B80B38;
	Wed,  1 May 2024 20:03:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8BE1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0240880B38
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QBcQDpWtQ16 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20F7D80A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F7D80A81
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20F7D80A81
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:03:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so55106745e9.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 13:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714593785; x=1715198585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LLd+FOgEx2VeLKy9LjmZYuwgcfgLx7Wn5FLOMgnba6E=;
 b=C4c57EerylPA4C/Y6KuqE7BNl77oEttAYiFvrsErSDUGhO432wH/Ngj6lMH/DsSdbY
 nOf7Lhc48Gkilx3qkzNwTO5LzIkYZiJRsdTD3ZnNi7azMsD7UP+Upv9x0hufuWc4A9s4
 bdCwL/Vg0hVTMdcq6uzjLh6lX9550JiineGvtC6YbJwThM3k1LNdCj2Gq/Jv1g6yA9Dl
 BwWInbXlFKbLYQqG8H5Ovi9pcPd7ICkH0vbBTFge7XPe7MyGE3yCkMLJ68S+w0gzBO0F
 xreyUsZC6ap0127QUKasbzXbyoZk8rRdeB7As6UahePsZ51tyn6WAkKjQnla8+KPBr1g
 pTbA==
X-Gm-Message-State: AOJu0Yxd8ywOdzi+5BGmbw964fileXzBg3F3CXI2QduluimeH8b0fM3b
 jPo7QDt+qJqZkrHTgrW/ijFj7p0YGVWQiqYHxypj9VeqeEJIhrA0ewuzVT50gd0+Et8sDTpc6oW
 H
X-Google-Smtp-Source: AGHT+IFvYiY0j0DIqCVXOn2iRouGkiLqhOoMyIg31m7IUQKStioIIydA6ejEIsOPbrF4CYzVcm//6Q==
X-Received: by 2002:a05:600c:4ed2:b0:41c:11b:b36e with SMTP id
 g18-20020a05600c4ed200b0041c011bb36emr2281137wmq.16.1714593785023; 
 Wed, 01 May 2024 13:03:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 o27-20020a05600c511b00b00418a386c17bsm3159382wms.12.2024.05.01.13.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 13:03:04 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 22:03:02 +0200
Message-ID: <20240501200302.1585821-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714593785; x=1715198585;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LLd+FOgEx2VeLKy9LjmZYuwgcfgLx7Wn5FLOMgnba6E=;
 b=XdhwuvCvrbFNbhBS2/W6N2ZH2DuP3G/TLFFJLLWanX3pX2FO2kqp0rA2Wb8rhuGwKj
 PsrSVxeTbGqSiiJoOBJVla2iA4Vp+xK4JtdBeQgNcoJSaQYev4HKotMURUNi/F6xDKj4
 JReQOLkwny+/IhHl/vu7IHhBU5o4LTszm3uw9fg1jT0Q08qHS3aIkOfQsGR9ij9XcfyR
 x8j0yub7KDMXY/3SH25+JzVBMxSQHYkHRCUI0m/SqvpLWOd/hLrf8aQG2w8AdUSspipE
 DN56p9dOx4ag4M4X/Z411Yq1oa/JN7+Wcwvd+epGomZ8/002QSMz5Ty7x9iYyFxgLzR9
 GEHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XdhwuvCv
Subject: [Buildroot] [PATCH] utils/genrandconfig: remove Sourcery CodeBench
 Nios-II exclusion
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII has been removed by [1].

[1] 7fa0159a5055363d002089f0c451a84594732cf2

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 utils/genrandconfig | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5ebec415b5..df6bede158 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -294,18 +294,6 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_BOOST=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_FLANN=y\n' in configlines:
-        return False
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
         return False
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
