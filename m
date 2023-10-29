Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA21AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 22:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C35E7068F;
	Sun, 29 Oct 2023 22:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C35E7068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee59KORjw5nc; Sun, 29 Oct 2023 22:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A847074C;
	Sun, 29 Oct 2023 22:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A847074C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF0671BF403
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 22:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848FA4F182
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 22:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848FA4F182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXRsHRJI8IOP for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 22:02:19 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80D1A4F180
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 22:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80D1A4F180
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f7db21967so928659f8f.1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 15:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698616937; x=1699221737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35/3tGuU8iLrPXFn0fLuFdkegh4E7gogU/yYSRGgLLc=;
 b=E5BqdNplTfSrzIJWkuO8OsBEH3V6d964+tbTS1nSGKQuTG3xjD437pQj/7Gclhn0YC
 IV8cNBuU3wHLHW9iNfIgy2FNgdYTlsL00e78wTgA0yQatkmsOEtYGLPZbbouQ5hPF+2C
 1kCjTjFMU4smtGDTuNhkBzTy3ugqSx3d5I3/H5WwQQhX8IxPdjpLmy91sLts3qjU8rtM
 K7rHdaRduDlvKq4xVNPQQSeZwZDEcZ2wx1G0JJ3PMYGELw4KXTMs34Lfvel8LZbCC3um
 4D4H2DL+z4KZMwEA9ifATiC1zDIBpOl3akU3XF3izDVfC6J83txfk/GQ7dGnQbYTQU/W
 pazg==
X-Gm-Message-State: AOJu0YxyNZQCP0A4nB7Ei6tJ1mgLnyr4f/yuMc9W1N28lrz0WiTzeB9O
 lPR+WCFRiTUl8viATbX2Xu3289o3fhE=
X-Google-Smtp-Source: AGHT+IEZ/jii0agzaFrj4ewU/ScdQe+2YlDncstEHongdEWbCwKZ2z1bHgituwKDke48SXTOvBv9CQ==
X-Received: by 2002:a5d:67c7:0:b0:31a:d871:7ae7 with SMTP id
 n7-20020a5d67c7000000b0031ad8717ae7mr5527543wrw.29.1698616936963; 
 Sun, 29 Oct 2023 15:02:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d25-20020adfa419000000b0032f79e55eb8sm4562031wra.16.2023.10.29.15.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 15:02:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 23:02:14 +0100
Message-ID: <20231029220214.32159-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698616937; x=1699221737; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=35/3tGuU8iLrPXFn0fLuFdkegh4E7gogU/yYSRGgLLc=;
 b=VrDMhnpXF8C5W2mYSPDNi29ivNDw4kKBoKaoIbwV+f0KWzdiatoq4vqtXUX0fnY7NO
 3IohxGnacB/drvzSno60gAtnrNOutbWp47D++59ZZUWkrsjcj9ejmQB5HZMvI13gQZFI
 cIRK9Q1lMrOms4K9UJ0QM3PV/6hbMp5HUoiFyhC2yZvVMcMHVDHEDVLHXWLFgKHa92nH
 ntgikN5TTNcHhh1Rb/q873aaXMpiFbEAXx5lG6Jxbc/Gz1ScVdRVzIndzkKmA5ziMtW7
 sY2gKtp98+eWrW5TI2FyIaFHY4MRT4g5O9mLNY0/eNyzH0DSOfgu+sBel+P7j0T1ol0F
 Jodg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VrDMhnpX
Subject: [Buildroot] [PATCH 1/1] package/uftrace: bump to version 0.14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Upstream link to patch (even if it was rejected)

https://github.com/namhyung/uftrace/blob/v0.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                             | 1 -
 ...01-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch | 1 +
 package/uftrace/uftrace.hash                                    | 2 +-
 package/uftrace/uftrace.mk                                      | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d5c894ff25..31f6672eb3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1397,7 +1397,6 @@ package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.pa
 package/ubus/0001-Install-server-and-client-examples.patch Upstream
 package/udpcast/0001-fix-musl-build.patch Upstream
 package/uemacs/01-clear-ixon-termios-flag.patch Upstream
-package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch Upstream
 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch Upstream
 package/uhttpd/0001-Remove-Werror.patch Upstream
 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch Upstream
diff --git a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
index 6913012c3b..2855be0d9e 100644
--- a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
+++ b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
@@ -11,6 +11,7 @@ Using a #ifdef ... #endif test doesn't work as this value is defined
 through an enum in glibc.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/namhyung/uftrace/pull/1389
 ---
  cmds/record.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index 195f0605c8..c4aad39016 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2aad01f27d4f18717b681824c7a28ac3e1efd5e7bbed3ec888a3ea5af60e3700  uftrace-0.12.tar.gz
+sha256  b81255bc288e79e96a5b158d4875fa6425ad51c85f4c4c8523c1defb9366ad12  uftrace-0.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index d36c3bd8f5..c005a32b76 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.12
+UFTRACE_VERSION = 0.14
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
