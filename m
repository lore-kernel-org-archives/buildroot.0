Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C9DEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D65BC6070A;
	Fri, 21 Jul 2023 18:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D65BC6070A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPSj-nYcK9PS; Fri, 21 Jul 2023 18:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CDE16141C;
	Fri, 21 Jul 2023 18:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDE16141C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5D011BF5B4
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF72483B0F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 18:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF72483B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6LD7HzvbaoK for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 18:47:58 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE01883B05
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 18:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE01883B05
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so3679895e87.3
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 11:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689965276; x=1690570076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4orZlF8tF2SLfzLUgXjfCVhaVHUv7mkDw66WCEjvrE8=;
 b=GyX/08ORj8CAU5KXf56DTX7ooLW990uSdFWwxKGg/IKFCSCOCd29WtL44jvidlFN69
 k07p8L0i/78c79ppSkvZB7/1CV6BvF1WnbVOs9pYwJpFBiqWBEhJawBghsH2pIeYQdIf
 i1cBIxE0pNMD6BJCclkUpCPM2PjcgDXhyHHDinV6LUwNfeDX/f0QWMHNCothge6zC66J
 oByacOSVcFODjMemfM/TUAnDc9o+B+hdv7LC/XCWHXoljKWitAUgNgCQ2Z2mIzVjPp4O
 D62cL686RQBlP1o4Q+tcQ8z2U/t2xnntb1wTsqpyP7CsGgeuz/uo884u9GUYATZOcwAm
 J4Ag==
X-Gm-Message-State: ABy/qLa6RRc5gU8WP4AB1MbXTQSxMdGGO0Kwf8fsrKkBNmnShB+NsVKr
 7PsVPrI5E/XSdNiP0gkUsQIqjv9l8XQ=
X-Google-Smtp-Source: APBJJlEZigaEo7+Sw6nrEmm3sREc2/xT1ZiQsd2YhZLzdVKkoDitBP6BVlHi6pj0bsMKs/51DYURZA==
X-Received: by 2002:a19:384d:0:b0:4f8:67f0:7253 with SMTP id
 d13-20020a19384d000000b004f867f07253mr1490994lfj.49.1689965275471; 
 Fri, 21 Jul 2023 11:47:55 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906230900b0099b7247efbcsm589117eja.8.2023.07.21.11.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 11:47:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jul 2023 20:47:52 +0200
Message-Id: <20230721184752.819052-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689965276; x=1690570076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4orZlF8tF2SLfzLUgXjfCVhaVHUv7mkDw66WCEjvrE8=;
 b=sKCRRLcQ18GYLOWOPHVeU5XchFYKWLmWPzQljD4HAeq8n7dl0f/lnIYtwG6F2kL9Bs
 78l1mlujBztuVzCMNNLxnQjm8P7+liHiMh4/9DlXhCdOejQmzd8C+IyWE1lPpFxY5Y+8
 E3kcJ73V1DNU9g7DnoBo6E9PiGifnr1S1Kgjfs/r81rltqDPioiDbCNEkJzoaBbhyjiY
 ukBf9O8Rpy29MoxL1Nb11eiIqdexHRKnlCQgZbDqHgEwwx+YfaBZSjzVJmlkffvpHLpR
 KPsFOiYiZ1vTih5t4sNUARekq8QU+XjEoHh415cqzk2LMoFcFnc6Da2UOnY2a9NFf1hG
 b6tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sKCRRLcQ
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index c655e9931..049f8c2fc 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aa354d1265814db5a1ee9dfff6049e19b148e1fd818f1ecfa4fcf2b19f6e4dd9  luajit-d0e88930ddde28ff662503f9f20facf34f7265aa.tar.gz
+sha256  835035b244c3dc3d3d19bdd5ac623af90b84207e6330fb78f9fa51d6e200d760  luajit-8635cbabf3094c4d8bd00578c7d812bea87bb2d3.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 09bde3590..2a27aa505 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = d0e88930ddde28ff662503f9f20facf34f7265aa
+LUAJIT_VERSION = 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
