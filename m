Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3ACC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA7240C19;
	Wed,  6 Aug 2025 20:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvJcR_v6VZIN; Wed,  6 Aug 2025 20:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A6640C03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A6640C03;
	Wed,  6 Aug 2025 20:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DAC1233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53C1E40C00
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4hnIJdmGw7z for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 20:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1284540BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1284540BBD
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1284540BBD
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:06:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b794a013bcso141164f8f.2
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 13:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754510792; x=1755115592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEV66IwyeUe6XCPXZk9c5Z8GvJs0lpWf3LCQKhGXlJ8=;
 b=ahntkMXWJkSZ6Vzb4jYgiNLTG8wRg599SgOaUUP25NrllxokhiSklc1WkeN1oADEvx
 beh3mz3BH5kcXOdJGdYoevqhBGW9rOU2nC2eUPGgv2XQBW08iExV6QO2i+cWcqhyg3RX
 fRpZNmA6UovfOag6AOL/mGcnAcSr20te5BN1I/DB/h36uAZBA68tG2/o5YFNoCamplUX
 wN0Buq2WF63InktuBdEO3cD905l3h9UBCzo0RwQtArUbSv3wX0Ev+VpcTxpVIOjvHRZX
 LK1KjpuUYJjTri4RDGuS6g86UEag6ZwDbuMbhGx6xpcg3Wx6RrfRmSPq74Q1akPAoViv
 vVpQ==
X-Gm-Message-State: AOJu0Yyotdr0/m/LUEAtu/1FR4BPAwcRyO+greEpG1ELP66zt7a44PvN
 Qu5FcQfXv2bb+mif5buOMExxTZsADa4ogzT6hlGHe4M07zb9eI5qRhy28zGUq421NrTN1VWkmlS
 yCNai
X-Gm-Gg: ASbGncveCTO/m3l7TYhB8QRS7oMoGckXknBy4NeymvYwF0nzeDEXWzvpmlMQP65VSze
 twWI72gApPF+yF5CWkn96REH5iUeH1v2DaSSl4ImS8CaUOY+66E1j0w4EwhAq6Q82VufEywDtcT
 3t1MFebO1/vzV4J65dAZYmqW57lSopqP19xQFKy5Z8ZE7kI+dWUEyqjZhesdqnp2YGPZx0P6H3/
 OvkcP9/paHZGMhQl9egW8x4AuCe8MG6c+ZZ1Qfx7QtXdHuSKRD9Z1h01oOgNiP7EzximRNUbBhJ
 G90DZCaqPsuZtlOVp5budu6+hLDdsGIES5vJZVVRVNYF2k/8RA/N790m6XNBZKyvCFmPh6ky+Gc
 6MnCbO6bmlzNM+g==
X-Google-Smtp-Source: AGHT+IHPoS7Au/2hiwGwEWA71fcPM7RCy4Gx0GzteoanW873TWCrN5r1adyoe1Ry4sWFRv249V5AZQ==
X-Received: by 2002:a05:6000:220d:b0:3a5:783f:528a with SMTP id
 ffacd0b85a97d-3b8f4948865mr3106846f8f.59.1754510792378; 
 Wed, 06 Aug 2025 13:06:32 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bc12csm24649352f8f.28.2025.08.06.13.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 13:06:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  6 Aug 2025 22:06:31 +0200
Message-ID: <20250806200631.605635-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754510792; x=1755115592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WEV66IwyeUe6XCPXZk9c5Z8GvJs0lpWf3LCQKhGXlJ8=;
 b=d8HCWTJPmfbcxDwfbSKxSSua4QX8YphPDnL/fgpUeZfKmouDNEWLDI/4vwiPFq9K2E
 dGmjsDUhstEBI7Li6TLgRO+039t1Z+1r7hYlfy9aAudbGiSjY/qr3DTsoGAoHEtaGupF
 LAElS9n9KZ7mYDiHBK88daupMry6hB3BYFZ7zbzqUJ0+hxGDF6MXFmjx89mDXPefoYGW
 FkGKtVcE+O7mAqS7ILJrLWAb1uppygRj0iZCazFZYqwnyi3WONT0fYuDJhz5990snESp
 aecxueB6LFhSS90eMs7+/QEq+1ZrHTLbHg9Wk0Pcq+shx+8A+fMcrT7bvsjobsUbt3pt
 zp3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d8HCWTJP
Subject: [Buildroot] [PATCH] package/libapparmor: fix build w/ musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building the libapparmor package with musl the following error
would appear:

```
test_multi.c: In function 'main':
test_multi.c:27:30: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
   27 |         printf("File: %s\n", basename(argv[1]));
      |                              ^~~~~~~~
test_multi.c:27:24: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
   27 |         printf("File: %s\n", basename(argv[1]));
      |                       ~^     ~~~~~~~~~~~~~~~~~
      |                        |     |
      |                        |     int
      |                        char *
      |                       %d
make[3]: *** [Makefile:466: test_multi_multi-test_multi.o] Error 1
```

This error can be reproduced with the following:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_LIBAPPARMOR=y
EOF
make olddefconfig
make libapparmor
```

On musl libc the function `basename` is provided by included libgen.h.
This error has been addressed upstream in [1] by re-defining the
function `basename`.

Also, `libapparmor.mk` refered to patch 0001 which has been removed in
[2] so I removed that reference. The autoreconf is still needed.

[1] https://gitlab.com/apparmor/apparmor/-/commit/7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a
[2] 27cd0b5033 package/apparmor: bump to version 3.0.4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...e-a-portable-version-of-gnu-basename.patch | 44 +++++++++++++++++++
 package/libapparmor/libapparmor.mk            |  1 -
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch

diff --git a/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch b/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
new file mode 100644
index 0000000000..c068279853
--- /dev/null
+++ b/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
@@ -0,0 +1,44 @@
+From 7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a Mon Sep 17 00:00:00 2001
+From: Jules Maselbas <jmaselbas@zdiv.net>
+Date: Thu, 16 May 2024 12:01:00 +0200
+Subject: [PATCH] libapparamor: Define a portable version of gnu basename
+
+Since musl 1.2.5, basename(3) prototype is only provided in libgen.h
+(as mandated by POSIX) and not in strings.h. Also there is a major
+difference between the gnu basename and the one defined in libgen.h,
+the latter modify the argument string making them incompatible.
+
+Fix this by defining a portable version of basename using strchr.
+
+Upstream: https://gitlab.com/apparmor/apparmor/-/commit/7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libraries/libapparmor/testsuite/test_multi.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libraries/libapparmor/testsuite/test_multi.c b/libraries/libapparmor/testsuite/test_multi.c
+index 578629500..7f37966ec 100644
+--- a/libraries/libapparmor/testsuite/test_multi.c
++++ b/libraries/libapparmor/testsuite/test_multi.c
+@@ -1,5 +1,3 @@
+-#define _GNU_SOURCE /* for glibc's basename version */
+-
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -7,6 +5,12 @@
+ 
+ #include <aalogparse.h>
+ 
++static const char *basename(const char *path)
++{
++	const char *p = strrchr(path, '/');
++	return p ? p + 1 : path;
++}
++
+ int print_results(aa_log_record *record);
+ 
+ int main(int argc, char **argv)
+-- 
+GitLab
+
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index fa59ff2924..b1c9a952f0 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -16,7 +16,6 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
-# Patch 0001 touches Makefile.am and m4 files
 LIBAPPARMOR_AUTORECONF = YES
 
 # Most AppArmor tools will want to link to the static lib.
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
