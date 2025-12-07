Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB473D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4CEB605FF;
	Sun,  7 Dec 2025 14:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNMTb2gCeMQH; Sun,  7 Dec 2025 14:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704C460B95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118858;
	bh=2BSc0Uj9kV5jswSlYOrhsTQiExSdQSdEcNV6IVPNeaU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WkQTspYfWuQX0QYiFSjgOpay8rDNmOYrvqGTyFO9Dbju4lgafbAuDhfTIyetvcWGt
	 Z9yTUO9wcoDct4Zw/ri/RbrAHgUSgPbQDxht+bzHUNXsGcs365/4ZPFHRGDWvulL47
	 eyG3+PxuaA0IIWM/ppzEMmwrzL7OcpRa4V8PPWZuB6egFkkehAH4r0ictf5N6mfis1
	 WIqxE2ICB1ANY6aiUZKdHtGOW82BQnpGv9OIt2Zljbg8HDLwYTVRaKS8e61o1Tqkss
	 bKqnLu39HO4JN0tEAMXTduE1OnnhLZl0lDmKJntZROR68oaF2r5eGSqW75qHhq5Y/u
	 +HrC2ZIwr2ogg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 704C460B95;
	Sun,  7 Dec 2025 14:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1C02CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 869E440692
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvBMMw_WCya6 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13E2A4068F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E2A4068F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13E2A4068F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37DF8A4C0CCD;
 Sun,  7 Dec 2025 15:42:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-0xN8;
 Sun, 07 Dec 2025 14:42:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:34 +0100
Message-ID: <20251207144243.3696572-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118579;
 bh=1WpYaOVcN+rvEOkshuFxTh9RStbLNjptspe7CX3sYsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QrY+Zl759wpRPJ0Hv5aE/IXc5A9+mU0nKZz/MVhp/MkwsuqMkRWu1cg5lHAPIbJ1Q
 FyIDa0/h3DnTD17fZUjaBHkHIuMKtwsJimb4iLxvIefH2gRaFAsqbruzvxUqLflQk8
 pU1I0pmzTnsfL6ClVW6iAqwCqwdrFos+cq51LD5ANj9rmNxn78TUHKn7Aj6HK/RmyF
 Bn8EdO6NusA8KHGrIoAEt7FKYdL/aakKkWSHtGZ6OZ04oZzY+o4nBgw1Iw7B0yyFep
 /jNZHOQQO+e+yDTv+fO8mxp7QC1Fab40MHtktyb8jiuETwwJXsGI5SNBIznfTAZ9ID
 8CKYHzejrD2CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QrY+Zl75
Subject: [Buildroot] [PATCH/next 25/33] package/resiprocate: bump version to
 1.13.2
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/resiprocate/resiprocate/blob/resiprocate-1.13.2/CHANGELOG.md

Switched _SITE to github, the previous URL redirects to github.com.

Removed patches which are included in this release.

License file was renamed and updated:
https://github.com/resiprocate/resiprocate/commits/resiprocate-1.13.2/LICENSE.md

Switch build system to cmake, removed apps-specific option:
- sipdial is built if OpenSSL is enabled:
  https://github.com/resiprocate/resiprocate/blob/resiprocate-1.13.2/apps/CMakeLists.txt#L6
- clicktocall build is broken
  AddressTranslator.cxx: In member function 'void clicktocall::AddressTranslator::
    addTranslation(const resip::Data&, const resip::Data&)':
  AddressTranslator.cxx:55:16: error: assignment of read-only variable 'flags'
     55 |          flags |= std::regex_constants::nosubs;

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              |  7 ++
 ...e-issue-compiling-with-Visual-Studio.patch | 95 -------------------
 ...t-disable-use-of-legacy-OpenSSL-memo.patch | 38 --------
 ...l-fix-typo-in-preprocessor-condition.patch | 25 -----
 ...Security-cxx-remove-deprecated-OpenS.patch | 26 -----
 package/resiprocate/Config.in                 |  9 +-
 package/resiprocate/resiprocate.hash          |  5 +-
 package/resiprocate/resiprocate.mk            | 54 +++++++----
 8 files changed, 43 insertions(+), 216 deletions(-)
 delete mode 100644 package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
 delete mode 100644 package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
 delete mode 100644 package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
 delete mode 100644 package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index b2adbc2277..6a7e149709 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_RESIPROCATE_APPS
