Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2346C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E8F6108B
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79E8F6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16356834C6;
	Sat, 11 Sep 2021 08:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kj-ye4AxCw_O; Sat, 11 Sep 2021 08:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5442583298;
	Sat, 11 Sep 2021 08:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60F291BF3C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B0346065A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcvJ2Pb0Ql_f for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 08:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B8D160619
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:20:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso3074051wme.4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 01:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DOpCAI0fMMUcrZpAdiC3t/a2KYM5ZWnCKX/Pc7nGE+E=;
 b=ajDroSfJGz1/bbVa1SzAz6YQwiptYwT5d8rAUkuONFOTaNVUQO5fwkL1UjX21UJJyO
 GuPe9t0gyvuqjB3sXrWpriagtTMUj5jB1zhDheZaQjfE6c5MxPX9DB/k8NymFPkTNfK1
 ww33l/kt5YjAgWsOWedgj/pHI8dNzmNJxhwh21uXxEd5nekQRtYkN5/0FJLH3jAw3Hwh
 QGFnBUoFAOogyPYCYvMtHT0jPQiZZb6xiSTGNOxYZHKmlI1wKCKBxJNDrXdXb8iNyPW3
 E7izqwWSswSzgL98hZdKFwSfPFGQFctcQPX2Ks1kGqFvOEkJog8IY4dJNer8vLJUkh86
 DVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DOpCAI0fMMUcrZpAdiC3t/a2KYM5ZWnCKX/Pc7nGE+E=;
 b=Ccdzh3UsNInVR13ik6fZ/P18DnJ0ZAoy9Xp9bPuevEbcwoUaWhK/FNd5eFtmicPqzN
 c5b6atA9VHZpOF/uaKnkZCHJifACTti3lNXFGygcQxR2+hRX5TKHunsYfpXDuwf0zRyX
 kP+j6w+qas2qriKbBQyN2s+NwVn7ijcQSUF7oS7iZfJTqA5btxgBacWU7EFR21M1yOlS
 8T4TJLCTSVq3aXpa7+zMJwt/kWY4PrtoKgyuzb0dURQUq2qbAG8Z4le4a7zNNVuBBlnS
 RQmbHy6LNczMsR+PJFotF3Iu2booEKHu3VqvC4emRSgBu19MDQ1A4P1zk2qa1XMQO3S1
 GhzA==
X-Gm-Message-State: AOAM530Dcumb9Ppi3Cf/NPVSFlJ9y+iPYHB/xyrB81EKv4+rYdV3sxqN
 DLusjofVV6hGTscUPzoA2OVSARu/uo4=
X-Google-Smtp-Source: ABdhPJwF01EYqXmvM4fGwCIdRdLfUV/tVZeDkaNru3aT9CZBRP3C8dbH+spE4fSX1ZYnb2I1X3h32Q==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr1670610wmq.110.1631348455011; 
 Sat, 11 Sep 2021 01:20:55 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 by smtp.gmail.com with ESMTPSA id m29sm1010229wrb.89.2021.09.11.01.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 01:20:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 10:20:47 +0200
Message-Id: <20210911082047.2892382-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kodi: fix selection of dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Ruschival <t.ruschival@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Commit 148e695e3756 (package/kodi: bump version to 19.0-Matrix) extended
the set of required libraries for various "platform" backends, by
selecting those libraries from the blind options. For example, we have:

    config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
        bool
        default y
        depends on [...]
        select BR2_PACKAGE_LIBINPUT
        [...]

However, that option is true as soon as the requirements are met (the
depends on), even when Kodi itself is not enabled.

This means that extra libraries are pulled in to the build, even when
not required.

We fix that by moving the actual selects to the main symbol, along with
the proper conditions. This means that we have two lines that select
libxbcommon, under two different conditions; we could make that a single
select, but the codition would need to be on two lines anyway, so meh...

This is not an ideal solution, because it is a bit ugly, but:
 1) adding three new blind options just for the select is kinda extreme
    and superfluous;
 2) our Kodi packaging is already a bit ugly anyway.

Fixes: #14206

Reported-by: Thomas Ruschival <t.ruschival@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 074a457d1b..af7604428e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -25,8 +25,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_MESA3D_GBM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBINPUT
-	select BR2_PACKAGE_LIBXKBCOMMON
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	bool
@@ -38,8 +36,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
 	depends on BR2_PACKAGE_WAYLAND # waylandpp
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_WAYLANDPP
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	bool
@@ -47,7 +43,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_XLIB_LIBXRANDR
 
 comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
@@ -102,6 +97,11 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
+	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
+	select BR2_PACKAGE_WAYLANDPP if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	help
 	  Kodi is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
