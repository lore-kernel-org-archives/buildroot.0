Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C9C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 079C1400A6;
	Sun,  5 May 2024 13:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOQ5Z0HsJd2N; Sun,  5 May 2024 13:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E19ED400D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E19ED400D0;
	Sun,  5 May 2024 13:38:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBBE1BF31E
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4181540B61
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jEQ5gAYBfWm for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EC6A400A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EC6A400A6
 for <buildroot@buildroot.org>; Sun,  5 May 2024 13:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5865C86669; Sun,  5 May 2024 13:38:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 15:20:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 826e0bc3360ac1daa3581232c52ee47697bfabc6
X-Git-Newrev: 0bdce8023102eb9ea75162cd061af411f29b67b7
X-Patchwork-Hint: ignore
Message-Id: <20240505133852.5865C86669@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glog: needs gcc >= 6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0bdce8023102eb9ea75162cd061af411f29b67b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++14 is mandatory since bump to version 0.7.0 in commit
2e9f161d4a7a68a041860e5855e98bee9d3a1498 and
https://github.com/google/glog/commit/674283420118bb919f83ceb3d9dee31ef43ff3aa
and
https://github.com/google/glog/commit/42a185cd888439d500a35191cd31a605b7c5bd20
resulting in the following build failure with gcc 5:

In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/glog-0.7.0/src/demangle.cc:43:0:
/home/buildroot/autobuild/run/instance-2/output-1/build/glog-0.7.0/src/utilities.h:210:22: error: enclosing class of constexpr non-static member function 'google::glog_internal_namespace_::FileDescriptor::operator bool() const' is not a literal type
   constexpr explicit operator bool() const noexcept {
                      ^

Fixes: 2e9f161d4a7a68a041860e5855e98bee9d3a1498
 - http://autobuild.buildroot.org/results/8d5e105283ead1057545b46726385f4ba4dff29e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glog/Config.in            | 6 ++++--
 package/opencv4-contrib/Config.in | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index bbdd1e2151..85873f02f0 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_GLOG
 	bool "glog"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	help
 	  C++ implementation of the Google logging module
 
 	  https://github.com/google/glog
 
-comment "glog needs a toolchain w/ C++, threads"
+comment "glog needs a toolchain w/ C++, threads, gcc >= 6"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 261d414869..d992c6d1ac 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -251,6 +251,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	bool "sfm"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # glog
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
 	select BR2_PACKAGE_EIGEN
@@ -261,6 +262,9 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	  to perform 3d reconstruction from 2d images. The core of
 	  the module is a light version of Libmv.
 
+comment "sfm needs a toolchain w/ gcc >= 6"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE
 	bool "shape"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
