Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96CBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:12:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9866109F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F9866109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6802F4252A;
	Wed,  4 Aug 2021 01:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVzF6aFvFv2h; Wed,  4 Aug 2021 01:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE1B42516;
	Wed,  4 Aug 2021 01:12:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1F21BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AB68414BC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epZzMJ32sRuY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B70B54044C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0BD058B442; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 22:09:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b9a9ce7119c67de4337b49554aa4a5552992d669
X-Git-Newrev: f7a316e0fbd6261e4a655002aadb6d58bb664e5f
X-Patchwork-Hint: ignore
Message-Id: <20210803211028.0BD058B442@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/optee-client: add
 dependency on headers >= 4.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f7a316e0fbd6261e4a655002aadb6d58bb664e5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since upstream commit 5da4da99e0bb3d694e93046207ae4ce3b5545043, in
3.13.0, OP-TEE client unconditionally uses the MMC_IOC_MULTI_CMD
ioctl(). But this ioctl() was only introduced in kernel 4.3, so
earlier kernels did not have this definition.

This was clearly known when upstream started using this ioctl. From
the upstream commit 5da4da99e0bb3d694e93046207ae4ce3b5545043 commit
log:

    As MMC_IOC_MULTI_CMD is available since linux 4.3, we should be safe to
    use it by default on read / write block operations.

So let's propagate this dependency into Buildroot.

Fixes:

  http://autobuild.buildroot.net/results/bd270a6793df499d5f52959e3de17f8a92d88305/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-benchmark/Config.in | 6 ++++--
 package/optee-client/Config.in    | 6 ++++--
 package/optee-examples/Config.in  | 6 ++++--
 package/optee-test/Config.in      | 5 +++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
index 0257392d3a..2070582fbb 100644
--- a/package/optee-benchmark/Config.in
+++ b/package/optee-benchmark/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_PACKAGE_LIBYAML
 	help
@@ -13,6 +14,7 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 
 	  http://github.com/linaro-swg/optee_benchmark
 
-comment "optee-benchmark needs a toolchain w/ threads, dynamic library"
+comment "optee-benchmark needs a toolchain w/ threads, dynamic library, headers >= 4.3"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index d2fda18df8..2765f49308 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
 	help
 	  Enable the OP-TEE client package that brings non-secure
 	  client application resources for OP-TEE support. OP-TEE
@@ -26,5 +27,6 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 
 endif
 
-comment "optee-client needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "optee-client needs a toolchain w/ threads, dynamic library, headers >= 4.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 859cd6632e..843981a458 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 	depends on BR2_TARGET_OPTEE_OS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -19,6 +20,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 
 	  https://github.com/linaro-swg/optee_examples
 
-comment "optee-examples needs a toolchain w/ threads, dynamic library"
+comment "optee-examples needs a toolchain w/ threads, dynamic library, headers >= 4.3"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index cfcf74939d..cf36d19fab 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPTEE_TEST
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # optee-client
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -24,7 +25,7 @@ config BR2_PACKAGE_OPTEE_TEST
 
 	  http://github.com/OP-TEE/optee_test
 
-comment "optee-test needs a toolchain w/ threads, C++, dynamic library"
+comment "optee-test needs a toolchain w/ threads, C++, dynamic library, headers >= 4.3"
 	depends on BR2_TARGET_OPTEE_OS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
