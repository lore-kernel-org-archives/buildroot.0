Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2845CCD5BB1
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 09:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0362440ED1;
	Sat, 23 May 2026 09:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx89-KMAeX5e; Sat, 23 May 2026 09:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C64DF40EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779527558;
	bh=5zQx7MZT86A+Eqdjj40JgixKOSfQ1Ewh3O3TB3JDGCw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSvWGU6yiYUrejq8xObfxbZBud2eL9fQxl7BmrcgZYNgfehr58jhks+JJphB3HaK7
	 nyz1apUc9P/Q5XvnTaYwg32D4mDLVhXX2DgOXqZLprYAZmyx0JfgWCJty+G/RiGbdS
	 Jd2m42dCirHWxR8nI30q3GiJEBXYpMNYGUgxKn0SMioDoD9453A0dFxCphqNhvE6n5
	 0RdTdbdb2x69x9gE+PqZJSM3mtH78eiLB22HxDUBPvibxEDEaJEqGMEW5Z7DQpz7+N
	 jy+GK1Ctaa5fPC7eXRHVmVDRBNQENuFYCxAoysEjbNfNXP0a7Npgb62iVznhMIIhhd
	 UvekPNAa8XCQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64DF40EE2;
	Sat, 23 May 2026 09:12:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32AB0263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 187CB40EE2
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BKuXM_EOW76 for <buildroot@buildroot.org>;
 Sat, 23 May 2026 09:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCB6540ED1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB6540ED1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCB6540ED1
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:12:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51B2CA4C013E
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:12:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36918)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQiOi-000000001HG-40iW
 for buildroot@buildroot.org; Sat, 23 May 2026 09:11:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 11:11:55 +0200
Message-ID: <20260523091156.112718-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523091156.112718-1-bernd@kuhls.net>
References: <20260523091156.112718-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779527521;
 bh=Kg0x2XNa7upo56JA42PmSFW9778VKPpJgwbnztQupIE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=H0oFELlmXDiFMIzu/w86AeCGDbqu3IJBl0O6WLO2C85wurC4/MU5pZq1noevJaCBw
 USx8YvhsfH2NZVpHl5gMiOdCfGyFEZreDMBdd6zxMgtUP6WOfcS8ZsbBgvOmVTrON1
 BfshFs5F8LBYXYwEh+wTc/X7hqypb9iL4v+t/NfjtjHUDMZS+PypgiNt5+gRmYu3Rr
 kQqaYEI3x5vyRhFGlR0AOoexUsEQCtFkqXiIE9a81j4urLTnp842W+1e1VbpUXCmRO
 e+w34NSCIAYGZ7DhHyjcQxYthwkHfc7Aj7SOAI4PhcL6kMAtbSopxDP3GYTMeaoAsU
 Hzmx5TYIWVrgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=H0oFELlm
Subject: [Buildroot] [PATCH 4/5] package/xml-security-c: remove package
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

https://santuario.apache.org/
"July 2024
 As announced early this year, the C++ library has been officially
 retired. A fork of this code base has been migrated to the Shibboleth
 Project, which has been the sole maintainer for a number of years now.
 See the Shibboleth wiki for notable caveats regarding usage of this
 code."

https://shibboleth.atlassian.net/wiki/spaces/DEV/pages/3726671873/Santuario
"The C++ xml-security-c library has been retired at Apache and is now
 solely maintained by the Shibboleth Project for our use only. Use by
 any other project, while permitted freely under the license, is
 ill-advised and unsupported by the Shibboleth Project. While we
 continue to publish a fork of the code in our repository, and will
 accept bug reports and certainly security reports, we do not promise
 any responsiveness to third parties, and urge that no other projects
 rely on this code. Existing users should seek alternatives or consider
 forking the code for their own use."

The package is unmaintained and will cause build errors with the
upcoming bump of OpenSSL to 4.0.0. No other package depends on it so we
can safely remove it from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  7 ++
 package/Config.in                             |  1 -
 .../0001-fix-build-with-libressl-3.5.0.patch  | 91 -------------------
 package/xml-security-c/Config.in              | 20 ----
 package/xml-security-c/xml-security-c.hash    |  3 -
 package/xml-security-c/xml-security-c.mk      | 18 ----
 7 files changed, 7 insertions(+), 134 deletions(-)
 delete mode 100644 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
 delete mode 100644 package/xml-security-c/Config.in
 delete mode 100644 package/xml-security-c/xml-security-c.hash
 delete mode 100644 package/xml-security-c/xml-security-c.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 822260dad0..34f4d5bdcd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -992,7 +992,6 @@ package/xen/0002-Fix-build-with-64-bits-time_t.patch lib_patch.Upstream
 package/xen/0003-libs-light-fix-tv_sec-printf-format.patch lib_patch.Upstream
 package/xen/0004-libs-light-fix-tv_sec-fprintf-format.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
-package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch lib_patch.Upstream
 package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 5359459cd6..7a9dc41d06 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_XML_SECURITY_C
+	bool "xml-security-c removed"
+	select BR2_LEGACY
+	help
+	  xml-security-c was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_LIBPHIDGET
 	bool "libphidget"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f5e93688a5..23a76bd9b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1913,7 +1913,6 @@ menu "JSON/XML"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
 	source "package/xerces/Config.in"
-	source "package/xml-security-c/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
 	source "package/zix/Config.in"
