Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03287C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F5D406C0;
	Mon, 12 Aug 2024 13:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_TjpdT6Uqbb; Mon, 12 Aug 2024 13:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7B440984
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7B440984;
	Mon, 12 Aug 2024 13:04:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B686C1BF311
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB6D40645
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tkf0Z4XN9Zux for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E49040602
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E49040602
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:04:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B410851A7; Mon, 12 Aug 2024 13:04:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 15:01:26 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ed225a095050900bfdf0ed3dc1a74d9d83da5577
X-Git-Newrev: 22f476b997497dced9759085e85f0208c33f3556
X-Patchwork-Hint: ignore
Message-Id: <20240812130448.4B410851A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/directfb: enable
 on riscv32 again
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

commit: https://git.buildroot.net/buildroot/commit/?id=22f476b997497dced9759085e85f0208c33f3556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Newer 32bit architectures like RISCV32 and ARC are using 64bit time_t
from the get go unlike other 32bit architectures, therefore aliasing
__NR_futex to __NR_futex_time64 avoids the build error mentioned
in cb6fd050.

Fixes:
 - http://autobuild.buildroot.org/results/c0f4168575fa85af933539441eea95a3b10dac91

Signed-off-by: Steffen Persvold <spersvold@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4ae4122936306952109865006d055a112a111f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...efine-__NR_futex-on-32bit-architectures-u.patch | 43 ++++++++++++++++++++++
 package/directfb/Config.in                         |  2 -
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch b/package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch
new file mode 100644
index 0000000000..4cbbc5dcc3
--- /dev/null
+++ b/package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch
@@ -0,0 +1,43 @@
+From 8ffd68a8dfa1e8671dd8c01b96faffd681deca4e Mon Sep 17 00:00:00 2001
+From: Steffen Persvold <spersvold@gmail.com>
+Date: Tue, 25 Jun 2024 14:14:49 +0200
+Subject: [PATCH] libdirect: define __NR_futex on 32bit architectures using
+ 64-bit time_t
+
+Newer 32bit architectures like RISCV32 and ARC are using 64bit time_t
+from the get go unlike other 32bit architectures, therefore aliasing
+__NR_futex to __NR_futex_time64 helps avoid the below errors :
+
+system.c:242:21: error: '__NR_futex' undeclared (first use in this function)
+  242 |      ret = syscall( __NR_futex, uaddr, op, val, timeout, uaddr2, val3 );
+      |                     ^~~~~~~~~~
+
+Upstream: dead
+Signed-off-by: Steffen Persvold <spersvold@gmail.com>
+---
+ lib/direct/os/linux/glibc/system.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/direct/os/linux/glibc/system.c b/lib/direct/os/linux/glibc/system.c
+index 32086a25..7143442b 100644
+--- a/lib/direct/os/linux/glibc/system.c
++++ b/lib/direct/os/linux/glibc/system.c
+@@ -213,6 +213,10 @@ direct_getenv( const char *name )
+ 
+ /**********************************************************************************************************************/
+ 
++#if defined(__NR_futex_time64) && !defined(__NR_futex)
++#define __NR_futex __NR_futex_time64
++#endif
++
+ DirectResult
+ direct_futex( int *uaddr, int op, int val, const struct timespec *timeout, int *uaddr2, int val3 )
+ {
+@@ -245,4 +249,3 @@ direct_futex( int *uaddr, int op, int val, const struct timespec *timeout, int *
+ 
+      return DR_OK;
+ }
+-
+-- 
+2.40.1
+
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f4d6b8cbd1..20481f56da 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
-	depends on !BR2_RISCV_32
 	depends on !BR2_STATIC_LIBS # static link issues
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -162,7 +161,6 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 endif # BR2_PACKAGE_DIRECTFB
 
 comment "directfb needs a glibc or uClibc toolchain w/ C++, NPTL, gcc >= 4.5, dynamic library"
-	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
