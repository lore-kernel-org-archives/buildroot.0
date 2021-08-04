Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC8DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:11:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3989660FC4
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3989660FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1252F608A5;
	Wed,  4 Aug 2021 11:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ttyn_V4Wof0k; Wed,  4 Aug 2021 11:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E69660830;
	Wed,  4 Aug 2021 11:11:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE9421BF327
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA7140480
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfL4PTZxNhzJ for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:11:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D248E404F8
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B79DB8B4BC; Wed,  4 Aug 2021 11:11:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 13:04:16 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 44ea3c1fff3b0512ad3d9af89dde672bdc879ed1
X-Git-Newrev: 9eb4f576e7f3494d327b7be08945d2caa21b3c2f
X-Patchwork-Hint: ignore
Message-Id: <20210804111102.B79DB8B4BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/exiv2: fix build
 without SSP
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9eb4f576e7f3494d327b7be08945d2caa21b3c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build without SSP fails since bump to version 0.27.4 in commit
bcace429426ee91aac56f3dcc33b69e22141d384

This is due to the fact that
https://github.com/Exiv2/exiv2/commit/bbe0b70840cf28b7dd8c0b7e9bb1b741aeda2efd
removed the wrong GCC_ prefix from HAS_FSTACK_PROTECTOR_STRONG variable

Fixes:
 - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b18d9d6191c3ca1f74115e6395ff8e9ee1b75b89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-add-BUILD_WITH_STACK_PROTECTOR-option.patch | 52 ++++++++++++++++++++++
 package/exiv2/exiv2.mk                             |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
new file mode 100644
index 0000000000..c82061661b
--- /dev/null
+++ b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
@@ -0,0 +1,52 @@
+From 8651c9f823ace70b6609b10aeef0c0740636b570 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Jul 2021 19:31:25 +0200
+Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
+
+Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
+toolchains that don't support stack-protector:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/9.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: utils.cpp:(.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag[_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag]+0xd0): undefined reference to `__stack_chk_fail'
+
+Indeed, support for -fstack-protector-strong can't be detected through
+check_cxx_compiler_flag as some toolchains need to link with -lssp to
+enable SSP support
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Exiv2/exiv2/pull/1756]
+---
+ CMakeLists.txt            | 1 +
+ cmake/compilerFlags.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9fe8b5f9..aabb3dca 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,6 +52,7 @@ mark_as_advanced(
+     EXIV2_TEAM_USE_SANITIZERS
+ )
+ 
++option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
+ option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
+ option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
+ include(cmake/gcovr.cmake REQUIRED)
+diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
+index c8a85c59..20f6ac53 100644
+--- a/cmake/compilerFlags.cmake
++++ b/cmake/compilerFlags.cmake
+@@ -44,7 +44,7 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
+             if(HAS_FCF_PROTECTION)
+                 add_compile_options(-fcf-protection)
+             endif()
+-            if(HAS_FSTACK_PROTECTOR_STRONG)
++            if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
+                 add_compile_options(-fstack-protector-strong)
+             endif()
+         endif()
+-- 
+2.30.2
+
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 52bf03fc63..33222e6381 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -12,7 +12,9 @@ EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
 EXIV2_CPE_ID_VENDOR = exiv2
 
-EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
+EXIV2_CONF_OPTS += \
+	-DBUILD_WITH_STACK_PROTECTOR=OFF \
+	-DEXIV2_BUILD_SAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
