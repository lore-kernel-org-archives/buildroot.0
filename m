Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33F7C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 06:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93D561101
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 06:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A93D561101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A9BB400E7;
	Tue, 24 Aug 2021 06:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOYt350BiHc9; Tue, 24 Aug 2021 06:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C263B40177;
	Tue, 24 Aug 2021 06:44:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55CA21BF339
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 06:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AA9540177
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 06:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPMm4ru-asK2 for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 06:44:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6287B400E7
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 06:44:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n5so17270082wro.12
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcqFv8DjmWeNeNmAwQ7ZKDBtdCLRvGUqANA1NC1ut4Y=;
 b=n+6OmvDp2In685B+cEmABxGVSAlXQMGR9DGpxxEHZMuvC2L1ySUi7PrVuMLj9yOqkL
 kW55y4WbYD7OCj3PAQ0QJzjWuz5otR5j0z0cpyc+EnayxaTy3t8Pj4QMIIPMjSj1xv5G
 ubqU/aBKECbB6kLf2W0e0FzyiGSc7qWzj6AWfy26GInk4KfTUeR9/9EcomHAlO2Ku84/
 PlLXv8duIR9ZRyoOKsmTpYxnKej2KhL9o0PcInZp1sCpUzP9VIvWnQELtb4hvmKQPloi
 DlslyO8QEkN54i6C69zof6bty/P/qC8SPe2uXZDITWkQIXUQflxPF51Aa/bnx+eL58Zx
 rBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcqFv8DjmWeNeNmAwQ7ZKDBtdCLRvGUqANA1NC1ut4Y=;
 b=di1HRZHk2SmHsjH7V64uEqC83NxbTTRU8YdTTMcvtkCrKMS8DQYp3hLdnJbEwp3fEc
 NeWXIFld7m04P42ABVgNwUZm5BoIpIyCMn5BlK0xIpuftdYCbV0npbFO2krl28r4EVZT
 q+P20UEnljcY5QeUzbXj8VrucmCJ6wjotM8l84bqfTTDpuiXVqMzCKm9BOFlcKc8ZcaP
 YBKL95vy8RoGeOkbREbgax9tRHLoPdPvax/FVKoXGohwGDVCYnAKrhH/oq8ITm+1Toih
 OxgF96IjOldR/d1TiyNebRYkm4+VVOSrKDe2hzUur44wlpf1o2hyX31lj5o/TaFP9bS7
 X37g==
X-Gm-Message-State: AOAM533VBRh+A2mMyJqQ0CceB0TwQj6y1FbZbRjbJI7Pc27Y5O0xoZlR
 vX/TdZ7WUOXAsvsiFwDRZ3/nCfGiLy3uUg==
X-Google-Smtp-Source: ABdhPJzIqBya4lq/3PH6XSLVsGPemmSA64hv+Lev8IngBnLpI5Jzsmftjb9tCdy/aGQBSab9Tj1MuQ==
X-Received: by 2002:adf:f645:: with SMTP id x5mr12342768wrp.353.1629787468249; 
 Mon, 23 Aug 2021 23:44:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id 18sm1521237wmv.27.2021.08.23.23.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:44:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 08:43:57 +0200
Message-Id: <20210824064357.92124-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sdl2: use BR2_PACKAGE_MESA3D_GBM
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

BR2_PACKAGE_MESA3D_GBM should be used instead of
BR2_PACKAGE_MESA3D_OPENGL_EGL as spotted by Arnout in review of
https://patchwork.ozlabs.org/project/buildroot/patch/20210821093908.677218-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index a487b8de60..bf3ba9d5c4 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -31,14 +31,13 @@ comment "X11 video driver needs X.org"
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_PACKAGE_LIBDRM
-	# requires libgbm from mesa3d
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_MESA3D_GBM
 
 comment "KMS/DRM video driver needs libdrm"
 	depends on !BR2_PACKAGE_LIBDRM
 
-comment "KMS/DRM video driver needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+comment "KMS/DRM video driver needs mesa3d w/ GBM"
+	depends on !BR2_PACKAGE_MESA3D_GBM
 
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
