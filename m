Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679E9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 21:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF084611DD;
	Sat, 16 Apr 2022 21:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzJzQ64h_OaG; Sat, 16 Apr 2022 21:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07755611D9;
	Sat, 16 Apr 2022 21:47:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88C491BF341
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73C9341C34
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id days_O4DT7Aw for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 21:47:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10F9C41C32
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 21:47:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso9682349wma.0
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 14:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KyXTYmGJDKa6GrrnDB9kvE6TyR4SD4/XI/WyD9VlD0U=;
 b=PkluSh9qFNy11SH519CTFQDTo4ueWyfoB3McqW16WlzLfVfVCx0xHwa84ZUDav+688
 J82sja/TwIcidR8imZ+zwudbGZJ1Oo5IdV2F/bSrQEm2IltZwbS0BYIKYTpwbgyrM/Yi
 YTfzZ32wCV9kgnfeQZlVfwGmi7DwhT6aKD0ouM5oXg1MV7GCSRQbo0ZDEAOQiKY/BClR
 cNUUsGV1CgK82Tm+DYboBgCLIMWHqeRtIcWPCGXJfZaoF/tWLzxiESBIwmHLVDgUn0zs
 2HUkGPCq4GXIA7w6aPN9/105v54qaXVv3ucm6l2tBm7lHWwNzpoSlqXnx+nB1d1OjOSf
 2YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KyXTYmGJDKa6GrrnDB9kvE6TyR4SD4/XI/WyD9VlD0U=;
 b=nL+XCYi1e61uPfZ4m3P+lBlkkBfZQOoYWpFw6LHydJuJqrRLaNX0U0Hs8iFHNrm5uA
 gQsX7ajARWCx7TAErN8hARJg41UuAOrixs6ffZICXj668sZwvy9nj8fDej0Z4C32xUWS
 rLS6XIWXqjhAEpxXHr94PKQxJaBX6Q5IEmzIs2F/7uk7+nb7dctb/Ns9ouE2MFIfDtXv
 VI+joU/EHnJV9xcTpHpKdkzo/pJxI78UNQIVUDH7HZJ9vuNlCQx7Mk10D2cJ5qcSpPVC
 vN0LvdUTioVUkJAZlN2kb2zA78vEHL51MHiQifZzaVX3ZImW3zrNFNFURPiqrEPP9kZo
 RFgQ==
X-Gm-Message-State: AOAM532Abg3OAo7YwZNSgXW2ptQrPDFKm3Y1PFRDvLuBTIg0dJthsSKk
 LS5WXameyQm2soxsJ463ibY0lhOp+LU=
X-Google-Smtp-Source: ABdhPJwY2Ch4cEyO0DXWvD2pcDHPkBVsv2Jg/Uy6F4fM/YDAWEwFzyQrx+N83/hX36Ud1aokadGbtw==
X-Received: by 2002:a7b:cbd3:0:b0:38e:bc95:5048 with SMTP id
 n19-20020a7bcbd3000000b0038ebc955048mr4678256wmi.203.1650145649653; 
 Sat, 16 Apr 2022 14:47:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm7039035wrn.114.2022.04.16.14.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 14:47:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 23:45:28 +0200
Message-Id: <20220416214528.3515227-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/aircrack-ng: fix sqlite3 build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.2 in
commit 242227dd86efaaec7c785b32a14e8133f2e86dec:

powerpc-buildroot-linux-gnu-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include'
In file included from src/aircrack-ng/aircrack-ng.c:54:
/usr/include/math.h:476:21: error: '_Float128' is not supported on this target
  476 | # define _Mdouble_  _Float128
      |                     ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/83a114ce197fb6af53a26ed68184cf3bbb30c8a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/aircrack-ng/aircrack-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index ff87766d6f..95cda7c5a6 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -69,7 +69,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 AIRCRACK_NG_DEPENDENCIES += sqlite
-AIRCRACK_NG_CONF_OPTS += --with-sqlite3
+AIRCRACK_NG_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
 else
 AIRCRACK_NG_CONF_OPTS += --without-sqlite3
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
