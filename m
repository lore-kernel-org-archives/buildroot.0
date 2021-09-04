Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FF1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:18:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B7C60F3A
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02B7C60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3194023D;
	Sat,  4 Sep 2021 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEnuhYduDRcU; Sat,  4 Sep 2021 20:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0819B40220;
	Sat,  4 Sep 2021 20:18:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03C2E1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00C4340364
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e94RZ_P0nzw for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E51640356
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD32188442; Sat,  4 Sep 2021 20:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 21:55:21 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fdfd8f0fe9a6dd43aaf0cef4d9d687d1d52fa434
X-Git-Newrev: 527018a3f10e7364ac1b66b87caa24b263931d8f
X-Patchwork-Hint: ignore
Message-Id: <20210904201606.BD32188442@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ogre: fix build
 on musl
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=527018a3f10e7364ac1b66b87caa24b263931d8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure on musl raised since the addition of the
package in commit eb91fa730c5d92202c38514345e86315e138944c:

/tmp/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp: In static member function 'static bool Ogre::StringConverter::parse(const String&, Ogre::int32&)':
/tmp/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:253:22: error: 'strtol_l' was not declared in this scope; did you mean 'strtold_l'?
  253 |         ret = (int32)strtol_l(val.c_str(), &end, 0, _numLocale);
      |                      ^~~~~~~~
      |                      strtold_l

Fixes:
 - http://autobuild.buildroot.org/results/491f89e45610a7752c0700ac02b80a92b7876ec3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84333281cd923308781fd40887c94cd33386b12a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../ogre/0002-Checks-for-strtol_l-function.patch   | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/ogre/0002-Checks-for-strtol_l-function.patch b/package/ogre/0002-Checks-for-strtol_l-function.patch
new file mode 100644
index 0000000000..540530ee9e
--- /dev/null
+++ b/package/ogre/0002-Checks-for-strtol_l-function.patch
@@ -0,0 +1,71 @@
+From 3f182b7e743662ec3fa63e1c7f213171d99485ba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Feb 2020 21:45:58 +0100
+Subject: [PATCH] Checks for strtol_l function
+
+strtol_l (and strtoul_l, strtoll_l, strtoull_l) are not always available
+(for example on musl) so check for strtol_l and reuse android fallback if
+needed to avoid the following build failure:
+
+/home/buildroot/autobuild/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp: In static member function 'static bool Ogre::StringConverter::parse(const String&, Ogre::int32&)':
+/home/buildroot/autobuild/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:253:22: error: 'strtol_l' was not declared in this scope
+         ret = (int32)strtol_l(val.c_str(), &end, 0, _numLocale);
+                      ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/107cffe41081ce46441dec8699d6ad0f152bc152
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OGRECave/ogre/commit/3f182b7e743662ec3fa63e1c7f213171d99485ba]
+---
+ CMake/ConfigureBuild.cmake             | 7 +++++++
+ CMake/Templates/OgreBuildSettings.h.in | 2 ++
+ OgreMain/include/OgreString.h          | 3 +++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/CMake/ConfigureBuild.cmake b/CMake/ConfigureBuild.cmake
+index ab049a525ae..73606c997c1 100644
+--- a/CMake/ConfigureBuild.cmake
++++ b/CMake/ConfigureBuild.cmake
+@@ -133,6 +133,13 @@ if(SDL2_FOUND OR EMSCRIPTEN)
+     set(OGRE_BITES_HAVE_SDL 1)
+ endif()
+ 
++# determine if strtol_l is supported
++include(CheckFunctionExists)
++CHECK_FUNCTION_EXISTS(strtol_l HAVE_STRTOL_L)
++if (NOT HAVE_STRTOL_L)
++  set(OGRE_NO_LOCALE_STRCONVERT 1)
++endif ()
++
+ # generate OgreBuildSettings.h
+ configure_file(${OGRE_TEMPLATES_DIR}/OgreComponents.h.in ${PROJECT_BINARY_DIR}/include/OgreComponents.h @ONLY)
+ configure_file(${OGRE_TEMPLATES_DIR}/OgreBuildSettings.h.in ${PROJECT_BINARY_DIR}/include/OgreBuildSettings.h @ONLY)
+diff --git a/CMake/Templates/OgreBuildSettings.h.in b/CMake/Templates/OgreBuildSettings.h.in
+index a491d09624c..95eb1b71d64 100644
+--- a/CMake/Templates/OgreBuildSettings.h.in
++++ b/CMake/Templates/OgreBuildSettings.h.in
+@@ -107,4 +107,6 @@ WARNING: Disabling this will make the samples unusable.
+ 
+ #cmakedefine01 OGRE_NO_QUAD_BUFFER_STEREO
+ 
++#cmakedefine01 OGRE_NO_LOCALE_STRCONVERT
++
+ #endif
+diff --git a/OgreMain/include/OgreString.h b/OgreMain/include/OgreString.h
+index a81c220012e..1f544195dee 100644
+--- a/OgreMain/include/OgreString.h
++++ b/OgreMain/include/OgreString.h
+@@ -46,8 +46,11 @@ THE SOFTWARE.
+ #   define strnicmp strncasecmp
+ #endif
+ 
++#if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID || OGRE_PLATFORM == OGRE_PLATFORM_EMSCRIPTEN || \
++	(OGRE_PLATFORM == OGRE_PLATFORM_LINUX && OGRE_NO_LOCALE_STRCONVERT == 1)
+ #if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID || OGRE_PLATFORM == OGRE_PLATFORM_EMSCRIPTEN
+ #   define locale_t int
++#endif
+ #   define strtod_l(ptr, end, l) strtod(ptr, end)
+ #   define strtoul_l(ptr, end, base, l) strtoul(ptr, end, base)
+ #   define strtol_l(ptr, end, base, l) strtol(ptr, end, base)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
