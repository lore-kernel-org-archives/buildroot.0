Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB33E71094
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 16:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F18083BD5;
	Thu, 21 Sep 2023 16:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F18083BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgkeTMV6GEE6; Thu, 21 Sep 2023 16:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB90C83BB3;
	Thu, 21 Sep 2023 16:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB90C83BB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A89E91BF228
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 16:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81C4B60BF9
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 16:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C4B60BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sugz014_kPNn for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 16:48:15 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 689DB606B0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 16:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 689DB606B0
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32172f8a5dbso1132222f8f.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 09:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695314893; x=1695919693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LjTsUeVuZUehsEUrDRsh+Kv3Qp+P51hdYF9XL046GFA=;
 b=MBNpZ+LUoO5zQXtTY1TBWFBfrJkDbWVyrYmuffKt6D/tp6xuJHwvcw2c/iCQ2hQcK9
 8YDZkUtfSocB0G/15Z/lPagEVfPqDXwR1pRG2iNTmCdaz745zr8uICDAp8mJkdFoA6Yb
 bHtPawa3YeUkKx5BxQkB3RohrNbXyYcZCMzy5UxjOD9yADSZvqilUaHs+Op+Q5wRIuy3
 yX13AZNFLoxUVcdDvcHu8+3jhVMz/v8N+x5KQxPfZ3yOvfDExycOUykc3owLRr/t884f
 vsqMuNLSH/1QtDW9i3LPKH5ZaN5Dq43CQUYXBjb7wVXDgkshnLkkIC7BobG6F0ls50zz
 iqIg==
X-Gm-Message-State: AOJu0Ywk2uOGh5fcy7+VyjD6xzJsvQ9+wQD3GcMgF2ja0VMjb/3zlwjL
 1B9x52miK8cK4mZOUEJ+uM2sGaGTR0s=
X-Google-Smtp-Source: AGHT+IHu12IZ9onqtr75PPWDJQTZhjndkqT6id0XwMyjSwfubQ7bq9fh7sXERWSl1BYtkZNKuFuyVA==
X-Received: by 2002:adf:db47:0:b0:313:f94f:3b15 with SMTP id
 f7-20020adfdb47000000b00313f94f3b15mr4972592wrj.2.1695314892681; 
 Thu, 21 Sep 2023 09:48:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b0031fe0576460sm2244824wrx.11.2023.09.21.09.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 09:48:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 18:48:09 +0200
Message-Id: <20230921164809.102741-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695314893; x=1695919693; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LjTsUeVuZUehsEUrDRsh+Kv3Qp+P51hdYF9XL046GFA=;
 b=ZKHjhW9XOyuMkw5chL+CY2jPAjmTAIHHr+Zy15mojZ9Qr1GifwyDUEOTxdpnkgBfwf
 9yYF+npBtFPNU/srlisZFBitQpP+3uBOa5akTnuDd4mFxKe0VdUeXMrRlfedYm642Oml
 3UjyK9DCtKTQGGrpLtsMlSauzPAiVi8EvtXFKPN/MyOcjLIMNYyp4uuKn5dN0qctTr1e
 /OZaiinTxhG5pyBxcphXqkNIiqc02ZIUKHbFHFw4KGhZnJifQFMcKwKRzqCKBcyBWSYw
 GUk12wTLo91mfxPL07qyr6qEC4t2JTRxm4yafKdYxbrMEBi9nlRfBALF8VxkehBRblfs
 2iyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZKHjhW9X
Subject: [Buildroot] [PATCH v2, 1/1] package/vulkan-loader: fix x11 handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 6aa1bc31678ff9f8013084fda34b9f941cc63fc3:

In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.h:24,
                 from /home/buildroot/autobuild/run/instance-3/output-1/build/vulkan-loader-1.3.262/loader/extension_manual.c:23:
/home/buildroot/autobuild/run/instance-3/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/vulkan/vulkan.h:71:10: fatal error: X11/extensions/Xrandr.h: No such file or directory
   71 | #include <X11/extensions/Xrandr.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop select

 package/vulkan-loader/vulkan-loader.mk | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/vulkan-loader/vulkan-loader.mk b/package/vulkan-loader/vulkan-loader.mk
index f6dd9d0ac3..b1545a4972 100644
--- a/package/vulkan-loader/vulkan-loader.mk
+++ b/package/vulkan-loader/vulkan-loader.mk
@@ -26,13 +26,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VULKAN_LOADER_DEPENDENCIES += libxcb
-VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=ON \
-	-DBUILD_WSI_XLIB_SUPPORT=ON
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=ON
 else
-VULKAN_LOADER_CONF_OPTS += \
-	-DBUILD_WSI_XCB_SUPPORT=OFF \
-	-DBUILD_WSI_XLIB_SUPPORT=OFF
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XCB_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
+VULKAN_LOADER_DEPENDENCIES += xlib_libX11 xlib_libXrandr
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=ON
+else
+VULKAN_LOADER_CONF_OPTS += -DBUILD_WSI_XLIB_SUPPORT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
