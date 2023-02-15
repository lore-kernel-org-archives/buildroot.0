Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD6C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 15:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0932B40393;
	Wed, 15 Feb 2023 15:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0932B40393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fx3ckEcUzvq2; Wed, 15 Feb 2023 15:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA93040BC3;
	Wed, 15 Feb 2023 15:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA93040BC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6436B1BF3EB
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 15:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EB6740BC3
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 15:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB6740BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QlGLeHDg2ud for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 15:13:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B7EB40393
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B7EB40393
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 15:13:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ky6so2263841ejc.0
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 07:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3bb5juuyKLwF3wuTDY5HAJXTYb4/PcowEgyKY0pYzSM=;
 b=cp+4/F1KntDM9fZn3wziNv/wKUH9o0z8aF99BsPtnKe4j/Bw7xW08fA2wS47yQ9VNj
 EIHQG0fOIJ2RZh5Eo3VGDrJ1LR9VyoIHbmG0F46MCNofzMzUKcDyqSAjtHlPB1YBX+qj
 e3Xu8+B+B0BhvCtOPACb60kW5BBCE92M1pOPrGSc7TSXisjcBZ/RBb9nFydUud0ZwRUC
 ZcoXDf3EsemLhifb9cAg8604/izVNLb0SCK0mW1ZQU+ISreb8HwuugNex9hsz3V3ze+J
 2o4vDyMeY+6zflIhBefjlxD8cNmN7+04+puof6t1AfUwpOkeZ4h/njBlV0mKt1GULi/c
 jGtQ==
X-Gm-Message-State: AO0yUKUyp559ZRbx+vWqaABPz41ycYZsZoRY+JGB2kUYDdB/LK5NhDuV
 SzL6wDGX1O+gDwre+X1uXMs9cPqBG84=
X-Google-Smtp-Source: AK7set+nHHE3SQVcD5g45sefeCceYpuav43MprkNK9YSoHWTV8bCQiVo32XZChxQ76XGvT0VUgDOoA==
X-Received: by 2002:a17:906:c79a:b0:887:d0e6:fa28 with SMTP id
 cw26-20020a170906c79a00b00887d0e6fa28mr2436262ejb.1.1676474001247; 
 Wed, 15 Feb 2023 07:13:21 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 m16-20020a1709061ed000b0088f8a61eb48sm9785578ejj.154.2023.02.15.07.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 07:13:20 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 16:13:01 +0100
Message-Id: <20230215151302.140387-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3bb5juuyKLwF3wuTDY5HAJXTYb4/PcowEgyKY0pYzSM=;
 b=BEMKT+CMqNhsUJ+8MxL1G+04UtXW2iQIbl0OMKiYBkHnRbRrhEvi0YKPgPT2Q+xhfa
 208bba+h47TZUiLNKa8pVqeAksR6lw7IVuU7NPjmu7VykgntFecHHg20HC1QddJGO4q3
 CjAgdue2Ma8AQ7JSDvTkB1eGEwP2SGLbwiB6hcCTiJcwJqMbb2uZYPJaOGo/KFDmeBb1
 9up1i6eYHf52xHP1NcehUwT6w64Ffd5n+2JQ7agNfV2qO4J+OinKtyoUqXSBBgVUYBTO
 mR28vFusKfaVtZ3I9mSOF6lQ8zq4W4Pwy51PRDV4az7geW62cEU4rnDGbgSyUSS/v/Zr
 MMWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BEMKT+CM
Subject: [Buildroot] [PATCH] package/zstd: bump to version 1.5.4
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The LICENSE text has changed, nominally the copyright owner changed
from "Facebook" to "Meta Platforms, Inc. and affiliates",
reflecting the name change of that company.

Add upstream patch to fix zstd-dll build.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...-zstd-dll-build-missing-dependencies.patch | 179 ++++++++++++++++++
 package/zstd/zstd.hash                        |   6 +-
 package/zstd/zstd.mk                          |   2 +-
 3 files changed, 183 insertions(+), 4 deletions(-)
 create mode 100644 package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch

