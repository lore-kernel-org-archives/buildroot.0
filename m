Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A106C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158D4615D1;
	Wed, 29 Nov 2023 21:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 158D4615D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGW6fhWh7ROT; Wed, 29 Nov 2023 21:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39FCF615CC;
	Wed, 29 Nov 2023 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39FCF615CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4921BF969
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52AD582099
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52AD582099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVDPt-a3BXow for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:30:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67BEC82068
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BEC82068
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4848287589; Wed, 29 Nov 2023 21:30:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 22:26:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02e80e06c54af2863b622f1ecaa076656f1c16cf
X-Git-Newrev: cb924944051be8f121feff2f510d04d135e0f4aa
X-Patchwork-Hint: ignore
Message-Id: <20231129213008.4848287589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgdiplus: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb924944051be8f121feff2f510d04d135e0f4aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately, libgdiplus unconditionally calls AC_PROG_CXX since
version 6.1 for google-based tests resulting in the following build
failure without C++ since commit
5b6dd17b864cfb9133d3e2d78b9a15fed877b15b and
https://github.com/mono/libgdiplus/commit/4f9802230653ffe810ed2e535a572e42821fdf2d:

checking whether the C++ compiler works... no
configure: error: in `/home/thomas/autobuild/instance-3/output-1/build/libgdiplus-6.1':
configure: error: C++ compiler cannot create executables

Fixes:
 - http://autobuild.buildroot.org/results/3757921a2160ca209089a0b47414a445cc42e35e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgdiplus/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index 6ddf44fd0c..d26a997d46 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGDIPLUS
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_CAIRO
@@ -13,7 +14,8 @@ config BR2_PACKAGE_LIBGDIPLUS
 
 	  https://github.com/mono/libgdiplus
 
-comment "libgdiplus needs a toolchain w/ wchar, threads"
+comment "libgdiplus needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
