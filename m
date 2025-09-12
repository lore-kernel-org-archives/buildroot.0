Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4CECA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 07:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E72FE81BBD;
	Fri, 12 Sep 2025 07:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iq56ldMDBWYn; Fri, 12 Sep 2025 07:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C6281B48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C6281B48;
	Fri, 12 Sep 2025 07:20:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC63812D
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 07:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2FC360714
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 07:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lycj5Gmo6OBU for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 07:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A492160ACF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A492160ACF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A492160ACF
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 07:20:20 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so1039273f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 00:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757661619; x=1758266419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zEVrtfgd1tlwEkE58lrufDBOWKKi6SPXslKmAf+/GbA=;
 b=mdSOOswrAnBcEGuFetIvnYCfhE7YK3meCCXzNGwRYC1EIvBnDnSx2Vn51D79cHVKUL
 +Hfg08tfd5gOyEdRRrxPb1Tt8FlT3Z3OLWChJXfqhzN4dMTKVerFuYLKobbkAxmJThNx
 8wpfWfyQway8jGR5+wmeYjrFq4V6Qwk7LflrpZ4CooOco3rd6rP1KSwwDJyXBLGhOqko
 eivziWHZdjfvjGrnqQ9WljHOqRhDcMBcB+cO/biOlNHdmyAL4uOxJApIuoYEyRgUtl8u
 1fZrrvWOIPeCKPsboPIpQQCt8FNGhpPoK9f8QmPfP2ktyqLX7c9BHKgshdrdNtstzFdG
 JlUg==
X-Gm-Message-State: AOJu0Yz4rltJleVtYYoZy878GF2Az6B+mMwbxCOYONYHMduwioEHYxsj
 dNcveUHE1wYM1HYBLsaXpIFZg4eMNVkOhtrPWaogzSjDmVeT/67BvS++KhBIydTbqNNXBypucku
 bjOe58I0=
X-Gm-Gg: ASbGncvpuAOIZxpvIz1eyqzEpocjS+LHjWSeK03DU3hMYTGWCyj8VGNMAq45Q4NuDM7
 5rU3eKC6vpDuuKkvz3VUICN9KqgCMilNBo+zolLzbYU6DNDF52LoTcTg6P7xd0adul7gdGg4GuN
 xfsDM3+DDsY0qOL8d1bniRbfbV+76erLB1NY/s+diiW1z3dJOhtVfiCycY5waIlZn77sVYqRyUD
 P392n6KIs3z8L5+mqoU4vnsyufHuv7cwpACsfoShCctw22ymP41hNm8ZL0KnQKi5rS3Z/adO87+
 iarVHzheCux1WcHOldrtZW/LQl/bmOOFTLFPQCIQlXB1nSIvnY80uaYMX94uJ8oWtv3B5ZmEXpY
 W3Axt+EWEcIDlNEQ=
X-Google-Smtp-Source: AGHT+IHMsDsdI7t0RVs4dlg+BMtoY46tQkDwp2ZexSSn5Hg5qDTibformJT9D4qHYO1wwN4yMbZgew==
X-Received: by 2002:a05:6000:438a:b0:3ce:bf23:3c32 with SMTP id
 ffacd0b85a97d-3e7658bb980mr1510385f8f.22.1757661618619; 
 Fri, 12 Sep 2025 00:20:18 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03718c64sm51001055e9.3.2025.09.12.00.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 00:20:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Sep 2025 09:20:16 +0200
Message-ID: <20250912072016.115101-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757661619; x=1758266419; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zEVrtfgd1tlwEkE58lrufDBOWKKi6SPXslKmAf+/GbA=;
 b=KPzZ2skaPyo91qjGFdxZQ9Fz1CV8Ysax2OX4CXS9f2VvXeVTq0sJIVzhSYYRLGT/YW
 8GDcLYHkWimguc/8z0Puqrb7r5mql7pdeak7uDX6/gCTMzmgNVijcnZ1ofEiU/u2123m
 UrIzDxyXwx5RImEc4I2TZ32QEtcpjR6e2cYIY99+IEhcGR3SMH+LxbFt098tKmVM8vZI
 HlAZ8He6klfAlXSTfxE++NhkOkIK4OGx4l8Zd2bcqQvsRF5RIMfZ8Wi+GvSgQeysryrK
 hm3C9zi6mJjiZFJIiJzUOwmvvNS5cKnKp9J4zrtqdWZAqcTVdSNEl2E0c9GwcsbNIktx
 2APg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KPzZ2ska
Subject: [Buildroot] [2025.02.x, PATCH] package/avrdude: remove 0001 patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit dd4299e87a87bffee4491fdd30c9c23dc75fa7cb.

The SWIG implementation is not present on version 7.2 avaiable on
2025.02.x. It was introduced in version 8.0 of avrdude [1].

[1] https://github.com/avrdudes/avrdude/pull/1714

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...s.txt-allow-disabling-Python-support.patch | 59 -------------------
 package/avrdude/avrdude.mk                    |  2 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch

diff --git a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch b/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
deleted file mode 100644
index fc6210c099..0000000000
--- a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 41ee27cf1d31bbc62425aab286b7e524acc64bff Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 29 Aug 2025 22:21:50 +0200
-Subject: [PATCH] CMakeLists.txt: allow disabling Python support
-
-In some cases, even if Swig is found and Python3 is found, it may not
-be desirable to build Python support in avrdude, so this commit adds
-an ENABLE_PYTHON_SUPPORT option to be able to explicitly disable using
-Python support (unfortunately CMake doesn't allow passing arguments
-that would prevent it from finding Swig/Python 3 if available).
-
-To preserve existing behavior, this option defaults to enabled (ON).
-
-Upstream: https://github.com/avrdudes/avrdude/pull/2051
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7f3fce92..94263bab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -34,6 +34,7 @@ option(USE_EXTERNAL_LIBS "Use external libraries from AVRDUDE GitHub repositorie
- option(USE_LIBUSBWIN32 "Prefer libusb-win32 over libusb" OFF)
- option(DEBUG_CMAKE "Enable debugging output for this CMake project" OFF)
- option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
-+option(ENABLE_PYTHON_SUPPORT "Enable Python support" ON)
- 
- if(WIN32)
-     # Prefer static libraries over DLLs on Windows
-@@ -281,14 +282,16 @@ if(HAVE_LINUXGPIO)
- endif()
- 
- # -------------------------------------
--# Find SWIG
--find_package(SWIG 4.0 COMPONENTS python)
--if(SWIG_FOUND)
--  find_package(Python3 COMPONENTS Interpreter Development)
--  if(PYTHON3_FOUND)
--    set(HAVE_SWIG 1)
--  else()
--    message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+# Find SWIG/Python3 if needed
-+if(ENABLE_PYTHON_SUPPORT)
-+  find_package(SWIG 4.0 COMPONENTS python)
-+  if(SWIG_FOUND)
-+    find_package(Python3 COMPONENTS Interpreter Development)
-+    if(PYTHON3_FOUND)
-+      set(HAVE_SWIG 1)
-+    else()
-+      message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+    endif()
-   endif()
- endif()
- 
--- 
-2.50.1
-
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 7ffecce041..54d83dec4b 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -9,7 +9,7 @@ AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DENABLE_PYTHON_SUPPORT=NO
+AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
