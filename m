Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD776C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A7284D41;
	Sat,  8 Jun 2024 19:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwKof-5xxLF8; Sat,  8 Jun 2024 19:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B8BE84D36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8BE84D36;
	Sat,  8 Jun 2024 19:17:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB61C1BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C318C40437
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 817T7kW9Eqtx for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73A7403D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A73A7403D6
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A229787C6F; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:24:16 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 658686c6df381a12fca841adb0d2837dd56eb4aa
X-Git-Newrev: 454728710b7e852e71169d444ffb402435d30e8d
X-Patchwork-Hint: ignore
Message-Id: <20240608191502.A229787C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/kmod: fix build
 with musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=454728710b7e852e71169d444ffb402435d30e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Patch from upstream PR still being discussed:
https://github.com/kmod-project/kmod/pull/32

Fixes: #16093

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
[yann.morin.1998@free.fr:
  - add upstream tag to the patch
  - reference #16093
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 05617724ee2b5db9a1a6bb07272915ef3c1fd535)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-portable-implementation-for-basename-API.patch | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
new file mode 100644
index 0000000000..26f108d66e
--- /dev/null
+++ b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
@@ -0,0 +1,134 @@
+From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Dec 2023 17:35:59 -0800
+Subject: [PATCH] Use portable implementation for basename API
+
+musl has removed the non-prototype declaration of basename from
+string.h [1] which now results in build errors with clang-17+ compiler
+
+Implement GNU basename behavior using strchr which is portable across libcs
+
+Fixes
+../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+71 | "Commands:\n", basename(argv[0]));
+| ^
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Suggested-by: Rich Felker
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/kmod-project/kmod/pull/32
+Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
+---
+ libkmod/libkmod-config.c | 2 +-
+ shared/util.c            | 4 ++--
+ shared/util.h            | 7 +++++++
+ testsuite/testsuite.c    | 2 +-
+ tools/depmod.c           | 2 +-
+ tools/kmod.c             | 4 ++--
+ 6 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
+index e83621b3..8aa555a4 100644
+--- a/libkmod/libkmod-config.c
++++ b/libkmod/libkmod-config.c
+@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
+ 	bool is_single = false;
+
+ 	if (name == NULL) {
+-		name = basename(path);
++		name = gnu_basename(path);
+ 		is_single = true;
+ 	}
+
+diff --git a/shared/util.c b/shared/util.c
+index e2bab83a..0e16670e 100644
+--- a/shared/util.c
++++ b/shared/util.c
+@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
+
+ char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
+ {
+-	char *modname;
++	const char *modname;
+
+-	modname = basename(path);
++	modname = gnu_basename(path);
+ 	if (modname == NULL || modname[0] == '\0')
+ 		return NULL;
+
+diff --git a/shared/util.h b/shared/util.h
+index c4a3916b..073dc5a7 100644
+--- a/shared/util.h
++++ b/shared/util.h
+@@ -5,6 +5,7 @@
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <time.h>
+@@ -76,6 +77,12 @@ do {						\
+ 	__p->__v = (val);			\
+ } while(0)
+
++static _always_inline_ const char *gnu_basename(const char *s)
++{
++  const char *p = strrchr(s, '/');
++  return p ? p+1 : s;
++}
++
+ static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
+ {
+ 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
+diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
+index 318343ac..aafc9873 100644
+--- a/testsuite/testsuite.c
++++ b/testsuite/testsuite.c
+@@ -70,7 +70,7 @@ static void help(void)
+
+ 	printf("Usage:\n"
+ 	       "\t%s [options] <test>\n"
+-	       "Options:\n", basename(progname));
++	       "Options:\n", gnu_basename(progname));
+
+ 	for (itr = options, itr_short = options_short;
+ 				itr->name != NULL; itr++, itr_short++)
+diff --git a/tools/depmod.c b/tools/depmod.c
+index 43fc354a..cfb15b11 100644
+--- a/tools/depmod.c
++++ b/tools/depmod.c
+@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
+ 	if (name != NULL)
+ 		namelen = strlen(name);
+ 	else {
+-		name = basename(dir);
++		name = gnu_basename(dir);
+ 		namelen = strlen(name);
+ 		dirlen -= namelen + 1;
+ 	}
+diff --git a/tools/kmod.c b/tools/kmod.c
+index 55689c07..df91e5c6 100644
+--- a/tools/kmod.c
++++ b/tools/kmod.c
+@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
+ 			"Options:\n"
+ 			"\t-V, --version     show version\n"
+ 			"\t-h, --help        show this help\n\n"
+-			"Commands:\n", basename(argv[0]));
++			"Commands:\n", gnu_basename(argv[0]));
+
+ 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
+ 		if (kmod_cmds[i]->help != NULL) {
+@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
+ 	const char *cmd;
+ 	size_t i;
+
+-	cmd = basename(argv[0]);
++	cmd = gnu_basename(argv[0]);
+
+ 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
+ 		if (streq(kmod_compat_cmds[i]->name, cmd))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
