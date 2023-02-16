Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A54C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E8E60687;
	Thu, 16 Feb 2023 18:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E8E60687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OiixCnEiR7S; Thu, 16 Feb 2023 18:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA8C46120B;
	Thu, 16 Feb 2023 18:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA8C46120B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82801BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAE3081355
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE3081355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tutH84MMPEbf for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:33:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51C898101B
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51C898101B
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:33:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r28so2276672wra.5
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 10:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCrzBAxJkPAIJUb0B/F7khSEXOW3yJ8n32WhD/8g1rE=;
 b=kxD4IjjjiFoLiVAsJ4aH4BwBVamuk0w52clEIaprzwt0uwEopPBrdOHrruOFsdhiGN
 b9NWFFq61XR+kJJmgXOlaS/8czdisbyNQ79uX/FDa5+St1xQsXjOok0fD+mza1dQflOu
 l5sT+X8gyScuYSKOpPz/2BNp+L9RRbu5lrTnDVQkxEuI5PlDndkgsVjlfR+DBF6O/DPX
 fa4ePFnoRince6zPq+mK+rg6/9kiNgNY4U4Qu0Wilhlo0xTsJQdHxMK1zXu0LY3Tlzrw
 8qTJAZ5aJJFojJPmFaLX4rPvM0oxbFCLS8oSwDrsaZeJFxctlVMVrybNqCEn/ILP683k
 iPgw==
X-Gm-Message-State: AO0yUKU8e4Ek+45RoaJPjAi+ujVu1N5K2z2pdhBxasU/UFmoYCOJpyez
 mRI9OzIQ4kTQz51vIocFXAe8PW87Ys53Wg==
X-Google-Smtp-Source: AK7set8qEHwblHpajSu4KJlX+jIkqKO+b/MWVOrJiGv72IDgY/AnsNfAxOnTtAFZCPEAgBpNsIIp/Q==
X-Received: by 2002:a5d:458d:0:b0:2c3:eafd:143d with SMTP id
 p13-20020a5d458d000000b002c3eafd143dmr6625869wrq.69.1676572437331; 
 Thu, 16 Feb 2023 10:33:57 -0800 (PST)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003e204158ac7sm6754969wms.47.2023.02.16.10.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 10:33:57 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 19:33:21 +0100
Message-Id: <20230216183322.21622-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216183322.21622-1-raphael.pavlidis@gmail.com>
References: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
 <20230216183322.21622-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCrzBAxJkPAIJUb0B/F7khSEXOW3yJ8n32WhD/8g1rE=;
 b=q6MISUxeO6zUMRBXGNMZCNYBv1GH1cJve7pQZPkydoEYNddi9iXmyK7ZFmWsuKFdz/
 iJJPP/2PVT3UHe6O+cjZuW3h8fxfFYnWDngYe0s4sZksxYrpX6J7L+Xw3P/p5Ic3nkF9
 zZL4k++v4NDDzb1c6GTJVOy8eJscgmn26uAuxxp/Eh3LX19UN+MyqJRl8gxWEcZDN6xy
 RY89/z7SWdhuKgjKkfLi9kK7IkV9wItHZLfzZ1gQsnNQE6ph8rQ2gtB3K9t8G3eTuaJB
 6LTUWRpoROkuTwUuRKEZXVQy824hOE7re0mq+izTNS8P5Bk1cJuCBn5RIsgzB0KF02cF
 8SdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q6MISUxe
Subject: [Buildroot] [PATCH v2 2/3] package/weston: add xwayland dependency
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
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the XWayland support is enabled then build the corresponding XServer.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/weston/Config.in | 10 +++++++++-
 package/weston/weston.mk |  2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..09119edaaa 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -109,16 +109,24 @@ comment "X11 (nested) compositor needs X.org enabled"
 
 config BR2_PACKAGE_WESTON_XWAYLAND
 	bool "XWayland support"
-	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_LIBEPOXY
+	depends on BR2_PACKAGE_XORG7 # xwayland
+	depends on BR2_USE_MMU # xwayland
+	depends on !BR2_STATIC_LIBS # xwayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XWAYLAND
 
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+comment "XWayland support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 # Weston needs at least one shell; this can be one of the bundled ones,
 # below, of from a third-party package, which should then select this.
 config BR2_PACKAGE_WESTON_HAS_SHELL
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5e71473640..01f84178b2 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -123,7 +123,7 @@ WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
 WESTON_CONF_OPTS += -Dxwayland=true
-WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
+WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor xwayland
 else
 WESTON_CONF_OPTS += -Dxwayland=false
 endif
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
