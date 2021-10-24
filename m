Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D6BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2FB60F12
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C2FB60F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DBB607E6;
	Sun, 24 Oct 2021 13:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0wkZKnEkY85; Sun, 24 Oct 2021 13:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C8960690;
	Sun, 24 Oct 2021 13:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB7F61BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E6D40124
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yVJa6gDeECt for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:59:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1226400B5
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:59:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E89B4885D0; Sun, 24 Oct 2021 13:56:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:58:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 946397f8e43ffa711fd3217e750504224a084dd5
X-Git-Newrev: 1afea0b11b140a6d50aff726f2570702cc984a6e
X-Patchwork-Hint: ignore
Message-Id: <20211024135614.E89B4885D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: fix gtest.pc/gmock.pc
 library names for the debug build
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

commit: https://git.buildroot.net/buildroot/commit/?id=1afea0b11b140a6d50aff726f2570702cc984a6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   - http://autobuild.buildroot.org/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2

  >>> libcamera 40f5fddca7f774944a53f58eeaebc4db79c373d8 Building
  [...]
  [114/123] Linking target src/lc-compliance/lc-compliance
  FAILED: src/lc-compliance/lc-compliance
  [...]
  .../host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lgtest

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fix-gtest.pc-gmock.pc-library-names-for-t.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
new file mode 100644
index 0000000000..c47e8fc8f8
--- /dev/null
+++ b/package/gtest/0001-pkg-config-fix-gtest.pc-gmock.pc-library-names-for-t.patch
@@ -0,0 +1,62 @@
+From cf5a3177159ca832470e7f876cab0a1923fa666f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 22 Oct 2021 20:17:36 +0200
+Subject: [PATCH] pkg-config: fix gtest.pc/gmock.pc library names for the debug
+ build
+
+In case CMAKE_BUILD_TYPE is set to Debug the gtest library is
+name libgtestd.a but the link command returned from gtest.pc is
+'-lgtest' (without the debug d) and so the linking of dependent
+packages fails (see [1] for a buildroot failure example).
+
+Enhance the gtest.pc ang gmock.pc generation to honour the debug 'd'.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2021-October/626382.html
+
+[Upstream: https://github.com/google/googletest/pull/3625]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ googlemock/cmake/gmock.pc.in          | 2 +-
+ googletest/cmake/gtest.pc.in          | 2 +-
+ googletest/cmake/internal_utils.cmake | 3 +++
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/googlemock/cmake/gmock.pc.in b/googlemock/cmake/gmock.pc.in
+index 23c67b5c..0f469857 100644
+--- a/googlemock/cmake/gmock.pc.in
++++ b/googlemock/cmake/gmock.pc.in
+@@ -6,5 +6,5 @@ Description: GoogleMock (without main() function)
+ Version: @PROJECT_VERSION@
+ URL: https://github.com/google/googletest
+ Requires: gtest = @PROJECT_VERSION@
+-Libs: -L${libdir} -lgmock @CMAKE_THREAD_LIBS_INIT@
++Libs: -L${libdir} -lgmock@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
+ Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
+diff --git a/googletest/cmake/gtest.pc.in b/googletest/cmake/gtest.pc.in
+index b4148fae..225bba81 100644
+--- a/googletest/cmake/gtest.pc.in
++++ b/googletest/cmake/gtest.pc.in
+@@ -5,5 +5,5 @@ Name: gtest
+ Description: GoogleTest (without main() function)
+ Version: @PROJECT_VERSION@
+ URL: https://github.com/google/googletest
+-Libs: -L${libdir} -lgtest @CMAKE_THREAD_LIBS_INIT@
++Libs: -L${libdir} -lgtest@DEBUG_POSTFIX@ @CMAKE_THREAD_LIBS_INIT@
+ Cflags: -I${includedir} @GTEST_HAS_PTHREAD_MACRO@
+diff --git a/googletest/cmake/internal_utils.cmake b/googletest/cmake/internal_utils.cmake
+index 58fc9bfb..fd81b825 100644
+--- a/googletest/cmake/internal_utils.cmake
++++ b/googletest/cmake/internal_utils.cmake
+@@ -335,6 +335,9 @@ function(install_project)
+     # Configure and install pkgconfig files.
+     foreach(t ${ARGN})
+       set(configured_pc "${generated_dir}/${t}.pc")
++      if(CMAKE_BUILD_TYPE MATCHES Debug)
++        set(DEBUG_POSTFIX "d")
++      endif()
+       configure_file("${PROJECT_SOURCE_DIR}/cmake/${t}.pc.in"
+         "${configured_pc}" @ONLY)
+       install(FILES "${configured_pc}"
+-- 
+2.33.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
