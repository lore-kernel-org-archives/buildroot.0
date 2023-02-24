Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B97C7EE23
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 16:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61EA640B67;
	Fri, 24 Feb 2023 16:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61EA640B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLg5JR3bahbG; Fri, 24 Feb 2023 16:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F3640B2F;
	Fri, 24 Feb 2023 16:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F3640B2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4EB51BF33D
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E23782195
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 16:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E23782195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jniWgdI6sR_p for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 16:40:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D7182193
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D7182193
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 16:40:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so2099411wmi.3
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwM6ZlXLVh6r48Y6wWtAYoi1RpEFTo8QnS7izqExSys=;
 b=ZkGFwhOaM/+bJYNi5iHUuJNaA3c9A6XQQVP5C8ALKQMNnB3c/kw9OiO8R+UZ9IQPwj
 LU3laI5Y1th0ymVZZewNvoDaa+NMGU+Q9N6RymQmTGYlVDrUBEBjQS7R0+/HG9jMtV3b
 /ENRANdf1ABDDPBgtCAb2nuOvxQsGG67HpN6A0JT7HOUjANi7fyf9EUfamaucdPD4ixv
 7rLdJcJbxERAxAm9+rS5ungbjD+gRrlhG3pZ6oa9YSgVoyUya1I5r/YxkDAfkS+Ntolu
 mXBfpP6wX9zhwmVQvdwSv/dOb1S7pP9olOSKjUzrgjbVsYInkJ/V4U1z0WtJZfpjW5R+
 Fvpw==
X-Gm-Message-State: AO0yUKUbogrZDiM4iUt41EQBMwojRSFBDnrbSFODSFUX/frMKKbZoqsb
 rG1yNa1d8SfjbvSTTb9QW8Zm17GwOuo=
X-Google-Smtp-Source: AK7set8rJzuWdRl8+6h0spzTy/puPJLPQs0hGuT+m7ePTMX1CmXXNkX4rDKz3Ddx1UbO5COP9LGo5g==
X-Received: by 2002:a05:600c:755:b0:3eb:2708:86ca with SMTP id
 j21-20020a05600c075500b003eb270886camr1480353wmn.28.1677256855802; 
 Fri, 24 Feb 2023 08:40:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b002c55ec7f661sm12520287wrr.5.2023.02.24.08.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:40:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 17:40:53 +0100
Message-Id: <20230224164053.53287-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vwM6ZlXLVh6r48Y6wWtAYoi1RpEFTo8QnS7izqExSys=;
 b=j8GzRb50wW9zEQvhxkLAEX8z4z4pvAshcNR7xDmYRyELavHrs/8DTfdGgHNFKemorN
 JEFsw9K9lmrWid5IXIarCBTo7hTTMDM0qhlQGZAp0KwDxTj5sFjaVINvp6+gRlZCuD3l
 Xdu1nCEvWMP8PP6BhYIpLhIc1oBEfeEmZdkB/CIgRt6xIkGeCxIG19UBjdRzWssjcV9w
 +ZIZlk5DlfKP7ak7pDVDAuzI/OS2xiipHbkk1QLmx2hpoqRajDZKVKJE6i8gJcE9lhFc
 c8x3pUa8HtBt4A6V6HHEeSVxHNsdZYSeweaaW+xqNunOVe41x4M6t4TSbyTqG+GNlbDr
 1UmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j8GzRb50
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: needs threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

threads are mandatory since version 19.1.1 and
https://github.com/intel/gmmlib/commit/9e4aa143fb7e7e87332fcb7c9871040ff4a1a1da
resulting in the following build failure since commit
cd206d9b808a322a00294b4caad203a892ed4c92:

CMake Error at /home/thomas/autobuild/instance-2/output-1/host/share/cmake-3.22/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Threads (missing: Threads_FOUND)

Fixes:
 - http://autobuild.buildroot.org/results/c1120932e8c212820b239ee8cd4a057623a73376

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/intel-gmmlib/Config.in      | 6 ++++--
 package/intel-mediadriver/Config.in | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
index b6f93f7416..a3d0d2610b 100644
--- a/package/intel-gmmlib/Config.in
+++ b/package/intel-gmmlib/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_GMMLIB
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Intel(R) Graphics Memory Management Library provides
 	  device specific and buffer management for the Intel(R)
@@ -11,5 +12,6 @@ config BR2_PACKAGE_INTEL_GMMLIB
 
 	  https://github.com/intel/gmmlib
 
-comment "intel-gmmlib needs a toolchain w/ dynamic library, C++"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
+comment "intel-gmmlib needs a toolchain w/ dynamic library, C++, threads"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
index ad56590008..537e4abd2f 100644
--- a/package/intel-mediadriver/Config.in
+++ b/package/intel-mediadriver/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_INTEL_MEDIADRIVER
 	depends on !BR2_STATIC_LIBS # mesa3d, libva
 	depends on BR2_INSTALL_LIBSTDCPP # intel-gmmlib, mesa3d
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libva
+	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-gmmlib, libva
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
 	select BR2_PACKAGE_INTEL_GMMLIB
 	select BR2_PACKAGE_LIBPCIACCESS
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