+	bool "resiprocate apps support option removed"
+	select BR2_LEGACY
+	help
+	  The build system does not contain an apps-specific option
+	  anymore.
+
 config BR2_PACKAGE_MESA3D_VDPAU
 	bool "mesa3d Gallium VDPAU state tracker support removed"
 	select BR2_LEGACY
diff --git a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
deleted file mode 100644
index 2157ea0450..0000000000
--- a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From be76b10a50749e2e11dce8dcc38b414a7f9d8747 Mon Sep 17 00:00:00 2001
-From: Ben Walden <bwalden@redboxvoice.com>
-Date: Sat, 22 Aug 2020 23:14:11 +0100
-Subject: [PATCH] Fix some issue compiling with Visual Studio 16.7.0 and tidy
- up Visual Studio 16 project files
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747
-[Retrieved (and updated to keep only RendKa.cxx update)]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- VisualStudioReadme.htm                        |   65 +
- contrib/GeoIP/GeoIP_12_0.vcxproj              |  550 -------
- contrib/GeoIP/GeoIP_16_0.vcxproj              |   93 +-
- .../db/build_windows/db_static_12_0.vcxproj   | 1260 -----------------
- .../db/build_windows/db_static_16_0.vcxproj   |  696 +--------
- contrib/db/dbinc/atomic.h                     |    4 +-
- contrib/db/mp/mp_fget.c                       |    4 +-
- contrib/db/mp/mp_mvcc.c                       |    4 +-
- contrib/db/mp/mp_region.c                     |    4 +-
- contrib/db/mutex/mut_method.c                 |    2 +-
- contrib/pcre/pcre_12_0.vcxproj                |  466 ------
- contrib/pcre/pcre_16_0.vcxproj                |  159 +--
- contrib/popt/popt_12_0.vcxproj                |  394 ------
- contrib/popt/popt_16_0.vcxproj                |  120 +-
- reSIProcate_16_0.sln                          |   58 +-
- .../queuetostream_12_0.vcxproj                |  582 --------
- .../queuetostream_16_0.vcxproj                |  207 ++-
- repro/repro_12_0.vcxproj                      |  825 -----------
- repro/repro_12_0.vcxproj.filters              |   47 -
- repro/repro_16_0.vcxproj                      |  159 ++-
- repro/reprocmd/reprocmd_12_0.vcxproj          |  597 --------
- repro/reprocmd/reprocmd_16_0.vcxproj          |  139 +-
- repro/reprolib_12_0.vcxproj                   |  596 --------
- repro/reprolib_12_0.vcxproj.filters           |  136 --
- repro/reprolib_16_0.vcxproj                   |  132 +-
- resip/dum/dum_12_0.vcxproj                    |  615 --------
- resip/dum/dum_16_0.vcxproj                    |  124 +-
- resip/dum/test/basicCall_12_0.vcxproj         |  621 --------
- resip/dum/test/basicCall_16_0.vcxproj         |  145 +-
- resip/dum/test/basicClient_12_0.vcxproj       |  653 ---------
- resip/dum/test/basicClient_16_0.vcxproj       |  158 +--
- resip/dum/test/basicMessage_12_0.vcxproj      |  615 --------
- resip/dum/test/basicMessage_16_0.vcxproj      |  141 +-
- resip/dum/test/basicRegister_12_0.vcxproj     |  615 --------
- resip/dum/test/basicRegister_16_0.vcxproj     |  137 +-
- resip/rend/RendKa.cxx                         |    2 +-
- resip/rend/rend_12_0.vcxproj                  |  352 -----
- resip/rend/rend_16_0.vcxproj                  |   89 +-
- resip/stack/resiprocate_12_0.vcxproj          |  873 ------------
- resip/stack/resiprocate_12_0.vcxproj.filters  |  351 -----
- resip/stack/resiprocate_16_0.vcxproj          |  165 ++-
- resip/stack/test/test_12_0.vcxproj            |  627 --------
- resip/stack/test/test_16_0.vcxproj            |  171 ++-
- rutil/dns/ares/ares_12_0.vcxproj              |  488 -------
- rutil/dns/ares/ares_12_0.vcxproj.filters      |   34 -
- rutil/dns/ares/ares_16_0.vcxproj              |  159 +--
- rutil/rutil_12_0.vcxproj                      |  604 --------
- rutil/rutil_16_0.vcxproj                      |  153 +-
- 48 files changed, 1409 insertions(+), 13782 deletions(-)
- delete mode 100644 contrib/GeoIP/GeoIP_12_0.vcxproj
- delete mode 100644 contrib/db/build_windows/db_static_12_0.vcxproj
- delete mode 100644 contrib/pcre/pcre_12_0.vcxproj
- delete mode 100644 contrib/popt/popt_12_0.vcxproj
- delete mode 100644 repro/accountingconsumers/queuetostream_12_0.vcxproj
- delete mode 100644 repro/repro_12_0.vcxproj
- delete mode 100644 repro/repro_12_0.vcxproj.filters
- delete mode 100644 repro/reprocmd/reprocmd_12_0.vcxproj
- delete mode 100644 repro/reprolib_12_0.vcxproj
- delete mode 100644 repro/reprolib_12_0.vcxproj.filters
- delete mode 100644 resip/dum/dum_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicCall_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicClient_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicMessage_12_0.vcxproj
- delete mode 100644 resip/dum/test/basicRegister_12_0.vcxproj
- delete mode 100644 resip/rend/rend_12_0.vcxproj
- delete mode 100644 resip/stack/resiprocate_12_0.vcxproj
- delete mode 100644 resip/stack/resiprocate_12_0.vcxproj.filters
- delete mode 100644 resip/stack/test/test_12_0.vcxproj
- delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj
- delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj.filters
- delete mode 100644 rutil/rutil_12_0.vcxproj
-
-diff --git a/resip/rend/RendKa.cxx b/resip/rend/RendKa.cxx
-index 8645f17636..8321ada1ee 100644
---- a/resip/rend/RendKa.cxx
-+++ b/resip/rend/RendKa.cxx
-@@ -66,7 +66,7 @@ bool operator<(const RendKaAssoc& a, const RendKaAssoc& b)
- 
- struct RendKaConn 
- {
--   bool operator() (const RendKaAssocPtr& a, const RendKaAssocPtr& b) 
-+   bool operator()(const RendKaAssocPtr& a, const RendKaAssocPtr& b) const
-    {
-       return *a < *b;
-    }
diff --git a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch b/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
deleted file mode 100644
index c333df849d..0000000000
--- a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a Mon Sep 17 00:00:00 2001
-From: Daniel Pocock <daniel@pocock.pro>
-Date: Thu, 4 Aug 2022 10:55:30 +0200
-Subject: [PATCH] rutil: OpenSSLInit: disable use of legacy OpenSSL memory leak
- checking with OpenSSL 3.0 and later
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- rutil/ssl/OpenSSLInit.cxx | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/rutil/ssl/OpenSSLInit.cxx b/rutil/ssl/OpenSSLInit.cxx
-index d42486f96b..65afed09fe 100644
---- a/rutil/ssl/OpenSSLInit.cxx
-+++ b/rutil/ssl/OpenSSLInit.cxx
-@@ -69,14 +69,19 @@ OpenSSLInit::OpenSSLInit()
- 	CRYPTO_set_dynlock_lock_callback(::resip_OpenSSLInit_dynLockFunction);
- #endif
- 
-+/* The OpenSSL memory leak checking has been deprecated since
-+   OpenSSL v3.0.  OpenSSL developers recommend that we rely
-+   on modern compilers to provide the same functionality. */
- #if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	CRYPTO_malloc_debug_init();
- 	CRYPTO_set_mem_debug_options(V_CRYPTO_MDEBUG_ALL);
--#else
-+#elsif (OPENSSL_VERSION_NUMBER < 0x30000000L)
- 	CRYPTO_set_mem_debug(1);
- #endif
- 
-+#if (OPENSSL_VERSION_NUMBER < 0x30000000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_ON);
-+#endif
- 
- 	SSL_library_init();
- 	SSL_load_error_strings();
diff --git a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch b/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
deleted file mode 100644
index 5cbe5871d0..0000000000
--- a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 53302195c339dfaa104788a50aa900a48dbff777 Mon Sep 17 00:00:00 2001
-From: Andrey Semashev <andrey.semashev@gmail.com>
-Date: Sat, 10 Sep 2022 12:15:06 +0200
-Subject: [PATCH] rutil: fix typo in preprocessor condition
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/53302195c339dfaa104788a50aa900a48dbff777
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- rutil/ssl/OpenSSLInit.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rutil/ssl/OpenSSLInit.cxx b/rutil/ssl/OpenSSLInit.cxx
-index 65afed09fe..0d87a9f9d8 100644
---- a/rutil/ssl/OpenSSLInit.cxx
-+++ b/rutil/ssl/OpenSSLInit.cxx
-@@ -75,7 +75,7 @@ OpenSSLInit::OpenSSLInit()
- #if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
- 	CRYPTO_malloc_debug_init();
- 	CRYPTO_set_mem_debug_options(V_CRYPTO_MDEBUG_ALL);
--#elsif (OPENSSL_VERSION_NUMBER < 0x30000000L)
-+#elif (OPENSSL_VERSION_NUMBER < 0x30000000L)
- 	CRYPTO_set_mem_debug(1);
- #endif
- 
diff --git a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch b/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
deleted file mode 100644
index 2b595d64c1..0000000000
--- a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 88f98702d908549d888aa7f0ee1b0763e09662b1 Mon Sep 17 00:00:00 2001
-From: Daniel Pocock <daniel@pocock.pro>
-Date: Thu, 4 Aug 2022 11:09:43 +0200
-Subject: [PATCH] resip/stack: ssl/Security.cxx: remove deprecated OpenSSL
- ERR_GET_FUNC, not required
-
-Upstream: https://github.com/resiprocate/resiprocate/commit/88f98702d908549d888aa7f0ee1b0763e09662b1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- resip/stack/ssl/Security.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/resip/stack/ssl/Security.cxx b/resip/stack/ssl/Security.cxx
-index 75dc6d838a..23c2ebbf09 100644
---- a/resip/stack/ssl/Security.cxx
-+++ b/resip/stack/ssl/Security.cxx
-@@ -967,7 +967,7 @@ BaseSecurity::addPrivateKeyPEM( PEMType type,
-          char buffer[120];
-          unsigned long err = ERR_get_error();
-          ERR_error_string(err, buffer);
--         if(ERR_GET_LIB(err) == ERR_LIB_EVP && ERR_GET_FUNC(err) == EVP_F_EVP_DECRYPTFINAL_EX && ERR_GET_REASON(err) == EVP_R_BAD_DECRYPT)
-+         if(ERR_GET_LIB(err) == ERR_LIB_EVP && ERR_GET_REASON(err) == EVP_R_BAD_DECRYPT)
-          {
-             ErrLog(<< "Could not read private key (error=" << buffer << ") - likely incorrect password provided, may load correctly when transports are added with appropriate password");
-          }
diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index 7561b7c86c..ba68ad8e59 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_RESIPROCATE
 	  parsing) and libdum (SIP Dialog Usage Manager, a state
 	  machine for SIP dialogs).
 
-	  https://www.resiprocate.org/
+	  https://github.com/resiprocate/resiprocate
 
 if BR2_PACKAGE_RESIPROCATE
 
@@ -40,11 +40,4 @@ config BR2_PACKAGE_RESIPROCATE_REND
 	  Rend is tool that is was created specifically to load test
 	  gtSIP based presence servers.
 
-config BR2_PACKAGE_RESIPROCATE_APPS
-	bool "resiprocate-apps"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PCRE
-	help
-	  Build apps clicktocall and sipdial
-
 endif # BR2_PACKAGE_RESIPROCATE
diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 03336c64a2..93a7131141 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,4 +1,3 @@
-# http://list.resiprocate.org/pipermail/resiprocate-announce/2020-May/000000.html
-sha256  046826503d3c8682ae0e42101b28f903c5f988235f1ff4a98dbfb9066d0d3d49  resiprocate-1.12.0.tar.gz
 # Locally Computed
-sha256  16b0fd1938a10fcd145904cc2dad74500fef9d27fc15b44cf8e8f92011f94d35  COPYING
+sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index 58b942465c..ab8299302a 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,45 +4,57 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.12.0
-RESIPROCATE_SITE = https://www.resiprocate.org/files/pub/reSIProcate/releases
-# For complete details see https://www.resiprocate.org/License
+RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
-RESIPROCATE_LICENSE_FILES = COPYING
+RESIPROCATE_LICENSE_FILES = LICENSE.md
 RESIPROCATE_CPE_ID_VENDOR = resiprocate
 RESIPROCATE_INSTALL_STAGING = YES
 
-# Utilize c-ares from buildroot instead built in ARES library
-# NOTE: resiprocate doesn't support --without-<feature> syntax as it will try
-#       to build with package if specified
+RESIPROCATE_CONF_OPTS = -DWITH_C_ARES=ON
 RESIPROCATE_DEPENDENCIES = c-ares
-RESIPROCATE_CONF_OPTS = -with-c-ares \
-	--with-sysroot="$(STAGING_DIR)"
+
+RESIPROCATE_CONF_OPTS += \
+	-DBUILD_QPID_PROTON=OFF \
+	-DBUILD_RECON=OFF \
+	-DBUILD_REFLOW=OFF \
+	-DBUILD_REPRO=OFF \
+	-DBUILD_RETURN=OFF \
+	-DBUILD_TFM=OFF \
+	-DHAVE_CLOCK_GETTIME_MONOTONIC_EXITCODE=0
+
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+RESIPROCATE_CONF_OPTS += -DUSE_MAXMIND_GEOIP=ON
+RESIPROCATE_DEPENDENCIES += geoip
+else
+RESIPROCATE_CONF_OPTS += -DUSE_MAXMIND_GEOIP=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RESIPROCATE_CONF_OPTS += -DWITH_SSL=ON
 RESIPROCATE_DEPENDENCIES += openssl host-pkgconf
-RESIPROCATE_CONF_OPTS += --with-ssl
-# Configure.ac does not include '-lz' when statically linking against openssl
-RESIPROCATE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+else
+RESIPROCATE_CONF_OPTS += -DWITH_SSL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_POPT),y)
-RESIPROCATE_CONF_OPTS += --with-popt
+RESIPROCATE_CONF_OPTS += -DUSE_POPT=ON
 RESIPROCATE_DEPENDENCIES += popt
+else
+RESIPROCATE_CONF_OPTS += -DUSE_POPT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT),y)
-RESIPROCATE_CONF_OPTS += --with-dtls
+RESIPROCATE_CONF_OPTS += -DUSE_DTLS=ON
+else
+RESIPROCATE_CONF_OPTS += -DUSE_DTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_RESIPROCATE_REND),y)
-RESIPROCATE_CONF_OPTS += --with-rend
+RESIPROCATE_CONF_OPTS += -DBUILD_REND=ON
 RESIPROCATE_DEPENDENCIES += boost
+else
+RESIPROCATE_CONF_OPTS += -DBUILD_REND=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_RESIPROCATE_APPS),y)
-RESIPROCATE_CONF_OPTS += --with-apps
-RESIPROCATE_DEPENDENCIES += pcre
-endif
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
