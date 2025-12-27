Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810C8E8FDDD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 11:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43DCC607A8;
	Sat, 27 Dec 2025 11:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlDN4mMG1UZ5; Sat, 27 Dec 2025 11:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6730C60783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766835483;
	bh=MTOYbZeAtqHn3NWx3KrDcVevt59MFS4Rn8kKbJcoEG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HcxoVCmzyeEROi81c/j0bfioM4skhxqUqc4cZEp9Z+qRFaxqPhB3yIiaDX9qQX1/J
	 8Pn66xkYTkH2FPwW9XVRXZMqw1DimTL4vzgysxtHrvOUcajQTqRM+gRAqjXMHWvGXB
	 EdCj/pX98KoOG5H0TfTdnP3YdZrP8LSOuXxT4TfrhbtxzSmCa6YCiHL1pXFuPsGAJh
	 cBQQYZ1GB03k6VImG0Wq+J8ysoBhVXfUtsIldnWM17dj4jikKaQVt3SZA2hFQ1KtrM
	 3GJNRBfQqyPiihipttSytvloXYb2zCk5r1GooEZeo7hKJH21XeMQhPv9FpcYLQkeg0
	 2NeX7UxlOtS1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6730C60783;
	Sat, 27 Dec 2025 11:38:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D91B4255
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D734B4060C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKywd_ju6AWu for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E14405FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E14405FF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 11:38:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2A5987717; Sat, 27 Dec 2025 11:37:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 12:36:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa6a81b4d92fb30cc631e9b45b3d0bb8ac3045c4
X-Git-Newrev: 5a8811cadeedb265ac38efed0f79c2ef66151a9e
X-Patchwork-Hint: ignore
Message-Id: <20251227113759.F2A5987717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cppcms: fix build with recent
 versions of ICU
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a8811cadeedb265ac38efed0f79c2ef66151a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 that
bumped package/icu to version 77-1, the build of cppcms with ICU
support enabled fails.

Indeed, ICU now requires C++17, and while cppcms.mk has some logic to
get C++ flags using icu-config, the -std=c++17 gets ultimately
overridden by the built-in -std=c++11 flag encoded in cppcms
CMakeLists.txt.

To fix this, we have submitted a patch upstream that ensures the
CMAKE_CXX_FLAGS passed on the command line take precedence over the
built-in flags defined in cppcms CMakeLists.txt.

Fixes:

  https://autobuild.buildroot.net/results/9c34a08ea02499b28093ad3fa184cee10b2883ac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...txt-allow-flags-passed-on-the-command-lin.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch b/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
new file mode 100644
index 0000000000..a6b9526e88
--- /dev/null
+++ b/package/cppcms/0002-CMakeLists.txt-allow-flags-passed-on-the-command-lin.patch
@@ -0,0 +1,58 @@
+From 58faaa72919076e2c847b595a739469243ac9706 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 16 Dec 2025 16:02:41 +0100
+Subject: [PATCH] CMakeLists.txt: allow flags passed on the command line to win
+ over built-in flags
+
+CMakeLists.txt and booster/CMakeLists.txt define some flags in
+CXX_FLAGS, and then set CMAKE_CXX_FLAGS in a way that causes the flags
+in CXX_FLAGS to override the ones passed (for example on the command
+line through CMAKE_CXX_FLAGS). This prevents the user from overriding
+those compiler flags in CXX_FLAGS.
+
+A specific example is that CXX_FLAGS sets -std=c++11, but with recent
+version of ICU (such as >= 77-1), -std=c++11 is not enough, passing
+-std=c++17 is needed. Unfortunately, it cannot be passed through
+CMAKE_CXX_FLAGS due to the aforementioned problem.
+
+This commit allows to resolve this by ensuring that CMAKE_CXX_FLAGS
+and CMAKE_C_FLAGS win over CXX_FLAGS/C_FLAGS.
+
+Upstream: https://github.com/artyom-beilis/cppcms/pull/107
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt         | 4 ++--
+ booster/CMakeLists.txt | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 826e87f..86693e2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -141,8 +141,8 @@ elseif(MSVC)
+ 	set(C_FLAGS "/W3")
+ endif()
+ 
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_FLAGS}")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_FLAGS}")
++set(CMAKE_CXX_FLAGS "${CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
++set(CMAKE_C_FLAGS "${C_FLAGS} ${CMAKE_C_FLAGS} ")
+ 
+ #############################################################################
+ #
+diff --git a/booster/CMakeLists.txt b/booster/CMakeLists.txt
+index 8f63254..4638f76 100644
+--- a/booster/CMakeLists.txt
++++ b/booster/CMakeLists.txt
+@@ -223,7 +223,7 @@ if(NOT IS_WINDOWS)
+ 	endif()
+ endif()
+ 
+-set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX_FLAGS}")
++set(CMAKE_CXX_FLAGS "${CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
+ 
+ #############################################################################
+ #
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
