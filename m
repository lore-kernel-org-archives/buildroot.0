Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25F3C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B5060BCE;
	Fri, 18 Sep 2026 21:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmvcHdHQ8JJJ; Fri, 18 Sep 2026 21:33:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C63E60BDB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789767227;
	b=G0ZPLI3LwEoJJVH0iYQVqdh68ZFOPjMHTu/7x3WiKcszrSXYDn8/zdF02HRuCbuk9V9N
	 +VAPSYDx+3xiB1mgM8OMhuT0nLbyLOmLyYa5xfMBNr3fbWxDnFyNyywiDvrQI1sa4kSE9
	 r0uvyvUizHZJKChSXZFJK6qMr3ynSBpcdOfaRnBeoYUlFzqQJUMPbC9yDkKT4b7qtup92
	 LSJ8CqNOSUrLWQuljLHVAS1WLhJOAEiMHtKh45Bx7cCn3Uzq9nzvTVo0SVYKNrmtjEg6C
	 Cxoqs3HgvEZMjWGOYnAnAutCzgJvXMe+2DoDOzGktffiaXpHJOJeVKFTXALY1UxKUHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789767227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2QR4R+/SnUcncy2uPtntF4y8JAT3/FucASOrcxksLRs=;
	b=h3n61ZFg85bBX2SmQ4S6l5Nbqngd+q+tku5eDEXkfDUR8q9o33Lj4aTMLTO/GjwNGlAx
	 NMC8qEnVFke+NdvK3pZHbuaXt9ker79Uh3JwRiZM9QxNSlsj/Z8QmPDuoXZQoXPnZNYfj
	 J8l79OEZAVxLQun5nXyI/4/9XgaDnWe149Se/wGdbRYlB0RAjpjwIOMSFCUWZmLEvWsdj
	 ejI66N8WyEywHhFto0IAzjjh3Wd/Niz4XmtFxH9iHI7MxQYaVJLmgXzFNPUNhoD9tVJa1
	 ZIAmMG9R2jLiDkmfKpwHoV7n4BpTNOZwpl0txSlmLld4783ATm4ECuhtDLYrwC7IqvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789767227;
	bh=2QR4R+/SnUcncy2uPtntF4y8JAT3/FucASOrcxksLRs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OdH10JVCDDq9pNokwZy5hhfYDurUVPuglQ1Fl/wXpj2JMPka4Za8N8SIlSF+e7k2D
	 toSVwNFrgtR/CMpB3ovK2Qu4WlvfSVhO8AVQKbAW33JnRp481TMfMdB76j5FMe5xBo
	 Q7qtOcKmSGggCZocLDXZeuah56E85oz/9uEkoE++OdhnTMAjgLA1pa0YeAg30a9nlr
	 vk5AYa8RU/wNFsY/zy3WYdjV+t10QBkNCeLPg2qt3gljWrrO84avB4IKdCsq4FjQBM
	 0cz4B2NfGbngarcCMoX8JYxiMoeoHd1YL26Xd2/2mN36suWYL5J/fibZWU4JbyBCUG
	 e+1C5Gpvsg3mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C63E60BDB;
	Fri, 18 Sep 2026 21:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C8C5224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123F9811D4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQGwLTif_Cqa for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0A7E2811CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789767223;
 b=RkwT/WgigjJYZ+5ltN0ngrS2J8JULKXdzBkY7fPBwL6Ygr/0l6WTgITaaS2dWr+g//Oy
 PyyTrgf2EURO9IhreCMUz3CTUGIJjZD00rfzqggKHA6MxlDhL2UTu2xamYs2WdjztgPi4
 Hm3C9r+UEwNvxp26ERD3HcH/3503DoosOddyzOiOmHrNQiEFNraZdg2iZUAQUm5yoG2AJ
 mmdNDSzfkr/3nsj5EEpDS/LStSYe02nHPIvRuTk07wmwJO4qndGzVYq//NPM6aAMWjfss
 c8piNYvV4qM5wNDf91hHj08LbUcbuCpt3R0sxx2716aGL7I3p5ZM/8xTT3vrCinLrrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789767223;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q9eao0jnHZ3QrrbFVEZTZ5xyCflrSSSynom2/KckEnw=;
 b=K+7aBmA4kfRx0gnVwAAm/h+YK3tT4vG34QKN3aDIx5vLXoTwaqHtCKcGqx4SgeSrk3Ie
 QY0mpTe7DXTCopEB86ckyMvQ3rZVt1YYWGb812C1L8U/yU13N/99o/RFYq69+Rq5XbJCT
 OU0WumH0XiNFXPnIbuHGvrDdCFFBHnnuHyGgOr34d4alhbq/dVKRqeklpZzQOdXsynwi2
 d+z4esr/3t2MeIywAqm7vZkgKpMbeaiff27WrQdgdCqGCG4KgoG1Th+XmPU8gyosYmfgN
 iz21hWOocjgCxY+PJNgGzRbjoKx5de1pzQ3te8X2ZhqPthqsNWyhgdlmoZTQCwmkq/g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A7E2811CA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:33:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88998976B0; Fri, 18 Sep 2026 21:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 23:31:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e44b1c4195d14fc5b3960bf01ced0e3697358417
