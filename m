Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CF8C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 14:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D9DD81EA4;
	Sat, 25 Feb 2023 14:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9DD81EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfYoy3lU_B_G; Sat, 25 Feb 2023 14:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85BF181E43;
	Sat, 25 Feb 2023 14:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85BF181E43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D85E71BF2A7
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 14:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B938760C04
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 14:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B938760C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElRkR-QBHmvy for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 14:49:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81ACA60B4D
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81ACA60B4D
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 14:49:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h14so1998950wru.4
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 06:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fj0UCHTRhMrDjRjLsMWzAUuVEfiDvmBmdGY4X522Ws0=;
 b=5ayith8wnAeOYeMcylF6Obr+dUSApJ3qKsW1+FV99DElZHTEwmVuMSHIexDsdter/c
 ajysbQ/kyXFSVcN5nhAK9GiD8iPShrt+39yVd6kl+K8+DcWCq3kG3UcZDCHZo+rrqGXm
 bOBDYkX7ojuAZXrY59fe3ZVOlxcsSXU2N2fVyxG2edhISW21B5Tbze7VzMWv6ghwXBP0
 AKzp90jq/Nq03BGf/goS0T6LqEyLc+V6QDi7Gy1J9QAVBDP3ZJvXFxcFDtf+M/XIe8PG
 rXTl4mAweTZMpTgzs235O2uyDRmQkSWlV3IPWgH8NuSxpFDFD/zCQN7zLcaraHobS7tS
 A3Ug==
X-Gm-Message-State: AO0yUKV8h93XR/1E3Y06lUSyfiMQNDJYDj64FKeAyfm4/Nim/kL6K9AU
 xCqLOh7KyaaGAd5tGYf2ccTMdZ0suDk=
X-Google-Smtp-Source: AK7set+iI1HvgkYXp1MC0wdCCh4WggC/+ZT5zGWVzmEQdWwk/9FjhOE+JnljYU2JfOtTGDJ53nk7yA==
X-Received: by 2002:adf:fbca:0:b0:2c5:899f:3412 with SMTP id
 d10-20020adffbca000000b002c5899f3412mr15483104wrs.26.1677336550335; 
 Sat, 25 Feb 2023 06:49:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1c7901000000b003e2058a7109sm6411999wme.14.2023.02.25.06.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 06:49:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 15:49:04 +0100
Message-Id: <20230225144904.3033289-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fj0UCHTRhMrDjRjLsMWzAUuVEfiDvmBmdGY4X522Ws0=;
 b=KCGQgUZtQTjbOLBYqCp8Sq0xcOzLD+Fb+gpGEhn9nTLwuhJ5eqwzhVkhVTIO5vqUjo
 347SVDuMB8qK+lET3ZxgvfyI+V45UMCq9KLmkPHbCM3YBwJO//JMs71krOjM8nqNPM+t
 OHLpfL4yvEzK+S/yXoWBL+N1nME2qsBayJIb5dooZR+MozWu5vVRSx8jLb9YbDukcv4B
 VxrQt2K9vRYTyH+uVySMylZj1XuLQtRvwH/11UOUB4shgOhfsqn3bdzrmJWqsx2i/wAU
 8yqa33x4ZXHdHYlh4X3Ek4Ltrrf5xJr+phlqBAiQzBJ6KLG+8jOkcWpJS+gf+liHOSu0
 3N7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KCGQgUZt
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: needs C++
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
Cc: Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++ is mandatory since at least version 1.23.0 and
https://github.com/numpy/numpy/commit/c91a7d0c5691c9d78bd75284777fda73f225155d
resulting in the following build failure since bump to version 1.23.4 in
commit 32d8e23b977a5bba1f23e3821709c6aa9ff3bc55:

RuntimeError: Broken toolchain: cannot link a simple C++ program. note: A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/2d048d9b669ad60f37eeb2162b0a4f9fb425be1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/piglit/Config.in       | 6 ++++--
 package/python-numpy/Config.in | 6 ++++--
 package/python-zlmdb/Config.in | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 736fd95d71..5e957a555a 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_X11_EGL || \
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
@@ -31,5 +32,6 @@ config BR2_PACKAGE_PIGLIT
 
 	  https://piglit.freedesktop.org
 
-comment "piglit needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "piglit needs a glibc or musl toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index a65164d9d5..132c3f7a82 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -27,6 +28,7 @@ config BR2_PACKAGE_PYTHON_NUMPY
 
 	  http://www.numpy.org/
 
-comment "python-numpy needs glibc or musl"
+comment "python-numpy needs a glibc or musl toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index ac4ee05442..8eba2d7946 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ZLMDB
 	bool "python-zlmdb"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
@@ -17,6 +18,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 
 	  https://github.com/crossbario/zlmdb
 
-comment "python-zlmdb needs glibc or musl"
+comment "python-zlmdb needs a glibc or musl toolchain w/ C++"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
