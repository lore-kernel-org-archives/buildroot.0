Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472B7C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 07:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A671A60E27;
	Thu,  2 Feb 2023 07:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A671A60E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtJDGgi-xPzf; Thu,  2 Feb 2023 07:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914756102D;
	Thu,  2 Feb 2023 07:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914756102D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 771A61BF2B4
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 07:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 504DB41A4B
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 07:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 504DB41A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ws2YiIak8PRW for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 07:15:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A9D41A3E
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2A9D41A3E
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 07:15:44 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q5so856402wrv.0
 for <buildroot@buildroot.org>; Wed, 01 Feb 2023 23:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N7K/ygHjrpozEz1Be1gU1UWWXJjdi0um4HMaQptUIl0=;
 b=KQAwDaJYohtlvyc0r9cL8aFnqD9YurATmvfDnKZ3UTAmiDfeWE/RC0qXWFAmmWwee/
 Zloauz9k7pRE2C6Gbypa2YbrZGc0JTWR68esCz5byT7TUpk88DevPRzejefCQ/F6IdsW
 a2fpPH4X+cnUssM8corrMI8xBdhXIaVBbc1hYoSDC0TB8R6J6n/LE7NHnVHuXMIaHxdR
 GCVuINDkUfakOMlcPVEJ9tF9HmVly8H99ypzu+dEvYeopSqbvPPDVt0BvM6IPFNavNuO
 Ka5+1Ws9w68vsGPBDjw+zz+GF4OF2ecc9+c9otnW/6vfwBJSw1zsnSeVP6QJxOWWao3v
 zNEw==
X-Gm-Message-State: AO0yUKWIjhPpjj2L87S3nlDX6YKY1sGSQLor4CHfYF5ovaa3YWzg49CH
 KJdXuBVXXqM+Z8SZKm9mFccB3NIq8RCBdN7i
X-Google-Smtp-Source: AK7set91k+18RKV0iP+/+wTOozrAjh6RLwIuC6qc3eK3CGdAxs5eHKTuor6Tk4EioZ5vq3N6uflbsA==
X-Received: by 2002:a5d:6b89:0:b0:2bf:b571:1f18 with SMTP id
 n9-20020a5d6b89000000b002bfb5711f18mr5133227wrx.61.1675322142402; 
 Wed, 01 Feb 2023 23:15:42 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 a17-20020adffb91000000b002bddac15b3dsm18708954wrr.33.2023.02.01.23.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 23:15:41 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 08:15:17 +0100
Message-Id: <20230202071518.3961314-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/fluent-bit: add support for non glibc
 toolchain
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

- require threads and dynamic library support
- require sync_4 support
- provide fts.h trough musl-fts

'static_assert()' is not available if no C++ toolchain or no glibc
is used, so add two patches to fix this

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 .../0002-lib-c-ares-fixup-static_assert.patch | 56 +++++++++++++++++++
 .../0003-lib-cfl-fixup-static_assert.patch    | 33 +++++++++++
 package/fluent-bit/Config.in                  | 10 +++-
 package/fluent-bit/fluent-bit.mk              | 11 +++-
 4 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100644 package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
 create mode 100644 package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch

No idea if there is an interest in uClibc or musl-enabled toolchains regarding buildroot?
I was able to compile fluent-bit for most of the supported platforms with a limited amount
of changes.

I had to create two patches in two libs. One (cfl) was already upstreamed,
and added the link to it. The other (c-ares) should be fixed by the m4 bump. I guess that
fluent-bit will bump those sub-libs over time, so we can drop these patches.

                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: SKIPPED
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

