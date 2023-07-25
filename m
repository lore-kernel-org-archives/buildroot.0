Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3101CC001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB51460F6F;
	Tue, 25 Jul 2023 10:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB51460F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F82Hbm6yAdx0; Tue, 25 Jul 2023 10:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 308DB60F19;
	Tue, 25 Jul 2023 10:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 308DB60F19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5425C1BF59A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B08181CAF
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 10:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B08181CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNKFp6AaCiem for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 10:31:51 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9764981CE7
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 10:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9764981CE7
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b97f34239cso46185461fa.3
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 03:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690281109; x=1690885909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AqWTi41DY4CaEnphp9bVi2n0A2dvzfLs3Z6qzlDC3NE=;
 b=kTI3S3qJrGasEIPl1vEyV1xJTUPvKzs5cJYyr1o/jTJ+Sn0fCU0XLx/7iQM/DdXOwo
 58+Jl1G1xJOeGMeCHTcGOtiqyJRKLA3lLmo7N1y5UshHvpQj1F2qM+TxholVg80evUfn
 HoWvN1+lWBLB2MpLWH+urLilNMc66UwgBYRT00coOZ3vVtvpEhk/MvjpYTOyJXayd0wc
 MZKVG1tinVWZL4h3XAxMwyDfco5PzXCVcelgSFtcvv1P0FDWZLR7C45UO48OgsrQ+PFt
 TVLGYlKpoZDLV4EOEpNQNkPCsNiSmsUIAo64B2Ksd89dUgb3htPUDjXCB0IDhzvYZxm1
 xDWg==
X-Gm-Message-State: ABy/qLY+QVmEwatGx/94JmJTQI0CwqzaTtXm7HHrwUVkTaFHzj5qsy0a
 ccyKgMQF1Ql2XA72PG0lZ4Ik6U3EG8o=
X-Google-Smtp-Source: APBJJlGapvD+8QgPV5xyxIvQdT12liAAIZbzeFktFHRXQOH18RMygv2lSs8R/h6HaRSrML45Ba9gNA==
X-Received: by 2002:a2e:8906:0:b0:2b9:5791:88cc with SMTP id
 d6-20020a2e8906000000b002b9579188ccmr7966899lji.37.1690281108984; 
 Tue, 25 Jul 2023 03:31:48 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003fbaade0735sm16022723wmc.19.2023.07.25.03.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:31:48 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 25 Jul 2023 12:31:40 +0200
Message-Id: <20230725103140.941516-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690281109; x=1690885909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AqWTi41DY4CaEnphp9bVi2n0A2dvzfLs3Z6qzlDC3NE=;
 b=PfzzlJNVt96ljP4jc4ETnU7OD98BeQudUKZL9GfsWBbTodNoHgwaUtRt+FNnNVgOV4
 eMtJUVL3sXpUvZ1IpCNMOutMmTaC50K94o2pLax/16E2vx6j8AUaIKxEh5mLa/EW0gEI
 3eVWZ8241D/DjYaaaSUHxDw0K1niW1uEVjVvp8WXk+nlEaLXDQy00YMwNsM7q8eS9+ek
 FvspJNC1+dO2ZAltAv8cw7++lnSJ8CAvb99fPjf8/GkL4kHdgGPPWHBJMDf/yiFzoxNS
 Yz/ZLwBHmPCUPSeURbeeoPfoeHUxL2LrGxXpeoNE7yo6GoeWnDtBjGjLZAVKfN+/nPhe
 RGyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PfzzlJNV
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version 0.3.4
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
 ...MakeLists.txt-do-not-force-the-build-of-a-share.patch | 9 ++++-----
 package/libubootenv/libubootenv.hash                     | 2 +-
 package/libubootenv/libubootenv.mk                       | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
index 9040e1267..9c5438f30 100644
--- a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
+++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
@@ -29,7 +29,7 @@ diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
 index 4b71bc5..0b515f4 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -12,18 +12,16 @@ SET(include_HEADERS
+@@ -15,17 +15,15 @@ SET(include_HEADERS
  
  include(GNUInstallDirs) # for the CMAKE_INSTALL_LIBDIR variable
  
@@ -40,16 +40,15 @@ index 4b71bc5..0b515f4 100644
 -ADD_LIBRARY(ubootenv_static STATIC ${libubootenv_SOURCES} ${include_HEADERS})
 -SET_TARGET_PROPERTIES(ubootenv_static PROPERTIES OUTPUT_NAME ubootenv)
  add_executable(fw_printenv fw_printenv.c)
- add_executable(fw_setenv fw_setenv.c)
- target_link_libraries(ubootenv z)
+ target_link_libraries(ubootenv z yaml)
  target_link_libraries(fw_printenv ubootenv)
- target_link_libraries(fw_setenv ubootenv)
+ add_custom_target(fw_setenv ALL ${CMAKE_COMMAND} -E create_symlink fw_printenv fw_setenv)
  
 -install (TARGETS ubootenv ubootenv_static DESTINATION ${CMAKE_INSTALL_LIBDIR})
 +install (TARGETS ubootenv DESTINATION ${CMAKE_INSTALL_LIBDIR})
  install (FILES libuboot.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
  install (TARGETS fw_printenv DESTINATION ${CMAKE_INSTALL_BINDIR})
- install (TARGETS fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
+ install (PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/fw_setenv DESTINATION ${CMAKE_INSTALL_BINDIR})
 -- 
 2.30.2
 
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 6863b7fcf..b881994bf 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8fc9498b557bbf4ae4d39a2dbd15a2ef44f8ea8de4686cc971c6788a65cd1ec0  libubootenv-0.3.3.tar.gz
+sha256  78faadcfac67e50273e5d4e95e6cf6fee3d486ce9dc568d1fe25312271a88768  libubootenv-0.3.4.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index e841e0b84..b4c958810 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.3
+LIBUBOOTENV_VERSION = 0.3.4
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
@@ -12,6 +12,6 @@ LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
 	LICENSES/MIT.txt
 
 LIBUBOOTENV_INSTALL_STAGING = YES
-LIBUBOOTENV_DEPENDENCIES = zlib
+LIBUBOOTENV_DEPENDENCIES = libyaml zlib
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