diff --git a/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch b/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index 1b2591aa36..0000000000
--- a/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 66d1d626cf1405119d89c6fd0fb7e9019bd67f6c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 6 Jun 2022 10:24:58 +0200
-Subject: [PATCH] fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-In file included from ../xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp:36:0,
-                 from enc/OpenSSL/OpenSSLCryptoKeyRSA.cpp:35:
-../xsec/enc/OpenSSL/OpenSSLSupport.hpp:92:20: error: field 'mp_ctx_store' has incomplete type 'EVP_ENCODE_CTX {aka evp_Encode_Ctx_st}'
-     EVP_ENCODE_CTX mp_ctx_store;
-                    ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/e908e59ec5b8e1ac505c44900dcb39527f0ec1d3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://issues.apache.org/jira/browse/SANTUARIO-588]
----
- xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp | 3 ++-
- xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp | 3 ++-
- xsec/enc/OpenSSL/OpenSSLSupport.cpp      | 5 +++--
- xsec/enc/OpenSSL/OpenSSLSupport.hpp      | 3 ++-
- 4 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
-index a8ea9f1d..a9a84e3f 100644
---- a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
-+++ b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
-@@ -48,7 +48,8 @@ XERCES_CPP_NAMESPACE_USE
- //           Construction/Destruction
- // --------------------------------------------------------------------------------
- 
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
- OpenSSLCryptoBase64::OpenSSLCryptoBase64() : mp_ectx(&m_ectx_store), mp_dctx(&m_dctx_store) { }
- OpenSSLCryptoBase64::~OpenSSLCryptoBase64() { }
- #else
-diff --git a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
-index 82aeb0a1..7c947d50 100644
---- a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
-+++ b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
-@@ -205,7 +205,8 @@ private :
-     EVP_ENCODE_CTX *mp_ectx;              // Encode context
-     EVP_ENCODE_CTX *mp_dctx;              // Decode context
- 
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
-     EVP_ENCODE_CTX m_ectx_store;
-     EVP_ENCODE_CTX m_dctx_store;
- #endif 
-diff --git a/xsec/enc/OpenSSL/OpenSSLSupport.cpp b/xsec/enc/OpenSSL/OpenSSLSupport.cpp
-index cf874f82..c4453004 100644
---- a/xsec/enc/OpenSSL/OpenSSLSupport.cpp
-+++ b/xsec/enc/OpenSSL/OpenSSLSupport.cpp
-@@ -273,7 +273,8 @@ int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
- 
- #endif
- 
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+	 ((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
- EvpEncodeCtxRAII::EvpEncodeCtxRAII() : mp_ctx(&mp_ctx_store) { };
- EvpEncodeCtxRAII::~EvpEncodeCtxRAII() { }
- #else
-@@ -289,4 +290,4 @@ EVP_ENCODE_CTX
-     return mp_ctx;
- }
- 
--#endif
-\ No newline at end of file
-+#endif
-diff --git a/xsec/enc/OpenSSL/OpenSSLSupport.hpp b/xsec/enc/OpenSSL/OpenSSLSupport.hpp
-index b5f67f26..09d50899 100644
---- a/xsec/enc/OpenSSL/OpenSSLSupport.hpp
-+++ b/xsec/enc/OpenSSL/OpenSSLSupport.hpp
-@@ -88,7 +88,8 @@ public:
- 
- private:
-     EVP_ENCODE_CTX *mp_ctx;
--#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
-+	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
-     EVP_ENCODE_CTX mp_ctx_store;
- #endif    
- };
--- 
-2.35.1
-
diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
deleted file mode 100644
index c7963be69a..0000000000
--- a/package/xml-security-c/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_XML_SECURITY_C
-	bool "xml-security-c"
-	depends on BR2_INSTALL_LIBSTDCPP # xerces
-	depends on !BR2_STATIC_LIBS # xerces
-	depends on BR2_USE_WCHAR # xerces
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	depends	on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_XERCES
-	help
-	  The xml-security-c library is a C++ implementation of
-	  the XML Digital Signature and Encryption specifications.
-
-	  https://santuario.apache.org/cindex.html
-
-comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xml-security-c/xml-security-c.hash b/package/xml-security-c/xml-security-c.hash
deleted file mode 100644
index f4b7041a63..0000000000
--- a/package/xml-security-c/xml-security-c.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.4.tar.gz.sha256
-sha256  a78da6720f6c2ba14100d2426131e0d33eac5a2dba5cc11bdd04974b7eb89003  xml-security-c-2.0.4.tar.gz
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/xml-security-c/xml-security-c.mk b/package/xml-security-c/xml-security-c.mk
deleted file mode 100644
index fda9af4798..0000000000
--- a/package/xml-security-c/xml-security-c.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# xml-security-c
-#
-################################################################################
-
-XML_SECURITY_C_VERSION = 2.0.4
-XML_SECURITY_C_SITE = http://archive.apache.org/dist/santuario/c-library
-XML_SECURITY_C_LICENSE = Apache-2.0
-XML_SECURITY_C_LICENSE_FILES = LICENSE.txt
-XML_SECURITY_C_DEPENDENCIES = openssl xerces
-XML_SECURITY_C_INSTALL_STAGING = YES
-
-XML_SECURITY_C_CONF_ENV = \
-	xml_cv_func_getcwd_null=yes \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
