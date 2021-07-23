Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65C3C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 08:08:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6634560E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 08:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6634560E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 397D6401E2;
	Sat, 24 Jul 2021 08:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5Ar4GPH4KyX; Sat, 24 Jul 2021 08:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BF4B40131;
	Sat, 24 Jul 2021 08:08:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 890D61BF37B
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 08:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857B683B32
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 08:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MPG0T450JxG for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 08:08:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8401083AEA
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 08:08:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 j6-20020a05600c1906b029023e8d74d693so2963164wmq.3
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HO2H2W9GdFCtMKJL+MHPvn1jmUywA/RCVCbks3MejNc=;
 b=sUj4AwuVCpDFsCIsqAbqxHwNoa/GlislyCT9ydf4BRSAmTygPdvixANeHP3i099GD2
 5UbUDEMSyqyZctjOKaZ8rE2FrD0Pzx644U86KulzfQpHpVAQ07z0pGUoGFsl7BF2nBXO
 MBcJL9+BinhLdrsxiqqQKJOYRECgduJ6x4ySnrnY/ucyeyn8878fFoUflmjOU6Gbdzo3
 IJ1PeEKS0A4obivoC5MJRaiNb8sWsDN2xsRuQQRNWFvbdw8vxkcUJuvTTtAbuJc2mY0w
 qz5RvCqP/+1Z0E4Iy+n3OVGErlZE/sgWKa5ZxL3cfz78aDypgoTUvZbSNtCbUgySoeW3
 3G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HO2H2W9GdFCtMKJL+MHPvn1jmUywA/RCVCbks3MejNc=;
 b=SBIwzWPgyK3QnIMvNk8DOieA6jLXqfX3hTzZRaUHFPLO28YHAls5Rd/snE7VpLfdMH
 j3/aEY+l+Xk16hc8CVSw8895bEODQnseKlp4tZch6R6GiSFrWSQ8JhxqZJ1vWwktov8G
 GAJ1EehVHvKcV8NsGwQx/PsUnmqgojKHtxrH82X6QhHotK1bSajGFtR1AzuWZ2zgR3yQ
 i2+sdowCrqFmfGNatNBaRv/6OACcNyf59raaJN70S/NVEsVy5nwoC6QYguj9wvmjbVdh
 UhaMX4EX8pScUuJFlrjRbDkCq1dGOijUP52hhZ0CYl53AG2SeypZv0+G7EWoqTY1PicB
 NCZQ==
X-Gm-Message-State: AOAM53355j3jDe8+fDwS9kkQf8iZNMsp6E6Yt8w2jVMpbcho72Fo/aOO
 iYdJZuYXdkxoTtXVGpqdtxxDCXSBqig=
X-Google-Smtp-Source: ABdhPJw+FiJLbaXOGp8lkFET6yGncDDWP+e/qyOsdbs66HwuIFeNZbdsutQzXPuRFLKK6hVzanzsCw==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr8093780wmq.84.1627114107769; 
 Sat, 24 Jul 2021 01:08:27 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t1sm21073023wrm.42.2021.07.24.01.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:08:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:43:10 +0200
Message-Id: <20210723204310.2533158-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/janet: bump to version 0.16.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

patch upstreamed.

diff LICENSE:
-Copyright (c) 2020 Calvin Rose and contributors
+Copyright (c) 2021 Calvin Rose and contributors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...eson.build-fix-build-without-threads.patch | 72 -------------------
 package/janet/janet.hash                      |  4 +-
 package/janet/janet.mk                        |  2 +-
 3 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 package/janet/0003-meson.build-fix-build-without-threads.patch

