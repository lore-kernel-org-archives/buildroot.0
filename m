Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067A2C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9932260BB0;
	Sun,  6 Apr 2025 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkjAAgCh7xzD; Sun,  6 Apr 2025 19:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1BF608B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1BF608B1;
	Sun,  6 Apr 2025 19:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6F0E1DE
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8AF04056B
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSOvBMe394n8 for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 19:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E1940552
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2E1940552
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 19:36:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B039883C3D; Sun,  6 Apr 2025 19:36:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Apr 2025 21:35:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c2b2314df768a0add1fe45a9ad7dbcf2192d26f
X-Git-Newrev: 34424432baedba4d9f9acdcfb8dd68f8075f94af
X-Patchwork-Hint: ignore
Message-Id: <20250406193653.B039883C3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: backport upstream fix for
 mimalloc on armeb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=34424432baedba4d9f9acdcfb8dd68f8075f94af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python3 uses mimalloc by default, however, mimalloc did not compile for
big-endian ARM and generated the wrong instructions for ARMv7+ targets.

These issues have been fixed upstream in both mimalloc and CPython.

The issue can be reproduced with commands:

    cat <<EOF >.config
    BR2_armeb=y
    BR2_cortex_a15=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_PYTHON3=y
    EOF
    make olddefconfig
    make python3

Fixes: https://autobuild.buildroot.org/results/26b752738022e8b46e810a08e28d687120e5c4e3/

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[Julien: add commands to reproduce the issue in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch b/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch
new file mode 100644
index 0000000000..b4ecde94ee
--- /dev/null
+++ b/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch
@@ -0,0 +1,80 @@
+From a9aae012b4ee83f1aba7c122943c63b69c5b9f97 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 31 Mar 2025 20:58:29 +0200
+Subject: [PATCH] [3.13] gh-131675: Fix `mi_atomic_yield` in mimalloc on 32-bit
+ ARM (gh-131784) (gh-131954)
+
+Use the standard `__ARM_ARCH` macro, which is supported by GCC and Clang.
+
+The branching logic for of `__ARMEL__` has been removed so if the target
+architecture supports v7+ instructions, a yield is emitted, otherwise a nop
+is emitted. This covers both big and little endian scenarios.
+(cherry picked from commit 03f6c8e239723637811fd8d278661f5292351197)
+
+Upstream: https://github.com/python/cpython/pull/131954
+
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+Co-authored-by: Vincent Fazio <vfazio@gmail.com>
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ Include/internal/mimalloc/mimalloc/atomic.h     | 17 ++++++++++-------
+ ...25-03-27-01-21-50.gh-issue-131675.l2zfOO.rst |  1 +
+ 2 files changed, 11 insertions(+), 7 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
+
+diff --git a/Include/internal/mimalloc/mimalloc/atomic.h b/Include/internal/mimalloc/mimalloc/atomic.h
+index 1093c540864..a46a7676ad2 100644
+--- a/Include/internal/mimalloc/mimalloc/atomic.h
++++ b/Include/internal/mimalloc/mimalloc/atomic.h
+@@ -338,8 +338,9 @@ static inline void mi_atomic_yield(void) {
+   _mm_pause();
+ }
+ #elif (defined(__GNUC__) || defined(__clang__)) && \
+-      (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__armel__) || defined(__ARMEL__) || \
+-       defined(__aarch64__) || defined(__powerpc__) || defined(__ppc__) || defined(__PPC__)) || defined(__POWERPC__)
++      (defined(__x86_64__) || defined(__i386__) || \
++       defined(__aarch64__) || defined(__arm__) || \
++       defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(__POWERPC__))
+ #if defined(__x86_64__) || defined(__i386__)
+ static inline void mi_atomic_yield(void) {
+   __asm__ volatile ("pause" ::: "memory");
+@@ -348,10 +349,16 @@ static inline void mi_atomic_yield(void) {
+ static inline void mi_atomic_yield(void) {
+   __asm__ volatile("wfe");
+ }
+-#elif (defined(__arm__) && __ARM_ARCH__ >= 7)
++#elif defined(__arm__)
++#if __ARM_ARCH >= 7
+ static inline void mi_atomic_yield(void) {
+   __asm__ volatile("yield" ::: "memory");
+ }
++#else
++static inline void mi_atomic_yield(void) {
++  __asm__ volatile ("nop" ::: "memory");
++}
++#endif
+ #elif defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(__POWERPC__)
+ #ifdef __APPLE__
+ static inline void mi_atomic_yield(void) {
+@@ -362,10 +369,6 @@ static inline void mi_atomic_yield(void) {
+   __asm__ __volatile__ ("or 27,27,27" ::: "memory");
+ }
+ #endif
+-#elif defined(__armel__) || defined(__ARMEL__)
+-static inline void mi_atomic_yield(void) {
+-  __asm__ volatile ("nop" ::: "memory");
+-}
+ #endif
+ #elif defined(__sun)
+ // Fallback for other archs
+diff --git a/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst b/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
+new file mode 100644
+index 00000000000..be870a81df1
+--- /dev/null
++++ b/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
+@@ -0,0 +1 @@
++Fix mimalloc library builds for 32-bit ARM targets.
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
