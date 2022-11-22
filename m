Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C131C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D866102D;
	Tue, 22 Nov 2022 22:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D866102D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvjF3iUfeKkS; Tue, 22 Nov 2022 22:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C5C61011;
	Tue, 22 Nov 2022 22:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C5C61011
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 319471BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AB484191F
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB484191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpKJ58Jvz2FX for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:56:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07ABA4190D
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07ABA4190D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7C2A84250; Tue, 22 Nov 2022 22:56:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:53:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7464a54bd1c809b2f78b6da9240cd318252b49f8
X-Git-Newrev: c2b0d606e54a1860a333f364340de6a3ef8b9f5d
X-Patchwork-Hint: ignore
Message-Id: <20221122225605.E7C2A84250@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsync: fix
 configure options
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2b0d606e54a1860a333f364340de6a3ef8b9f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit e8b5feee87be5157e93665011b3c350f6996dfcc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 0d311aa167..9dd66aeb8c 100644
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
