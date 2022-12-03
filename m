Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024C8C4332F
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 21:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84C6C60B00;
	Sat,  3 Dec 2022 21:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84C6C60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUJpnnDcLc3n; Sat,  3 Dec 2022 21:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6CF60ACF;
	Sat,  3 Dec 2022 21:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6CF60ACF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C05B01BF5DC
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B64281762
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B64281762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1wQXl4HUAqe for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 21:19:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A62B8174D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A62B8174D
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 21:19:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id t1so5973524wmi.4
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 13:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h9ahsHh5G35KYXe7DOGEWM+1020Ppag5Ff/3UXJITQs=;
 b=Cjxsd6FWz0SkxxOyhEAmJ92Y5QIspKcKYOKTibXni4sB43q1USfWdLLbv77SlycwAN
 ngK815MRqoyftWnxchIUZ1UFfDkUHlBAZ+rH2pLA3N6WhF0peWD7ymmrjseduhlVLdoW
 y0AJGO/u6/8c6ArK+BIbeTVw5kBPOf6dg5XVKyakyLy8uczj8Hkm6r1IDroZxdaxBHKY
 4Wv41aTLHUb1IM3ChEvTOTazB5+yBR+8SBy7i/fYigUs7ydnJmFzb18Snciz5x6HLd94
 jw42vEuxZNoyeOBIds95NiGg1YYzCZCW0KAu30sVdBWw3pAgX6UehEE+Uetl+/4QeVFQ
 vtFA==
X-Gm-Message-State: ANoB5pny6l3Tjj+bHk3ff6U/GqA+5LF0DIzmC6FOQPAepu9+K4rZIzeO
 9poo9zDGyezkqpbFLwYpzveRf5VHHDk=
X-Google-Smtp-Source: AA0mqf52XABkGcA9ueWkNl4sHNEWxHIBPjrnPlgQ4xYiH2Ahw/nTKWmbwSuoy9L3U4gXVQiik73kfg==
X-Received: by 2002:a1c:7709:0:b0:3cf:6a83:c7a3 with SMTP id
 t9-20020a1c7709000000b003cf6a83c7a3mr15838365wmi.21.1670102383119; 
 Sat, 03 Dec 2022 13:19:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003cfd64b6be1sm22290595wmo.27.2022.12.03.13.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 13:19:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 22:19:39 +0100
Message-Id: <20221203211939.853298-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h9ahsHh5G35KYXe7DOGEWM+1020Ppag5Ff/3UXJITQs=;
 b=MmM2FmLzejIPBJTLz2u/FbgAJNxmfygyc7UUnzOpSEX7LmNp83MdqkihtT1Rck8g3/
 JG9nYoBwUdULs00z84FqSBdM+zy2MXXu+oM8ORi6YELIdeFaMl15OE1B2YQukIG7E8Bh
 +dIV4PVw863hrbfrJGRCzwWGqRDc2AxbrUlmM7AfYWnsoRVcuiREtRc9Emz64X/Cnueq
 ud7gvySlboqCCiQYO7/P0Ha9NuC3H//ug3mlZZaFvc7/dqy+ACaN7ECPGGjc6Tn+Tyax
 bvsziMKGqYprSU6VMJDwV1vBc0hbln6imau4/7gzFm83K9q7h+WwOvmYuJwEhaH4xuio
 CvhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MmM2FmLz
Subject: [Buildroot] [PATCH 1/1] package/matchbox-keyboard: add libpng
 dependency
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libpng is a mandatory dependency since bump to version 0.1.1 in commit
e2511d88e83acae4144be89ce5e258b724067bd5 and
https://git.yoctoproject.org/matchbox-keyboard/commit/?id=1d7c5f1e0ad736205151c0df5aa738f942bd3e97:

checking for PNG... no
configure: error: Package requirements (libpng) were not met:

Package 'libpng', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/4495f0720d7053a52ff8fef82d18a70a6f20c66b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/matchbox-keyboard/Config.in            | 1 +
 package/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index 260a57c6a4..3d7a9d203c 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "matchbox-keyboard"
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index 242c4831d1..a1e3c61543 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -11,7 +11,7 @@ MATCHBOX_KEYBOARD_SITE = \
 MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
 MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING applet/applet.c
 MATCHBOX_KEYBOARD_DEPENDENCIES = \
-	host-pkgconf matchbox-lib matchbox-fakekey expat xlib_libXrender
+	host-pkgconf matchbox-lib matchbox-fakekey expat libpng xlib_libXrender
 # From git
 MATCHBOX_KEYBOARD_AUTORECONF = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
