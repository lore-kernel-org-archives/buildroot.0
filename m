Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A76C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13EFC8305A;
	Mon, 20 Feb 2023 23:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13EFC8305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reXGlA790Jd1; Mon, 20 Feb 2023 23:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332D281FD6;
	Mon, 20 Feb 2023 23:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332D281FD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 845A81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 211E14173E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 211E14173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtLppBscPzkU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EB9B41737
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB9B41737
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F50A86495; Mon, 20 Feb 2023 20:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 20:35:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9103c8f2e94f69d7ef392746aa53bbf2f468a008
X-Git-Newrev: 035f18db042d218777394b868beadc575976a5ac
X-Patchwork-Hint: ignore
Message-Id: <20230220205231.4F50A86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/crun: needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=035f18db042d218777394b868beadc575976a5ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

crun unconditionally uses atomic_bool when libgcrypt is found since
version 1.7.1 and
https://github.com/containers/crun/commit/40f66c0a74b8d918ecc7ae9228dca32a4fd71084
resulting in the following build failure with gcc 4.8 since commit
6987b92da510a8c8b9534a22506850c163d0f035:

src/libcrun/seccomp.c: In function 'calculate_seccomp_checksum':
src/libcrun/seccomp.c:374:3: error: unknown type name 'atomic_bool'
   static atomic_bool initialized = false;
   ^

Fixes:
 - http://autobuild.buildroot.org/results/924806ffd6d83cd6d8226577c3877b0b8ca2722d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/crun/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/crun/Config.in b/package/crun/Config.in
index fa0894e126..45c86f0655 100644
--- a/package/crun/Config.in
+++ b/package/crun/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRUN
 	bool "crun"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_YAJL # libocispec
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_CRUN
 
 	  https://github.com/containers/crun
 
-comment "crun needs a glibc or musl toolchain"
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+comment "crun needs a glibc or musl toolchain, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
