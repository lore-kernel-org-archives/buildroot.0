Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2821C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D56D41674;
	Sat, 23 Jul 2022 15:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D56D41674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UY964AGpHGVT; Sat, 23 Jul 2022 15:33:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8A4341665;
	Sat, 23 Jul 2022 15:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A4341665
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 108161BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22A8E61ADA
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A8E61ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYxuEuSIyFPb for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B8166118D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B8166118D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1140F8469F; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d479264b34f209b96b81a627c88851a04fa794dd
X-Git-Newrev: e0ff7f5351d508b07ba478dd9fc7317007c76a60
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.1140F8469F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: disable libsanitizer for
 mips64{el} w/ n32 ABI
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
Content-Type: multipart/mixed; boundary="===============6696243168338883800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6696243168338883800==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e0ff7f5351d508b07ba478dd9fc7317007c76a60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsanitizer has been enabled for mips64{el} in gcc 12 [1] but it
fail to build when n32 ABI is used:

In file included from output/mips64el-buildroot-linux-gnu/sysroot/usr/include/bits/stat.h:25,
                 from output/mips64el-buildroot-linux-gnu/sysroot/usr/include/fcntl.h:78,
                 from ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cpp:55:
output/mips64el-buildroot-linux-gnu/sysroot/usr/include/bits/struct_stat.h:190:8: error: redefinition of ‘struct stat64’
  190 | struct stat64
      |        ^~~~~~

In file included from ../../../../libsanitizer/sanitizer_common/sanitizer_linux.cpp:49:
output/mips64el-buildroot-linux-gnu/sysroot/usr/include/asm/stat.h:52:8: note: previous definition of ‘struct stat64’
   52 | struct stat64 {
      |        ^~~~~~

Disable libsanitizer for mips64 with n32 ABI.

Note: Only glibc toolchains are affected since libsanitizer is
disabled for musl and uClibc-ng toolchains [2].

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/2510178651

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=344e6f9f2abcff9b2bb4b26b693be4a599272f43
[2] https://git.buildroot.net/buildroot/commit/?id=5f4d658d888b539de9a6247ae5b1a0999de5d4ec

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 42484f539b..3719bfb004 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -135,6 +135,13 @@ ifeq ($(BR2_sparc)$(BR2_sparc64),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# libsanitizer is available for mips64{el} since gcc 12 but fail to build
+# with n32 ABI due to struct stat64 definition clash due to mixing
+# kernel and user headers.
+ifeq ($(BR2_mips64)$(BR2_mips64el):$(BR2_MIPS_NABI32),y:y)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 # The logic in libbacktrace/configure.ac to detect if __sync builtins
 # are available assumes they are as soon as target_subdir is not
 # empty, i.e when cross-compiling. However, some platforms do not have

--===============6696243168338883800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6696243168338883800==--
