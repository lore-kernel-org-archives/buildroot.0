Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17724CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C922980E2B;
	Thu, 14 Aug 2025 20:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lx1IKDZcnLBn; Thu, 14 Aug 2025 20:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E16C880E3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16C880E3A;
	Thu, 14 Aug 2025 20:06:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10ECD1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE8080C99
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC6aPFKo3X1S for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30B7680D6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30B7680D6E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F09E86F0D; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:33:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c27f33cf9d07119ec7d4ad5b36df8e1969db5ea6
X-Git-Newrev: fbb8b2a5b3cc4582938dab7f750c66ff13497653
X-Patchwork-Hint: ignore
Message-Id: <20250814200605.2F09E86F0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/janet: fix build
 w/ musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbb8b2a5b3cc4582938dab7f750c66ff13497653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since the commit [1] the janet package started failing on the
autobuilder when using musl libc:

```
[50/56] Compiling C object libjanet.so.1.35.2.p/meson-generated_.._janet.c.o
FAILED: libjanet.so.1.35.2.p/meson-generated_.._janet.c.o
/workdir/instance-0/output-1/host/bin/armeb-buildroot-linux-musleabi-gcc -Ilibjanet.so.1.35.2.p -I. -I.. -I../src/include -fdiagnostics-color=always -Wall -Winvalid-pch -std=c99 -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g3 -fPIC -pthread -fvisibility=hidden -MD -MQ libjanet.so.1.35.2.p/meson-generated_.._janet.c.o -MF libjanet.so.1.35.2.p/meson-generated_.._janet.c.o.d -o libjanet.so.1.35.2.p/meson-generated_.._janet.c.o -c janet.c
src/core/util.c: In function 'janet_strerror':
src/core/util.c:977:12: error: returning 'int' from a function with return type 'const char *' makes pointer from integer without a cast [-Wint-conversion]
[51/56] Compiling C object janet-native.p/meson-generated_.._janet.c.o
```

The commit [2] introduced the issue in v1.35.0, the `strerror` function
has different definition on glibc compared to musl. This issue has been
addressed in commit [3]. This patch add the upstream commit [3].

[1] 31212c4c58 package/janet: bump to version 1.35.2
[2] https://github.com/janet-lang/janet/commit/8334504f4e5aa253502a45db3eeb4db265490b4e
[3] https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568

Fixes: https://autobuild.buildroot.org/results/ff1/ff1d6063c1a79d17cfa9910cca824e704a4a0c67/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 92a244ba8bf1a80dba746dbb6b7ab0a45b1dd375)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...001-check-for-glibc-instead-of-gnu-source.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
new file mode 100644
index 0000000000..5ee021e658
--- /dev/null
+++ b/package/janet/0001-check-for-glibc-instead-of-gnu-source.patch
@@ -0,0 +1,26 @@
+From a5d6b2283834422a9fa9e79b5c7ad9b932b52568 Mon Sep 17 00:00:00 2001
+From: Calvin Rose <calsrose@gmail.com>
+Date: Fri, 21 Jun 2024 17:17:22 -0500
+Subject: [PATCH] Check for __GLIBC__ instead of _GNU_SOURCE
+
+musl doesn't obey this behavior.
+
+Upstream: https://github.com/janet-lang/janet/commit/a5d6b2283834422a9fa9e79b5c7ad9b932b52568
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/core/util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/util.c b/src/core/util.c
+index 4bb37abc5..6cb5676e0 100644
+--- a/src/core/util.c
++++ b/src/core/util.c
+@@ -972,7 +972,7 @@ const char *janet_strerror(int e) {
+ #ifdef JANET_WINDOWS
+     /* Microsoft strerror seems sane here and is thread safe by default */
+     return strerror(e);
+-#elif defined(_GNU_SOURCE)
++#elif defined(__GLIBC__)
+     /* See https://linux.die.net/man/3/strerror_r */
+     return strerror_r(e, janet_vm.strerror_buf, sizeof(janet_vm.strerror_buf));
+ #else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
