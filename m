Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7CCC5321E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A31840267;
	Sun, 18 Aug 2024 07:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2weq6EccsgO; Sun, 18 Aug 2024 07:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B4574032E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B4574032E;
	Sun, 18 Aug 2024 07:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 379C21BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05F2D80AA2
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjER80nqTRep for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 073EF80AA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 073EF80AA7
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01D5685F99; Sun, 18 Aug 2024 07:29:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 09:28:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62fd55d2722264099868e106ab5146fe65f15825
X-Git-Newrev: 463f4c6cb86a3ab7ef5ada2d0eb27367d135277d
X-Patchwork-Hint: ignore
Message-Id: <20240818072943.01D5685F99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: fix build on OpenRISC
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

commit: https://git.buildroot.net/buildroot/commit/?id=463f4c6cb86a3ab7ef5ada2d0eb27367d135277d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of libffi on OpenRISC is broken with GCC 14.x. This commit
brings two patches, submitted upstream, that address those two build
issues. Both issues always existed in the OpenRISC libffi code base.

Fixes:

  http://autobuild.buildroot.net/results/fb95d9a0f8322a58cd266014f3dea4eaa1b483e5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch | 47 ++++++++++++++++++++
 ...-or1k-ffi.c-fix-incompatible-pointer-type.patch | 50 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch b/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
new file mode 100644
index 0000000000..f3a7b29e3b
--- /dev/null
+++ b/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
@@ -0,0 +1,47 @@
+From 4506e943289ed1363f3921bc201d5da76f750229 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 12:56:22 +0200
+Subject: [PATCH] src/or1k/ffi.c: fix prototype of ffi_call_SYSV()
+
+The current code base of libffi on OpenRISC (or1k) fails to build with
+GCC 14.x with the following error:
+
+../src/or1k/ffi.c: In function 'ffi_call':
+../src/or1k/ffi.c:167:34: error: passing argument 3 of 'ffi_call_SYSV' from incompatible pointer type [-Wincompatible-pointer-types]
+  167 |       ffi_call_SYSV(size, &ecif, ffi_prep_args, rvalue, fn, cif->flags);
+      |                                  ^~~~~~~~~~~~~
+      |                                  |
+      |                                  void * (*)(char *, extended_cif *)
+../src/or1k/ffi.c:113:27: note: expected 'void * (*)(int *, extended_cif *)' but argument is of type 'void * (*)(char *, extended_cif *)'
+  113 |                           void *(*)(int *, extended_cif *),
+      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This is due to the fact that ffi_prep_args() is in fact defined as:
+
+  void* ffi_prep_args(char *stack, extended_cif *ecif)
+
+so, let's fix the prototype of the function pointer, which anyway gets
+passed to assembly code, so the typing gets lost.
+
+Upstream: https://github.com/libffi/libffi/pull/854
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/or1k/ffi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/or1k/ffi.c b/src/or1k/ffi.c
+index 9451d4e..157388e 100644
+--- a/src/or1k/ffi.c
++++ b/src/or1k/ffi.c
+@@ -110,7 +110,7 @@ void* ffi_prep_args(char *stack, extended_cif *ecif)
+ 
+ extern void ffi_call_SYSV(unsigned,
+                           extended_cif *,
+-                          void *(*)(int *, extended_cif *),
++                          void *(*)(char *, extended_cif *),
+                           unsigned *,
+                           void (*fn)(void),
+                           unsigned);
+-- 
+2.46.0
+
diff --git a/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch b/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch
new file mode 100644
index 0000000000..e1ff003500
--- /dev/null
+++ b/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch
@@ -0,0 +1,50 @@
+From ec39b03d891a77552ad7729ff79bf21bf3591842 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 13:52:45 +0200
+Subject: [PATCH] src/or1k/ffi.c: fix incompatible pointer type
+
+The current code base of libffi on OpenRISC (or1k) fails to build with
+GCC 14.x with the following error:
+
+../src/or1k/ffi.c: In function 'ffi_closure_SYSV':
+../src/or1k/ffi.c:183:22: error: initialization of 'char *' from incompatible pointer type 'int *' [-Wincompatible-pointer-types]
+  183 |   char *stack_args = sp;
+      |                      ^~
+
+Indeed:
+
+  register int *sp __asm__ ("r17");
+  [..]
+  char *stack_args = sp;
+
+Adopt the same logic used for:
+
+  char *ptr = (char *) register_args;
+
+which consists in casting to the desired pointer type. Indeed, later
+in the code stack_args is assigned to ptr (so they need to be the same
+pointer type), and some arithmetic is done on ptr, so changing its
+pointer type would change the behavior.
+
+Upstream: https://github.com/libffi/libffi/pull/854
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/or1k/ffi.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/or1k/ffi.c b/src/or1k/ffi.c
+index 157388e..7a6d28c 100644
+--- a/src/or1k/ffi.c
++++ b/src/or1k/ffi.c
+@@ -180,7 +180,7 @@ void ffi_closure_SYSV(unsigned long r3, unsigned long r4, unsigned long r5,
+   register int *r13 __asm__ ("r13");
+ 
+   ffi_closure* closure = (ffi_closure*) r13;
+-  char *stack_args = sp;
++  char *stack_args = (char*) sp;
+ 
+   /* Lay the register arguments down in a continuous chunk of memory.  */
+   unsigned register_args[6] =
+-- 
+2.46.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
