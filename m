Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEA2C54E71
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386F581EA4;
	Tue, 19 Mar 2024 16:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LQGhdtheb6j; Tue, 19 Mar 2024 16:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C37D81EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C37D81EB7;
	Tue, 19 Mar 2024 16:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB7451BF836
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B551140CA1
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtre_F1Cy-ym for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB51A402D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB51A402D4
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A34CB82D13; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 16:37:48 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d42aea936cef4bcc8340f148c0775a482cc37d19
X-Git-Newrev: bc4f613e976fc74e24db1c30ef4940b3e4b4bc0c
X-Patchwork-Hint: ignore
Message-Id: <20240319163621.A34CB82D13@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/spirv-tools:
 needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc4f613e976fc74e24db1c30ef4940b3e4b4bc0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following static build failure raised since the addition of the
package in commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c:

[ 26%] Linking CXX shared library libSPIRV-Tools-shared.so
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-11/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_init':
__uClibc_main.c:(.text+0x98): undefined reference to `__fini_array_start'

Fixes: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
 - http://autobuild.buildroot.org/results/f953d500830e8124c6e85c57887106f9352cb4c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c39259aa35ff1376910e402e3b7f2449e1e133d3)
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
