Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CAFC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9346160868;
	Fri, 10 Jul 2026 07:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imLRdIM3wqZv; Fri, 10 Jul 2026 07:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A40160856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668081;
	bh=7a3370zUta0O7UNM8NojN+BvaTQkdm2c0SZmyhyXCic=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kodig/rUbGtxVDZPOu59e7vavjW3zZ+1y/XTQpcVXecf90C3IJAMMSgkvC/BrImwR
	 inpD7JVCot/kEsEB04S/8GJ1r/ZIysVTch0YmZp3RsVUxFfrgGFVpAELNNOXNoDi86
	 PJeLeN/SDRmjENVDgKq4RsxXly4WbKFQ7TO3RbQ0krE5/bnE32Wfmn5CHaf/k3y4Lm
	 2JM2Ic5XHIlMfX/qsmMdT7G06S5+YvN7zwsnYd1XtYxBAW8QhskgDWx/hT/eF3295J
	 ysu/9xcrskUHCWRZLRSUOvSCHaEWkC6Ght4NvIAhXkcYeyJsQuIxFYXAdwX/cRO8l5
	 1vyyRr9cpqA1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A40160856;
	Fri, 10 Jul 2026 07:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED463320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D34D36078A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRDF0DwusjNG for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5AE3605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5AE3605CA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5AE3605CA
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so3984825e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 00:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783668076; x=1784272876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ndfMlj2lTAUs/bCVymdUTB7TNy8Q3rIELeFu9bX9eWc=;
 b=EbcsCHnh9rT/iMBIoqzeRDJN7B0UbUDBwnXiiBm8kgETiuyxppPnuKmzREYOUOMH/k
 n65DSAjomYkTmQa3qXCjm9HtVscoixVCMP/UKRRVCXksLS8uOxI9rLGY+JINXjexeEZ4
 T58VUBo89tDE6emn+NnIoO9i3ZR2ishFBSBnz+qmI+rrxBdHrSc8DupLaiwTBrU7XqVO
 FPWCPFphKXSpt7nVet/iMtb3Facp1byN31KBmWAJPwn28IkDnX8r2oRUVg8b8QabJzRo
 Aqa7IL/Ze73t16pah6H1YcZR0VUCf/ie9ia78uc2qkKGhfYMHyz6E057Sy1JYSJ3Jnp+
 XvvA==
X-Gm-Message-State: AOJu0YwgT/2HHtA5FUhl2tiTmk2IIMA+OKZLtN9fjpOF6qIhNt+MJ8Ij
 kHTdzP5kNkmlJciRjf2DKHlyTFWjUTbnvYEuJP34z43yIn53yOtXdpF4CC/SCEcehk6K8RgKNV3
 YkcXYFIU=
X-Gm-Gg: AfdE7cnf52ie3TT4FPhX5Ndab88t9bM4K7qO+XyyX7QVas5tHvdybe6xQ/x+zOkzMcm
 /CCdYFx8fmUvjr75Ti+sKn56qohMPtE8q4nluTXoWRkAY2mqFRvBwApTZ7h5ck5C10I8KMQDKYD
 HgIHiTztebmUsCcR/maoYkglfGmcXTuzySp6W3PYi8mamHndJ5P4AL9jF9VqBG+wWd0SIesA9f+
 2Svy9rGvCJfbTY8sZKu5vs0tp/p5Lo5o/ewc0MfrtL18vfeqXVowB4wma3IBJIZmQhdDnXRrOSd
 xP71Xh5Re8JeucsUInMIexQwpcU+Z0tFPd1IBAjEsZCSw89hwc7YbvOJF85F22NY3IWK13oyDE3
 U1ZAWeM6939KeIE2rN8VoxqaIPb5hEHE8yMD7Hg2xCqPADCny6qdYw2TA4sq0XF+Ld0ul9/gXan
 0Ob/T+877LboiTNbvk5QPvGNVvGxcHIGj2tAJfEFh4SuZfYmMBmKqI9iUuOSjRzOrBtjErhYIyD
 ueo7DILRdQmwcVrHIHnpQl99J4CyzxKIKtk4nuiRQHV9zev4TazGVsyq1LVaWSUDBtkKX6bZKnu
 Jog8RNoWoEGLhrzYSg5LvZcX
X-Received: by 2002:a05:600c:3e0c:b0:493:c548:87fb with SMTP id
 5b1f17b1804b1-493f536ceb3mr8224385e9.36.1783668076393; 
 Fri, 10 Jul 2026 00:21:16 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.1.245]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccdbbsm120194765e9.3.2026.07.10.00.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 00:21:16 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Fri, 10 Jul 2026 09:21:10 +0200
Message-ID: <20260710072112.51856-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783668076; x=1784272876;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ndfMlj2lTAUs/bCVymdUTB7TNy8Q3rIELeFu9bX9eWc=;
 b=Kwde/rUpFv4EGu3lXGxLPByW9ywoJVKsEVTdYQBUCAOg3x0/OVJ5xMe7pDMC/DmQjB
 U76ys2JdO7bjlbnK9x4yFPKFZeb4K9ktJWgQ++uZmxLsWgt0f15QoDTlZ+H/Z2iS0nJ1
 8Dj+m1jkYG5K6PLtpUGUdhmk/c2TbN/icVQVU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Kwde/rUp
Subject: [Buildroot] [PATCH RESEND 1/2] package/libcppconnman: add new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcppconnman is a C++ library that provides an easy-to-use API
to communicate with ConnMan over D-Bus using GDBus.

https://github.com/amarula/libcppconnman

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 Resending this patch as it has been a couple of months since the original submission. 
 No changes have been made.


 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 package/libcppconnman/Config.in          | 26 ++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 24 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/libcppconnman/Config.in
 create mode 100644 package/libcppconnman/libcppconnman.hash
 create mode 100644 package/libcppconnman/libcppconnman.mk

diff --git a/package/libcppconnman/Config.in b/package/libcppconnman/Config.in
new file mode 100644
index 0000000000..f1fee9ae72
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libcppconnman provide easy to use C++ API to communicate
+	  with ConnMan via the DBus using GDBus.
+
+	  https://amarula.github.io/libcppconnman/
+
+comment "libcppconnman needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	help
+	  Compile CLI example.
+
+endif
\ No newline at end of file
diff --git a/package/libcppconnman/libcppconnman.hash b/package/libcppconnman/libcppconnman.hash
new file mode 100644
index 0000000000..6367503e7f
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6fe3f4eb7372786f76b6be8cf77720066f4aa216c6596e99d8015e7139a00073  libcppconnman-1.0.0.tar.gz
+sha256  7ffe1954587c77dfba1cf8eb9b2ea743671fa6e63f9e7a2f258119d42e14eefe  LICENSE
diff --git a/package/libcppconnman/libcppconnman.mk b/package/libcppconnman/libcppconnman.mk
new file mode 100644
index 0000000000..2a0eb10ec9
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libcppconnman
+#
+################################################################################
+
+LIBCPPCONNMAN_VERSION = 1.0.0
+LIBCPPCONNMAN_SITE = $(call github,amarula,libcppconnman,v$(LIBCPPCONNMAN_VERSION))
+LIBCPPCONNMAN_LICENSE = LGPL-2.1-or-later
+LIBCPPCONNMAN_LICENSE_FILES = LICENSE
+
+LIBCPPCONNMAN_INSTALL_STAGING = YES
+
+LIBCPPCONNMAN_DEPENDENCIES = host-pkgconf libglib2
+
+LIBCPPCONNMAN_CONF_OPTS = -DBUILD_CONNMAN=ON
+
+ifeq ($(BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE),y)
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