diff --git a/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
new file mode 100644
index 0000000000..de5d0d06a8
--- /dev/null
+++ b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
@@ -0,0 +1,56 @@
+From aca354ae22c55fa6051d04a9f674fe0825443a94 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Wed, 1 Feb 2023 11:26:56 +0100
+Subject: [PATCH] lib: c-ares: fixup static_assert
+
+"undefined reference to 'static_assert'"
+
+Not defined when using uClibc or if not C++ >= 11.
+
+upstream: https://github.com/c-ares/c-ares/issues/504
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ lib/c-ares-1.18.1/configure                      | 4 ++++
+ lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4 | 3 +++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/c-ares-1.18.1/configure b/lib/c-ares-1.18.1/configure
+index 737f0a0dd..b99b7ed49 100755
+--- a/lib/c-ares-1.18.1/configure
++++ b/lib/c-ares-1.18.1/configure
+@@ -6316,6 +6316,8 @@ else $as_nop
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
++#define static_assert _Static_assert
++
+   template <typename T>
+     struct check
+     {
+@@ -6393,6 +6395,8 @@ else $as_nop
+          cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
++#define static_assert _Static_assert
++
+   template <typename T>
+     struct check
+     {
+diff --git a/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4 b/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4
+index 229de3091..fe4a11c67 100644
+--- a/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4
++++ b/lib/c-ares-1.18.1/m4/ax_cxx_compile_stdcxx_11.m4
+@@ -37,6 +37,9 @@
+ #serial 9
+ 
+ m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [[
++
++#define static_assert _Static_assert
++
+   template <typename T>
+     struct check
+     {
+-- 
+2.39.0
+
diff --git a/package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch b/package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch
new file mode 100644
index 0000000000..7b99a8e4de
--- /dev/null
+++ b/package/fluent-bit/0003-lib-cfl-fixup-static_assert.patch
@@ -0,0 +1,33 @@
+From 8d17fc961fef2e88f4c8fa2316af925d5466ca4d Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Wed, 1 Feb 2023 11:38:15 +0100
+Subject: [PATCH] lib: cfl: fixup static_assert
+
+"undefined reference to 'static_assert'"
+
+Not defined when using uClibc or if not C++ >= 11.
+
+upstream: https://github.com/Cyan4973/xxHash/commit/6189ecd3d44a693460f86280ccf49d33cb4b18e1
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ lib/cfl/lib/xxhash/xxhash.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/cfl/lib/xxhash/xxhash.h b/lib/cfl/lib/xxhash/xxhash.h
+index 08ab79457..511c4d12b 100644
+--- a/lib/cfl/lib/xxhash/xxhash.h
++++ b/lib/cfl/lib/xxhash/xxhash.h
+@@ -1546,8 +1546,7 @@ static void* XXH_memcpy(void* dest, const void* src, size_t size)
+ /* note: use after variable declarations */
+ #ifndef XXH_STATIC_ASSERT
+ #  if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)    /* C11 */
+-#    include <assert.h>
+-#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
++#    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { _Static_assert((c),m); } while(0)
+ #  elif defined(__cplusplus) && (__cplusplus >= 201103L)            /* C++11 */
+ #    define XXH_STATIC_ASSERT_WITH_MESSAGE(c,m) do { static_assert((c),m); } while(0)
+ #  else
+-- 
+2.39.0
+
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 6c2299e695..f53eacb447 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_FLUENT_BIT
 	bool "fluent-bit"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBYAML
 	help
@@ -29,5 +32,6 @@ config BR2_PACKAGE_FLUENT_BIT_WASM
 
 endif
 
-comment "fluent-bit needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "fluent-bit needs a toolchain w/ threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 6e9a33e02e..151afc34aa 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -47,12 +47,19 @@ FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+FLUENT_BIT_DEPENDENCIES += musl-fts
+FLUENT_BIT_LINKER_FLAGS += -lfts
+endif
+
 # Uses __atomic_compare_exchange_8
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS=-latomic
+FLUENT_BIT_LINKER_FLAGS += -latomic
 endif
 
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LINKER_FLAGS)"
+
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
 		$(TARGET_DIR)/etc/init.d/S99fluent-bit
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
