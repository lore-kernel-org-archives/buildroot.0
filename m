Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9953FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AE183032;
	Wed,  9 Feb 2022 19:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wb_kik3TF7aA; Wed,  9 Feb 2022 19:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 645F082FF9;
	Wed,  9 Feb 2022 19:13:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D26CE1BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD531404EE
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0sNy_3VbUKNg for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:13:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1B4C403F8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:13:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d27so5747783wrc.6
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Zob10YqGxuuoI3QSXGbUu+neswD9F+0cWXfnAf2d20=;
 b=ASyRH9PiUZM3vtfK/jt7RFW5ooLYk+dODY9ZzbhqxDKBWLR0JUbyBbXWysZXnQhX5c
 g4MhUyC4yzMhtbaucM2o5dmXSEhCQzUfI42s0QCbhqsZeS0ahhUr/ML2aSZmz8WFWyZ+
 S23oI8gjWUwSHO7Zm2r5u2GsHzwrIKgQTKDMDPMkDSMUeEN7j5vSMnSfelSeDrJVuPGB
 iud0+pOAKbeBFH/hyKVWVnn+07TlgnfxZ7kGhnMLPIi2VGncg7eMWaeNZPgp3XzaP3jT
 XGXacG0GVfBZgNmcOGIG+dIPNkroi5z8DLyZidXWD2AKkt/Qb0LA8UpLlOmzZyzCw03R
 sT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Zob10YqGxuuoI3QSXGbUu+neswD9F+0cWXfnAf2d20=;
 b=D3M/f4Ijs8eMByRYx9BP10qe2QDC5NHYDcxwPTw9gRyq/QRHTnIA7IK3GkayI3h7JM
 jvb/lmKmyKzUG0N7NSOCqbFDGgcAEW+3BAlzKT8jjZG7bBdKCZAQM+OUv9VUWnY2eE2z
 oWPiG+P+AiTT1Csx19i6ItjZsIuiXV2GcuXg+PVW3lOFmW//XOIkm62CqIH485yIK4dA
 BwZ1g9e6Ow1zTNXFQ78yUr24wtQ5rSf1FfpKdZ2BmK8QXcmdi8JVHoHGeYIW+r8CIQCV
 7eZ2ORGqRkOHSLvXqj+DEO7d7PuA+gW0a5UWP2XGFd3X14Q+YyrvJrSgZjpzfQ3zPSe1
 emFQ==
X-Gm-Message-State: AOAM533BoIGANSYBD3JnZPgrGq2bCat+41Ldqy5b7e7gfGuu2UBaGLcB
 UAZbcSeKCctstOC4kfE84WQGz/Aa8Uo=
X-Google-Smtp-Source: ABdhPJzIdFlBdjOjT1Q/XMVz90rCxiBT/PfHv1TNxAqe0tdtvUu91v6SgZlidDSXDbXgROBDavnqNg==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr3225231wrs.620.1644433989723; 
 Wed, 09 Feb 2022 11:13:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p2sm10629698wrt.101.2022.02.09.11.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:13:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:13:28 +0100
Message-Id: <20220209191329.201362-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
References: <20220209191329.201362-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/sdl2_ttf: disable builtin freetype2
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable builtin freetype2 which is enabled by default since bump to
version 2.0.18 in commit f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
https://github.com/libsdl-org/SDL_ttf/commit/834ec54127dc9c2a12928f5fe32cf110ec4c7a7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 3b2b35e157..e9397d8505 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -11,6 +11,7 @@ SDL2_TTF_LICENSE = Zlib
 SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
+SDL2_TTF_CONF_OPTS = --disable-freetype-builtin
 
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