X-Git-Newrev: c24ae7f2f1bebeea6fd7252987496d9ac1d9b042
X-Patchwork-Hint: ignore
Message-Id: <20260918213235.88998976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: allow building when
 crypto backend is not gcrypt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0273898243174914703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0273898243174914703==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c24ae7f2f1bebeea6fd7252987496d9ac1d9b042
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When enabling the openscap package and the libnss library _but not_
libgcrypt, the build can fail on the following error:

  ../src/libopenscap.so.33.1.3: undefined reference to `crapi_init'

The issue is due to the fact that the corresponding Makefile
systematically forces -DWITH_CRYPTO=gcrypt: openscap CMake
instrumentation then searches only this backend, fails to find it,
assumes that no crypto backend is available, and so does not include the
crapi_object in the final link step.

Commit 7c85f3adf4a8 ("package/openscap: new package") took into account
the fact that openscap isn't currently able to build if no crypto backend
is provided (see [0]), and so made sure to force libgcrypt inclusion if
libnss is not included. Since then, two fixes ([1] and [2]) have been
integrated upstream to allow building openscap with any backend.

Do not systematically enforce libgcrypt anymore through WITH_CRYPTO:
rather than testing nss presence, and falling back to libgcrypt, allow
both to be absent, and so relax the libgcrypt dependency to make it
optional as well. Bring the two upstream patches allowing openscap build
without any crypto backend.  Those patches can be dropped once openscap
v1.4.5 is released.

[0] https://github.com/OpenSCAP/openscap/issues/2310
[1] https://github.com/OpenSCAP/openscap/commit/d12d820a9493b0a0ee1ad4b0aeaa87da28aa0080
[2] https://github.com/OpenSCAP/openscap/commit/5b858d1786c025cbd50dfc284b252c3ee6dd99dc

Fixes: https://autobuild.buildroot.org/results/4c905c1b0ee384149c3d85e8f2ebf0af3a12c2ad/
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-without-crypto-support.patch    | 57 ++++++++++++++++++++++
 ...gcrypt-cmake-variables-if-gcrypt-is-not-f.patch | 50 +++++++++++++++++++
 package/openscap/Config.in                         |  5 --
 package/openscap/openscap.mk                       |  9 ++--
 4 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/package/openscap/0001-Fix-build-without-crypto-support.patch b/package/openscap/0001-Fix-build-without-crypto-support.patch
new file mode 100644
index 0000000000..97da60f032
--- /dev/null
+++ b/package/openscap/0001-Fix-build-without-crypto-support.patch
@@ -0,0 +1,57 @@
+From d12d820a9493b0a0ee1ad4b0aeaa87da28aa0080 Mon Sep 17 00:00:00 2001
+From: Eljees <yurytumanov.r@yandex.ru>
+Date: Mon, 27 Jul 2026 06:57:38 +0300
+Subject: [PATCH] Fix build without crypto support
+
+Upstream: https://github.com/OpenSCAP/openscap/commit/d12d820a9493b0a0ee1ad4b0aeaa87da28aa0080
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ src/CMakeLists.txt                   | 2 +-
+ src/OVAL/probes/CMakeLists.txt       | 2 +-
+ src/OVAL/probes/crapi/CMakeLists.txt | 7 ++++++-
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 5d59bf3f036f..f31ce8040e0a 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -59,7 +59,7 @@ if (ENABLE_PROBES)
+ 		)
+ 	endif()
+ endif()
+-if (HAVE_MMAN_H AND (GCRYPT_FOUND OR NSS_FOUND))
++if (HAVE_MMAN_H)
+ 	list(APPEND OBJECTS_TO_LINK_AGAINST
+ 		$<TARGET_OBJECTS:crapi_object>
+ 	)
+diff --git a/src/OVAL/probes/CMakeLists.txt b/src/OVAL/probes/CMakeLists.txt
+index e505908f5842..25e3ca56a0c3 100644
+--- a/src/OVAL/probes/CMakeLists.txt
++++ b/src/OVAL/probes/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ add_subdirectory("SEAP")
+ add_subdirectory("probe")
+ 
+-if (HAVE_MMAN_H AND CRYPTO_FOUND)
++if (HAVE_MMAN_H)
+ 	add_subdirectory("crapi")
+ endif()
+ 
+diff --git a/src/OVAL/probes/crapi/CMakeLists.txt b/src/OVAL/probes/crapi/CMakeLists.txt
+index 1f3e5a963bbf..3fb6f123c8d6 100644
+--- a/src/OVAL/probes/crapi/CMakeLists.txt
++++ b/src/OVAL/probes/crapi/CMakeLists.txt
+@@ -1,4 +1,9 @@
+-file(GLOB_RECURSE CRAPI_SOURCES "*.c")
++if (CRYPTO_FOUND)
++	file(GLOB_RECURSE CRAPI_SOURCES "*.c")
++else()
++	# crapi_init has a no-op implementation for builds without a digest backend.
++	set(CRAPI_SOURCES "crapi.c")
++endif()
+ file(GLOB_RECURSE CRAPI_HEADERS "*.h")
+ 
+ add_library(crapi_object OBJECT ${CRAPI_SOURCES} ${CRAPI_HEADERS})
+-- 
+2.55.0
+
diff --git a/package/openscap/0002-Do-not-use-gcrypt-cmake-variables-if-gcrypt-is-not-f.patch b/package/openscap/0002-Do-not-use-gcrypt-cmake-variables-if-gcrypt-is-not-f.patch
new file mode 100644
index 0000000000..d4d3bd2d16
--- /dev/null
+++ b/package/openscap/0002-Do-not-use-gcrypt-cmake-variables-if-gcrypt-is-not-f.patch
@@ -0,0 +1,50 @@
+From 5b858d1786c025cbd50dfc284b252c3ee6dd99dc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
+Date: Tue, 18 Aug 2026 09:38:05 +0200
+Subject: [PATCH] Do not use gcrypt cmake variables if gcrypt is not found
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit d12d820a9493 ("Fix build without crypto support") enabled
+building the crapi library without a crypto backend, but left the
+target_include_directories and target_compile_definitions calls
+unguarded. When no crypto library is available, the GCrypt find module
+leaves GCRYPT_INCLUDE_DIRS unset, so CMake fails at the generate step
+with:
+
+  CMake Error: The following variables are used in this project, but
+  they are set to NOTFOUND: GCRYPT_INCLUDE_DIR
+
+The test command provided at this time made the build successful because
+it provided -DCMAKE_DISABLE_FIND_PACKAGE_GCrypt=TRUE, but if no crypto
+backend is provided, it does not make sense to provide those cmake
+configuration options preventing dependency search manually.
+
+Guard both calls with a CRYPTO_FOUND check so they are only applied when
+an actual digest backend is present, even without providing
+-DCMAKE_DISABLE_FIND_PACKAGE_foo
+
+Upstream: https://github.com/OpenSCAP/openscap/commit/5b858d1786c025cbd50dfc284b252c3ee6dd99dc
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ src/OVAL/probes/crapi/CMakeLists.txt | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/OVAL/probes/crapi/CMakeLists.txt b/src/OVAL/probes/crapi/CMakeLists.txt
+index 3fb6f123c8d6..88cb916b6d96 100644
+--- a/src/OVAL/probes/crapi/CMakeLists.txt
++++ b/src/OVAL/probes/crapi/CMakeLists.txt
+@@ -8,5 +8,7 @@ file(GLOB_RECURSE CRAPI_HEADERS "*.h")
+ 
+ add_library(crapi_object OBJECT ${CRAPI_SOURCES} ${CRAPI_HEADERS})
+ set_oscap_generic_properties(crapi_object)
+-target_include_directories(crapi_object PUBLIC ${NSS_INCLUDE_DIRS} ${GCRYPT_INCLUDE_DIRS})
+-target_compile_definitions(crapi_object PUBLIC ${GCRYPT_DEFINITIONS})
++if (CRYPTO_FOUND)
++	target_include_directories(crapi_object PUBLIC ${NSS_INCLUDE_DIRS} ${GCRYPT_INCLUDE_DIRS})
++	target_compile_definitions(crapi_object PUBLIC ${GCRYPT_DEFINITIONS})
++endif()
+-- 
+2.55.0
+
diff --git a/package/openscap/Config.in b/package/openscap/Config.in
index b6deae0a5f..2d932140a7 100644
--- a/package/openscap/Config.in
+++ b/package/openscap/Config.in
@@ -1,14 +1,10 @@
 config BR2_PACKAGE_OPENSCAP
 	bool "openscap"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgcrypt
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libxmlsec1
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libxmlsec1
 	select BR2_PACKAGE_LIBCURL
-	# In theory should build without crypto, but in practice it
-	# doesn't: https://github.com/OpenSCAP/openscap/issues/2310
-	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LIBXMLSEC1
@@ -22,7 +18,6 @@ config BR2_PACKAGE_OPENSCAP
 	  https://github.com/OpenSCAP/openscap
 
 comment "openscap needs a toolchain w/ dynamic library, NPTL, gcc >= 7"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/openscap/openscap.mk b/package/openscap/openscap.mk
index 7da38df345..6fbe097718 100644
--- a/package/openscap/openscap.mk
+++ b/package/openscap/openscap.mk
@@ -22,7 +22,6 @@ OPENSCAP_DEPENDENCIES = \
 HOST_OPENSCAP_DEPENDENCIES = \
 	host-pkgconf \
 	host-libcurl \
-	host-libgcrypt \
 	host-libxml2 \
 	host-libxmlsec1 \
 	host-libxslt \
@@ -36,7 +35,6 @@ OPENSCAP_CONF_OPTS = \
 	-DENABLE_OSCAP_UTIL_VM=OFF \
 	-DENABLE_PROBES_WINDOWS=OFF \
 	-DENABLE_TESTS=OFF \
-	-DWITH_CRYPTO=gcrypt \
 	-DENABLE_PYTHON3=OFF
 
 HOST_OPENSCAP_CONF_OPTS = \
@@ -47,7 +45,6 @@ HOST_OPENSCAP_CONF_OPTS = \
 	-DENABLE_OSCAP_UTIL_VM=OFF \
 	-DENABLE_PROBES_WINDOWS=OFF \
 	-DENABLE_TESTS=OFF \
-	-DWITH_CRYPTO=gcrypt \
 	-DENABLE_PYTHON3=OFF
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -60,10 +57,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 OPENSCAP_DEPENDENCIES += libgcrypt
-endif
-
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
+OPENSCAP_CONF_OPTS += -DWITH_CRYPTO=gcrypt
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 OPENSCAP_DEPENDENCIES += libnss
+OPENSCAP_CONF_OPTS += -DWITH_CRYPTO=nss
 endif
 
 ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)

--===============0273898243174914703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0273898243174914703==--
