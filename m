Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F19C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3F63415DD;
	Sat, 11 Feb 2023 18:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3F63415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rxa9sYeJr4yH; Sat, 11 Feb 2023 18:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A52B415D4;
	Sat, 11 Feb 2023 18:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A52B415D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD661BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17014818A1
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17014818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YNZ_WBAd1Io for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:25:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8918176A
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB8918176A
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:25:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id a2so8295371wrd.6
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knLMERga3XwVcCtEYZEkvhO3WwD73QiLRcL3ANiNSO8=;
 b=YLTHdBuJWNJ8utb0RFBoya0CyQwP+Lbm/AM8FxQxn5khCMHBxNl+AE6a0A6dr8Ufor
 A97bUzSbKjnIkF/R1cFkigta3zF0A24Aeo4ykcFqkZznCZAM3uybghRprOH+FLe91qCA
 wZKvZkJXhWCsOy62Qw3LYerJ3on4UwCzTgKVBlqqxsAeBUlwf4S3pATFQoOUd+kQMaQ+
 JEBbgtLezL0lLeJI/eFvVoNeS9wXe53cFPi7+pD568WE9r3FRpByNcj1Dtvc7YLzWzt0
 dpZmss4c0yxMYbqtcCUwhfCsA9fFu+7pEvYhhS2sFNMgE04xlDhSaPJyn7iZSbXPRRI3
 LoCg==
X-Gm-Message-State: AO0yUKU+vHvmqMLzaA/KZxvzNh2BtTbp0eVxufvHRu8GTEvh78SrJS8q
 1MNlbgWYv3qIWkBNutrkbYqEuYFT07TO73CA
X-Google-Smtp-Source: AK7set9rhNJruyuZZQZG0P66qk/CpDBC6W2aEY+ChbtQAh+V/OdqEIv33TJ1HVPjMAAz22Z6JYatYw==
X-Received: by 2002:adf:a1dc:0:b0:2c5:519f:307a with SMTP id
 v28-20020adfa1dc000000b002c5519f307amr1340941wrv.30.1676139956682; 
 Sat, 11 Feb 2023 10:25:56 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:64de:b20e:de86:754e])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b002c54538c9bdsm5086256wrt.10.2023.02.11.10.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 10:25:56 -0800 (PST)
From: thomas@devoogdt.com
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:25:44 +0100
Message-Id: <20230211182546.633728-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230211182546.633728-1-thomas@devoogdt.com>
References: <20230211182546.633728-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/fluent-bit: add support for non
 glibc toolchain
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

- require threads and dynamic library support
- require sync_4 support
- provide fts.h trough musl-fts

static_assert is not available if no C++ toolchain or no glibc
is used, so add two patches to fix this

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
  v2: rebased the c-ares patch

 .../0001-lib-cfl-fixup-static_assert.patch    | 33 +++++++++++
 .../0002-lib-c-ares-fixup-static_assert.patch | 56 +++++++++++++++++++
 package/fluent-bit/Config.in                  | 10 +++-
 package/fluent-bit/fluent-bit.mk              | 11 +++-
 4 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100644 package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
 create mode 100644 package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch

diff --git a/package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch b/package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
new file mode 100644
index 0000000000..19dab7cac6
--- /dev/null
+++ b/package/fluent-bit/0001-lib-cfl-fixup-static_assert.patch
@@ -0,0 +1,33 @@
+From e4f825dd9e952f4a056bf89342049e67102ae6bb Mon Sep 17 00:00:00 2001
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
+2.34.1
+
diff --git a/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
new file mode 100644
index 0000000000..d9b918ea8a
--- /dev/null
+++ b/package/fluent-bit/0002-lib-c-ares-fixup-static_assert.patch
@@ -0,0 +1,56 @@
+From f55f9bf6d9201169d2e5d3782068b03ff17dec90 Mon Sep 17 00:00:00 2001
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
+ lib/c-ares-1.19.0/configure                      | 4 ++++
+ lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4 | 3 +++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/c-ares-1.19.0/configure b/lib/c-ares-1.19.0/configure
+index 4c5e1a966..58712ec34 100755
+--- a/lib/c-ares-1.19.0/configure
++++ b/lib/c-ares-1.19.0/configure
+@@ -6317,6 +6317,8 @@ else $as_nop
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
++#define static_assert _Static_assert
++
+   template <typename T>
+     struct check
+     {
+@@ -6394,6 +6396,8 @@ else $as_nop
+          cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
++#define static_assert _Static_assert
++
+   template <typename T>
+     struct check
+     {
+diff --git a/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4 b/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4
+index 229de3091..fe4a11c67 100644
+--- a/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4
++++ b/lib/c-ares-1.19.0/m4/ax_cxx_compile_stdcxx_11.m4
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
+2.34.1
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
index c10ef613d7..4ecf813511 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -49,12 +49,19 @@ FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+FLUENT_BIT_DEPENDENCIES += musl-fts
+FLUENT_BIT_LDFLAGS += -lfts
+endif
+
 # Uses __atomic_compare_exchange_8
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS=-latomic
+FLUENT_BIT_LDFLAGS += -latomic
 endif
 
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)"
+
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
 		$(TARGET_DIR)/etc/init.d/S99fluent-bit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
