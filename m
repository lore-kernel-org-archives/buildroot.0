Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E455CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 509C840360;
	Sun, 13 Feb 2022 15:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZkv9Ram_2hZ; Sun, 13 Feb 2022 15:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE18403CF;
	Sun, 13 Feb 2022 15:28:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15B0E1BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C664660B5D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nD4PojFFPgqn for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B2160B7C
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5D88A8295E; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c16618959a1097b1d8bc580a29c2fdd96c96e91d
X-Git-Newrev: ec720d210634b55faf0eb6c060d915b100c5028d
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.5D88A8295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mp4v2: needs gcc >= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec720d210634b55faf0eb6c060d915b100c5028d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TechSmith fork of mp4v2 needs gcc >= 5:
https://github.com/TechSmith/mp4v2/issues/47

As a result, the following build failure is raised since bump to version
5.0.1 in commit df22a9d6b77d9e245dceb7c8fd3f9d80c8917ca0:

In file included from ./include/mp4v2/mp4v2.h:58:0,
                 from ./libplatform/platform_posix.h:37,
                 from ./libplatform/platform.h:24,
                 from libplatform/impl.h:6:
./include/mp4v2/file.h:336:5: warning: identifier 'nullptr' is a keyword in C++11 [-Wc++0x-compat]
     ShouldParseAtomCallback cb = nullptr );
     ^

While a it, drop first patch which is not needed now that mp4v2 depends
on gcc >= 5

Fixes:
 - http://autobuild.buildroot.org/results/178f1266396d44c6659a67d8e68cb99e36d544ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...01-Static-cast-to-unsigned-int-for-cases.patch} |  0
 ...-src-mp4track.cpp-replace-nullptr-by-NULL.patch | 50 ----------------------
 package/mp4v2/Config.in                            |  6 ++-
 3 files changed, 4 insertions(+), 52 deletions(-)

diff --git a/package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
similarity index 100%
rename from package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
rename to package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
diff --git a/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
deleted file mode 100644
index c279b9c56a..0000000000
--- a/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 78cf76b5d661e37e958163c37c0ad95940c09591 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 May 2020 11:42:19 +0200
-Subject: [PATCH] src/mp4track.cpp: replace nullptr by NULL
-
-Commit 15ec11166ba9ee7b77631d0d9234522f656cfd66 added code that uses
-nullptr. nullptr is C++11, it will break the build with gcc < 5.
-
-Semantically, NULL and nullptr are different, so should not be mixed.
-In this situaiton, m_File.FindAtom() indeed does not return nullptr,
-but NULL (on error, that is).
-
-Switch back to comparing against NULL.
-
-Fixes:
- - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/TechSmith/mp4v2/pull/62]
----
- src/mp4track.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/mp4track.cpp b/src/mp4track.cpp
-index 4b8fc9d..42489eb 100644
---- a/src/mp4track.cpp
-+++ b/src/mp4track.cpp
-@@ -908,16 +908,16 @@ File* MP4Track::GetSampleFile( MP4SampleId sampleId )
-        MP4FtypAtom *pFtypAtom = reinterpret_cast<MP4FtypAtom *>( m_File.FindAtom( "ftyp" ) );
- 
-        // MOV spec does not require "ftyp" atom...
--       if ( pFtypAtom == nullptr )
-+       if ( pFtypAtom == NULL )
-        {
--          return nullptr;
-+          return NULL;
-        }
-        else
-        {
-           // ... but most often it is present with a "qt  " value
-           const char *majorBrand = pFtypAtom->majorBrand.GetValue();
-           if ( ::strcmp( pFtypAtom->majorBrand.GetValue(), "qt  " ) == 0 )
--             return nullptr;
-+             return NULL;
-        }
-        throw new Exception( "invalid stsd entry", __FILE__, __LINE__, __FUNCTION__ );
-     }
--- 
-2.26.2
-
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 172d1baabe..00e80cd358 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MP4V2
 	bool "mp4v2"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	help
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
@@ -18,5 +19,6 @@ config BR2_PACKAGE_MP4V2_UTIL
 
 endif
 
-comment "mp4v2 needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "mp4v2 needs a toolchain w/ C++, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
