Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FF0C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 19:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9EA8409A3;
	Sun, 26 Feb 2023 19:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9EA8409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJUwFCsn1jaj; Sun, 26 Feb 2023 19:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83D8409A4;
	Sun, 26 Feb 2023 19:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83D8409A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B24611BF36E
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 19:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83C6260AFB
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 19:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83C6260AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjHLWSkTMlJ1 for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 19:53:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE5B60AE1
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CE5B60AE1
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 19:53:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so2634366wmi.3
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 11:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NB7HzcOR/kFG6erIVhVXumFrmQB9yOo+T6OeEPkrufI=;
 b=PyMQ2S6XmWrxAGkaP00+sHlZxeghSNiaadZQ9Tql8O6ViXgMvHSaOv36FREHf4phXx
 itU4tQ1UY/uyKQ01O5YO4XKoa+EnT3SuOZ7IanoAD3aROtPleJWQ9oRzr4/Ce1iMAUFd
 6mBiYP+mwugNnC9j7dZaynPY8/Xdy9pRalUUC1NewzAJgZNSNYGyyBXh2W2vE2+venXC
 YC4wVAC4oGd393+9aMfhTWjmTZZUIFdDBmRx0KFj0vxk5X/+MvdY2P0RX14rwZ2j08Jx
 XKpZRhJr0DcUqthCyGI8NtR7l3xEm2Nv7rc0FKx/8q/dXdmFvDNh/kU8cgFtS6LiBi0p
 q9tw==
X-Gm-Message-State: AO0yUKUtXb929YGjrO8HBzOWl/D2iCWFlLNO8Ima9naIP3GrIseF59/3
 Oqg2M2BxRgXG0kvUa8cv3E/KnxXcLYs=
X-Google-Smtp-Source: AK7set9p6o3SzHhYnjaoTQSMS4rQ6APV1lqetrypz0jGEI91savqb1zJqygcJ3bymDG84PfSIkwpVg==
X-Received: by 2002:a05:600c:6023:b0:3e7:cee4:f8a with SMTP id
 az35-20020a05600c602300b003e7cee40f8amr17342774wmb.29.1677441205816; 
 Sun, 26 Feb 2023 11:53:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k18-20020a056000005200b002c54c7153f0sm5256447wrx.1.2023.02.26.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 11:53:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 20:53:15 +0100
Message-Id: <20230226195315.1184297-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NB7HzcOR/kFG6erIVhVXumFrmQB9yOo+T6OeEPkrufI=;
 b=L/eJBMueYjds1LAzSg21lxk2p1vxQ4+rh4pAF4fongWiyaxsKi5WzbAi2z0zrr4EQH
 k1RNzwm07bQh3TnWlJS4+XtoDPKOsgX4yxCmvcY4Lbyq7XnSWPLMcYbUWD1tzXTbTaNq
 hAPDmjVxk4zFMFDiJmIM4dFnQ+ThCv6n9KfkcX7Dkd7ZD7yhddWav0ubIyMIz/yQN5af
 pQNfiDaftbua6gDJJ+j8FoLN3xEgwQo5ksinGiYuRiYImuoqaWCYYxl5TYKN8EpH84I4
 go4gGDj7Ikt4+uAxyEqbvy3p3EbM1+br4i5q2qJXLVIESlypjfg9hZk4P5vOAg5nWysK
 j3/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L/eJBMue
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix openssl static build with
 -latomic
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following openssl static build failure with -latomic raised
since bump to version 8.1.0 in commit
7e608885a2df51ba77378f210f4c0e8cb59d5b8b:

/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
ssl_cert.c:(.text+0x53c): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/f606bb15bf4f88ba29ef0795413e13acc9cd0976

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...keLists.txt-prefer-pkg_check_modules.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch

diff --git a/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch b/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
new file mode 100644
index 0000000000..3714050445
--- /dev/null
+++ b/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
@@ -0,0 +1,40 @@
+From 565c003ac412c9b0fa39d208d4a911f4300477c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Feb 2023 20:39:11 +0100
+Subject: [PATCH] CMakeLists.txt: prefer pkg_check_modules
+
+Prefer pkg_check_modules over find_package to avoid the following static
+build failure with openssl and -latomic:
+
+/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
+ssl_cert.c:(.text+0x53c): undefined reference to `__atomic_fetch_sub_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f606bb15bf4f88ba29ef0795413e13acc9cd0976
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zhaojh329/ssl/pull/4]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ssl/CMakeLists.txt b/src/ssl/CMakeLists.txt
+index 4868bf7..36488c7 100644
+--- a/src/ssl/CMakeLists.txt
++++ b/src/ssl/CMakeLists.txt
+@@ -14,10 +14,10 @@ endif()
+ 
+ find_package(PkgConfig QUIET)
+ 
+-find_package(OpenSSL)
++pkg_check_modules(OPENSSL openssl)
+ 
+ if (NOT OPENSSL_FOUND)
+-    pkg_check_modules(OPENSSL openssl)
++    find_package(OpenSSL)
+ endif()
+ 
+ find_package(WolfSSL)
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
