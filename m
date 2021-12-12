Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E48EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA80940531;
	Sun, 12 Dec 2021 14:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xl445ONV1XbW; Sun, 12 Dec 2021 14:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9EE840227;
	Sun, 12 Dec 2021 14:13:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E58D1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 225BE8574A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8m0XsE2WYssF for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 093D085754
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 37E9682D86; Sun, 12 Dec 2021 14:06:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:05:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 503eecdb87c6ed874a8856faec8e3397711e4862
X-Git-Newrev: 55c2b3cf1c1946d7911e833edba82fcb60860fed
X-Patchwork-Hint: ignore
Message-Id: <20211212140653.37E9682D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/assimp: needs std::exception_ptr
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

commit: https://git.buildroot.net/buildroot/commit/?id=55c2b3cf1c1946d7911e833edba82fcb60860fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dependency on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 to assure
std::exception_ptr support (the only in-tree assimp dependency
in package/qt5/qt53d is optional already).

Fixes:

  - http://autobuild.buildroot.net/results/0cc9cab2761591af57d6d6744a0dd61b7c60e935

  In file included from .../build/assimp-5.1.0/include/assimp/GenericProperty.h:52:0,
                   from .../build/assimp-5.1.0/code/Common/BaseProcess.h:46,
                   from .../build/assimp-5.1.0/code/Common/BaseProcess.cpp:44:
  .../build/assimp-5.1.0/include/assimp/Importer.hpp:522:11: error: 'exception_ptr' in namespace 'std' does not name a type
       const std::exception_ptr& GetException() const;
             ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/assimp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index c535240efc..833e559a6f 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ASSIMP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LIBZLIB
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
@@ -18,3 +19,6 @@ comment "assimp needs a toolchain w/ C++, wchar"
 
 comment "assimp needs libzlib"
 	depends on !BR2_PACKAGE_LIBZLIB
+
+comment "assimp needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
