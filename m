Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E3EC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 13:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7824A8206E;
	Sun,  3 Mar 2024 13:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ktug9wCTytC; Sun,  3 Mar 2024 13:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6E382080
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6E382080;
	Sun,  3 Mar 2024 13:04:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE9341BF863
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBFED82080
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX1MbvzacPbb for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 13:04:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE1348206E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE1348206E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE1348206E
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 13:04:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412ced8ef97so10443855e9.3
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 05:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709471057; x=1710075857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ktBS2TOnPmjdEXcTX1F/jg/yfyZJXraLjW5nS5fFTNs=;
 b=oT0hkaizhe1uitobqvxoqVgr2XbtPoirKCJxh5mlpQHayE1bQaIFwQPZkX50dPcrfx
 73j3jHPxz0XGAfjzgawerTDXL+H8C6B3u4tS2ANIrGRPDucjHK16p4u0R8cVhckJ1CYS
 Ba4pQ/84koC2LQIh4RlMMp69wme9Cn+2BpI3WMSUOdppnqVQKSZjYn5wSan0C8pAOiBF
 w9UYb1UO5Z4MzGXZsgEmj2N/wipeNYy0DY7nuh+iaq7e/PN1gfeO83XJrrStdfG7mhU3
 ScGHzuMZK+kcfgsBXUuN8OZr4vM6l8wmIELN1vxrqDPWfq/riyBmSmh9u5t0j+QoCV+d
 32cQ==
X-Gm-Message-State: AOJu0Yyas/dLyy3UUSu5obnIagAvhgO9XQiddMYbcwWjfbakzasMn8ud
 8uLMbo0YnglH782C7YQMQah982+gn0owM9jFG4NV6IRYrnPgqdHNfVNGvTaQ
X-Google-Smtp-Source: AGHT+IFl2Ax75kcfhlm1w8Fc4mymdcBYDputv3WdnCsnplBeX/rjc+aWmzDKypWBtP6Rra6epw+ddg==
X-Received: by 2002:a05:600c:a12:b0:412:e221:2bd5 with SMTP id
 z18-20020a05600c0a1200b00412e2212bd5mr607460wmp.3.1709471057170; 
 Sun, 03 Mar 2024 05:04:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c358700b00412b6fbb9b5sm2521180wmq.8.2024.03.03.05.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 05:04:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 14:04:14 +0100
Message-ID: <20240303130414.141535-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709471057; x=1710075857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ktBS2TOnPmjdEXcTX1F/jg/yfyZJXraLjW5nS5fFTNs=;
 b=LSzY1oIq3YfEiVRf3KRzkP0bmo0QpMYC8opi2xWFxM3mJdMzGF88R+dGtEn/gZXIuG
 aZ7O/nWbRf0p1ABAUcitqh0szJLT4KoSp5yPIL97gZga8NXR+z4gdx5C9tWnpk6vdWHD
 VAsB1pFlArU8mKECCVKgkw8X1hZB8eIvEOi+31jMe1mg1XM5dkcguLbGK5xgIY4Kubmu
 TOV14H6KXlmi45xBEUuTsDpacP5Rw80oxlUAvHsJrsxc1iTpYP/U8en0DAslU5GEiHpG
 /PyGcoDIKPUsM6iyvf3LPu2LoCrr5K2jY2T3o/9Tmx9Xg9O8lBaLHrYuHoKXPkVCRKIT
 +O3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LSzY1oIq
Subject: [Buildroot] [PATCH 1/1] package/spirv-tools: needs dynamic library
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

Fix the following static build failure raised since the addition of the
package in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:

[ 26%] Linking CXX shared library libSPIRV-Tools-shared.so
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_init':
__uClibc_main.c:(.text+0x98): undefined reference to `__fini_array_start'

Fixes: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
 - http://autobuild.buildroot.org/results/f953d500830e8124c6e85c57887106f9352cb4c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spirv-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index fa9b615c56..98b0c46525 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
@@ -9,6 +10,6 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
+comment "spirv-tools needs a toolchain w/ C++, dynamic library, gcc >= 8"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
