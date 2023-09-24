Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C576BCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7089A41708;
	Sun, 24 Sep 2023 21:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7089A41708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFcgO4Mc1R_3; Sun, 24 Sep 2023 21:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4046341740;
	Sun, 24 Sep 2023 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4046341740
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87EEA1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EFA440320
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EFA440320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-wkgsDAFHsp for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:15:32 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B8874012B
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B8874012B
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4053c6f1087so43039075e9.0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 14:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695590129; x=1696194929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C9wJ9z9uHe8Mvv7LBQSw81sJl6HTrRU3EqJfNvvy5Aw=;
 b=Hr139ItuvVDNqNgKLNFBqKwMS4fi4c9PsKw7bi76L4VnvqLUNlFa8BtlvKUB+d/xWW
 pIq8UetkKw6Eddwd2+BS1jbGO62ecEElD6q4M7NvvDO865/eU/Rn7RP6H6TdB5vUrpVk
 8opVVmsZ+O/GIjoagUiMQRe4Q1YiyHusIR6fTmoXMxL2+O/PQNDc8Ml/IehTN5I53geQ
 afCm9c0qNfOKhs4U0DZxvheXXOhKK3YVpMTs4UsHfuNZv1VifkV7G/fHdfzC6cyIW5N7
 4X6c8Azzu9BK5Zs8yw5RJUL9Ir0yj1j7q9ccZHwVzj7+cNNCiXr7wUzGex7qMQs9Ra02
 +7NQ==
X-Gm-Message-State: AOJu0Yxrqs5gwELNdmWeEUu+HHnMKwJYeD4awURTCD4rA+ngi8QSS0Vh
 murWFxM55ouyt1s5dNrG6PAguTNgzMU=
X-Google-Smtp-Source: AGHT+IGfsUpKu++5D1Y4Qt0JNR4q4WHx9Psf4bqWDbGNGUZMUQWe5s0yNVXlJSr/oV8NMB7MQLxGPQ==
X-Received: by 2002:a1c:6a03:0:b0:402:cd60:8aa9 with SMTP id
 f3-20020a1c6a03000000b00402cd608aa9mr4260386wmc.20.1695590129329; 
 Sun, 24 Sep 2023 14:15:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c251200b00401e32b25adsm10483678wma.4.2023.09.24.14.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 14:15:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:15:24 +0200
Message-Id: <20230924211524.1598438-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695590129; x=1696194929; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C9wJ9z9uHe8Mvv7LBQSw81sJl6HTrRU3EqJfNvvy5Aw=;
 b=gVmMIbwhRENdGQ5aiEyhAk3OVD4ydd0DALZtYouJZkfte96pnSx0qztzJE1nWrnM1i
 Eu2wmuER7NTIQxjr87PG9GKyxdX50aQnQRaGxccjsqgiDKfIuwuFUA6zna7nbBSkHMr9
 A2OSiGCt8agK0KdT5aPNgRTUufMkKR1RN8wmwBUzCrG6IvBEZh/Pd5wn57JP4sA6h7S/
 L18yevcA8XRS8Iwu1LsA0XKc5tRj/H8ULuVaC6wD56vQdUZCA9JRY+DQqqZrYf2+CNT+
 jWU2GMPGwDXt6bZAUEKQPEfjQYPBCSaZgKZOKUZ4FWDL01xKHz4KI/CA8aWWKyJ6o8jv
 OKCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gVmMIbwh
Subject: [Buildroot] [PATCH 1/1] package/unixodbc: bump to version 2.3.12
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/lurcher/unixODBC/releases/tag/2.3.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...ivermanager.h-fix-build-without-thre.patch | 34 -------------------
 package/unixodbc/unixodbc.hash                |  2 +-
 package/unixodbc/unixodbc.mk                  |  2 +-
 4 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index c11a9cf840..7918a22c44 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1414,7 +1414,6 @@ package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch Upstream
 package/umtprd/0001-Fix-output_dir-make-dependency.patch Upstream
 package/unbound/S70unbound Shellcheck
 package/unifdef/0001-Makefile-fix-error-on-install.patch Upstream
-package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch Upstream
 package/unscd/S46unscd Indent Shellcheck Variables
 package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch Upstream
 package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
diff --git a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
deleted file mode 100644
index 9d54bbf5ef..0000000000
--- a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 119cab666646cd9210439d4696a4bfa18343a2c6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 12 Jul 2022 00:29:28 +0200
-Subject: [PATCH] DriverManager/drivermanager.h: fix build without threads
-
-Fix the following build failure without threads raised since version
-2.3.10 and commit 6df155fb213896b9507b421c58856e4376647ae1:
-
-/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
-/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'
-
-Fixes:
- - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/lurcher/unixODBC/commit/119cab666646cd9210439d4696a4bfa18343a2c6]
----
- DriverManager/drivermanager.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/DriverManager/drivermanager.h b/DriverManager/drivermanager.h
-index 9528fae..abd324b 100644
---- a/DriverManager/drivermanager.h
-+++ b/DriverManager/drivermanager.h
-@@ -808,6 +808,8 @@ void pool_signal();
- 
- #define thread_protect(a,b)
- #define thread_release(a,b)
-+#define pool_timedwait(a)
-+#define pool_signal()
- 
- #endif
- 
diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index 9e5401c2b3..6262dab5ae 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c  unixODBC-2.3.11.tar.gz
+sha256  f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec  unixODBC-2.3.12.tar.gz
 sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 650e3b3b36..28f1e5bc94 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.11
+UNIXODBC_VERSION = 2.3.12
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = http://www.unixodbc.org
 UNIXODBC_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
