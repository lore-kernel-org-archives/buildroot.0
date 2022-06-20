Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13491C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 861A66100A;
	Mon, 20 Jun 2022 21:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 861A66100A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUE5jpOcaSLq; Mon, 20 Jun 2022 21:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A3460FFC;
	Mon, 20 Jun 2022 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A3460FFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1441F1BF398
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F06BD41914
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06BD41914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cA3FBGndxQQE for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:12:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C4E416EF
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C4E416EF
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:12:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so6265064wml.2
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yV58Ua1xbOw3pSzn9PnH7aTeWpNfa1x0Pe21DwalMbQ=;
 b=N669b69SfTqHrrZm376whnRsbzmBZXfZX2RAoPi4dCz4++LjY8ZuFwfmWtKnTzraDj
 q3/5iWSu9P8Kkm8rETLQ0ajvOYBt25fv09HMLZ1BV1hCdps+uaZchLC69M7io+RgHTyL
 HQBs7IPT1MNqIN+k/3Ee1jf0UcgbfSyi20OgSNRFROwwrm3E5Rj65q2FPOC+NENr3i5r
 zyXqFz5a7rnv9Ld+o2RIMZhDOzEDCF/hxL2pnUnriPq8bmaJ84PgfEeczy+M9E/JRJVj
 lJMtSKMw4LRZTmTJp6m/AiugCgnPjmuIol0cW/7vn0+tbmj1UlM0JLIv2LLjLl/g03nl
 NUHg==
X-Gm-Message-State: AOAM531id8P9hV/UEFtJtecNBbQQUXaVUnWYwdCX/9q6Pr2Ql0cfnkWH
 fFiB4s0O1VwptkhEyY3Nj/M1XL5+KKY=
X-Google-Smtp-Source: ABdhPJxTSgOxoyqNk5iPa0pEnLNvdnROFX00a4I14iE0kH2h6g98FCXGhj5tMs3b4YnhtJA4z6hrFw==
X-Received: by 2002:a05:600c:4c06:b0:39c:975a:a548 with SMTP id
 d6-20020a05600c4c0600b0039c975aa548mr36372254wmp.99.1655759546601; 
 Mon, 20 Jun 2022 14:12:26 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bt28-20020a056000081c00b0020fcc655e4asm13729556wrb.5.2022.06.20.14.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:12:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:08:56 +0200
Message-Id: <20220620210856.771825-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
References: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yV58Ua1xbOw3pSzn9PnH7aTeWpNfa1x0Pe21DwalMbQ=;
 b=X+6X8Do/KehB6euA9Dd75DiJk5CzNTUMaSjxhK1yXRHlIf+vlaFReltTXLGXeSs6r+
 Hpd1YmqulZn2hvO0NAUc60k2sTtopK/dmYW29mQhd37OYPaIz5HF+VT/XQgTFeNNCrLF
 OnrN73Z8XNraL6OHcs8Ah/bujSpgaH4Ft9ZHSAqaJdj+Gp1iLln7dfSpD3RxHjNM8qPX
 bxyKQ6dkPJwVKmXpRbjzQCpoJYFtEamqi/1Us0DXQdsyRSgMCXZ9jr9lo8Ddlc+fxcsC
 xDlY0U3EtygcdSom+uVsyAvrqZxi5XxaLc20kmxrD8RqywBluFYgu5vEks8n05f4VjJs
 Qcvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X+6X8Do/
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: drop
 unrecognized option
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dmx has been dropped since version 21.1.0 and
https://gitlab.freedesktop.org/xorg/xserver/-/commit/b3b81c8c2090cd49410960a021baf0d27fdd2ab3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index fa5d2a802d..43d2038a8d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -45,7 +45,6 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--disable-config-hal \
 	--enable-record \
 	--disable-xnest \
-	--disable-dmx \
 	--disable-unit-tests \
 	--with-builder-addr=buildroot@buildroot.org \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
@@ -165,10 +164,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-screensaver
 endif
 
-ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dmx
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libcrypto
 XSERVER_XORG_SERVER_DEPENDENCIES += openssl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
