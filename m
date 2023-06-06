Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFD8C7EE43
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 20:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45CB4612BF;
	Tue,  6 Jun 2023 20:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45CB4612BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_HM35T0PhV1; Tue,  6 Jun 2023 20:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7F860C00;
	Tue,  6 Jun 2023 20:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F7F860C00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 958E01BF3EF
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 20:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4874172B
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 20:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4874172B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbYcmIrA2nbp for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 20:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 882A741722
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 20:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882A741722
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76F6F86D15; Tue,  6 Jun 2023 20:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Jun 2023 22:14:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1
X-Git-Newrev: a4fec34ba231b78ea24a6480c31aa45132b40784
X-Patchwork-Hint: ignore
Message-Id: <20230606202724.76F6F86D15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjxl: requires host-cmake >= 3.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4fec34ba231b78ea24a6480c31aa45132b40784
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libjxl requires cmake 3.19 since version v0.7 due to the
new behavior of cmake [1].

-- Configuring done
CMake Error at cmake/FindLCMS2.cmake:40 (add_library):
  INTERFACE_LIBRARY targets may only have whitelisted properties.  The
  property "INCLUDE_DIRECTORIES" is not allowed.
Call Stack (most recent call first):
  third_party/CMakeLists.txt:114 (find_package)

The portability issue has already been reported upstream [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095

[1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
[2] https://github.com/libjxl/libjxl/issues/1425

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjxl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
index da04b89f9b..923560298f 100644
--- a/package/libjxl/Config.in
+++ b/package/libjxl/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBJXL
 	# libjxl fail to link statically due to libatomic issue
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
+	select BR2_HOST_CMAKE_AT_LEAST_3_19
 	select BR2_PACKAGE_BROTLI
 	select BR2_PACKAGE_HIGHWAY
 	select BR2_PACKAGE_LCMS2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
