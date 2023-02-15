Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F481C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EECD260FE9;
	Tue, 21 Feb 2023 02:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EECD260FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvMzYMeEzvAH; Tue, 21 Feb 2023 02:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7CE7021E;
	Tue, 21 Feb 2023 01:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7CE7021E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41A9D1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349B37003A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349B37003A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aog3i2vpJVE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 407A2610E5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 407A2610E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E165828C8; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 10:16:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 656af31891cc68eb8b27866cb9e9a7ca428a2b16
X-Git-Newrev: d649bcd3805a26cedb30120ebbdcf12f8fbf449f
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.3E165828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fluent-bit: add
 support for non glibc toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d649bcd3805a26cedb30120ebbdcf12f8fbf449f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- require threads and dynamic library support
- require sync_4 support
- provide fts.h through musl-fts

static_assert is not available if no C++ toolchain or no glibc
is used, so add two patches to fix this

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-lib-cfl-fixup-static_assert.patch         | 33 +++++++++++++
 .../0002-lib-c-ares-fixup-static_assert.patch      | 56 ++++++++++++++++++++++
 package/fluent-bit/Config.in                       | 10 ++--
 package/fluent-bit/fluent-bit.mk                   | 11 ++++-
 4 files changed, 105 insertions(+), 5 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
