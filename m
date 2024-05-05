Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8F8C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 11:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5194026E;
	Sun,  5 May 2024 11:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8xCvwGxTLSh; Sun,  5 May 2024 11:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D5A240273
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D5A240273;
	Sun,  5 May 2024 11:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDD221BF36C
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C70064017F
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9uVpjeskOq7 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 11:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E854015E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80E854015E
 for <buildroot@buildroot.org>; Sun,  5 May 2024 11:18:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D36D86639; Sun,  5 May 2024 11:18:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 13:14:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5257789d6f088f1e2a0a8b00e1d21d32d2497ac
X-Git-Newrev: 4eeb69c9835450da8af8f55c776a7774914e2102
X-Patchwork-Hint: ignore
Message-Id: <20240505111834.4D36D86639@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=4eeb69c9835450da8af8f55c776a7774914e2102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/gdal/Config.in       | 6 +++---
 package/libgeotiff/Config.in | 6 +++---
 package/postgis/Config.in    | 6 +++---
 package/proj/Config.in       | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 839a1bd7ea..6ee088ce0c 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GDAL
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG
@@ -25,8 +25,8 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, NPTL, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
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
index 78569d63be..593c0dc1f3 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_PACKAGE_POSTGRESQL_FULL
 	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgeos, proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -17,6 +17,6 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
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
