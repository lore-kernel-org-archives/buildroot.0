Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E468DC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9AE2817A1;
	Mon,  4 Mar 2024 11:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DCYdqmZm83I; Mon,  4 Mar 2024 11:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42164820BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42164820BC;
	Mon,  4 Mar 2024 11:51:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4041BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A0D540BD5
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtLuWDIHRQoP for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CBA40BC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37CBA40BC7
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:51:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23A3688053; Mon,  4 Mar 2024 11:51:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 12:50:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34d473b5cca2a0e01ba7a60ced275f94a0e40540
X-Git-Newrev: c39259aa35ff1376910e402e3b7f2449e1e133d3
X-Patchwork-Hint: ignore
Message-Id: <20240304115118.23A3688053@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-tools: needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=c39259aa35ff1376910e402e3b7f2449e1e133d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since the addition of the
package in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:

[ 26%] Linking CXX shared library libSPIRV-Tools-shared.so
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_init':
__uClibc_main.c:(.text+0x98): undefined reference to `__fini_array_start'

Fixes: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
 - http://autobuild.buildroot.org/results/f953d500830e8124c6e85c57887106f9352cb4c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spirv-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index fa9b615c56..98b0c46525 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
@@ -9,6 +10,6 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
+comment "spirv-tools needs a toolchain w/ C++, dynamic library, gcc >= 8"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
