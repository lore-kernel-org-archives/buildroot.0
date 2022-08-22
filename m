Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4800BC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 15:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C321341606;
	Mon, 22 Aug 2022 15:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C321341606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwD0mf6zmZQF; Mon, 22 Aug 2022 15:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6674408DB;
	Mon, 22 Aug 2022 15:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6674408DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0F841BF387
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 15:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A116408DB
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 15:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A116408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhfkYKd3E0Cm for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 15:23:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F2C8408D3
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F2C8408D3
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 15:23:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b16so14407432edd.4
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=XvWh41XNSCMDuYMBSOg6yeJPC0//SvvGPhexltXINDQ=;
 b=KWidLqbqNQuF3tsYlbre+CBM6b++DP4sw59iaLPsreRBbCKs47uVQ42m3fByAVE3e6
 uyYyWn8hU4HbD2YfH1RVRB+GcHSBu8fLuXWEG0/Fe8bWVyewnsgI9sE1LI881dRYnp1/
 UeE4po5SgiNBJ7l6tUkn/Fj5UaXyQyXDRt79JyaKRY4xMtAp6TmbtJ/pLxKT3O1V6V1W
 JFKQ8fp4DiBaeOG9svH7+LoiiEJkjCcpwD7wP21h3DsAmOuSfyk2hNDIlG12ATwNV8oJ
 QB8hth2IQ59lrSYGkRnW9wvvy2ugcSShnbQ+di6zoxFV2DRvz4daLGfcRDyQd+Z5+MPf
 cbog==
X-Gm-Message-State: ACgBeo2aUEN1hrGbOqwYYQwA7sUPePVNXyxuxQSWtNKVVlnmIY4YbP0S
 4/KkOQqvg8nlXUubs1zhHXRvmRoTfvY=
X-Google-Smtp-Source: AA6agR5L/YR20pi38B7YQLZWg83HZFimzHVE4TVlazUSbYPwDBNiIKSQa6CyGCPAb3kn45rDtmVMog==
X-Received: by 2002:a05:6402:3583:b0:43d:6943:44a with SMTP id
 y3-20020a056402358300b0043d6943044amr16412696edc.409.1661181832050; 
 Mon, 22 Aug 2022 08:23:52 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 k5-20020aa7d8c5000000b0044657ecfbb5sm5707086eds.13.2022.08.22.08.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:23:51 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 17:23:39 +0200
Message-Id: <20220822152339.2188387-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=XvWh41XNSCMDuYMBSOg6yeJPC0//SvvGPhexltXINDQ=;
 b=BqiUuy05lEM2IV2fzSEH9X4p+n0QFKOR4XrmJ/LR7QYAq7bkUcUOduCGRI8/lgBzdS
 lTvyzANd4gB9jGjVX6R7sAIBQbIpRTxyJggPOo9Ul4Z6eyAanJ0v5jiaYNHdTq6oM3bh
 Jp/eig+vusOfJiBRI2lVRD7CUuHxNAJKhFi+Ug9VNXfdsUrqHipo6OWs5ZLj4FwtTfMy
 uG9mWXieaTkOhxEJ+ym6/aIG86ttY3df/kH16MDYFTrPxk4W+6xlYYK4ptglmidu+f5W
 0VugAbCtJK4EGmh66lVS0bTuotlkrxe7Du3y/gAcKNnfhdxvHc4j5D5jUPzOIEPOPYOt
 2x/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BqiUuy05
Subject: [Buildroot] [PATCH] package/webkitgtk: drop unused flag
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream dropped in:
https://github.com/WebKit/WebKit/commit/aa6631a6189aaa4541a2d2e89993a4989103d161

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 7b81e76695..0e8f794abc 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -99,7 +99,6 @@ endif
 # 2D CANVAS acceleration requires OpenGL proper with cairo-gl
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += \
-	-DENABLE_ACCELERATED_2D_CANVAS=ON \
 	-DENABLE_GLES2=OFF \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
