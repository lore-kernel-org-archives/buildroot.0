Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A788C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB834092A;
	Sat, 23 Jul 2022 15:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB834092A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFoWiVXVT9MW; Sat, 23 Jul 2022 15:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CA0040362;
	Sat, 23 Jul 2022 15:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA0040362
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44DED1BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2104484BDD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2104484BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8mJ07fO9sog for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AD8984BDC
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD8984BDC
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1E6D4846A0; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ff7f5351d508b07ba478dd9fc7317007c76a60
X-Git-Newrev: 4011ff535e28e5641074380acffff3378a460dac
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.1E6D4846A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: disable libsanitizer for
 mips{el} and gcc > 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=4011ff535e28e5641074380acffff3378a460dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since [1], gcc contains a workaround for struct_kernel_stat_sz
definition and apply a local patch when updating libsanitizer with
upstream (llvm-project) [2].

Since gcc 12, the workaround is not enough and trigger the following
error:

In file included from ../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_linux.cpp:21:
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_linux.cpp:75:38: error: static assertion failed
   75 | COMPILER_CHECK(struct_kernel_stat_sz == sizeof(struct stat));
      |                ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~

Disable libsanitizer for now.

Note: Only glibc toolchains are affected since libsanitizer is
disabled for musl and uClibc-ng	toolchains [3].

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/2510178606

[1] http://gcc.gnu.org/ml/gcc/2018-03/msg00133.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9f943b2446f2d0a345bbf9b4be3d3a4316372270
[3] https://git.buildroot.net/buildroot/commit/?id=5f4d658d888b539de9a6247ae5b1a0999de5d4ec

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3719bfb004..114e774503 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -142,6 +142,12 @@ ifeq ($(BR2_mips64)$(BR2_mips64el):$(BR2_MIPS_NABI32),y:y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# libsanitizer bundled in gcc 12 fails to build for mips32 due to
+# mixing kernel and user struct stat.
+ifeq ($(BR2_mips)$(BR2_mipsel):$(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y:y)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # The logic in libbacktrace/configure.ac to detect if __sync builtins
 # are available assumes they are as soon as target_subdir is not
 # empty, i.e when cross-compiling. However, some platforms do not have
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
