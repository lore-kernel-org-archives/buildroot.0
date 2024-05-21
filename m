Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D42FC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3907740763;
	Tue, 21 May 2024 20:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHgC5STQJS4Z; Tue, 21 May 2024 20:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4632E40758
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4632E40758;
	Tue, 21 May 2024 20:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFEBB1C5524
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7BC5406D7
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lc8KepSwNWjq for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 20:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA3F406D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DA3F406D5
 for <buildroot@buildroot.org>; Tue, 21 May 2024 20:19:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85398874D6; Tue, 21 May 2024 20:19:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 22:16:42 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e26c33a4b9d85deaceb6de22989a21320aef064c
X-Git-Newrev: 222220d06eaf0fada91c5b651bd3b2d43a4cb0fb
X-Patchwork-Hint: ignore
Message-Id: <20240521201906.85398874D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/proj: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=222220d06eaf0fada91c5b651bd3b2d43a4cb0fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

NPTL is mandatory since bump to version 9.3.0 in commit
57aba033e6cc81b95d006227c45a15eb3fc77d07 and
https://github.com/OSGeo/PROJ/commit/ce080251225d16e11e139a5ebe07cf608fe022b2:

/home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp: In member function 'std::shared_ptr<osgeo::proj::io::SQLiteHandle> osgeo::proj::io::SQLiteHandleCache::getHandle(const std::string&, PJ_CONTEXT*)':
/home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp:622:9: error: 'pthread_atfork' was not declared in this scope; did you mean 'pthread_attr_t'?
  622 |         pthread_atfork(nullptr, nullptr,
      |         ^~~~~~~~~~~~~~
      |         pthread_attr_t

Fixes: 57aba033e6cc81b95d006227c45a15eb3fc77d07
 - http://autobuild.buildroot.org/results/392664375c5bc5f047d39bff31534a226e8ea526

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4eeb69c9835450da8af8f55c776a7774914e2102)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdal/Config.in       | 6 +++---
 package/libgeotiff/Config.in | 6 +++---
 package/postgis/Config.in    | 6 +++---
 package/proj/Config.in       | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 24a1f06af2..fe96f4a7d9 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_GDAL
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG
@@ -26,9 +26,9 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, NPTL, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 7ed296fb25..f07c994361 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGEOTIFF
 	bool "libgeotiff"
 	depends on BR2_INSTALL_LIBSTDCPP # proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_TIFF
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBGEOTIFF
 
 	  https://github.com/OSGeo/libgeotiff
 
-comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
+comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 7d42390677..7f85c03007 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
@@ -18,7 +18,7 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9, not binutils bug 27597"
+comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
diff --git a/package/proj/Config.in b/package/proj/Config.in
index 1952fc7d9a..6d172e2ee9 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PROJ
 	bool "proj"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_SQLITE
 	help
@@ -14,7 +14,7 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
-comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
+comment "proj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
