Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C024C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 18:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B4F081331;
	Mon, 26 Dec 2022 18:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B4F081331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mn-5E8kCHTyJ; Mon, 26 Dec 2022 18:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1DAF8132E;
	Mon, 26 Dec 2022 18:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1DAF8132E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015E51BF488
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0FA84049C
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 18:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0FA84049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XWHhvNSACdm for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 18:21:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F92A4047D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F92A4047D
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 18:21:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so2204427wmk.4
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 10:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GqDxiojt2VO1Yfc0QG0b+hDN5/Zq6bNL3HfpbQoRcOE=;
 b=n+zfkBa5HxTPCfkz39BaCp62mARPrTB6dxMK/t6R7Rlk275xYZnp95jpc4Kch5jDK0
 o/Yxa8XYaKNww1yfeiSGIn87u9+yB1D7xOFkaUu3rTLq42OODpHntP99DF1nnnbfDfrM
 1z7uHFyLxVaW9PQo8+PRkVd8Fl+MUPgnF5MnQHi7k72zhLHA9oEdi9Q1iTKRMNKXop4Z
 9DKIe3uZ9oho0GPsGMvko319DAM26DUH/eUxeID7TKhhfIzScfWWTyKg1AuSTM1bU+JZ
 XWixzZcTK93NTWnsESRqfwRElvHrinpqFVRkoGxAGd5QpkCqHckqqqmyH1qwYgZvf142
 0kkw==
X-Gm-Message-State: AFqh2ko782s/eclY8fxjAl+i/7K0f7Stj7Zsh8ah7YHqoYlHVmZBNkoN
 WicgWlLL9f0wfjOOx+CSPbQL3BTzIFI=
X-Google-Smtp-Source: AMrXdXu8icmC7YWlskL3wwN5odlwH22wsaCATpauBGM3XbMku/tjSoPt/5PAJp2dQIqs8ZYoMaAsRg==
X-Received: by 2002:a05:600c:4da0:b0:3d2:3a53:2cd6 with SMTP id
 v32-20020a05600c4da000b003d23a532cd6mr13609778wmp.9.1672078876283; 
 Mon, 26 Dec 2022 10:21:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003d359aa353csm14428716wmb.45.2022.12.26.10.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 10:21:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 19:21:11 +0100
Message-Id: <20221226182111.279110-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GqDxiojt2VO1Yfc0QG0b+hDN5/Zq6bNL3HfpbQoRcOE=;
 b=Flz6h/YaF4GWaoa34JnjAtsJ/xViP/2xrK+w6SqhsbJlqkR5WJBvciaFfGhRcq6ebm
 T5NNO4VOa8Pwn2SEM6QVobVm+6VfxnanFWJtZ1DDyY3iNxbiNtysDRqKmDR8dyaZb4uu
 Ix0eMow06Sj4Ubf7gNTlHDlzDICVLoFfb9CfZcWbx0xdclPL2oF0qbSorbhVOopvA30m
 wa+nMzBUQbeBPMtyJK+rPwcR7Xa0Rd7vUzHBA6P3Lc4UzYuzAwTauS7a4uCAMa950Hfb
 qEuO3BcRCh11rh/jPn0VjtI4QQZTM2/c+wOu/E0zC6YpNhZear+7Y0YnjFyfvn7Q8DBY
 ms0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Flz6h/Ya
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: fix static openssl build
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

Fix the following static openssl build failure raised since commit
7967755fbf25fe4d5860884bedb3e01fcd7e9855:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-13/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
ssl_cert.c:(.text+0x384): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...se-pkg-config-to-detect-openssl-when.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch

diff --git a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
new file mode 100644
index 0000000000..7db53a1f50
--- /dev/null
+++ b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
@@ -0,0 +1,45 @@
+From 6e3fce6f81ca04dc6edc35264537751e925f75be Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 26 Dec 2022 19:11:52 +0100
+Subject: [PATCH] CMakeLists.txt: use pkg-config to detect openssl when
+ possible
+
+In order to take into account the libraries used by openssl when
+building statically, using pkg-config is recommended. This patch
+therefore improves the CMakeLists.txt to use pkg-config to detect
+openssl when pkg-config is available. This will avoid the following
+static build failure when openssl needs to link with -latomic:
+
+/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-13/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
+ssl_cert.c:(.text+0x384): undefined reference to `__atomic_fetch_sub_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/merbanan/rtl_433/pull/2290]
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d47a3eda..aa1ac754 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -175,7 +175,12 @@ set(ENABLE_OPENSSL AUTO CACHE STRING "Enable OpenSSL TLS support")
+ set_property(CACHE ENABLE_OPENSSL PROPERTY STRINGS AUTO ON OFF)
+ if(ENABLE_OPENSSL) # AUTO / ON
+ 
+-find_package(OpenSSL)
++find_package(PkgConfig)
++if(PKG_CONFIG_FOUND)
++    pkg_check_modules(OPENSSL openssl)
++else()
++    find_package(OpenSSL)
++endif()
+ if(OPENSSL_FOUND)
+     message(STATUS "OpenSSL TLS support will be compiled. Found version ${OPENSSL_VERSION}")
+     include_directories(${OPENSSL_INCLUDE_DIR})
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
