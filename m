Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AFBC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2554E82F31;
	Wed, 26 Jul 2023 20:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2554E82F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvAN60VOntjf; Wed, 26 Jul 2023 20:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F5E81FA2;
	Wed, 26 Jul 2023 20:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59F5E81FA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37831BF336
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A8FB41D9F
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A8FB41D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lF9q7ZDC_Unx for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:02:47 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CB0F41BB3
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB0F41BB3
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B64BA4C09B1;
 Wed, 26 Jul 2023 22:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38200)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOkia-0003su-0T;
 Wed, 26 Jul 2023 22:02:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 22:02:44 +0200
Message-Id: <20230726200244.1699373-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690401764;
 bh=xozoGV4tfCb7LinoF6o7H6XANydw1r+pwcO3lg0nM1E=;
 h=From:To:Cc:Subject:Date:From;
 b=KxHFWdQp38Ck9k5T97h0mrUSDE41heKyKADx99dz5xtDJjbNac2qyKWaY93ye1FMy
 fLT4rHALz12Ow3lX6oHOUqGTcHQTGH0j8jM5yWSHvAwnoPk6SvKDA2qcK3U1Y2j9Gv
 4ia1jKfM6Vw4XcoSjmylLBejdUjoMQKXm1mRZeAF0FVXKR6PLdArxwvgPLxWlNOlee
 RV+C6ES1vJxL8uBFwppVaVkhDP/7cnpJlsDmSlWdMnG+yIMixX+fsuUDu7BgUlha37
 P5pUoAhRPAE9LxgCEtRacQTXAAZ/sW09ZoSVeZeuTw9Htdq269xs0FL0jOFGI0Y+AT
 gJGX1PULLlFCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KxHFWdQp
Subject: [Buildroot] [PATCH 1/1] package/optee-client: needs MMU
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
Cc: Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
