Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2960C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56DAF4012F;
	Tue, 22 Nov 2022 22:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DAF4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amLP7hzwOsoO; Tue, 22 Nov 2022 22:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C35C40528;
	Tue, 22 Nov 2022 22:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C35C40528
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0D001BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67AC94190D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AC94190D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mS9SY9yPM2i for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:56:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 702904191D
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 702904191D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D43F84250; Tue, 22 Nov 2022 22:56:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:54:21 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 472b17451c86deccc0dbbcde28a4923a139a56e5
X-Git-Newrev: b41bb7ce25f57a25c24bc225904d624f68614ba3
X-Patchwork-Hint: ignore
Message-Id: <20221122225606.5D43F84250@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rsync: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=b41bb7ce25f57a25c24bc225904d624f68614ba3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