diff --git a/package/janet/0003-meson.build-fix-build-without-threads.patch b/package/janet/0003-meson.build-fix-build-without-threads.patch
deleted file mode 100644
index e6c9e878b..000000000
--- a/package/janet/0003-meson.build-fix-build-without-threads.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From a7abe11105ac71081455fb4ff0400606bf1668e8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 18 Mar 2021 09:00:23 +0100
-Subject: [PATCH] meson.build: fix build without threads
-
-Fix the following build failure with -Dsingle_threaded=true on embedded
-toolchains without pthread:
-
-FAILED: janet.p/meson-generated_.._janet.c.o
-/home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-linux-gcc -Ijanet.p -I. -I.. -I../src/include -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -std=c99 -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -pthread -fvisibility=hidden -MD -MQ janet.p/meson-generated_.._janet.c.o -MF janet.p/meson-generated_.._janet.c.o.d -o janet.p/meson-generated_.._janet.c.o -c janet.c
-In file included from /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdlib.h:24,
-                 from ../src/include/janet.h:300,
-                 from src/core/features.h:57:
-/home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
-  218 | #   warning requested reentrant code, but thread support was disabled
-      |     ^~~~~~~
-src/core/ev.c:39:10: fatal error: pthread.h: No such file or directory
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/janet-lang/janet/commit/a7abe11105ac71081455fb4ff0400606bf1668e8]
----
- meson.build | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index ea8c2f2e..d6c6c069 100644
---- a/meson.build
-+++ b/meson.build
-@@ -60,7 +60,7 @@ conf.set('JANET_NO_SOURCEMAPS', not get_option('sourcemaps'))
- conf.set('JANET_NO_ASSEMBLER', not get_option('assembler'))
- conf.set('JANET_NO_PEG', not get_option('peg'))
- conf.set('JANET_NO_NET', not get_option('net'))
--conf.set('JANET_NO_EV', not get_option('ev'))
-+conf.set('JANET_NO_EV', not get_option('ev') or get_option('single_threaded'))
- conf.set('JANET_REDUCED_OS', get_option('reduced_os'))
- conf.set('JANET_NO_TYPED_ARRAY', not get_option('typed_array'))
- conf.set('JANET_NO_INT_TYPES', not get_option('int_types'))
-@@ -173,9 +173,14 @@ janetc = custom_target('janetc',
-     'JANET_PATH', janet_path, 'JANET_HEADERPATH', header_path
-   ])
- 
-+janet_dependencies = [m_dep, dl_dep]
-+if not get_option('single_threaded')
-+  janet_dependencies += thread_dep
-+endif
-+
- libjanet = library('janet', janetc,
-   include_directories : incdir,
--  dependencies : [m_dep, dl_dep, thread_dep],
-+  dependencies : janet_dependencies,
-   version: meson.project_version(),
-   soversion: version_parts[0] + '.' + version_parts[1],
-   install : true)
-@@ -189,7 +194,7 @@ else
- endif
- janet_mainclient = executable('janet', janetc, mainclient_src,
-   include_directories : incdir,
--  dependencies : [m_dep, dl_dep, thread_dep],
-+  dependencies : janet_dependencies,
-   c_args : extra_cflags,
-   install : true)
- 
-@@ -202,7 +207,7 @@ if meson.is_cross_build()
-   endif
-   janet_nativeclient = executable('janet-native', janetc, mainclient_src,
-     include_directories : incdir,
--    dependencies : [m_dep, dl_dep, thread_dep],
-+    dependencies : janet_dependencies,
-     c_args : extra_native_cflags,
-     native : true)
- else
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index ca8093536..3e48509bc 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8eed302c8ded1df882544d13ce7e415b213cf7bc8fa77ca16110c89b36d19763  janet-1.15.4.tar.gz
+sha256  ed9350ad7f0270e67f18a78dae4910b9534f19cd3f20f7183b757171e8cc79a5  janet-1.16.1.tar.gz
 
 # Locally calculated
-sha256  1114e280d850605ae71b656dfc88115ab06081e8157720a2497f50edf50b110e  LICENSE
+sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 027edd72c..1d396285d 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.15.4
+JANET_VERSION = 1.16.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
