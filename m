Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C7A4848EE;
	Tue, 22 Mar 2022 23:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nPT_8k9wSV0; Tue, 22 Mar 2022 23:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7880C848E6;
	Tue, 22 Mar 2022 23:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45D401BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33974612B8
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVpesCoFRxYZ for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 332D960E83
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:34 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h63so22010752iof.12
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEpuGEAeiwFZaJKxuTyO9bugo22CVcMwdem/MIfVEnw=;
 b=SRlS0/iXY04G6Sx3U2F2WvBQIyWYZaErzVvYkLcoeAEOFNIjPIs8zEBcpqenjeXvZQ
 +IMjPkdUgTv3bgZz9qiaTFFRtfbcBONou0H0jLQLBGU0Ny0alpwB3DfEowNzmbXB2ldf
 5sYCYYKbzW1aQi36ANrvx+hUJUcGHkheeZHBMmGA9e0+hln/BwJF4+0DQ42yOIXFUfgw
 YnyhopeTJMO9zRWI2A8BwysZpZelWqcw0rU24almEHSu2OTZtgy3Qdtvcd63oAgiGQSS
 pqhgNaSyZi121u62u26KR8lxxEHW2x1ZyFkVbiP+vru07xyHG+mGCtDwpXzvGqvi31Ey
 iEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEpuGEAeiwFZaJKxuTyO9bugo22CVcMwdem/MIfVEnw=;
 b=virxyFTih+DUsYUe14fPSvShYFOAkJ0tTPXIcNBV7uTIkH1csH/1nes8ySTEzx93Nm
 CnV3GUZbK2DbK6wLkbysmeAmJp7uhytrLv4JXsnpc9bHmdTL05YsaVI9Q9nzPvo8Rp6O
 OhnFnMZCfnuU2h39tcEf7LVVBf4NclBhq0Q59lmYx9p5X8B/ueIHWZ4t6Wem5EYBEVcf
 HmK/hevvE8ixwtmI8VBtWw9HJkhnOYHlZ+cjQ/pWGWXuh5rVfqteytEpCSDwjegBrCZC
 Z+5xBznX4QbhhP6Esz2A35qNqsxVvbnByBvqVvcns1nmfTIXSV8uXH/lD5hh0PyoxpS4
 p+fw==
X-Gm-Message-State: AOAM533fIfCs6oyGMoo0w/rMlRiFCH55pF7boWjRuYTxiDO4zi5eDw+y
 fkPT+mZO73wmv9dYKoQjgD6F0qOpvoBMSLbU
X-Google-Smtp-Source: ABdhPJyCgLxP/40Ij6h3PSVhNUZ2LihzRx8VJURWOYj4q359PChDd695/pr1Q6Mx2vPAzaAQ1tC4Zw==
X-Received: by 2002:a05:6638:258f:b0:31a:1c77:f6ef with SMTP id
 s15-20020a056638258f00b0031a1c77f6efmr13676179jat.25.1647991353787; 
 Tue, 22 Mar 2022 16:22:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:14 -0600
Message-Id: <20220322232224.2842266-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 01/11] package/llvm: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v11 -> v12:
  - add gcc 5 dependency due to c++14 requirement
  - propagate gcc 5 reverse dependency
  - remove unsupported config options
---
 package/clang/Config.in  |  6 +++---
 package/llvm/Config.in   |  6 +++---
 package/llvm/llvm.hash   |  2 +-
 package/llvm/llvm.mk     | 20 ++++++--------------
 package/mesa3d/Config.in |  6 +++---
 5 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/package/clang/Config.in b/package/clang/Config.in
index a67e7631a8..7c732c7af7 100644
--- a/package/clang/Config.in
+++ b/package/clang/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CLANG
 	bool "clang"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -14,10 +14,10 @@ config BR2_PACKAGE_CLANG
 
 	  http://clang.llvm.org
 
-comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
+comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "clang needs a toolchain not affected by GCC bug 64735"
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 6ec2ffcfe6..c1887e36dd 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
 config BR2_PACKAGE_LLVM
 	bool "llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -55,10 +55,10 @@ config BR2_PACKAGE_LLVM_BPF
 
 endif
 
-comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
+comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 6bf2755777..e93a922492 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
+sha256 ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5 llvm-11.1.0.src.tar.xz
 sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 6c721c30b9..825de96392 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 9.0.1
+LLVM_VERSION = 11.1.0
 LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
@@ -157,15 +157,9 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 
-# Disable C++1y (ISO C++ 2014 standard)
-# Disable C++1z (ISO C++ 2017 standard)
-# Compile llvm with the C++11 (ISO C++ 2011 standard) which is the fallback.
-HOST_LLVM_CONF_OPTS += \
-	-DLLVM_ENABLE_CXX1Y=OFF \
-	-DLLVM_ENABLE_CXX1Z=OFF
-LLVM_CONF_OPTS += \
-	-DLLVM_ENABLE_CXX1Y=OFF \
-	-DLLVM_ENABLE_CXX1Z=OFF
+# Compile llvm with the C++14 (ISO C++ 2014 standard).
+HOST_LLVM_CONF_OPTS += -DCMAKE_CXX_STANDARD=14
+LLVM_CONF_OPTS += -DCMAKE_CXX_STANDARD=14
 
 # Disabled, requires sys/ndir.h header
 # Disable debug in module
@@ -237,13 +231,11 @@ endif
 HOST_LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
 	-DLLVM_BUILD_RUNTIME=OFF \
-	-DLLVM_INCLUDE_RUNTIMES=OFF \
-	-DLLVM_POLLY_BUILD=OFF
+	-DLLVM_INCLUDE_RUNTIMES=OFF
 LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
 	-DLLVM_BUILD_RUNTIME=OFF \
-	-DLLVM_INCLUDE_RUNTIMES=OFF \
-	-DLLVM_POLLY_BUILD=OFF
+	-DLLVM_INCLUDE_RUNTIMES=OFF
 
 HOST_LLVM_CONF_OPTS += \
 	-DLLVM_ENABLE_WARNINGS=ON \
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e41da562dc..b0ebc09212 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
@@ -32,10 +32,10 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_USE_WCHAR # std::wstring
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, dynamic library"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
