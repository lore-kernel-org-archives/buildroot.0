Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B3C5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 20:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A722241809;
	Wed, 21 Feb 2024 20:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhlLlrW2vFDJ; Wed, 21 Feb 2024 20:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B99254189A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B99254189A;
	Wed, 21 Feb 2024 20:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3A531BF41B
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 229D760E91
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 20:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48KNQww49VZc for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 20:19:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6503160E40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6503160E40
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 20:19:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D2E387A31; Wed, 21 Feb 2024 20:19:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 21:15:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aade5ced5edc40a4ad848cd276813d273d2d04e
X-Git-Newrev: 900bd80e9bfde5f1bb6c2dc746a9149a467f1f09
X-Patchwork-Hint: ignore
Message-Id: <20240221201908.5D2E387A31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: fix arm build
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

commit: https://git.buildroot.net/buildroot/commit/?id=900bd80e9bfde5f1bb6c2dc746a9149a467f1f09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib-ng usage uses CMAKE_C_COMPILER_TARGET which is non-standard and
is not supposed to be used by the CMakeLists.txt machinery of a
particular package.

Indeed, [1] specifies that:

  Some compiler drivers are inherently cross-compilers, such as clang
  and QNX qcc. These compiler drivers support a command-line argument
  to specify the target to cross-compile for.

buildroot is not using clang nor QNX qcc.
[2] also refers to this variable only for clang [3] and QNX [4].

Therefore, zlib-ng's usage of this variable is a bit of a hack, and it's
actually why it works when passed as an argument, because they are in
fact not supposed to use this variable.

So set CMAKE_C_COMPILER_TARGET to BR2_ARCH to fix the following arm
build failure raised since bump to version 2.0.6 in commit
d2249821d3f30202ca2a35ad24918378d9a0a0e8:

-- Detecting C compile features - done
-- Arch not recognized, falling back to cmake arch: 'l'
-- Basearch 'l' not recognized, defaulting to 'x86'.
-- Basearch of 'l' has been detected as: 'x86'

[...]

/home/buildroot/autobuild/instance-0/output-1/build/zlib-ng-2.1.3/arch/x86/x86_features.c:17:12: fatal error: cpuid.h: No such file or directory
   17 | #  include <cpuid.h>
      |            ^~~~~~~~~

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_TARGET.html
[2] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html
[3] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-using-clang
[4] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-qnx

Fixes: d2249821d3f30202ca2a35ad24918378d9a0a0e8
 - http://autobuild.buildroot.org/results/1551aa69be19239a8d8e081f033e4027d679ab8f
 - http://autobuild.buildroot.org/results/075d704c0f11710353bac43478e4501addcd747d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zlib-ng/zlib-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fbb906503a..33e8754c9d 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -13,6 +13,7 @@ ZLIB_NG_PROVIDES = zlib
 
 # Build with zlib compatible API, gzFile support and optimizations on
 ZLIB_NG_CONF_OPTS += \
+	-DCMAKE_C_COMPILER_TARGET=$(BR2_ARCH) \
 	-DWITH_GZFILEOP=1 \
 	-DWITH_OPTIM=1 \
 	-DZLIB_COMPAT=1 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
