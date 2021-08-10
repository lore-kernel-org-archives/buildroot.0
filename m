Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C85C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 10:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A331960F94
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 10:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A331960F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B5F605EB;
	Tue, 10 Aug 2021 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZX-z-D6dlUr; Tue, 10 Aug 2021 10:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD3D860602;
	Tue, 10 Aug 2021 10:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02CAF1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 10:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1FE1401BA
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 10:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSqYOB0w2cs9 for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 10:22:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp30.i.mail.ru (smtp30.i.mail.ru [94.100.177.90])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F761400EC
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jjoUzI/kcXHMMWc6FoOdqvyXm/OXzQTXq+rJYCFI+SU=; 
 t=1628590949;x=1629196349; 
 b=kKchm/u6inZOZOCqznxMuY0UqUe7rVlftHG0laYqyRI3sumnNB/BQ9i1IE/RSYkdfTmUHYz5Ax311r1oBZDtawNtC0RmO4QEUoJVpK+HMAzRH0Wn/VTr17+HlhGMMWPHDcTOJ0Gq+8at/54DtAb7Fd0Ftqg/jc1XOiV+6qeDxg8=;
Received: by smtp30.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDOtu-0002A8-OG; Tue, 10 Aug 2021 13:22:27 +0300
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 13:24:40 +0300
Message-Id: <20210810102440.829901-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: smtp30.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD9F9A2272A1D086A28553D1D5C4B4124EF182A05F53808504064E6FF920C24332C5C1540BA2A16EBF7CFBBAC94601131A755248FFE1BCBCE38
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79A02CDD1178524C2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B2BC59D094D41B978638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89453A20180C1051C6DC5E5CADF40A3996F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75C266B62551496319FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B60CDF180582EB8FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC112FDFC3C1A25714D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE70BFC8670DAA9A89CEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C9BE88FFEDFA497A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458F0AFF96BAACF4158235E5A14AD4A4A4625E192CAD1D9E79D94463893BF8742D06FD88C369EB6E950
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F8637F680D5D7CE889A4FA2A16FF3C857E59C2B6934AE262D3EE7EAB7254005DCED2465BA557073FD9C1E0A4E2319210D9B64D260DF9561598F01A9E91200F654B0B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34103A2CD2CFC42C67AE5BBE4225A0254B75071D15278D303A072181277AA4617EA30BE7CF335BB8FE1D7E09C32AA3244CAEE497D8AD6F12383BE578B75D2D350930363D8B7DA7DD44729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojGhQhWEp1aB+75Do4xJRkjg==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB249002DA95AD8BE4EB979024F70394749764A2BD06C83A47E3EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: [Buildroot] [PATCH] package/libgeos: bump version to 3.9.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Remove upstream patch.
Add myself to DEVELOPERS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 DEVELOPERS                                    |  1 +
 ...-CMakeLists.txt-add-BUILD_BENCHMARKS.patch | 37 -------------------
 package/libgeos/libgeos.hash                  |  2 +-
 package/libgeos/libgeos.mk                    |  2 +-
 4 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index bb39abefab..04fe6edbc6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1868,6 +1868,7 @@ N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
 N:	Maxim Kochetkov <fido_max@inbox.ru>
+F:	package/libgeos/
 F:	package/libosmium/
 F:	package/osm2pgsql/
 F:	package/postgis/
diff --git a/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch b/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch
deleted file mode 100644
index 94748dcdbd..0000000000
--- a/package/libgeos/0001-CMakeLists.txt-add-BUILD_BENCHMARKS.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 16848d6da27140caf922f71a233f96a508fb061e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Jan 2021 12:38:37 +0100
-Subject: [PATCH] CMakeLists.txt: add BUILD_BENCHMARKS
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libgeos/geos/pull/395]
----
- CMakeLists.txt | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c8b39bac..8ca6b829 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -48,6 +48,7 @@ option(BUILD_SHARED_LIBS "Build GEOS with shared libraries" ON)
- set(CMAKE_CXX_STANDARD 11 CACHE STRING "C++ standard version to use (default is 11)")
- 
- ## GEOS custom variables
-+option(BUILD_BENCHMARKS "Build GEOS benchmarks" ON)
- cmake_dependent_option(GEOS_BUILD_DEVELOPER
-   "Build with compilation flags useful for development" ON
-   "GEOS_BUILD_FROM_GIT" OFF)
-@@ -292,7 +293,9 @@ endif()
- #-----------------------------------------------------------------------------
- # Benchmarks
- #-----------------------------------------------------------------------------
--add_subdirectory(benchmarks)
-+if(BUILD_BENCHMARKS)
-+  add_subdirectory(benchmarks)
-+endif()
- 
- #-----------------------------------------------------------------------------
- # Utils
--- 
-2.29.2
-
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 5b5e44c7c5..3508ba9077 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd8082cf12f45f27630193c78bdb5a3cba847b81e72b20268356c2a4fc065269  geos-3.9.0.tar.bz2
+sha256  7e630507dcac9dc07565d249a26f06a15c9f5b0c52dd29129a0e3d381d7e382a  geos-3.9.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index a355732af8..ab2035c62a 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.9.0
+LIBGEOS_VERSION = 3.9.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
