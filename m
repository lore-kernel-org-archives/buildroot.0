Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB29C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B2C84032;
	Sat,  6 Jan 2024 09:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B2C84032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYqjliY5z-uG; Sat,  6 Jan 2024 09:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6B3283DD6;
	Sat,  6 Jan 2024 09:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6B3283DD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA601BF861
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3B8040493
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3B8040493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id twrwsG9sH_Sl for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99DE3403B3
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99DE3403B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 880E484689; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:52:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ac63a33609fd4fee17874bc9569688c78613e1c
X-Git-Newrev: d1c067e01be4ec60498cc6db263cdd07382a2998
X-Patchwork-Hint: ignore
Message-Id: <20240106095524.880E484689@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: fix build with
 kernel < 4.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1c067e01be4ec60498cc6db263cdd07382a2998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel < 4.16 raised since bump to
version 4.0.0 in commit 8a8fa2006846cd3480741f03372e17fedb811898 and
https://github.com/OP-TEE/optee_client/commit/3ac968ee7c927271e83ea3a4247839649202ab5e:

/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c: In function 'register_local_shm':
/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c:356:44: error: storage size of 'data' isn't known
  356 |         struct tee_ioctl_shm_register_data data;
      |                                            ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/d63eb7c8574366377760f5ab2eaec02f46173975

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tee-supplicant-fix-build-with-kernel-4.16.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch b/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch
new file mode 100644
index 0000000000..fa51bd5d5e
--- /dev/null
+++ b/package/optee-client/0001-tee-supplicant-fix-build-with-kernel-4.16.patch
@@ -0,0 +1,56 @@
+From acc5aec37f5f246ebf185d2129e7630eb80bb388 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Jan 2024 09:47:43 +0100
+Subject: [PATCH] tee-supplicant: fix build with kernel < 4.16
+
+Commit 3ac968ee7c927271e83ea3a4247839649202ab5e moved linux/tee.h from
+libteec/include to libteec/src resulting in the following build failure
+with any kernel < 4.16 (i.e before
+https://github.com/torvalds/linux/commit/033ddf12bcf5326b93bd604f50a7474a434a35f9):
+
+/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c: In function 'register_local_shm':
+/home/buildroot/autobuild/instance-3/output-1/build/optee-client-4.0.0/tee-supplicant/src/tee_supplicant.c:356:44: error: storage size of 'data' isn't known
+  356 |         struct tee_ioctl_shm_register_data data;
+      |                                            ^~~~
+
+To fix this build failure, update CMakeLists.txt and Makefile of
+tee-supplicant to add libteec/src to the include directories.
+
+Fixes: 3ac968ee7c92 ("Makefile, cmake: move teec related headers")
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OP-TEE/optee_client/pull/369
+---
+ tee-supplicant/CMakeLists.txt | 5 ++++-
+ tee-supplicant/Makefile       | 2 +-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
+index 31c6dac5..b44e9e95 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -93,7 +93,10 @@ endif()
+ ################################################################################
+ # Public and private header and library dependencies
+ ################################################################################
+-target_include_directories(${PROJECT_NAME} PRIVATE src)
++target_include_directories(${PROJECT_NAME}
++	PRIVATE src
++	PRIVATE ../libteec/src
++)
+ 
+ target_link_libraries(${PROJECT_NAME}
+ 	PRIVATE teec
+diff --git a/tee-supplicant/Makefile b/tee-supplicant/Makefile
+index 06c4b2e5..c3b32252 100644
+--- a/tee-supplicant/Makefile
++++ b/tee-supplicant/Makefile
+@@ -40,7 +40,7 @@ TEES_OBJ_DIR	:= $(OUT_DIR)
+ TEES_OBJS 	:= $(patsubst %.c,$(TEES_OBJ_DIR)/%.o, $(TEES_SRCS))
+ TEES_INCLUDES 	:= ${CURDIR}/../libteec/include \
+ 		   ${CURDIR}/src \
+-		   ${CURDIR}/../libteec/include \
++		   ${CURDIR}/../libteec/src \
+ 
+ TEES_CFLAGS	:= $(addprefix -I, $(TEES_INCLUDES)) $(CFLAGS) \
+ 		   -DDEBUGLEVEL_$(CFG_TEE_SUPP_LOG_LEVEL) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
