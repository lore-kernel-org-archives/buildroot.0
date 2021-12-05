Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C58C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 13:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FDB80F82;
	Sun,  5 Dec 2021 13:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XI_QZFnY--co; Sun,  5 Dec 2021 13:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1439380F25;
	Sun,  5 Dec 2021 13:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDE911BF275
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 13:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3C9608A3
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 13:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxdl_UfGNX-7 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 13:43:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89D0D6067C
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 13:43:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so5752935wms.3
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AG7jnQlogEeu1j8YdjUR2Je2qxiULGrSaI35vA3EVjw=;
 b=FYyUVAibAyCmMSAZ81bF1fqwspVN4dmlxKGb/ptMFOzDA1MDPCmLbzA/OcJYdrlG4b
 ZJFTSVrVIF1z3tC+BTDav6NQF7CnXJOciqiMbfr7gYh8w0HOWum+zgaesJHjZ2veg5K6
 rQKP8llLWXo8AtHUoakiYZYUbr0E6oJ6O7YxDTO1esqJ8OxsbQ1ffbN1JQnsXt8c6uE+
 ATccYfwdERO8d3uMJ1nOUFnml8eEW1vcccdXVKW+mUprLOFXtYobEYB/Bsr1ZQAyrtxa
 LF2o7bJ3LyvjwDjxX5U36r9RSfAzns7xDCCiXypQ+11VuA10D3d2R6C5JttleJ2n8JQZ
 I/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AG7jnQlogEeu1j8YdjUR2Je2qxiULGrSaI35vA3EVjw=;
 b=uGq5mC4htzFpGz79wOcce9Hdt/EV6okkw0IxjNl+ovk+kTC7rgJZE5cV4OkHoWTAwK
 alvTvIlIZp1+ZYwONbxhyu4Klii295oSouA5Hlvtw7VXuQ/sb33WRvApKWMk2OVKWRGl
 pKXXPPWoOcCVSy/S/HMr24I5RJxMw7k7b9ekMrm1xWYU3Hj7eFX888TyOW6J2Yb2+h0F
 3KBCqa6HPXU6U8RJ9fQ7O2XRZ2ZXnah3Ho72LJhHA/oJ9vJiNYKdFlhKfPoI82lp93AQ
 /p79kqWWtcn5iD4KSLwy1b//sS5QpZ1GCixdF7H5F0ChLaJOmqhBWyTP2yy39io5dwOw
 KI4w==
X-Gm-Message-State: AOAM532gHWmDa+BonUbZXGJYpZs0Wqq5Sa8Q/xdJ7xXBExvc8GakdjMz
 HiflLOrT4ZAI0MHglV193Fi0/+uKzpzo0A==
X-Google-Smtp-Source: ABdhPJwyIirA3HLKnafdL3XCXyrcoAsFIv3LEotH8G40oDbU2XPLPXPzcho4sVkzuj8S9XFsJLna2g==
X-Received: by 2002:a05:600c:1c87:: with SMTP id
 k7mr31262163wms.103.1638711818363; 
 Sun, 05 Dec 2021 05:43:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g124sm10479711wme.28.2021.12.05.05.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 05:43:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 14:43:42 +0100
Message-Id: <20211205134342.2111787-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/p7zip: update help text of 7za
 and 7zr
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update help text of 7za and 7zr options (added in commit
c1723424b8189730087006fc879fdae0cc123ca1) as suggested by Peter
Korsgaard in
https://patchwork.ozlabs.org/project/buildroot/patch/20211025215520.3712974-1-fontaine.fabrice@gmail.com/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p7zip/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index 3b30fd71cc..be2206eb76 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -21,14 +21,14 @@ choice
 config BR2_PACKAGE_P7ZIP_7ZA
 	bool "7za"
 	help
-	  Stand-alone executable that handles fewer archive formats
-	  than 7z
+	  Full 7za archiver. The program supports 7z, ZIP, CAB, ARJ,
+	  GZIP, BZIP2, TAR, CPIO, RPM and DEB formats
 
 config BR2_PACKAGE_P7ZIP_7ZR
 	bool "7zr"
 	help
-	  Stand-alone executable which is a "light-version" of 7za that
-	  only handles 7z archives and cannot handle encrypted archives
+	  Lightweight 7zr archiver. The program only handles 7z archives
+	  and cannot handle encrypted archives
 
 endchoice
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
