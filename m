Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C769C001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D916402A7;
	Thu, 27 Jul 2023 10:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D916402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLprfxvCRo1D; Thu, 27 Jul 2023 10:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37706403CA;
	Thu, 27 Jul 2023 10:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37706403CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5A91BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B5983F6F
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B5983F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJayH9cGCj8x for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:32:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B5CD83F74
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5CD83F74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B3D7836DB; Thu, 27 Jul 2023 10:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 12:32:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8079a2b768e2da6c3c68a46eecf9cdee17eacbb
X-Git-Newrev: 8f0061b666d8429bc8993256f5a1d6c0a01689f3
X-Patchwork-Hint: ignore
Message-Id: <20230727103235.3B3D7836DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f0061b666d8429bc8993256f5a1d6c0a01689f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added fork() with commit
https://github.com/OP-TEE/optee_client/commit/492410dcb78f07677524e1d932c86260180ea72c
in version 3.19.0 which was added to buildroot with commit
917a961d9c77d5f1aaa47206add9b9ff80e74a82.

Fixes:
- version 3.21.0:
  http://autobuild.buildroot.net/results/f81/f819828f11330d928df1a236bc8f83193a8a6315/
- version 3.19.0:
  http://autobuild.buildroot.net/results/e7b/e7b5c6f16083435a2e76bce00de718cf9d8c6a5b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-client/Config.in   | 2 ++
 package/optee-examples/Config.in | 2 ++
 package/optee-test/Config.in     | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 538948b72c..4061164cbb 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
+	depends on BR2_USE_MMU # fork()
 	help
 	  Enable the OP-TEE client package that brings non-secure
 	  client application resources for OP-TEE support. OP-TEE
@@ -48,5 +49,6 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEEACL
 endif
 
 comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 843981a458..eb6ee16502 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
+	depends on BR2_USE_MMU # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -22,5 +23,6 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 
 comment "optee-examples needs a toolchain w/ threads, dynamic library, headers >= 4.3"
 	depends on BR2_TARGET_OPTEE_OS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index cf36d19fab..57a7834c75 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPTEE_TEST
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
+	depends on BR2_USE_MMU # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -27,5 +28,6 @@ config BR2_PACKAGE_OPTEE_TEST
 
 comment "optee-test needs a toolchain w/ threads, C++, dynamic library, headers >= 4.3"
 	depends on BR2_TARGET_OPTEE_OS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