diff --git a/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch b/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch
new file mode 100644
index 0000000000..bbb008c3b3
--- /dev/null
+++ b/package/zstd/0001-Fix-zstd-dll-build-missing-dependencies.patch
@@ -0,0 +1,179 @@
+Fix zstd-dll build
+
+https://github.com/facebook/zstd/commit/c78f434aa4f5f1097c8edb975f4c1635817a5a71
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+
+diff --git a/.github/workflows/dev-short-tests.yml b/.github/workflows/dev-short-tests.yml
+index 132dbb9961..9c70dda130 100644
+--- a/.github/workflows/dev-short-tests.yml
++++ b/.github/workflows/dev-short-tests.yml
+@@ -55,6 +55,14 @@ jobs:
+       run: |
+         make c89build V=1
+ 
++  zstd-dll-test:
++    runs-on: ubuntu-latest
++    steps:
++    - uses: actions/checkout@ac593985615ec2ede58e132d2e21d2b1cbd6127c # tag=v3
++    - name: build zstd bin against a dynamic lib (debuglevel for more dependencies)
++      run: |
++        make -C lib lib-mt-release 
++        DEBUGLEVEL=2 make -C programs zstd-dll
+ 
+   gcc-7-libzstd:
+     runs-on: ubuntu-latest
+@@ -328,7 +336,6 @@ jobs:
+         make -j -C programs allVariants MOREFLAGS=-O0
+         ./tests/test-variants.sh
+ 
+-
+   qemu-consistency:
+     name: QEMU ${{ matrix.name }}
+     runs-on: ubuntu-20.04
+diff --git a/lib/common/zstd_common.c b/lib/common/zstd_common.c
+index 3208552475..3f04c22abf 100644
+--- a/lib/common/zstd_common.c
++++ b/lib/common/zstd_common.c
+@@ -14,7 +14,6 @@
+ *  Dependencies
+ ***************************************/
+ #define ZSTD_DEPS_NEED_MALLOC
+-#include "zstd_deps.h"   /* ZSTD_malloc, ZSTD_calloc, ZSTD_free, ZSTD_memset */
+ #include "error_private.h"
+ #include "zstd_internal.h"
+ 
+@@ -47,37 +46,3 @@ ZSTD_ErrorCode ZSTD_getErrorCode(size_t code) { return ERR_getErrorCode(code); }
+ /*! ZSTD_getErrorString() :
+  *  provides error code string from enum */
+ const char* ZSTD_getErrorString(ZSTD_ErrorCode code) { return ERR_getErrorString(code); }
+-
+-
+-
+-/*=**************************************************************
+-*  Custom allocator
+-****************************************************************/
+-void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem)
+-{
+-    if (customMem.customAlloc)
+-        return customMem.customAlloc(customMem.opaque, size);
+-    return ZSTD_malloc(size);
+-}
+-
+-void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem)
+-{
+-    if (customMem.customAlloc) {
+-        /* calloc implemented as malloc+memset;
+-         * not as efficient as calloc, but next best guess for custom malloc */
+-        void* const ptr = customMem.customAlloc(customMem.opaque, size);
+-        ZSTD_memset(ptr, 0, size);
+-        return ptr;
+-    }
+-    return ZSTD_calloc(1, size);
+-}
+-
+-void ZSTD_customFree(void* ptr, ZSTD_customMem customMem)
+-{
+-    if (ptr!=NULL) {
+-        if (customMem.customFree)
+-            customMem.customFree(customMem.opaque, ptr);
+-        else
+-            ZSTD_free(ptr);
+-    }
+-}
+diff --git a/lib/common/zstd_internal.h b/lib/common/zstd_internal.h
+index 37836dc703..2557ac703b 100644
+--- a/lib/common/zstd_internal.h
++++ b/lib/common/zstd_internal.h
+@@ -24,6 +24,8 @@
+ #include "mem.h"
+ #include "debug.h"                 /* assert, DEBUGLOG, RAWLOG, g_debuglevel */
+ #include "error_private.h"
++#define ZSTD_DEPS_NEED_MALLOC
++#include "zstd_deps.h"   /* ZSTD_malloc, ZSTD_calloc, ZSTD_free, ZSTD_memset */
+ #define ZSTD_STATIC_LINKING_ONLY
+ #include "../zstd.h"
+ #define FSE_STATIC_LINKING_ONLY
+@@ -351,9 +353,34 @@ const seqStore_t* ZSTD_getSeqStore(const ZSTD_CCtx* ctx);   /* compress & dictBu
+ int ZSTD_seqToCodes(const seqStore_t* seqStorePtr);   /* compress, dictBuilder, decodeCorpus (shouldn't get its definition from here) */
+ 
+ /* custom memory allocation functions */
+-void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem);
+-void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem);
+-void ZSTD_customFree(void* ptr, ZSTD_customMem customMem);
++MEM_STATIC void* ZSTD_customMalloc(size_t size, ZSTD_customMem customMem)
++{
++    if (customMem.customAlloc)
++        return customMem.customAlloc(customMem.opaque, size);
++    return ZSTD_malloc(size);
++}
++
++MEM_STATIC void* ZSTD_customCalloc(size_t size, ZSTD_customMem customMem)
++{
++    if (customMem.customAlloc) {
++        /* calloc implemented as malloc+memset;
++         * not as efficient as calloc, but next best guess for custom malloc */
++        void* const ptr = customMem.customAlloc(customMem.opaque, size);
++        ZSTD_memset(ptr, 0, size);
++        return ptr;
++    }
++    return ZSTD_calloc(1, size);
++}
++
++MEM_STATIC void ZSTD_customFree(void* ptr, ZSTD_customMem customMem)
++{
++    if (ptr!=NULL) {
++        if (customMem.customFree)
++            customMem.customFree(customMem.opaque, ptr);
++        else
++            ZSTD_free(ptr);
++    }
++}
+ 
+ 
+ /* ZSTD_invalidateRepCodes() :
+diff --git a/programs/Makefile b/programs/Makefile
+index fcff41dc1b..8507abef3f 100644
+--- a/programs/Makefile
++++ b/programs/Makefile
+@@ -225,7 +225,7 @@ zstd-noxz : zstd
+ .PHONY: zstd-dll
+ zstd-dll : LDFLAGS+= -L$(LIBZSTD)
+ zstd-dll : LDLIBS += -lzstd
+-zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c
++zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c pool.c threading.c
+ zstd-dll : zstd
+ 
+ 
+diff --git a/tests/Makefile b/tests/Makefile
+index 3eed19ea80..778c7d6759 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -95,7 +95,7 @@ allnothread: fullbench fuzzer paramgrill datagen decodecorpus
+ dll: fuzzer-dll zstreamtest-dll
+ 
+ .PHONY: zstd zstd32 zstd-nolegacy  # only external makefile knows how to build or update them
+-zstd zstd32 zstd-nolegacy:
++zstd zstd32 zstd-nolegacy zstd-dll:
+ 	$(MAKE) -C $(PRGDIR) $@ MOREFLAGS+="$(DEBUGFLAGS)"
+ 
+ .PHONY: libzstd
+@@ -328,13 +328,17 @@ test-all: test test32 test-decodecorpus-cli
+ test-zstd: ZSTD = $(PRGDIR)/zstd
+ test-zstd: zstd
+ 
++.PHONY: test-zstd-dll
++test-zstd-dll: ZSTD = $(PRGDIR)/zstd
++test-zstd-dll: zstd-dll
++
+ test-zstd32: ZSTD = $(PRGDIR)/zstd32
+ test-zstd32: zstd32
+ 
+ test-zstd-nolegacy: ZSTD = $(PRGDIR)/zstd-nolegacy
+ test-zstd-nolegacy: zstd-nolegacy
+ 
+-test-zstd test-zstd32 test-zstd-nolegacy: datagen
++test-zstd test-zstd32 test-zstd-nolegacy test-zstd-dll: datagen
+ 	file $(ZSTD)
+ 	EXE_PREFIX="$(QEMU_SYS)" ZSTD_BIN="$(ZSTD)" DATAGEN_BIN=./datagen ./playTests.sh $(ZSTDRTTEST)
+ 
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index eca44b89f0..ca4e2fa0b9 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,6 +1,6 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz.sha256
-sha256  7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0  zstd-1.5.2.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.4/zstd-1.5.4.tar.gz.sha256
+sha256  0f470992aedad543126d06efab344dc5f3e171893810455787d38347343a4424  zstd-1.5.4.tar.gz
 
 # License files (locally computed)
-sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
+sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 73bb97a793..45e8bf1bc2 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.2
+ZSTD_VERSION = 1.5.4
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
