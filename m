Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EBAFF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE7A8120D;
	Mon, 27 Apr 2026 20:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jamgrmlxODfw; Mon, 27 Apr 2026 20:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BECF181349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777321989;
	bh=6Ld6NZMRgW57cRvHS84dgHoYciguQrtMGSlskjAIvxg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VeWLc5f5YfDtfaMLkpjjPq7J5xSANGIv9kn0ogeWI1olFdYRfIHDu7cDh+6rB9kSD
	 To17jO37fDu6BFudB5OywLbKYNXtI0x4WERZG2E7D0zcS5SumKQldYaGI/Pp8AymuQ
	 613xgJI1HonIEIJwp6GlEEWbA8HimnH8zxAjgsY1KFCNT42gXFzY8SEx1VPZz3DTlC
	 7jFhn4bq4cmvzd3VVrbpUDG4vBHzi0wqOyGbsO+ps50r4pC3bAqzrD9NQ0OOTQIuFi
	 hQTAyLL2KxsWWW2J4BbUi5Y4lD+T2aXk9etcB7qRSM43oMeihgJYjVsX4NRffvdU9c
	 AT+v7h73bdGUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECF181349;
	Mon, 27 Apr 2026 20:33:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F7992DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CBFA81349
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEv3GsMRsGhx for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B277481345
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B277481345
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B277481345
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:33:04 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id HSdawBD7s4bDkHSdawpQnS; Mon, 27 Apr 2026 22:33:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 27 Apr 2026 22:01:00 +0200
Message-ID: <20260427200100.1413484-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDKgtci5d/5wp37mfLePgLuPCBK00RpZhOkXnjgVRd9a3bOCEY32kAEjDx77fV2l/O5bLXZ98MeoCUOmQMY7sg9cqML3nlAHHblJ+51bKgz/Og7rvPV1
 NX+mxdL7+xJOcG3eg57bpPNyZO/9MoLFT3lLGrkKP2egriQ0bQW0YbsvjdbLyDE2QfyCPVNgYfhxtUtlwXL3Uyc7Wzoa65n94H10MrRolmknOVPlCjhiD+EO
 kQPxHMJ1AMpToKg4ip1c7hj/0lfUN/1sHlqyQxk0gNM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777321982; bh=OaXcssNwe0xtCYCE++fxP1o1kZGyyL0QqMCzbWwl6Ok=;
 h=From:To:Subject:Date:MIME-Version;
 b=PfKRak4XsOHHhlvXN7KkOS2NJFbe1XfqVaQJhbv7mkD8K4/dKiV8Oqx83m1qsZlmo
 RWcT4CfEM3n8qoQJBxniHfTAW+0hStkrXCvDc26haG2mJvFZEST+2EMdOe1smj5YPA
 9qDS/2juQSQFbRV+2sMKCsMWtXCqLXNCVpXgtliDRA06oZ/eNHLba8v5uch3Rd2oQh
 z3ibzkHfo37staAMUFuJwR++g4AxQbSISnmmHCKl2FM+0jYqtAgFvU83UZ8Sfv51F3
 BTKUMRcc9USoa5mKgvlpU9ldwtXtMhYH0HwXZ0s1K4KtptewE0rO0DVC8r1PEn4DIJ
 tyvPGOg+obW/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PfKRak4X
Subject: [Buildroot] [PATCH] package/libblockdev: bump to version 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/storaged-project/libblockdev/blob/3.5.0/NEWS.rst

Reworked local patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-replacement-function-for-strerror_l.patch | 35 +++++++++++++------
 package/libblockdev/libblockdev.hash          |  2 +-
 package/libblockdev/libblockdev.mk            |  2 +-
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index d073e16ac5..dbbe3e5c4a 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,5 +1,5 @@
-From 01883cc14904e55d90955ad7cd9fc55bc18364ac Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+From 3d198be196bdc59ba332b87d8c2959de0b9160d2 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 Date: Sat, 20 Jan 2024 13:29:28 +0100
 Subject: [PATCH] Provide replacement function for strerror_l()
 
@@ -11,18 +11,19 @@ Upstream: N/A since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0 and 3.1]
+[Giulio: ported to version 3.0, 3.1 and 3.5]
 ---
- configure.ac       | 2 ++
- src/utils/module.c | 1 +
- src/utils/utils.h  | 4 ++++
- 3 files changed, 7 insertions(+)
+ configure.ac          | 2 ++
+ src/utils/dev_utils.c | 1 +
+ src/utils/module.c    | 1 +
+ src/utils/utils.h     | 4 ++++
+ 4 files changed, 8 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 02b26e3e..67341134 100644
+index e5d65d8b..507fa854 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
+@@ -123,6 +123,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
                   [LIBBLOCKDEV_SOFT_FAILURE([Header file $ac_header not found.])],
                   [])
  
@@ -31,8 +32,20 @@ index 02b26e3e..67341134 100644
  AC_ARG_WITH([escrow],
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
+diff --git a/src/utils/dev_utils.c b/src/utils/dev_utils.c
+index 89a54b4c..b4be5b44 100644
+--- a/src/utils/dev_utils.c
++++ b/src/utils/dev_utils.c
+@@ -23,6 +23,7 @@
+ #include <errno.h>
+ 
+ #include "dev_utils.h"
++#include "utils.h"
+ 
+ /**
+  * bd_utils_dev_utils_error_quark: (skip)
 diff --git a/src/utils/module.c b/src/utils/module.c
-index 6557c3ab..5893f0ac 100644
+index 11e139f8..c8b124e0 100644
 --- a/src/utils/module.c
 +++ b/src/utils/module.c
 @@ -28,6 +28,7 @@
@@ -59,5 +72,5 @@ index 801a8b6e..b2bdf0d0 100644
   * SECTION: utils
   * @short_description: library providing utility functions used by the blockdev library and its plugins
 -- 
-2.34.1
+2.47.3
 
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index ad0dce77ff..e76e02a756 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  65ef9a37babd44b85b8ff9b273f90f9f7d5f8ff7b0c76a8edb69240325fd83f4  libblockdev-3.4.0.tar.gz
+sha256  bccd30e6b5d11504de60d9889ff6a2a25b07a4ec8f04070f2387e168301b3e3a  libblockdev-3.5.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index b8f5a6cffc..e5cbe45b93 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.4.0
+LIBBLOCKDEV_VERSION = 3.5.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
