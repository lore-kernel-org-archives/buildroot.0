Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A3AC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 15:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8015660EE4;
	Mon,  2 Jan 2023 15:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8015660EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyseJNYLsYPM; Mon,  2 Jan 2023 15:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD8360ECE;
	Mon,  2 Jan 2023 15:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD8360ECE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 269C01BF2F1
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 15:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F3CC60ECE
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 15:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F3CC60ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25BRiPPiV9Nt for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 15:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A4860ECD
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78A4860ECD
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 15:45:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j17so21256709wrr.7
 for <buildroot@buildroot.org>; Mon, 02 Jan 2023 07:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jb0wgJ8gOVEzy6oxn2OaRIxlPApK+IOfm3ttNuDk52k=;
 b=C3j2T5gCOjQ6RQ5+KEj5MjOSq8v2QluusCvIXyZ2hEJPxIMr0ALVc1EEro8M/PZM9k
 ri2rFUlR2w4T/OIkdLoFyCZ/AnRlVnA3Kn79PdGwxuau+5CYf8WSZ5zJiV0IaVs6XetI
 qpw38IIzqCl1JXVo5QNyeAbW0F9hz0xTbZXWCAPkfxA6JIY89Huu+3q/81bVa26Tfg4b
 xXcbq4a9jrA2JfdqeUu0Q1oO3+yZXhqiq+Lp4XE3RRFbQSpNBjW7W973flUPvZqEn+jc
 6NPwrNDcMNIADs9XKu5UNfzkrv5IpwyhMqEVO36Mw+CRqjPDQhEA2sNocg4QuncnMVfD
 znNg==
X-Gm-Message-State: AFqh2kod7eHaWd8CpKfHggwUOlu9BybbwqUwu5LSckYQABB/j9R0jJKS
 dS4gVSdmdqG9dWAXG0zla+QpMLRCJFA=
X-Google-Smtp-Source: AMrXdXuZmKqRci/14d39Hic3YojSq3bh+uSw7O9eRO9eF8GyY5OgzlFdfN77VAnYpxT2WzhFcRjdMw==
X-Received: by 2002:adf:f844:0:b0:280:cc12:2835 with SMTP id
 d4-20020adff844000000b00280cc122835mr14368392wrq.65.1672674354532; 
 Mon, 02 Jan 2023 07:45:54 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a1800a2cec8fffeea5f12.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:a2ce:c8ff:feea:5f12])
 by smtp.gmail.com with ESMTPSA id
 f8-20020adff8c8000000b00282194eaf7bsm18844796wrq.71.2023.01.02.07.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 07:45:54 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 16:45:49 +0100
Message-Id: <20230102154550.78227-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jb0wgJ8gOVEzy6oxn2OaRIxlPApK+IOfm3ttNuDk52k=;
 b=bxGcZZYWDq1+1teJfJj/t2lk0G6awBm7fjQZ3NJKLJReZlYPYOWpj9seMdxUTbcQTQ
 K1sYtEB1BgkRDzE0DV1UiqoZ+UMRV1uvLOLKqkYrRJWd6Q0o/bn9d3P8ZH0uEK1gbADw
 AvA+mPl/DZ1QJrQAvGEJsX0ynwglw2DToyUHBgraUmJuUk2N1ziepFgrgBVnNONn2E4B
 Q2MWI/WL6QwWbk4+juiDvjo4lh4OSkgKqAPd9HkidsSu2d0BNvle3TOPeUsungHgir2l
 hAG2y8+pDM/qigWDMuCb4rc1H1FY4m0WESPfvrDfR2rsR8sc+o/hry5gmezj/rzAMpRa
 n5Tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bxGcZZYW
Subject: [Buildroot] [PATCH] package/minetest{-game}: bump to version 5.6.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release announcement:
5.6.0: https://forum.minetest.net/viewtopic.php?f=18&t=28511
5.6.1: https://forum.minetest.net/viewtopic.php?f=18&t=28703

