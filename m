Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2901C4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 13:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DD260AD7;
	Sat, 19 Nov 2022 13:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98DD260AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5QPyxtYFdwAb; Sat, 19 Nov 2022 13:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C238E60B9D;
	Sat, 19 Nov 2022 13:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C238E60B9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4F01BF2BA
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 13:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4B660AF8
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 13:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4B660AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhNO9-G576-Q for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 13:48:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A280D60BDA
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 13:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A280D60BDA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9022F83CEA; Sat, 19 Nov 2022 13:48:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 14:47:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35c2ee69a51a343f2e5c1f88eeb8c7064922ded4
X-Git-Newrev: e8b5feee87be5157e93665011b3c350f6996dfcc
X-Patchwork-Hint: ignore
Message-Id: <20221119134806.9022F83CEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: fix configure options
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8b5feee87be5157e93665011b3c350f6996dfcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename configure options to avoid the following build failure raised
since bump to version 3.2.5 in commit
ae2807821d897c16141d003f646475fee9e77cba:

./simd-checksum-x86_64.cpp: In function 'uint32_t get_checksum1_cpp(char*, int32_t)':
./simd-checksum-x86_64.cpp:89:52: error: multiversioning needs 'ifunc' which is not supported on this target
   89 | __attribute__ ((target("default"))) MVSTATIC int32 get_checksum1_avx2_64(schar* buf, int32 len, int32 i, uint32* ps1, uint32* ps2) { return i; }
      |                                                    ^~~~~~~~~~~~~~~~~~~~~
./simd-checksum-x86_64.cpp:480:1: error: use of multiversioned function without a default
  480 | }
      | ^
If you can't fix the issue, re-run ./configure with --disable-roll-simd.

Fixes:
 - http://autobuild.buildroot.org/results/069da8e585da2e51bfd4f475cc12b9a134954b08

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 7ff7ca6eef..8c7ad462ac 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -17,12 +17,12 @@ RSYNC_CONF_ENV = rsync_cv_HAVE_C99_VSNPRINTF=yes
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no \
-	--disable-simd \
+	--disable-roll-simd \
 	--disable-openssl \
 	--disable-xxhash \
 	--disable-zstd \
 	--disable-lz4 \
-	--disable-asm
+	--disable-md5-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
