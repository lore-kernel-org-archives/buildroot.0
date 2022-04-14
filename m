Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB2C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D0ED83EF7;
	Thu, 14 Apr 2022 19:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYBPhyGmLidN; Thu, 14 Apr 2022 19:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FCA83EB9;
	Thu, 14 Apr 2022 19:34:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0BBD1C1189
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECCB040993
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8aglabJ3P3m for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37E5B40142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E92B583C86; Thu, 14 Apr 2022 19:24:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 21:25:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b149694093a74402b1f41b5a8e16687cd19be05
X-Git-Newrev: ec3ed4da3ab80157cc69f056c60e05febed857ed
X-Patchwork-Hint: ignore
Message-Id: <20220414192443.E92B583C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: drop versioned layout
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec3ed4da3ab80157cc69f056c60e05febed857ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

boost.m4 embedded by cc-tool is not able to find boost libraries when
they are versionned (e.g. libboost_program_options-gcc9-mt-sd-1_78.a):

configure: error: cannot find the flags to link with Boost program_options

azmq and i2pd also have the same issue:

CMake Error at /nvmedata/autobuild/instance-8/output-1/host/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165 (message):
  Could NOT find Boost (missing: Boost_INCLUDE_DIR system date_time thread
  chrono random) (Required is at least version "1.48")

So drop versioned layout option

Fixes:
 - http://autobuild.buildroot.org/results/4ae98aed925fbb1d54023075deda9a864f52cee6
 - http://autobuild.buildroot.org/results/de35ca0156d4b6f465e440ed9a3effd471f657fa
 - http://autobuild.buildroot.org/results/c3d2a066429d5f2889c2232d62e5950eb6a89311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy        | 9 +++++++++
 package/boost/Config.in | 7 -------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 48c5ebb81e..27f19f14e7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2022.05"
+
+config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
+	bool "boost versioned layout removed"
+	select BR2_LEGACY
+	help
+	  Boost versioned layout isn't handled by a number of autotools
+	  and cmake packages (e.g. azmq, cc-tool, i2pd).
+
 comment "Legacy options removed in 2022.02"
 
 config BR2_PACKAGE_LIBCURL_LIBNSS
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 33a5337096..9e96be7878 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -36,19 +36,12 @@ config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
 	  and version, or Boost version. This option is useful if you
 	  build several variants of Boost, using the same compiler.
 
-config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
-	bool "versioned"
-	help
-	  Boost binary names include the Boost version number, name
-	  and version of the compiler and encoded build properties.
-
 endchoice
 
 config BR2_PACKAGE_BOOST_LAYOUT
 	string
 	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
 	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
-	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
