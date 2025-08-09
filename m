Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85632C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4051840A68;
	Sat,  9 Aug 2025 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi4HDDdnCWxY; Sat,  9 Aug 2025 20:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 587AE40B6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 587AE40B6F;
	Sat,  9 Aug 2025 20:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B8D21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4710860846
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3b7JCkZk8S_n for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 20:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CE7A60C18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CE7A60C18
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:53:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BDB38709F; Sat,  9 Aug 2025 20:53:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 22:51:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ae37b712f454975f1b18ac0557c2a371ceefa37
X-Git-Newrev: 064f7592d3e0c1422582545dec01367f46d443c9
X-Patchwork-Hint: ignore
Message-Id: <20250809205330.7BDB38709F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tini: fix build w/ musl
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=064f7592d3e0c1422582545dec01367f46d443c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building tini with musl libc, the following error occurs dur to
missing declaration of 'basename':

```
/home/buildroot/instance-0/output-1/build/tini-0.19.0/src/tini.c: In function 'print_usage':
/home/buildroot/instance-0/output-1/build/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
      |                                    ^~~~~~~~
make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/tini-0.19.0/.stamp_built] Error 1
make: Leaving directory '/home/buildroot/instance-0/buildroot'
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_TINI=y
EOF
make olddefconfig
make tini
```

This patch adds the upstream commit [1], that fixes this issue by
including `libgen.h`.

[1] https://github.com/krallin/tini/commit/924c4bd6028457188942ecbfdc75e6a343fa9395

Fixes: https://autobuild.buildroot.org/results/f0d/f0d10cd25f3b0e2a4af7266f7417b339ea5d242a
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...001-support-posix-basename-from-musl-libc.patch | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/package/tini/0001-support-posix-basename-from-musl-libc.patch b/package/tini/0001-support-posix-basename-from-musl-libc.patch
new file mode 100644
index 0000000000..17445d5b3b
--- /dev/null
+++ b/package/tini/0001-support-posix-basename-from-musl-libc.patch
@@ -0,0 +1,76 @@
+From 924c4bd6028457188942ecbfdc75e6a343fa9395 Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Sun, 14 Apr 2024 15:33:51 +0200
+Subject: [PATCH] Support POSIX basename() from musl libc
+
+Musl libc 1.2.5 removed the definition of the basename() function from
+string.h and only provides it in libgen.h as the POSIX standard
+defines it.
+
+This change fixes compilation with musl libc 1.2.5.
+````
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
+  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:25: error: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Werror=format=]
+  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
+      |                        ~^          ~~~~~~~~~~~~~~
+      |                         |          |
+      |                         char *     int
+      |                        %d
+
+````
+
+basename() modifies the input string, copy it first with strdup(), If
+strdup() returns NULL the code will handle it.
+
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+Upstream: https://github.com/krallin/tini/commit/924c4bd6028457188942ecbfdc75e6a343fa9395
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/tini.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/tini.c b/src/tini.c
+index 7914d3a..41d1506 100644
+--- a/src/tini.c
++++ b/src/tini.c
+@@ -14,6 +14,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <stdbool.h>
++#include <libgen.h>
+ 
+ #include "tiniConfig.h"
+ #include "tiniLicense.h"
+@@ -224,14 +225,19 @@ int spawn(const signal_configuration_t* const sigconf_ptr, char* const argv[], i
+ }
+ 
+ void print_usage(char* const name, FILE* const file) {
+-	fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
++	char *dirc, *bname;
++
++	dirc = strdup(name);
++	bname = basename(dirc);
++
++	fprintf(file, "%s (%s)\n", bname, TINI_VERSION_STRING);
+ 
+ #if TINI_MINIMAL
+-	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", basename(name));
++	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", bname);
+ #else
+-	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", basename(name));
++	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", bname);
+ #endif
+-	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", basename(name));
++	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", bname);
+ 
+ 	fprintf(file, "Command line options:\n\n");
+ 
+@@ -261,6 +267,7 @@ void print_usage(char* const name, FILE* const file) {
+ 	fprintf(file, "  %s: Send signals to the child's process group.\n", KILL_PROCESS_GROUP_GROUP_ENV_VAR);
+ 
+ 	fprintf(file, "\n");
++	free(dirc);
+ }
+ 
+ void print_license(FILE* const file) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
