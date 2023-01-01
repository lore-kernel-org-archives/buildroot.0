Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB9F408F5;
	Sun,  1 Jan 2023 23:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB9F408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQuY4w32PUn1; Sun,  1 Jan 2023 23:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A64B4091E;
	Sun,  1 Jan 2023 23:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A64B4091E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A81F1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 267AA60BFC
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 267AA60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfrdCyPb--SB for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7268E60B2C
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7268E60B2C
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:09 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id e205so23801444oif.11
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i+oMsZlZbGODRfe1V3OQvLz9E7Cc0/xrfitrtAj1aqc=;
 b=61Y+Mz/5EzAdpO/FLopcR7+tRUpwA5gyX3KgfeNUIgDGYR6Ol99MCcL6Y8Wep5QuzD
 17zKT0KFiIkKNY3GxuRckJ13hmqRRNwWQFGn4+7G2CRkKu4nsa+wOx167PdkdeHBhomp
 PRWruKBX+bSJdTYZLc8MVBtOM6+TKtwnS3d4odB/4PtUPznO6XWL4Ccsqra4Zmk+T/0x
 Izh6mpiBR+IkndMKFrzyElYR+Rm9J3CJ6vSx5wQCPst4bBuY/ZvVXTkVeeZKgUJl6y+u
 8KJG4DFOC8mnbsbWnLWlkXuR7uIVzWrhHxdITfemMUB9IT7/Ybg3ARTrFu+4elR5PUK/
 14uw==
X-Gm-Message-State: AFqh2kozr42swD8PkXuRhXnJkvRhKimWYNAB2F8MtnBT56jGjjZvkcjM
 3YymJ9taE7c8//gmwCihOUdA+1VRdqU=
X-Google-Smtp-Source: AMrXdXskanM/0WkvjVZrY91wbAOmhcP6Ir8vbKQoWlaUagTDcZmfdGn7xLrbjmNmacnJrKO3icNV8g==
X-Received: by 2002:a05:6808:1826:b0:359:ca54:ecb1 with SMTP id
 bh38-20020a056808182600b00359ca54ecb1mr28727525oib.59.1672616408619; 
 Sun, 01 Jan 2023 15:40:08 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:07 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:49 -0300
Message-Id: <20230101233653.487175-26-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+oMsZlZbGODRfe1V3OQvLz9E7Cc0/xrfitrtAj1aqc=;
 b=pf/miXoBj9qVRJY0+JziAME7Cb5yMYy0Ps4qp7B3JHVat0U98FtZn1KEpKCRDgzm3y
 wKiP9msbVT7vwvoGQOQZMgYtEQBQFiO7fixzBgRr1fdj91b743vNxaWCDiqZUZ//Swnu
 rVkejjtPCvX7ldkiO+0YGjuHR2tvUPyJCoGstKFPaz/XEicmC05Ocrru44SAQJ+fuz13
 XEZT/DLiIpbRkfSAHUL1Z4ZLRIpShlLjCKmfFWddkEU7PwoxHpCDFul0pHxZpSWbJM20
 aJERy6lENlowz92uMTXusEjy4aNuoEAcUgzOFNYjUjkp/AIwuu7YBXwIOIHaan2cw3bQ
 g4xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pf/miXoB
Subject: [Buildroot] [PATCH 25/29] utils/check-package: fix check for
 <pkg>_REDISTRIBUTE
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "8e87d76c12 check-package: check *.mk files" added a typo that
prevents check-package from checking <PKG>_REDISTRIBUTE default value.

Fix the typo: _INSTALL_REDISTRIBUTE -> _REDISTRIBUTE

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Running on current master generates no warnings.
---
 utils/checkpackagelib/lib_mk.py      | 2 +-
 utils/checkpackagelib/test_lib_mk.py | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b50a19ac62..b0bd52bdf6 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -296,7 +296,7 @@ class UselessFlag(_CheckFunction):
         r"_LIBTOOL_PATCH\s*=\s*YES"])))
     DEFAULT_GENERIC_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_INSTALL_IMAGES\s*=\s*NO",
-        r"_INSTALL_REDISTRIBUTE\s*=\s*YES",
+        r"_REDISTRIBUTE\s*=\s*YES",
         r"_INSTALL_STAGING\s*=\s*NO",
         r"_INSTALL_TARGET\s*=\s*YES"])))
     END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 49fa216fcd..5f5663377b 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -531,13 +531,13 @@ UselessFlag = [
     ('generic',
      'any.mk',
      'ANY_INSTALL_IMAGES = NO\n'
-     'ANY_INSTALL_REDISTRIBUTE = YES\n'
+     'ANY_REDISTRIBUTE = YES\n'
      'ANY_INSTALL_STAGING = NO\n'
      'ANY_INSTALL_TARGET = YES\n',
      [['any.mk:1: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
        'ANY_INSTALL_IMAGES = NO\n'],
       ['any.mk:2: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
-       'ANY_INSTALL_REDISTRIBUTE = YES\n'],
+       'ANY_REDISTRIBUTE = YES\n'],
       ['any.mk:3: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
        'ANY_INSTALL_STAGING = NO\n'],
       ['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
@@ -547,9 +547,9 @@ UselessFlag = [
      'ifneq (condition)\n'
      'ANY_INSTALL_IMAGES = NO\n'
      'endif\n'
-     'ANY_INSTALL_REDISTRIBUTE = YES\n',
+     'ANY_REDISTRIBUTE = YES\n',
      [['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
-       'ANY_INSTALL_REDISTRIBUTE = YES\n']]),
+       'ANY_REDISTRIBUTE = YES\n']]),
     ]
 
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