minetest:
- Update license file hash due to new image file in the project sources.
- IrrlichtMt 1.9.0mt8 is required to build Minetest >= 5.6.1.
- Add xlib_libXi dependecy for xinput2 support enabled by default for Linux.
- Remove xlib_libXxf86vm dependency previously used by gamma ramp code [1].

[1] https://github.com/minetest/irrlicht/commit/538c9e5cde425ecee1e802fd53344111683b60be

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/minetest-game/minetest-game.hash | 2 +-
 package/minetest-game/minetest-game.mk   | 2 +-
 package/minetest/Config.in               | 2 +-
 package/minetest/minetest.hash           | 6 +++---
 package/minetest/minetest.mk             | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 2b7eeffd8f..629871edbe 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5a24fec4ed838744906f020096c35616e7ba76eeec2b93b980a40af011107e7c  minetest-game-5.5.1.tar.gz
+sha256  5dc857003d24bb489f126865fcd6bf0d9c0cb146ca4c1c733570699d15abd0e3  minetest-game-5.6.1.tar.gz
 
 sha256  f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0  LICENSE.txt
 sha256  ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3  mods/beds/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index e5ee45b6ab..ec8d5bff26 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.5.1
+MINETEST_GAME_VERSION = 5.6.1
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 3e331dff7e..4e139ac3e2 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_MINETEST_CLIENT
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXI
 	help
 	  Build Minetest client.
 
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index e78f865969..ec67d4136d 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  dc0ae5188ef351db85c38b27f38f8549b133ed82aa46daea6deee148aa3454f4  minetest-5.5.1.tar.gz
-sha256  6d38dd7f3e3c8d768e1f5776b98dd5359b184c2e6740ddf733f4dc8615191bef  irrlicht-1.9.0mt5.tar.gz
+sha256  1440603e19dca70e2691e86a74c822ee2c4a36fceee32b2d85ae74772149e9a3  minetest-5.6.1.tar.gz
+sha256  27594242da8c7cc1e5ef45922e1dfdd130c37d77719b5d927359eb47992051e0  irrlicht-1.9.0mt8.tar.gz
 
-sha256  d1d8a63f7f70d89a3a899f3b9fb5ca1ea7dbbd4eb449be2a7b2ff861b1f09192  LICENSE.txt
+sha256  b38c8d428ceddf8e9b49dca63610c74499d952895d756b7eab5f5d4cef2954f6  LICENSE.txt
 sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  lib/irrlichtmt/doc/irrlicht-license.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 6d56c3222f..3904bd687c 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.5.1
+MINETEST_VERSION = 5.6.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds), Zlib (irrlicht)
 MINETEST_LICENSE_FILES = LICENSE.txt lib/irrlichtmt/doc/irrlicht-license.txt
@@ -12,7 +12,7 @@ MINETEST_CPE_ID_VENDOR = minetest
 
 MINETEST_DEPENDENCIES = gmp jsoncpp luajit sqlite zlib zstd
 
-MINETEST_IRRLICHTMT_VERSION = 1.9.0mt5
+MINETEST_IRRLICHTMT_VERSION = 1.9.0mt8
 MINETEST_EXTRA_DOWNLOADS = $(call github,minetest,irrlicht,$(MINETEST_IRRLICHTMT_VERSION))/irrlicht-$(MINETEST_IRRLICHTMT_VERSION).tar.gz
 
 define MINETEST_IRRLICHTMT_EXTRACT
@@ -36,7 +36,7 @@ MINETEST_CONF_OPTS = \
 	-DBUILD_UNITTESTS=OFF
 
 ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
-MINETEST_DEPENDENCIES += bzip2 freetype jpeg libgl libpng xlib_libXxf86vm
+MINETEST_DEPENDENCIES += bzip2 freetype jpeg libgl libpng xlib_libXi
 MINETEST_CONF_OPTS += -DBUILD_CLIENT=ON
 else
 MINETEST_CONF_OPTS += -DBUILD_CLIENT=OFF
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
