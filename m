Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735B1ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 14:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0807560C03;
	Sun,  4 Sep 2022 14:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0807560C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrHuMngL04F8; Sun,  4 Sep 2022 14:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B52560687;
	Sun,  4 Sep 2022 14:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B52560687
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF76D1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 14:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AECC40580
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 14:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AECC40580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wG7gyVprEj6K for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 14:45:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E48D40571
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E48D40571
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 14:45:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c11so4011221wrp.11
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 07:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5Pmv4kF0F5s69P69j9TCOTmpux1fdqwtcZafVCJnTOY=;
 b=01Fa9W8whXaDNVyyPPUb217yG2ZaQOSWol2nkm49W4oIKpum4nPZMvFZDskKuAM8e2
 GmHAbaW5Aijr42Urs4jx6U/KPRiLAu9GO2QyzeBx3tENzwMcIEb5OA7F+40eHYOsupZW
 oME/WAuE7tareTR/KbnJZrZ8vCtkvjddOX5YrV0GcHUu/z4TMJoAhUmEi7DyfUY6HJxZ
 s9u+5s3xh7F+NxXy3/XligIfYPo69BKpmPeB4x1plBFJLZCzv880IFe20UkxYXqsEN/I
 S+DxA/KP+gQmGyXhAFNBVZj8fZsOOoWtY8IPHigsxZRxQrUzvsb0YkFNvqL9mGSMSWzq
 IkTQ==
X-Gm-Message-State: ACgBeo1INUAm4dFDiPA+FacBZ8gVl6mtSFco46ONjriljx+/8OCxFGHs
 Lba5EouioEZjNmxxXOONmWpnkwfa0es=
X-Google-Smtp-Source: AA6agR7701PtRBgV5g35VR1MxL2JGdAAx0Fc791/89EXdHrl5WR0e5zJ8H1gXxi8zlDXmtoionvaQw==
X-Received: by 2002:adf:fb86:0:b0:21e:3cc8:a917 with SMTP id
 a6-20020adffb86000000b0021e3cc8a917mr23454537wrr.538.1662302752440; 
 Sun, 04 Sep 2022 07:45:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h23-20020a05600c2cb700b003a2f2bb72d5sm17556957wmc.45.2022.09.04.07.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 07:45:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 16:45:41 +0200
Message-Id: <20220904144541.349495-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=5Pmv4kF0F5s69P69j9TCOTmpux1fdqwtcZafVCJnTOY=;
 b=MG5m+zyf0Nievp18rKf3Jqw/fMCPZUfFjPhXYQ1CZLs7N+XDQ9DXQpIZvMBsiEUeEG
 VOgNKGbFLUH4bUjg/psiyfD4OiSskeXYqS9Cih6p03Etj4ps5qLoUjfYd3v7hj2abMGy
 3hCCAu9hF7279PZyAI4n1LzGo98ZW6uswH6FuS/NAR0mb9R7M+qCsrup5mDv7WitpPl1
 djV5Hpu3ioeFZ2b1T8B6iUJAlv/NmsYTLr2SgTQU8iTBiXyQajBlPjwwYV4NcI4tyOED
 hTevpBo3eIj6tvv2wVX3PcO6sZ2IICk869IbGygotbd1jJjBe/1UVB7az2HF0IV+6iTE
 8WZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MG5m+zyf
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: add pdf support
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

pdf support was disabled in commit
7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22

It depends on openjpeg and jbig2dec

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14976

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ghostscript/ghostscript.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 5bf8b08966..a11aec1c54 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -43,7 +43,6 @@ GHOSTSCRIPT_CONF_OPTS = \
 	--enable-freetype \
 	--disable-gtk \
 	--without-libpaper \
-	--without-pdf \
 	--with-system-libtiff
 
 ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
@@ -63,6 +62,12 @@ endif
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 GHOSTSCRIPT_DEPENDENCIES += openjpeg
 GHOSTSCRIPT_CONF_OPTS += --enable-openjpeg
+
+ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
+GHOSTSCRIPT_CONF_OPTS += --with-pdf
+else
+GHOSTSCRIPT_CONF_OPTS += --without-pdf
+endif
 else
 GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
