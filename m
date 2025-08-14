Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F42CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D294D80E37;
	Thu, 14 Aug 2025 20:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQMu-UzHwweQ; Thu, 14 Aug 2025 20:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8DC80E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C8DC80E1A;
	Thu, 14 Aug 2025 20:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7060D1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2FCA404D3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2BEewM70cQc for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88911404AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88911404AE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 867848760A; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:30:26 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c847ad2e2068f6ab481907c81f3cab2ef30811ae
X-Git-Newrev: c5bc42e041aafba30089bcf68e929e48cef5c3f6
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.867848760A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libapparmor: fix
 build w/ musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5bc42e041aafba30089bcf68e929e48cef5c3f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

When building the libapparmor package with musl the following error
would appear:

```
test_multi.c: In function 'main':
test_multi.c:27:30: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
   27 |         printf("File: %s\n", basename(argv[1]));
      |                              ^~~~~~~~
test_multi.c:27:24: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
   27 |         printf("File: %s\n", basename(argv[1]));
      |                       ~^     ~~~~~~~~~~~~~~~~~
      |                        |     |
      |                        |     int
      |                        char *
      |                       %d
make[3]: *** [Makefile:466: test_multi_multi-test_multi.o] Error 1
```

This error can be reproduced with the following:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_LIBAPPARMOR=y
EOF
make olddefconfig
make libapparmor
```

On musl libc the function `basename` is provided by included libgen.h.
This error has been addressed upstream in [1] by re-defining the
function `basename`.

[1] https://gitlab.com/apparmor/apparmor/-/commit/7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: drop unrelated AUTORECONF change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2640f5dcd03d93966244b1501c457b11d2fd3568)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...define-a-portable-version-of-gnu-basename.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch b/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
new file mode 100644
index 0000000000..c068279853
--- /dev/null
+++ b/package/libapparmor/0001-libapparamor-define-a-portable-version-of-gnu-basename.patch
@@ -0,0 +1,44 @@
+From 7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a Mon Sep 17 00:00:00 2001
+From: Jules Maselbas <jmaselbas@zdiv.net>
+Date: Thu, 16 May 2024 12:01:00 +0200
+Subject: [PATCH] libapparamor: Define a portable version of gnu basename
+
+Since musl 1.2.5, basename(3) prototype is only provided in libgen.h
+(as mandated by POSIX) and not in strings.h. Also there is a major
+difference between the gnu basename and the one defined in libgen.h,
+the latter modify the argument string making them incompatible.
+
+Fix this by defining a portable version of basename using strchr.
+
+Upstream: https://gitlab.com/apparmor/apparmor/-/commit/7fb040bde69ebdfce48cf1a01c1a62fd4f8eef0a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libraries/libapparmor/testsuite/test_multi.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libraries/libapparmor/testsuite/test_multi.c b/libraries/libapparmor/testsuite/test_multi.c
+index 578629500..7f37966ec 100644
+--- a/libraries/libapparmor/testsuite/test_multi.c
++++ b/libraries/libapparmor/testsuite/test_multi.c
+@@ -1,5 +1,3 @@
+-#define _GNU_SOURCE /* for glibc's basename version */
+-
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -7,6 +5,12 @@
+ 
+ #include <aalogparse.h>
+ 
++static const char *basename(const char *path)
++{
++	const char *p = strrchr(path, '/');
++	return p ? p + 1 : path;
++}
++
+ int print_results(aa_log_record *record);
+ 
+ int main(int argc, char **argv)
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
