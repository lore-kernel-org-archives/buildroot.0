Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1E8C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13C31405C5;
	Sun, 14 Aug 2022 23:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C31405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yi8fRhIwrbLZ; Sun, 14 Aug 2022 23:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3769F40490;
	Sun, 14 Aug 2022 23:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3769F40490
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1CCD1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA53C408BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA53C408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nc3PKSJD5dPq for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCB740298
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECCB740298
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:31 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id c12so2996616vkn.13
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jhSpX8WIJQt5riE+1tzkeK0rPpc7welRNW9TKLyFvmI=;
 b=KTRQ5dAV4M/cPOxpKa22txxZHX2Qebkwxe72HH4j9fXYmsSsEP4/GQeZtYNsa2ecxw
 YUgZ6bDburNCjJGcNXqNITn1nqqeG9OJpDwjs2R+Ni3gHLIPTb5JIj3rZE2Bm4PJWik9
 0LBAsWEoVR+dVNZUKPdulqDdRK/8JNLWKau683JfjowswvgAb95oL5xN615PUaUYMXzt
 S/6/keX5YPfdVVVvxl3ayXE73kAsouLS5zF5ex5CTnYaU0P4kNxXSDmfKXqL41CGkHog
 m5d2EJ6aupx7rojeZE7qPcKQsdIHchXdswVigOiN0cN94IWEBrdowXPxRmeTsMS83yCP
 EHvw==
X-Gm-Message-State: ACgBeo180pGbpyt9g/5XhJP4aCYJCOBGE10X24qCfsNo5BiOWj140DOj
 hiZGtWdd0fMk2wDdwoZltqcZ1RciyJg=
X-Google-Smtp-Source: AA6agR6WdQIW0o1y6axOt4bMJjefbvNGo7MYVj+EgjOLXmCImOVLE5u1V6aNqMc/R2+OkvLv1WlHfg==
X-Received: by 2002:a1f:5c53:0:b0:377:6247:1075 with SMTP id
 q80-20020a1f5c53000000b0037762471075mr5664211vkb.4.1660520430793; 
 Sun, 14 Aug 2022 16:40:30 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:29 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:41 -0300
Message-Id: <20220814233845.2247022-30-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jhSpX8WIJQt5riE+1tzkeK0rPpc7welRNW9TKLyFvmI=;
 b=brtsQFsapNMj6CEktq1VUpSqCarrmYypbZBjakRHITBUGdkwH5SILrFPdsIDC0sfRt
 /01RXjBIXBkZtZiaX9qk7QHhY9UbWsJeGEOypvWQaApiGI+FehtgkpAgw/vrBCxkcymv
 zm3qVsvlUhXs1u/jGhRqYZhTMrSM4BdOkK9Wu+jVK8+rTuiK/6yMDVkbQoiFlLzyPyFn
 ne3PIRgvqS/XxulDOIBTnyv7o+z7MaarOCDTGd2gDQoE817Xv8DpHcFY6oAjSotZDe6+
 urIs869I2TRgwj9u4DPG0ZYbeodKR0huK69uJAVbq+RosfJZD3KU7DFhHoiMZV+TFAM4
 HN2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=brtsQFsa
Subject: [Buildroot] [PATCH 29/33] package/x11r7/xserver_xorg-server: drop
 bogus BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
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
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit '09729b5e63 xserver_xorg-server: bump version, improve option
support' from 2010 removed the symbol but forgot to drop references to
it.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index daf4d81702..865917c4ec 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -12,9 +12,9 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_MCOOKIE
 	select BR2_PACKAGE_PIXMAN
-	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
+	select BR2_PACKAGE_XFONT_FONT_ALIAS
+	select BR2_PACKAGE_XFONT_FONT_MISC_MISC
+	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
