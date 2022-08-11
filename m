Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698E8C19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 06:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DE560FCA;
	Thu, 11 Aug 2022 06:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8DE560FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6xAzdUf4Rj0; Thu, 11 Aug 2022 06:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E699B60E8A;
	Thu, 11 Aug 2022 06:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E699B60E8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D02AB1BF271
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 06:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB30982A29
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 06:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB30982A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wvrfetpd8PdO for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 06:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B361082A26
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B361082A26
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 06:35:08 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10ec41637b3so20541482fac.4
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 23:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TjKYopYOfGnmC5V/w9nd/WgVrzXmLQeR2xsDNJQC73A=;
 b=rohykBthBWejdo+LG4fVELpgin5lvKWbomHmkj0NuD64xow8Zi24brbm973ami20v4
 /OM9IibfdBogg2AZFr3/Eh8RnQKt5d8JlsLlLhX8zAZ/ZkLwsDY1IVOIXySyxw+iNEO3
 dD9VL9zLe665WgOV6FJaUOqu3i02ohHHxKzzFAxRc1LHGhLqtr3grDwqxtxrcK3vo44p
 XXS7tzxwYEyt0kf04f+J6OgX8CPRLbQO0NvyBS8e8D+nXlGu58w7mGcGpfoPbhfDjsM4
 6VwtHQ51p/J1RMW8U0Qp1lAFYI7puXyOIWOcPdI1aYAZhlN6Enax9GuuUlg/MHedliFF
 AuhA==
X-Gm-Message-State: ACgBeo3UEIphueS1u++4wojbWQtjwYwOFW2VQI2THjoexOZgtIxE/PH0
 iPhP+seKmrzmHP1IRsWfrqHERUua8ns=
X-Google-Smtp-Source: AA6agR7xAe+t2eVintshoTqfUXWNJFtI0/0b0LUxhWsxoFKDdHcbm/BrXEFpenhc+xeyeSa+oahJEA==
X-Received: by 2002:a05:6871:85:b0:fe:29a0:4a2c with SMTP id
 u5-20020a056871008500b000fe29a04a2cmr3304239oaa.249.1660199707249; 
 Wed, 10 Aug 2022 23:35:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 d13-20020a4aeb8d000000b0041b49c19a00sm983417ooj.18.2022.08.10.23.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 23:35:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 00:35:02 -0600
Message-Id: <20220811063502.1823571-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811063502.1823571-1-james.hilliard1@gmail.com>
References: <20220811063502.1823571-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=TjKYopYOfGnmC5V/w9nd/WgVrzXmLQeR2xsDNJQC73A=;
 b=hrHyOjcjsC0BrppWhAe3d0VUBW+Mk14YzGSVcWwOjHct8+sk4eqZ1i4G06dwUBQrXJ
 sZjrDJl2bj5mjZh2+EZlXwWAIjplGfus7/gHvu7AYDnVzeLhKCQ6uiR01SwV/lmEpZFY
 ltMYzR0dBNdL517dWkrvL5j4aqXh3bLCZY0TxxC/hL01qKIJW/pEgTBPbHMI/CJnTQJN
 JSpCA78fYfheF8kGTw0JE7I9jMTm5Zf063l65V4l/vWhPcCM7pNs8S3v9NpVqLjLHZoh
 BnVlsB598xyae8zYEQtKgvEVitxfnBxD7LtA7COFALXLv7VN5a8HZc5o1ixpfwgGGrQs
 egpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hrHyOjcj
Subject: [Buildroot] [PATCH 2/2] package/libunwind: add libucontext support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We can expand the list of supported musl architectures by
letting libucontext provide required context API's.

Use the following table to determine which architectures require
libucontext for BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED:
https://github.com/libunwind/libunwind/tree/v1.6.2#libc-requirements

Enable BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS if we have
BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS or if context is not required
by checking for !BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED.

Select BR2_PACKAGE_LIBUCONTEXT when selecting BR2_PACKAGE_LIBUNWIND
if we have BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libunwind/Config.in    | 19 ++++++++++++++++++-
 package/libunwind/libunwind.mk |  4 ++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index dfd0df30fa..08f7f879c9 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -1,3 +1,17 @@
+config BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED
+	bool
+	default y
+	depends on !BR2_ARM_CPU_HAS_ARM
+	depends on !BR2_aarch64
+	depends on !BR2_aarch64_be
+	depends on !BR2_mips
+	depends on !BR2_mipsel
+	depends on !BR2_mips64
+	depends on !BR2_mips64el
+	depends on !BR2_riscv
+	depends on !BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 # libunwind is only available for a certain subset of the
 # architectures (as visible in the list of architectures supported
 # with the glibc C library below).
@@ -17,7 +31,8 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
-		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_x86_64)
+		(!BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED || \
+		 BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
 
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
@@ -27,6 +42,8 @@ config BR2_PACKAGE_LIBUNWIND
 	# forcefully links against libgcc_s, only available in dynamic
 	# linking configurations
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBUCONTEXT if BR2_TOOLCHAIN_USES_MUSL && \
+		BR2_PACKAGE_LIBUNWIND_MUSL_CONTEXT_REQUIRED
 	help
 	  C API to determine the call-chain of a program.
 
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 9cd587d0a3..afc17f7b25 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -16,4 +16,8 @@ LIBUNWIND_CONF_OPTS = \
 	--disable-tests \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+LIBUNWIND_DEPENDENCIES += libucontext
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
