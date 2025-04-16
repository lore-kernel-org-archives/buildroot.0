Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD44C369CA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A446F69C;
	Wed, 16 Apr 2025 21:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPi1EwPkHLot; Wed, 16 Apr 2025 21:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC3A6F606
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC3A6F606;
	Wed, 16 Apr 2025 21:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 082E320E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0F4E6F5A9
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glzhLKHvsicm for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F555607A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F555607A7
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73D858408D; Wed, 16 Apr 2025 21:40:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:44:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cb7599133a281359af8ebab0e2685b2ed5fc3168
X-Git-Newrev: e318e5c54bb4f2b5618cd88d54ddef6737f7b45c
X-Patchwork-Hint: ignore
Message-Id: <20250416214040.73D858408D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: add patch
 to fix reallocarray() definition
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
Content-Type: multipart/mixed; boundary="===============0829642636639944196=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0829642636639944196==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e318e5c54bb4f2b5618cd88d54ddef6737f7b45c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

uClibc-ng unconditionally exposes a reallocarray() prototype, but only
provides the implementation when the malloc-standard implementation is
selected in the configuration.

As noMMU configurations can't use malloc-standard, they use malloc or
malloc-simple that don't provide reallocarray().

As a result of reallocarray() being missing, some packages such as
util-linux provide their own replacement implementation... but its
prototype clashes with the one provided by uClibc, causing build
failures such as:

In file included from lib/color-names.c:7:
./include/c.h:586:21: error: static declaration of ‘reallocarray’ follows non-static declaration
  586 | static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
      |                     ^~~~~~~~~~~~
In file included from ./include/c.h:16:
/home/thomas/projets/buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/include/stdlib.h:898:14: note: previous declaration of ‘reallocarray’ with type ‘void *(void *, size_t,  size_t)’ {aka ‘void *(void *, unsigned int,  unsigned int)’}
  898 | extern void *reallocarray (void *__ptr, size_t __m, size_t __n);
      |              ^~~~~~~~~~~~
make[3]: *** [Makefile:12354: lib/libtcolors_la-color-names.lo] Error 1

This is addressed by a patch on uClibc, submitted upstream, which
makes sure the prototype is only exposed when the implementation is
provided.

The issue can be reproduced with commands:

    cat <<EOF >.config
    BR2_arm=y
    BR2_cortex_m4=y
    BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
    BR2_PACKAGE_UTIL_LINUX=y
    BR2_PACKAGE_UTIL_LINUX_KILL=y
    EOF
    make olddefconfig
    make util-linux

Fixes:

  https://autobuild.buildroot.net/results/157aa82aa4cd57eacc4defe6cace16e464261e9a/ (RISC-V noMMU)
  https://autobuild.buildroot.net/results/ce1a24c1465b82686ae375ac688a553fb65df5ea/ (ARM noMMU)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: add commands to reproduce the issue in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 01895663d37a821ec8d94b52f4d4384b967787e1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...lib.h-only-expose-reallocarray-prototype-.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/uclibc/0001-include-stdlib.h-only-expose-reallocarray-prototype-.patch b/package/uclibc/0001-include-stdlib.h-only-expose-reallocarray-prototype-.patch
new file mode 100644
index 0000000000..867e3645cc
--- /dev/null
+++ b/package/uclibc/0001-include-stdlib.h-only-expose-reallocarray-prototype-.patch
@@ -0,0 +1,64 @@
+From bbb1a4f197624b0040e3228505eb2a725a8846f8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 3 Apr 2025 22:56:49 +0200
+Subject: [PATCH] include/stdlib.h: only expose reallocarray() prototype when
+ implementation is available
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The reallocarray() primitive is only provided by the malloc-standard
+implementation: neither malloc nor malloc-simple provide it. This
+causes issues when building for example util-linux on noMMU platforms
+as:
+
+- noMMU platforms can't use malloc-standard, so either malloc or
+  malloc-simple are used, which means reallocarray() is not
+  implemented
+
+- util-linux detects the absence of reallocarray(), and provides its
+  own implementation, but the prototype clashes with the prototype in
+  uClibc's <stdlib.h>
+
+The combination of which causes the following build failure:
+
+In file included from lib/color-names.c:7:
+./include/c.h:586:21: error: static declaration of ‘reallocarray’ follows non-static declaration
+  586 | static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
+      |                     ^~~~~~~~~~~~
+In file included from ./include/c.h:16:
+/home/thomas/projets/buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/include/stdlib.h:898:14: note: previous declaration of ‘reallocarray’ with type ‘void *(void *, size_t,  size_t)’ {aka ‘void *(void *, unsigned int,  unsigned int)’}
+  898 | extern void *reallocarray (void *__ptr, size_t __m, size_t __n);
+      |              ^~~~~~~~~~~~
+make[3]: *** [Makefile:12354: lib/libtcolors_la-color-names.lo] Error 1
+
+To fix this, let's not expose the prototype of reallocarray() if we
+don't provide the implementation for it.
+
+Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/BX4ENNZYO23YQJQF5XITW7TETSJHEFK5/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/stdlib.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/stdlib.h b/include/stdlib.h
+index d4e0b75e7..448c5e336 100644
+--- a/include/stdlib.h
++++ b/include/stdlib.h
+@@ -986,9 +986,13 @@ extern int getpt (void);
+ extern int getloadavg (double __loadavg[], int __nelem)
+      __THROW __nonnull ((1));
+ 
++/* reallocarray() only provided by the malloc-standard implementation */
++#if defined(__MALLOC_STANDARD__)
+ extern void *reallocarray (void *__ptr, size_t __m, size_t __n);
+ #endif
+ 
++#endif
++
+ #ifdef _LIBC
+ extern int __drand48_iterate (unsigned short int xsubi[3], struct drand48_data *buffer) attribute_hidden;
+ 
+-- 
+2.48.1
+

--===============0829642636639944196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0829642636639944196==--
