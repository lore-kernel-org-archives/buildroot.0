Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA803C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FA94404A1;
	Wed, 25 Oct 2023 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA94404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWDXaFuNdv2h; Wed, 25 Oct 2023 20:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDCC40499;
	Wed, 25 Oct 2023 20:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDCC40499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE9D51BF356
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8861481F32
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8861481F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ik3rKIaoljEz for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 20:19:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8248E81F15
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 20:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8248E81F15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E3E685ED3; Wed, 25 Oct 2023 20:19:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 22:17:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 359abca84cd212dab176ee97c59d91d97b0d966b
X-Git-Newrev: ed573043b5ae27de6efbe6cf1f24f2561bf48f87
X-Patchwork-Hint: ignore
Message-Id: <20231025201908.6E3E685ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: bump to version 3.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed573043b5ae27de6efbe6cf1f24f2561bf48f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update local patch to add missing strerror_l() to other files.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ovide-replacement-function-for-strerror_l.patch | 80 +++++++++++++++++++---
 package/libblockdev/libblockdev.hash               |  2 +-
 package/libblockdev/libblockdev.mk                 |  2 +-
 3 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index 01e03ac6ec..987d28f82e 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,4 +1,4 @@
-From 425d9ad320746298bd52b74ea3f38ad3c0468ff0 Mon Sep 17 00:00:00 2001
+From 2acf5a8d4858035396ee45d96c824e0481644d36 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 29 Aug 2020 16:04:15 +0200
 Subject: [PATCH] Provide replacement function for strerror_l()
@@ -11,16 +11,19 @@ Upstream status: Not Applicable since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0]
+[Giulio: ported to version 3.0+]
 ---
- configure.ac         | 2 ++
- src/plugins/crypto.c | 7 +++++++
- src/plugins/part.c   | 9 +++++++++
- src/utils/module.c   | 8 +++++++-
- 4 files changed, 25 insertions(+), 1 deletion(-)
+ configure.ac                    | 2 ++
+ src/plugins/crypto.c            | 7 +++++++
+ src/plugins/nvme/nvme-error.c   | 8 ++++++++
+ src/plugins/nvme/nvme-fabrics.c | 8 ++++++++
+ src/plugins/nvme/nvme-op.c      | 8 ++++++++
+ src/plugins/part.c              | 9 +++++++++
+ src/utils/module.c              | 8 +++++++-
+ 7 files changed, 49 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 88fa835a..4fba7b7d 100644
+index 0a8ce4a7..dfbddb39 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
@@ -33,7 +36,7 @@ index 88fa835a..4fba7b7d 100644
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
 diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index 503e1207..5896d211 100644
+index c5f719ca..b2ae3f56 100644
 --- a/src/plugins/crypto.c
 +++ b/src/plugins/crypto.c
 @@ -62,6 +62,13 @@
@@ -50,8 +53,65 @@ index 503e1207..5896d211 100644
  /**
   * SECTION: crypto
   * @short_description: plugin for operations with encrypted devices
+diff --git a/src/plugins/nvme/nvme-error.c b/src/plugins/nvme/nvme-error.c
+index 4bd4d771..618b6aef 100644
+--- a/src/plugins/nvme/nvme-error.c
++++ b/src/plugins/nvme/nvme-error.c
+@@ -34,6 +34,14 @@
+ #include "nvme.h"
+ #include "nvme-private.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++    return strerror(errnum);
++}
++#endif
+ 
+ /**
+  * bd_nvme_error_quark: (skip)
+diff --git a/src/plugins/nvme/nvme-fabrics.c b/src/plugins/nvme/nvme-fabrics.c
+index 1877845f..5fcbeddc 100644
+--- a/src/plugins/nvme/nvme-fabrics.c
++++ b/src/plugins/nvme/nvme-fabrics.c
+@@ -36,6 +36,14 @@
+ #include "nvme.h"
+ #include "nvme-private.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++    return strerror(errnum);
++}
++#endif
+ 
+ /* nvme-cli defaults */
+ #define PATH_NVMF_CONFIG  "/etc/nvme/config.json"
+diff --git a/src/plugins/nvme/nvme-op.c b/src/plugins/nvme/nvme-op.c
+index dbef4f3a..7bafd7a3 100644
+--- a/src/plugins/nvme/nvme-op.c
++++ b/src/plugins/nvme/nvme-op.c
+@@ -35,6 +35,14 @@
+ #include "nvme.h"
+ #include "nvme-private.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++    return strerror(errnum);
++}
++#endif
+ 
+ /**
+  * bd_nvme_device_self_test:
 diff --git a/src/plugins/part.c b/src/plugins/part.c
-index d75bb791..ba34bb93 100644
+index 46d31137..6234e013 100644
 --- a/src/plugins/part.c
 +++ b/src/plugins/part.c
 @@ -26,6 +26,15 @@
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 146f36ceed..5f9a8a7e6c 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0f2872830293f3e222832903d80de4c38e06a9c3ea18915b3263272a72095ea8  libblockdev-3.0.3.tar.gz
+sha256  49841ff92db0ab032931e6f2b5eab63e5969b0ddc14b067b60e46a6eb6c60e47  libblockdev-3.0.4.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index e117a1349c..3bbc221cc5 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.0.3
+LIBBLOCKDEV_VERSION = 3.0.4
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
