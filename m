Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119FAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 14:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D0B610D3;
	Thu, 21 Jul 2022 14:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D0B610D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oESz8W0SDi5c; Thu, 21 Jul 2022 14:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20F1D60AAC;
	Thu, 21 Jul 2022 14:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F1D60AAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBDBE1BF338
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 14:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A60658404F
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 14:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60658404F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-njmQuF4FDF for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 14:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF12A84031
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF12A84031
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 14:50:01 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ss3so3523107ejc.11
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 07:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9VHTnzH+oRk4yn0/To8RsXMUViBdG0mqxmyoB4r1GFQ=;
 b=xdd+yCksjYqk8E/MuRq5/DaHDw5zozb0bmRsltI7Qzbao2iIcy2EC/AEj48mIUjeHl
 BsLtBOLUpOhXGtNClkDwy2QO4ME7PphXTq5IZf6AMoPnmOXtioeHS6d8SR4yyrce6NGp
 W1GNp+D4a+hJJ9njIW3/guTqIux3QsY+HNM4dnfm6YPOCnCjbx2isxMtbJLnSMDJrfRW
 4EdpolOaPKNrn8RdiehG/6igkwJW/bEJEQrYsKH11aLS1862KzxrPBXaIrSHMsdmw6JY
 x0g/puebM6Gj7LeNjK/cp99eLVXSzkqvCpFjRunUVScUnb4KxwNWThvG5Xmviczyo0kk
 UE3w==
X-Gm-Message-State: AJIora/2cyiNatf1ESS/apqg0cqXXU9Kor0tTnhHzpjrdBNEF5QM+nCM
 UnUwTSXYLCGoQ1J03IZLnyE1wWjr5Vo=
X-Google-Smtp-Source: AGRyM1tKHOkmDC7OkwHKrBVFrOVIFUSe+JR5bAtLYw88bJWBNFxAkm6UWcGnHrj4FFhNzQcAuE7PoQ==
X-Received: by 2002:a17:906:730c:b0:72b:4f83:51c1 with SMTP id
 di12-20020a170906730c00b0072b4f8351c1mr40800092ejc.515.1658414999342; 
 Thu, 21 Jul 2022 07:49:59 -0700 (PDT)
Received: from mercury.lan ([188.27.128.10]) by smtp.gmail.com with ESMTPSA id
 l10-20020a170906938a00b006f3ef214daesm950698ejx.20.2022.07.21.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 07:49:58 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 17:49:39 +0300
Message-Id: <20220721144939.1265027-1-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9VHTnzH+oRk4yn0/To8RsXMUViBdG0mqxmyoB4r1GFQ=;
 b=o0gmvF9eKnsxljgiR7MiImywj0RPTsK1UztUgCH9TuEFJv2GBethSEbGWNqGpBfT2a
 QHQuHKPSMRZ7SWf+ktzrbE6ZrftXnnpdGmKWwoMniIpumQRx3pEB78X3Z9o5zq8qzGxb
 BzePNpUvBrM9c5edS3/uXwlBBJ9+cKUQ/C74sQcCFdGZV1fjQuTAG3q92GBd48iTKh0r
 PSxRRjZi1+TO5cbwUqT7xq1MXQHlQBaOCcemUeou8B+keN/7e8b74leREM5shES3/AqI
 blfrXrFphpBrJIazfBQ6qo0ysKpVSnzG1JmFTqWKpZnYzmoVdjjMv39tQRiDDnNt8yfb
 LN/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o0gmvF9e
Subject: [Buildroot] [PATCH] package/cog: add libgbm as dependency when
 building with DRM support
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with DRM support, it can happen that the libgbm library
is not yet built by the provider of libgbm (specified by
BR2_PACKAGE_PROVIDES_LIBGBM).

The docs in cog `docs/platform-drm.md` specify this dep-list:
- **WPEBackend-fdo**:
- **Wayland**:
- **libdrm**:
- **libgbm**:
- **libinput**:
- **libudev**:

libgbm needs to be added, whereas `libudev` is provided by systemd (in my
case).

What happens (in my case) is that cog gets built before mesa3d (which is
the libgbm provider).

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---

If this could be backported to branch '2022.05.x', it would be great :)
No worries if there is ont intent to do so.

 package/cog/cog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index f2ca0af93d..1d68ef1b7e 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
-COG_DEPENDENCIES += libdrm libinput
+COG_DEPENDENCIES += libdrm libinput libgbm
 else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
