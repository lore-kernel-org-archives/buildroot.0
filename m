Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72555CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 20:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A0AB408F4;
	Mon, 15 Sep 2025 20:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-sqZwKomtzH; Mon, 15 Sep 2025 20:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AECF408AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AECF408AA;
	Mon, 15 Sep 2025 20:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCF2E1F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2CE4408AA
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRcjwwUbFaHZ for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 20:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.199;
 helo=send104.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 606224073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 606224073B
Received: from send104.i.mail.ru (send104.i.mail.ru [89.221.237.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 606224073B
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:07:50 +0000 (UTC)
Received: by exim-smtp-6f8b4bbb5d-cjh9g with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uyFUI-00000000MdR-2SXI; Mon, 15 Sep 2025 23:07:47 +0300
To: buildroot@buildroot.org,
	ju.o@free.fr
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 15 Sep 2025 23:07:42 +0300
Message-ID: <20250915200742.299662-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD91EA9861B4B16FED4F319EA5BCBCAB5BA000DF500160FEFD7182A05F53808504016E29C0AC234F9983DE06ABAFEAF6705EDD9F78014A65A8D706DA6ED840B895BE53309D15BC615AA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EFCED9770EA041F4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2E93DB7949584C9342E070BE324C7D3C4CC4B643524109070BB0A4F435E46E6718B35066C979671628AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C02CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B05EF1B56D39DD5F7389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A50B33F925C2A386155002B1117B3ED696E30877CF6971A28AA13BD6A4B0E00B96823CB91A9FED034534781492E4B8EEAD5C5DFC4BFF39B799F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF507E34D8EA163C36FD10944476E695FF4B8B0DA8AB52066A4254E09AD7072D06C52D74DAEBEB42920D2FD44A22383797263904E188A9CDDECFADA8FA657E621F21AF93C6A9387D445F4332CA8FE04980913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtNWLnEtpnHTKWpq282UPe6w==
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6311621668FB2115AD41554738BD826204FBA1EFEE9DCDFD590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=hHCCvCJbdupwPrKpqZpDGycPCsr9NS2C6b2cM2ERjAk=; t=1757966871; x=1758056871; 
 b=AXy81ijQ6koB1ehZqiuVJy6l2OqU8hbFwv19ygoJWZ78DZGd3swnhDQPGitX/kGZHE79ouhrjZX
 oiqA+qZELM302dWNM7l1BUUPfFTUgoccBIoccJnFstCFf6f8cJhwv51buGSqRyRYZfRCyiYj9toZ8
 Dcc3DTty4qLCoKvggl585kgkOMZcLuohz8jviWqwq/3b233qBrk+YYTqKamY+iI1zqkxs4tHAVMJJ
 bPA6Ak6MkNgsvpyS0wIHPtZB2GVncsVVYa6NDln/IxdL40D4NEoT+uVU7m+tafRWbMfEwHXw9oVJu
 1LYBbFbanzqMZaYNiOoZa/WEd9ZFjfpnt9sQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=AXy81ijQ
X-Mailman-Original-Authentication-Results: exim-smtp-6f8b4bbb5d-cjh9g;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/1] package/libgeos: bump version to 3.14.0
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.14.0

Bump minimal GCC version to 7. (Switched to C++17 as minimum requirement)
https://github.com/libgeos/geos/commit/e142764b77f4b8d0c36ec88406300c5f876743fb

Since commit https://github.com/libgeos/geos/commit/26292ce88077321ced5db5869ea0b11cabaa2d12
libgeos uses fenv.h to catch FPU exceptions. Some libc implementation may
have no fenv support. So add a patch to detect fenv.h availability.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 v2:
    Add fenv patch
---
 ...e-floating-point-exceptions-optional.patch | 70 +++++++++++++++++++
 package/libgeos/Config.in                     |  6 +-
 package/libgeos/libgeos.hash                  |  2 +-
 package/libgeos/libgeos.mk                    |  2 +-
 package/postgis/Config.in                     |  6 +-
 5 files changed, 78 insertions(+), 8 deletions(-)
 create mode 100644 package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch

diff --git a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
new file mode 100644
index 0000000000..7b0760fba7
--- /dev/null
+++ b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
@@ -0,0 +1,70 @@
+From a6bac7bd506988085fa692ff2e12727ae0e9db84 Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <fido_max@inbox.ru>
+Date: Mon, 15 Sep 2025 17:16:08 +0300
+Subject: [PATCH 1/1] geosop: make floating-point exceptions optional
+
+commit 26292ce ("geosop: show most floating-point exceptions in verbose mode")
+add fenv.h dependency. Some libc implementations (uclibc-ng )may have no fenv
+support. So make floating-point exceptions optional and detetct fenv.h at
+configure stage.
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+---
+ CMakeLists.txt         | 7 +++++++
+ util/geosop/GeosOp.cpp | 6 ++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 12411e586..a1e2f0c6e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -558,3 +558,10 @@ if(PROJECT_IS_TOP_LEVEL)
+ 
+   unset(_is_multi_config_generator)
+ endif()  # PROJECT_IS_TOP_LEVEL
++
++include(CheckIncludeFile)
++check_include_file(fenv.h HAVE_FENV_H)
++
++if(HAVE_FENV_H)
++    target_compile_definitions(geos_cxx_flags INTERFACE HAVE_FENV)
++endif()
+diff --git a/util/geosop/GeosOp.cpp b/util/geosop/GeosOp.cpp
+index 2cb17f000..05307cf30 100644
+--- a/util/geosop/GeosOp.cpp
++++ b/util/geosop/GeosOp.cpp
+@@ -26,7 +26,9 @@
+ #include <geos/io/WKBStreamReader.h>
+ #include <geos/io/WKBWriter.h>
+ 
++#if defined(HAVE_FENV)
+ #include <cfenv>
++#endif
+ #include <fstream>
+ #include <iostream>
+ #include <sstream>
+@@ -394,10 +396,13 @@ void GeosOp::run(OpArguments& opArgs) {
+     //------------------------
+ 
+     try {
++#if defined(HAVE_FENV)
+         std::feclearexcept(FE_ALL_EXCEPT); // clear floating-point status flags
++#endif
+ 
+         execute(op, opArgs);
+ 
++#if defined(HAVE_FENV)
+         // Catch everything except for FE_INEXACT, which is usually harmless
+         const int fpexp = std::fetestexcept(FE_ALL_EXCEPT ^ FE_INEXACT);
+         if (args.isVerbose && (fpexp != 0)) {
+@@ -414,6 +419,7 @@ void GeosOp::run(OpArguments& opArgs) {
+                 std::cerr << " FE_UNDERFLOW";
+             std::cerr << std::endl;
+         }
++#endif
+     }
+     catch (std::exception &e) {
+         std::cerr << "Run-time exception: " << e.what() << std::endl;
+-- 
+2.51.0
+
diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 76cbb9bdcd..ff88f7254d 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 7, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index f404b267e2..538933873b 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c  geos-3.13.1.tar.bz2
+sha256  fe85286b1977121894794b36a7464d05049361bedabf972e70d8f9bf1e3ce928  geos-3.14.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 475a54f79f..0de73e2688 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.13.1
+LIBGEOS_VERSION = 3.14.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 593c0dc1f3..a0f64bd76a 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_POSTGIS
 	bool "postgis"
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libgeos
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	select BR2_PACKAGE_LIBGEOS
@@ -17,6 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
