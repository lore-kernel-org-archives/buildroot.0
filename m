Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586AAC25B08
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 13:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B84AA6114C;
	Fri, 12 Aug 2022 13:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B84AA6114C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FeGB4YP6fbf; Fri, 12 Aug 2022 13:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE85260ABA;
	Fri, 12 Aug 2022 13:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE85260ABA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 766561BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E92260ABA
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 13:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E92260ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1ngNjqdbbNM for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 13:05:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 549DB60AAD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 549DB60AAD
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:05:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so3817259wmq.0
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 06:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jApr3mqmdpv7yMRzEa1KDnjO4OK8E37wh1t+NfQGMYU=;
 b=SUI+HA6jbQRdHdrrfuYXvqZVRnZnDXV7Pb/D3LkOdiXu6cvli1ADD1t/DCqk1bFaBK
 y458kFD2mitzFlqmFgKDKdPA9h7RXdComW7hnRRfucazTwo/GKJwemfClwZLgwlYLhnz
 FZSOPOlEgJlmODSzs1uqd5zaD1cv9EfyVwlkYpM0XD90W5cZwRE9sT98uq6lAVry2I8M
 /+c2cnlT7uWa1EZhAFY8awskHsRVhN3U87VQVJTx5vUH3Zaoh2UueZd8nIjs12dW9e50
 RWXcaZ0mNz4oVUIn8B49pJphsCqoZgIZOgwykjsv1t9QRWb4xHn7MgEXzcpzBHcEar+1
 Drtg==
X-Gm-Message-State: ACgBeo19FO1DbB1P71ITQhydXOYLr2DKD2GpiM0XLOb8otqeQerwTOqV
 jYHfljWLYtlvSIKEcwyStL/phZrPNoY=
X-Google-Smtp-Source: AA6agR48pWj8+feyaqoB/G4CUnJ2C23zoWoscw3PeCOQ63lhK50AcuWYPFIh7fyt24+OCt4y9MLGow==
X-Received: by 2002:a7b:ce02:0:b0:3a5:47a:3897 with SMTP id
 m2-20020a7bce02000000b003a5047a3897mr8848018wmc.102.1660309530253; 
 Fri, 12 Aug 2022 06:05:30 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b005f8c665f94b38664.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:5f8c:665f:94b3:8664])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003a308e9a192sm10910586wms.30.2022.08.12.06.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 06:05:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 15:05:26 +0200
Message-Id: <20220812130526.99002-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jApr3mqmdpv7yMRzEa1KDnjO4OK8E37wh1t+NfQGMYU=;
 b=alZuS+lE/JieXuiuGPcLEfiwF0Ibk8e03wb6I6g1YnFuLUd9SbAiuPJ4AUQ0jAz1CS
 1VbACI2XhaecFdNVFAFaKtDxgM7+gcky5RvgTwhq/f3zkbKoUhVCqLgTENHGQOPX7ziP
 Sz7wO8TWOrFp2H+DZvgnJGhmaep9Dxd/yYGM4WnupvaMl/vmkPEbUBZ84i/Nb6e49zZ9
 Dj9AoJoErUCuuGKnaw7IyQnZoRToOQVkOTvyrFQqbshMsDoH2SBqCvPknK+odY1z3HpJ
 hREIFX1PSCz5HyYqNamtxi8Ss9cq+rpIniQTeIJv6AlkYtIubR5ERcGRlzFSFYZcskD6
 qfIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=alZuS+lE
Subject: [Buildroot] [PATCH 1/1] package/intel-mediadriver: fix build with
 libexecinfo
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libexecinfo raised since bump to
version 22.4.3 in commit dd1c8879c503a093b807ea8ab04c31f685e7b340:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/intel-mediadriver-22.5.1/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp:2481: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/3316e39c5113bb7600374eda45497a87c9ac9873
 - http://autobuild.buildroot.org/results/1074e832dd2f67e6fea8ff1fc7e226245a4d51bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Fix-build-with-libexecinfo.patch     | 43 +++++++++++++++++++
 .../intel-mediadriver/intel-mediadriver.mk    |  4 ++
 2 files changed, 47 insertions(+)
 create mode 100644 package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch

diff --git a/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch b/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch
new file mode 100644
index 0000000000..3a6705f2b8
--- /dev/null
+++ b/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch
@@ -0,0 +1,43 @@
+From c5177d6fc64ad8bc25c8fbbe324e52744ef52e18 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Aug 2022 09:50:33 +0200
+Subject: [PATCH] Fix build with libexecinfo
+
+Fix the following build failure with musl or uclibc-ng and libexecinfo:
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/build/intel-mediadriver-22.5.1/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp:2481: undefined reference to `backtrace'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3316e39c5113bb7600374eda45497a87c9ac9873
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/intel/media-driver/pull/1470]
+---
+ media_driver/media_top_cmake.cmake | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
+index 0e19a47c9..936d8c35a 100755
+--- a/media_driver/media_top_cmake.cmake
++++ b/media_driver/media_top_cmake.cmake
+@@ -271,10 +271,16 @@ set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
+ set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
+ set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
+ 
++set(MEDIA_LINK_EXTERNAL_LIBS "${PKG_PCIACCESS_LIBRARIES} m pthread dl")
++find_package(Backtrace)
++if(Backtrace_FOUND)
++    set(MEDIA_LINK_EXTERNAL_LIBS "${MEDIA_LINK_EXTERNAL_LIBS} ${Backtrace_LIBRARY}")
++endif()
++
+ bs_ufo_link_libraries_noBsymbolic(
+     ${LIB_NAME}
+     "${INCLUDED_LIBS}"
+-    "${PKG_PCIACCESS_LIBRARIES} m pthread dl"
++    "${MEDIA_LINK_EXTERNAL_LIBS}"
+ )
+ 
+ if (NOT DEFINED INCLUDED_LIBS OR "${INCLUDED_LIBS}" STREQUAL "")
+-- 
+2.35.1
+
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index f43e6d1b42..4669c71bf6 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -18,6 +18,10 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 	libva \
 	mesa3d
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+INTEL_MEDIADRIVER_DEPENDENCIES += libexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 INTEL_MEDIADRIVER_DEPENDENCIES += xlib_libX11
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
