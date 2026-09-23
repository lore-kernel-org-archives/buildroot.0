Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EE6C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1D14127F;
	Thu, 24 Sep 2026 19:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYbc52bboxkR; Thu, 24 Sep 2026 19:00:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9BB594126D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276407;
	b=gfBkOdb9ieTtZLYTOwwjBTOX+wbQCmNKQJLGe/4eXO6i4UY9zfPQH768a+GayijvHIhj
	 llMhpJz/RfaI7u95rAmOtIOfEMsSs7C6X3WLSL5UQwSgY4mRgnscqxnahtB8os7ah7n13
	 q9imvgJZCiyiXF6Q0sbRbOIjBaIW/vUL8kCc+0cfL8yQCsLOG0Kb79URzt9sF6/dMCh/A
	 DMZjlxJ0zsJ08asVuGqkVoiofPRJiXEVwcMqZ1oEfxjMQoGCkagCULuuCRhb3FH5OMtd7
	 8pV0gJtassFhnpB7mrMnLLakiGfXQ0tc+XsooSys8KkRKzLgVJppYNOM4BvPjp/+3QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=idOHc81Fu85koVlBx2YPCS7s1qc1cmwLn9LICkPOsPg=;
	b=QAYmneN7B6hqmcM4F4FGHbkAJ5Flb2oJtFDoJ8ksLR4UwVjxfKGLlRDIPl6CLCvQxiau
	 pyIGNT4RSQggPkMXNCbUILTL00j+GeN7SbmRUgSIKDzxSEIt1spMWlxeAQGVF2qRKItoB
	 Z/nOlBlrm+uy68qA08SA82VGVQcxiudqNnwwDviFINimuPnfK/ObbIZADSL08SAlOur/L
	 eLxh8ibQJ9KuAi9vbiMJCzyGhiaaJJNUIu/9muJFJd9DJ/F00KOvjlLiQmHvysKOl62IB
	 saxbpLW8EUaUq0FSIhfQ3ISux3wVk9NOl2Obn3o6dlG7xJeMHOtFL9ddf40oFC4S43w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276407;
	bh=idOHc81Fu85koVlBx2YPCS7s1qc1cmwLn9LICkPOsPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLecjz9EXDHupEknNcyUFfNcy5YpHyUa3n16KNLR10DqiJ/nl0tcMWI4YGxJ8K57G
	 oJxsPc6Tiz9SbxUykM0WW+cQ96h9nLglHcyWVvCzXS1Uf0TsQviwuTd+teVLNXT2o7
	 ZebGomHEoK6l93b9i2OqKZfjltJvUDiAOV1Pky1pSPqOA5QTtMzOpemmld7eZv2a5v
	 +DQcauMljHh8vql3IFSPt6vVL7tiVprJrRsJSgr4HdgWO/8Fw0Te30WzHj4fyAviIW
	 zqIwAKkKS3rPsMdK4NQrOBT+SGkwSNLfLOKzrRo5c7NTDyUXTh6w5lKDIFufBHqrfc
	 7ybEKPznjoSMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB594126D;
	Thu, 24 Sep 2026 19:00:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B06D3B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49AA8404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4nen3PSOsaf for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 15AAB404CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=ezXOOmVkvhQVONQ8GczfnQMwFOC34Lc59+WtOlFAR7qyuEY/tsGixy4yQRPzOm7AuKAy
 YLJ9hSsFimgfGVYKWeug0z2LHUqweJqKuDU4//88v4gBSDFRbGDWPbpqmBvsCQCHtiXqm
 V8fYm96c+iKefxbGr3ZvC22x/faXr8j+TmHtig22uORzCQUC8uhTPQ+1FuadjXL6nWYCf
 pwBhJUn6GJ7us347/lMqpcg2LTiHc8mnHxyvcdz9VGWHYvFSkUrn68EC5WrFRLlsmyI1x
 /8cOl6zvimD+kVpR/7cplmDgKzSpezhJolv3X/nocD+6QKPcn70gQjOA9mZvbamU7zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sYUaK359urbgGxAsw9rQ8Tu32lQyFISBRUYVEK8Dc9g=;
 b=ir4er+z4F7M6a7DVoONsIfY4FrrLtEoFSgCWLnc18KfddI2rVqyXy8+Jus6gPacBZB2s
 9bBsGv2g53PtlekH/pz08YBkEn8JBgjpJdilQVFiRWVhwspb0QtHe3wPw5OcGyNX6adDr
 Zw6a4TtxVxnxO1/Tq2iKcMSmGbmQHF4XKTJSLjL+zAjBHrtOAUIIQa15OCLiQCuslhYq9
 OTLLfS3TvDpu1lmAZkNIVeuO6W+AFmxhUDnSUTXq5+CQ2BrqvPv9QqIIOONrTC9YJifZr
 W/nRTSb9urPGVfN1CdKjGJl7XBVGcnG3w4bS+i+LZwAIIyRpcGv+JoQ448O7bJNV5mA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15AAB404CA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADE1A9828F; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:34:04 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c05c6ca99a1667347b3ef5d27ad666a777075e59
X-Git-Newrev: 680074eeb1b71254adc2dedb26906ef9c855cb03
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.ADE1A9828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openscap: allow
 building when crypto backend is not gcrypt
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0656503264439816238=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0656503264439816238==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/680074eeb1b71254adc2dedb26906ef9c855cb03
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit c24ae7f2f1bebeea6fd7252987496d9ac1d9b042)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0656503264439816238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0656503264439816238==--
