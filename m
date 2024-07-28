Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23359C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A8580F00;
	Sun, 28 Jul 2024 10:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi5ULeZsQQmm; Sun, 28 Jul 2024 10:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313C881330
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313C881330;
	Sun, 28 Jul 2024 10:26:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF2C41BF94D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC25E40301
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72G317qfRXnT for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9167E402BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9167E402BF
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F22B87540; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 11:58:24 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 2b0c3604a4ce07ad4335ff4b3f6306fc4172d375
X-Git-Newrev: c9089fb964941caf755500d4e8c5ff2eda6b35ca
X-Patchwork-Hint: ignore
Message-Id: <20240728102559.7F22B87540@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/snappy: fix
 compilation error raised by vqtbl1q_u8 instruction
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
Content-Type: multipart/mixed; boundary="===============4307956898876363841=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4307956898876363841==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c9089fb964941caf755500d4e8c5ff2eda6b35ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The package compilation for the raspberrypi3_qt5we_defconfig raises the
following error:

In file included from buildroot/output/build/snappy-1.1.10/snappy.cc:29:
buildroot/output/build/snappy-1.2.1/snappy-internal.h: In function ‘snappy::internal::V128 snappy::internal::V128_Shuffle(V128, V128)’:
buildroot/output/build/snappy-1.2.1/snappy-internal.h:109:10: error: ‘vqtbl1q_u8’ was not declared in this scope; did you mean ‘vtbl1_u8’?
  109 |   return vqtbl1q_u8(input, shuffle_mask);
      |          ^~~~~~~~~~
      |          vtbl1_u8
make[4]: *** [CMakeFiles/snappy.dir/build.make:118: CMakeFiles/snappy.dir/snappy.cc.o] Error 1

The issue was raised by commit b3fb0b5b4b076 ("Enable vector byte
shuffle optimizations on ARM NEON") contained in version 1.1.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 01f35f8875acc98adb670d789b256790e2418be8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tion-error-raised-by-vqtbl1q_u8-instructi.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/snappy/0001-Fix-compilation-error-raised-by-vqtbl1q_u8-instructi.patch b/package/snappy/0001-Fix-compilation-error-raised-by-vqtbl1q_u8-instructi.patch
new file mode 100644
index 0000000000..b10ea7ecdf
--- /dev/null
+++ b/package/snappy/0001-Fix-compilation-error-raised-by-vqtbl1q_u8-instructi.patch
@@ -0,0 +1,52 @@
+From 284d5a6f267d4962b2b88540f218c10740a6c053 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Sat, 8 Jun 2024 18:42:16 +0200
+Subject: [PATCH] Fix compilation error raised by vqtbl1q_u8 instruction
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The compilation in Buildroot for the raspberrypi3_qt5we_defconfig
+configuration:
+
+make raspberrypi3_qt5we_defconfig
+make
+
+raises the following error:
+
+In file included from buildroot/output/build/snappy-1.2.1/snappy.cc:29:
+buildroot/output/build/snappy-1.2.1/snappy-internal.h: In function ‘snappy::internal::V128 snappy::internal::V128_Shuffle(V128, V128)’:
+buildroot/output/build/snappy-1.2.1/snappy-internal.h:109:10: error: ‘vqtbl1q_u8’ was not declared in this scope; did you mean ‘vtbl1_u8’?
+  109 |   return vqtbl1q_u8(input, shuffle_mask);
+      |          ^~~~~~~~~~
+      |          vtbl1_u8
+make[4]: *** [CMakeFiles/snappy.dir/build.make:118: CMakeFiles/snappy.dir/snappy.cc.o] Error 1
+
+As reported by [1], the vqtbl1q_u8 instruction is supported by A64
+architectures. For this reason, the patch enables the use of the
+instruction only for NEON of such architecture.
+
+[1] https://developer.arm.com/architectures/instruction-sets/intrinsics/vqtbl1q_u8
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/google/snappy/pull/185
+---
+ snappy-internal.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/snappy-internal.h b/snappy-internal.h
+index ae78247dbbc9..256d32344d1a 100644
+--- a/snappy-internal.h
++++ b/snappy-internal.h
+@@ -46,7 +46,7 @@
+ #include <arm_neon.h>
+ #endif
+ 
+-#if SNAPPY_HAVE_SSSE3 || SNAPPY_HAVE_NEON
++#if SNAPPY_HAVE_SSSE3 || (SNAPPY_HAVE_NEON && defined(__aarch64__))
+ #define SNAPPY_HAVE_VECTOR_BYTE_SHUFFLE 1
+ #else
+ #define SNAPPY_HAVE_VECTOR_BYTE_SHUFFLE 0
+-- 
+2.43.0
+

--===============4307956898876363841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4307956898876363841==--
