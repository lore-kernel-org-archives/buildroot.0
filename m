Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BC3C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:50:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1483C60560
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1483C60560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E352160AAD;
	Thu,  5 Aug 2021 19:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ru3-G5NACrkQ; Thu,  5 Aug 2021 19:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF23060AA6;
	Thu,  5 Aug 2021 19:50:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 105251C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01F4382B24
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLq4_9CBrr_S for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 450DE83B61
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11CCB8378F; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 14:33:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 25d602a6a66bfecf17da0ca5edf589ace95e58db
X-Git-Newrev: 8dfd7a1f903d86584e7942ead1ad79e0185a3391
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.11CCB8378F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zstd: fix dynamic
 build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dfd7a1f903d86584e7942ead1ad79e0185a3391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Dynamic build without threads is broken since bump to version 1.5.0 in
commit aad8bbf58842dd62a4911d2c671ad9598e26b459

Indeed, dynamic library is built with threads support since
https://github.com/facebook/zstd/commit/91465e23b2710de031a762874cafb417f8b7556e

To fix this build failure, add -nomt if needed however libzstd-nomt is a
"special target that builds a library in single-thread mode _and_
without zstdmt_compress.c". For an unknown reason, this target fails to
build and don't create any symlinks so replace libzstd-{mt,nomt} by
lib-{mt,nomt} even if this will have the side effect of building a
shared and a static version of the library.

Move the existing HAVE_THREAD setting in the same condition.

While at it, also replace "libzstd.a libzstd" by "lib"

Fixes:
 - http://autobuild.buildroot.org/results/e609601a0fc91c44d88a12c35b29ce937381462f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: move HAVE_THREAD in the same condition]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zstd/zstd.mk | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 2a876376a2..a0976b0701 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,12 +12,6 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-ZSTD_OPTS += HAVE_THREAD=1
-else
-ZSTD_OPTS += HAVE_THREAD=0
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZSTD_DEPENDENCIES += zlib
 ZSTD_OPTS += HAVE_ZLIB=1
@@ -43,19 +37,24 @@ ifeq ($(BR2_STATIC_LIBS),y)
 ZSTD_BUILD_LIBS = libzstd.a
 ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd
+ZSTD_BUILD_LIBS = lib
 ZSTD_INSTALL_LIBS = install-shared
 else
-ZSTD_BUILD_LIBS = libzstd.a libzstd
+ZSTD_BUILD_LIBS = lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
 # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
-# one. Building a multi-threaded binary with a library (which defaults to
-# single-threaded) gives a runtime error when compressing files.
-# The 'lib' makefile provides specific '%-mt' targets for this purpose.
+# one. Building a multi-threaded binary with a static library (which defaults
+# to single-threaded) gives a runtime error when compressing files.
+# The 'lib' makefile provides specific '%-mt' and '%-nomt' targets for this
+# purpose.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ZSTD_OPTS += HAVE_THREAD=1
 ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+else
+ZSTD_OPTS += HAVE_THREAD=0
+ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
 endif
 
 define ZSTD_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
