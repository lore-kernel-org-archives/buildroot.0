Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DDBC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 065A440462;
	Tue, 27 Dec 2022 20:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 065A440462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hgpDyQEBpkZ; Tue, 27 Dec 2022 20:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CA3D40472;
	Tue, 27 Dec 2022 20:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA3D40472
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 947ED1BF59F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D47840467
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D47840467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hg3v5iQY6ZU5 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E0A14047B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E0A14047B
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:08:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j17so7920877wrr.7
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 12:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fXoy2tvPj9irPEdb6HGlhnih1mXPdTx8kTQFZPUo9FQ=;
 b=1C7JrZ0nxmU2tQHyTvSS7ZsvHWgxqDOL89yH7zuYu84CPpF19QhbpUSPMlsDdGrTb2
 NQsqEwImMZ5bl+BQT6S1+dvV4lQ4bGLvO5+MDSMEfZqo+0l3NjosWAnmFKp0hw7zShV+
 s3LoTGo6u22zI0pykZgT2IRVQpofgESkuQq9bK7fXx03rjv5HkhIT341f2p4vBPrlUQy
 DRFYML6PZDuXuPwzkxSQ1URqjQ92pBI4pU/CXedc+4ET8Y4u1KM2BgAYAwcNc4G+F47L
 S1H6AZJMimqTOlIhWjlB/+zzDMUD7LAAfwMqz/qHL6pG8be838eiJWPPcTbNIxYVxU29
 jenQ==
X-Gm-Message-State: AFqh2kq/vwIXRle+9xk1YTK11zz2Nivw/7l3HBYIsun+Q1MYeJ03dq2N
 RjFOiBUYEMxe9UuZ251JmJ8T+UImx80=
X-Google-Smtp-Source: AMrXdXviZrWITK3l6MDhW4hgs/kn0hO/uP1eHSM3f4YqwcItQTBdJQZG6gPCEn4wA9M+xO0kCwuN4Q==
X-Received: by 2002:a5d:6a4c:0:b0:242:5878:291e with SMTP id
 t12-20020a5d6a4c000000b002425878291emr15024066wrw.51.1672171698811; 
 Tue, 27 Dec 2022 12:08:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d484e000000b00242814c2cf0sm13885980wrs.4.2022.12.27.12.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 12:08:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:08:14 +0100
Message-Id: <20221227200814.231660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fXoy2tvPj9irPEdb6HGlhnih1mXPdTx8kTQFZPUo9FQ=;
 b=HX3waVYyQVi8pKgkyFsVz012R+rn0Puv+sqj6Lt/IMpjbqJ0unsr/9xPYyIovLJ8GG
 6GJVXGQZokHt2dAkAQBWdjBbvXQ1iZfGbA19at63P70gfDrY65VWrascyK+PYsfvuPd9
 GD9L+pXKaWRC/5pEmMRayitO+mNQE6QjOtnEH1bNbKk+J6CxMOetqqQehebczHW3k6co
 oRqZs/OEVe9kBBFcBUmDDH5k+Xw0+VglzmCO5th2Q4qiSCxZQJip0LDDY7Q2H+DdWgsR
 NqOt+dns1G7KfU4XtsdNhIVa7j6BCz6KXYY17g8NmBu13Bp0Lw7rKHFFHDxqShmaayJ6
 0FMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HX3waVYy
Subject: [Buildroot] [PATCH v2,
 1/1] package/rtl_433: fix static openssl build
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
Changes v1 -> v2 (after review of Thomas Petazonni):
 - Use upstream patch

 ...se-pkg-config-to-detect-openssl-when.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch

diff --git a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
new file mode 100644
index 0000000000..00858c8ff9
--- /dev/null
+++ b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
@@ -0,0 +1,42 @@
+From b860de9e207d8fe2ea37dad28fdd014493d87703 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 27 Dec 2022 16:29:16 +0100
+Subject: [PATCH] build: Fix CMake to use pkg-config openssl when possible
+ (#2290)
+
+In order to take into account the libraries used by openssl when
+building statically, using pkg-config is recommended. This patch
+therefore improves the CMakeLists.txt to use pkg-config to detect
+openssl when pkg-config is available. This will avoid
+static build failure when openssl needs to link with -latomic.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/b860de9e207d8fe2ea37dad28fdd014493d87703]
+---
+ CMakeLists.txt | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d47a3eda2..cf30d8be2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -175,7 +175,14 @@ set(ENABLE_OPENSSL AUTO CACHE STRING "Enable OpenSSL TLS support")
+ set_property(CACHE ENABLE_OPENSSL PROPERTY STRINGS AUTO ON OFF)
+ if(ENABLE_OPENSSL) # AUTO / ON
+ 
+-find_package(OpenSSL)
++find_package(PkgConfig)
++if(PKG_CONFIG_FOUND)
++    pkg_check_modules(OPENSSL openssl)
++    set(OPENSSL_LIBRARIES ${OPENSSL_LINK_LIBRARIES})
++    set(OPENSSL_INCLUDE_DIR ${OPENSSL_INCLUDE_DIRS})
++else()
++    find_package(OpenSSL)
++endif()
+ if(OPENSSL_FOUND)
+     message(STATUS "OpenSSL TLS support will be compiled. Found version ${OPENSSL_VERSION}")
+     include_directories(${OPENSSL_INCLUDE_DIR})
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
