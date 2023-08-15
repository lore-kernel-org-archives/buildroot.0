Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E34C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 09:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE27D40BDE;
	Tue, 15 Aug 2023 09:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE27D40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mKdlDH-7JTe; Tue, 15 Aug 2023 09:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 277C740BC0;
	Tue, 15 Aug 2023 09:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 277C740BC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25B6D1BF2FF
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF1CC81E9F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 09:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1CC81E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndmAe6mfOH7p for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 09:22:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C92B81E5C
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 09:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C92B81E5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDE5185CD3; Tue, 15 Aug 2023 09:22:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 11:22:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b026eb1f48fc4deabb927c351e0bca9444f466f
X-Git-Newrev: c61329f4c6b2e7199e585db0340bea3654aed8dd
X-Patchwork-Hint: ignore
Message-Id: <20230815092236.EDE5185CD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: fix build with openssl
 >= 3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c61329f4c6b2e7199e585db0340bea3654aed8dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream:
"Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
flexible with regards to which version of OpenSSL build environment has
to provide"

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060472

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
new file mode 100644
index 0000000000..b876c3385f
--- /dev/null
+++ b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
@@ -0,0 +1,57 @@
+From a0db2b60b9f5c14e9f69c0e06e1a8d35f9fb1b5a Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Tue, 25 Jul 2023 14:39:25 +0200
+Subject: [PATCH] xtest: add -DOPENSSL_API_COMPAT=10100
+
+regression_1000.c uses OpenSSL functions that have been deprecated
+after version 1.1. In particular, building with version 3.0 causes the
+following error (and other similar ones not pasted here):
+
+ optee_test/host/xtest/regression_1000.c: In function 'check_signature':
+ optee_test/host/xtest/regression_1000.c:2735:9: error: 'SHA256_Init' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
+  2735 |         SHA256_Init(&ctx);
+       |         ^~~~~~~~~~~
+
+Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
+flexible with regards to which version of OpenSSL build environment has
+to provide.
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+(cherry picked from commit cf111604c4c32a76be90f29aab25fa9b882c8715)
+Upstream: https://github.com/OP-TEE/optee_test/commit/cf111604c4c32a76be90f29aab25fa9b882c8715
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ host/xtest/CMakeLists.txt | 2 +-
+ host/xtest/Makefile       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
+index 776787b..ae0f4e0 100644
+--- a/host/xtest/CMakeLists.txt
++++ b/host/xtest/CMakeLists.txt
+@@ -12,7 +12,7 @@ endif()
+ 
+ find_package(OpenSSL)
+ if(OPENSSL_FOUND)
+-	add_compile_options(-DOPENSSL_FOUND=1)
++	add_compile_options(-DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100)
+ 	set (OPENSSL_PRIVATE_LINK OpenSSL::Crypto)
+ endif()
+ 
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 8505629..2497850 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -39,7 +39,7 @@ endef
+ # - User/group login tests 1027 and 1028
+ WITH_OPENSSL ?= y
+ ifeq ($(WITH_OPENSSL),y)
+-CFLAGS += -DOPENSSL_FOUND=1
++CFLAGS += -DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100
+ ifneq ($(OPTEE_OPENSSL_EXPORT),)
+ LDFLAGS += -lcrypto
+ CFLAGS += -I$(OPTEE_OPENSSL_EXPORT)
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
