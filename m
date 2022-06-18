Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918DEC43334
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 12:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1194760ADE;
	Sat, 18 Jun 2022 12:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1194760ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idaZb4-PJasZ; Sat, 18 Jun 2022 12:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DCAF60ADC;
	Sat, 18 Jun 2022 12:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DCAF60ADC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 151B91BF852
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 12:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F20F1813DF
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 12:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20F1813DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q06Vbu83QMau for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 12:17:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8517813C8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8517813C8
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 12:17:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i10so5026887wrc.0
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 05:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ol1+fbXO6DD+rLZh38TahTaT9QjTaWT9KfcUFUgo0IU=;
 b=KLTt8lF4Zdsp2GAzy0WfytwjpoEiJ0qhREBCmZcs0Gg94vQe4g5Hn87xAXYm1zdAid
 M+oQLgTh1iXV4UPWTRQqbVJQ8/CJWhwUjxgAr3Ol3g8dRTXOh8ugRCQ9IiN9QQwoCDnD
 6gT2IxXab94prGvtflWSsK0wtWM3Jc2bZxLnB9oiuNHSrBLJTwN4+Vyziq7bD3jNjNTn
 qP3PWg3vu4oYpqP/L0fy5344gGc/5HJgERS0XkU3dc+2tT1JkD2M0LnmxzDo36CujdPr
 IlYeRrOvVB6ikU7Icw+6o3MIb2/4qmT4u2ybFFyGS7ChWfSb8VvCaLWl15+fr0TAMotb
 VLiQ==
X-Gm-Message-State: AJIora/z1BwiUy2rvjm3FCv+BBc2by/6/E/RMPQmSobAOjbH0FxCx9UA
 j8Q5Hi3EvJW1CGxS61YbXbCpkgo+y+Y=
X-Google-Smtp-Source: AGRyM1vJdyVzaqAOEZ0s0BSXjRB6ygT8U12CxnW1EKs1LEo6DuIj83yweCxcndYhSFNQ7EfsCX/lXw==
X-Received: by 2002:a5d:6d09:0:b0:21a:1321:55b6 with SMTP id
 e9-20020a5d6d09000000b0021a132155b6mr13180765wrq.117.1655554666286; 
 Sat, 18 Jun 2022 05:17:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b003973c54bd69sm12173096wme.1.2022.06.18.05.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:17:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Jun 2022 14:14:56 +0200
Message-Id: <20220618121456.511183-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libeastl: needs threads
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libeastl needs threads since its addition in commit
ed9ddaafb2c4d3ac44e46390248f5c9af08076b1 and
https://github.com/electronicarts/EASTL/commit/800bc26659f834354e38ee3de4c7300e739ed255:

In file included from /home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/source/thread_support.cpp:7:
/home/autobuild/autobuild/instance-7/output-1/build/libeastl-45469730d641868ce05433fff2e199510c7d45c3/include/EASTL/internal/thread_support.h:37:18: fatal error: pthread.h: No such file or directory
   37 |         #include <pthread.h>
      |                  ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/54ff018467d157530bde4d35602fd1820d9eb348

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libeastl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
index 5abea8f810..738b293be4 100644
--- a/package/libeastl/Config.in
+++ b/package/libeastl/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBEASTL
 	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  EASTL stands for Electronic Arts Standard Template
 	  Library. It is a C++ template library of containers,
@@ -21,6 +22,7 @@ config BR2_PACKAGE_LIBEASTL
 
 	  https://github.com/electronicarts/EASTL
 
-comment "libeastl needs a toolchain w/ C++, gcc >= 4.9"
+comment "libeastl needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBEASTL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
