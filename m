Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AA5C369CA
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 19:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF426FA14;
	Thu, 17 Apr 2025 19:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIVO_k4pC74Z; Thu, 17 Apr 2025 19:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E3A6084A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E3A6084A;
	Thu, 17 Apr 2025 19:50:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AEFB11F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5166940FBB
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYqGjQ8JKnCg for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 19:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.45;
 helo=mail-ed1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66FBE400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FBE400DD
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66FBE400DD
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 19:50:23 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso1889708a12.0
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744919421; x=1745524221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gfbzkhnAdDjmIMIFgFYe6K/iH1YDCO+haJeYM+1rYts=;
 b=EWu0fEgbnW3A9MdEFenbvLnLOaSaZGe89DFplhWc4/IrjxXCVTf0WsfFuEYKfqACMr
 cwJSfwzS1h0DQPwnB+o1/vvY+HjqemdjcTyew3BpiqATwpolQeX+IpRzR1G3L3diFeXP
 wcAxOVJoBClspY9RlKo70nBEA8Fqby2VFXIFmdtcAaqGz+wTEcd/TBOtjottghbcLCR4
 n05UuTP5bbHe6dxbrifo8xA2rk0IAuAXgDDAnpbPAfJOhw6Bd06OSnlPEDiZSWKhRWrK
 0NPQEmEsmZRGZmbjrR+ZyrxC7Lt6aPqMkKS8dHO5WiEcQUFHpPUhPwa/yNotxRjkNU5H
 4yNw==
X-Gm-Message-State: AOJu0Yys1+6YQ9SODXESWoKIVHjQnffDJbDTNaKY2l+PJ8EuIsg0tnFX
 VVVK/kjsYMwF98Sx3nu8tdFS9pTWCddcI/hX5w+emll83sJ6FAGJaEk9CQ==
X-Gm-Gg: ASbGncs0FmS7UQmNMiq0PEXj8dmACanxtY4+UwJ7UqWojeEDlyVLdN2Ei7Biw0Q/A3B
 7+XKamB9oJwJgXmKTFQRiDk5pyMHJvUBw0YqAXzIx4WoRS3lv8/LTHsxb3/gTef0CDmxC9KPVHG
 IVIfcegK3ZQvojuOVjCxwK9d8RPlhwvRqKr0n7/r9Gb/Hh8kQll/qEIgolzNBlA2/kwwfMLPxps
 jHJ9FIObLP+FwDPNsfVQ3XnFCRSGE04JuvD8E/mMLMIoSYLdxnRd/tTjvD0awehHmmXuRu+jDQ/
 m2vJYsaN+jzMb6H9ThZT7T4Ro2xGtqJM183IfmqhV7wdkcr6aRrR
X-Google-Smtp-Source: AGHT+IEtevSFg1HG1CzIqAWQTYAIeQwL0yPUpLmaYY/C1j0agN5NsXGHBsHQFwJSpLWib4u+yzzmmw==
X-Received: by 2002:a17:906:9f90:b0:aca:a161:f113 with SMTP id
 a640c23a62f3a-acb74baaea3mr9370766b.33.1744919420869; 
 Thu, 17 Apr 2025 12:50:20 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ef47ecesm31905966b.159.2025.04.17.12.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 12:50:20 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 17 Apr 2025 21:50:12 +0200
Message-ID: <20250417195012.300118-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/fluent-bit: bump to 4.0.0
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

News:
- https://fluentbit.io/announcements/v4.0.0/

FLB_UNICODE_ENCODER was added, and enabled by default in commit [1],
which requires LIBSTDCPP, disable it if BR2_INSTALL_LIBSTDCPP is not set.

Also add two more patches to drop the LIBSTDCPP requirement.

[1] https://github.com/fluent/fluent-bit/commit/3b04755e99fa500e98dcd1318f9b12f6863d31e4

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...able-CXX-support-if-tests-are-requir.patch | 34 +++++++++++++++++++
 ...-lib-miniz-only-require-a-C-compiler.patch | 27 +++++++++++++++
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              |  7 +++-
 4 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
 create mode 100644 package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch

diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
new file mode 100644
index 0000000000..f7b282165c
--- /dev/null
+++ b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
@@ -0,0 +1,34 @@
+From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:43:30 +0200
+Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
+
+Upstream: https://github.com/facebook/zstd/pull/4357/files
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
+index 347d41c0f..70e233df3 100644
+--- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
++++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
+@@ -37,7 +37,6 @@ project(zstd
+   VERSION "${ZSTD_FULL_VERSION}"
+   LANGUAGES C   # Main library is in C
+             ASM # And ASM
+-            CXX # Testing contributed code also utilizes CXX
+   )
+ 
+ message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
+@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
+ endif ()
+ 
+ if (ZSTD_BUILD_TESTS)
++    enable_language(CXX)
+     enable_testing()
+     if (NOT ZSTD_BUILD_STATIC)
+         message(SEND_ERROR "You need to build static library to build tests")
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..bfd32d6b68
--- /dev/null
+++ b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
@@ -0,0 +1,27 @@
+From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 23:01:13 +0200
+Subject: [PATCH] lib: miniz: only require a C compiler
+
+Upstream: https://github.com/richgel999/miniz/pull/338
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/miniz/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
+index ce6ade1c0..91012b36a 100644
+--- a/lib/miniz/CMakeLists.txt
++++ b/lib/miniz/CMakeLists.txt
+@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+   project(miniz C)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 9abf13698a..e4394f69d1 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f86ecbe208ae152841909a063f28ca250b8a6771c5e43dcb1786ef310f927904  fluent-bit-3.2.10.tar.gz
+sha256  ef9a479c8cc12e01de6682e0cfd21a0a5d335a0ab9be14bbca37211fbf428cad  fluent-bit-4.0.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index bd7c82b26b..09233d13c9 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.2.10
+FLUENT_BIT_VERSION = 4.0.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
@@ -23,6 +23,11 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+FLUENT_BIT_CONF_OPTS += \
+	-DFLB_UNICODE_ENCODER=No
+endif
+
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
 FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
