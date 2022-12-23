Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909BCC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 21:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D784782155;
	Fri, 23 Dec 2022 21:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D784782155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5LI8pWeXlJN; Fri, 23 Dec 2022 21:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F44B82141;
	Fri, 23 Dec 2022 21:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F44B82141
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4A521BF297
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 21:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF8461177
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 21:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF8461177
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkRx61aEoUQK for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 21:56:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73FDB61166
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73FDB61166
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 21:56:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y8so5556237wrl.13
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 13:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qslAbLIr1xF3zfAkFKgAVkbiS2X4WszpmMf88614SME=;
 b=OLfWHwlMbXczQsghAbEyCGepVGYqY3WnObg+KY3oTSqlLqn2ZfvMQF8MdeTIKhIHPS
 5minTqONXtOPFSWqovaaF6rsn1AlmcZZu3ahF1u6UxnZOdzxvuNAKTa5zZsQqT38tJI2
 d2VHUxd3UQrCmjtziF26imvhKh1bUnMCh+IXx65pGpBQbBBmrNnfEaXt9WUFzLsqfqpG
 MIkv6RtD1+pm0TVfZ0L2bjX2cVOGAa0HOyAzWTpMBzhPefB6yB0Fg9cj8NiWwR5/TlSs
 VNOrsMxnwvAyv3aCgGBUEKRguq5UpW63VYRvpFV4ZvXjPf+woeMgQr3C4fBLEDJ8xj/k
 5J0g==
X-Gm-Message-State: AFqh2krtjrp47qpd8VSSAjDlJ/IEAVRHomuxLxaOaBa9unMz/GVHz7+6
 0QhAWAn6vEktT8yUeOiaGkW5kyvktOY=
X-Google-Smtp-Source: AMrXdXvmh8oltfy9lhU6dz0l+KHqN6TLp8PXo5quY0BWfBvKfov9KJt/uzFkcrxEm7BT39gL5rfryA==
X-Received: by 2002:adf:fec6:0:b0:26a:ed4c:e3af with SMTP id
 q6-20020adffec6000000b0026aed4ce3afmr7852439wrs.49.1671832579105; 
 Fri, 23 Dec 2022 13:56:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d12-20020a5d4f8c000000b002421a8f4fa6sm3821932wru.92.2022.12.23.13.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 13:56:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 22:56:07 +0100
Message-Id: <20221223215607.12924-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qslAbLIr1xF3zfAkFKgAVkbiS2X4WszpmMf88614SME=;
 b=BMpUY19pxmYOCx7LNZp4LJLXrS/XRmjVmDmKigkplxuplWh5lesjsPD6akEXpREaCM
 F7pjudRFjwA5jAVEdDu0lMkjYW3YBs4svt5m1eBMzPzQg/JlKJkIMffT6TK9ElUT60X8
 mjUxIer416EbYXA987B7geTdJt55IEQJQJqO6ZHO06uAz573M6ZwfoLa8Ia0CYbmwOPs
 9q7DPkD+6HnPG3rKaUKksemMcUBBAS+5keHpIG2DeFU3IgxVYevzpYOBkAnPxgGu6QDA
 v+08Jgz/eiw7h8Ffotcy8jeRtwH89GO3oalb2w24dQ9kKqD/13EG5Z7Y0nbMRKHP0HvR
 i9dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BMpUY19p
Subject: [Buildroot] [PATCH 1/1] package/jitterentropy-library: bump to
 version 3.4.1
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

- Drop patch (already in version)
- Update hash of LICENSE file (year updated with
  https://github.com/smuellerDD/jitterentropy-library/commit/2e5019cfe63038faaa405ce53715effe4ea580e4)

https://github.com/smuellerDD/jitterentropy-library/blob/v3.4.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Makefile-add-ENABLE_STACK_PROTECTOR.patch | 52 -------------------
 .../jitterentropy-library.hash                |  4 +-
 .../jitterentropy-library.mk                  |  2 +-
 3 files changed, 3 insertions(+), 55 deletions(-)
 delete mode 100644 package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch

diff --git a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
deleted file mode 100644
index c4388663b0..0000000000
--- a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 272ee47892563e849f6b1bf59b0173f8aa33b631 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Dec 2021 11:36:13 +0100
-Subject: [PATCH] Makefile: add ENABLE_STACK_PROTECTOR
-
-Add ENABLE_STACK_PROTECTOR as build on embedded toolchains without
-stack-protector is again broken since
-https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
-jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
-
-Fixes:
- - http://autobuild.buildroot.org/results/8dee462d16d934dd173d58f17933c6911e4336bf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/jitterentropy-library/commit/272ee47892563e849f6b1bf59b0173f8aa33b631]
----
- Makefile | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index dfb96a8..c999ef5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,6 +2,7 @@
- 
- CC ?= gcc
- #Hardening
-+ENABLE_STACK_PROTECTOR ?= 1
- CFLAGS ?= -fwrapv --param ssp-buffer-size=4 -fvisibility=hidden -fPIE -Wcast-align -Wmissing-field-initializers -Wshadow -Wswitch-enum
- CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion
- LDFLAGS +=-Wl,-z,relro,-z,now -lpthread
-@@ -13,10 +14,12 @@ else
-   GCC_GTEQ_490 := $(shell expr `$(CC) -dumpfullversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$$/&00/'` \>= 40900)
- endif
- 
--ifeq "$(GCC_GTEQ_490)" "1"
--  CFLAGS += -fstack-protector-strong
--else
--  CFLAGS += -fstack-protector-all
-+ifeq "$(ENABLE_STACK_PROTECTOR)" "1"
-+  ifeq "$(GCC_GTEQ_490)" "1"
-+    CFLAGS += -fstack-protector-strong
-+  else
-+    CFLAGS += -fstack-protector-all
-+  endif
- endif
- 
- # Change as necessary
diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index 760befab53..c7833f1428 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9fcc954763a1dd4afe614a1b360f53b600d3376bbcc4b19177f27abf191ebad5  jitterentropy-library-3.3.1.tar.xz
-sha256  7e06574ff822594269083a796d06fa4e5e78c40efe5ca01a72d2a4662e8206df  LICENSE
+sha256  802f025f766c38abf663fd5a21482b8313b6d6e2c68c36a4ffd6bc105fe975ab  jitterentropy-library-3.4.1.tar.xz
+sha256  7a89069066f6c0b8767d3256e5ec5d765b2c7f3354a5a06fc8d5bd7b8103d8a3  LICENSE
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 4cdebf46a3..f405082d08 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 3.3.1
+JITTERENTROPY_LIBRARY_VERSION = 3.4.1
 JITTERENTROPY_LIBRARY_SOURCE = \
 	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
 JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
