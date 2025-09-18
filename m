Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A7FCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8989561036;
	Fri, 19 Sep 2025 12:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fyzdg1u1nrH5; Fri, 19 Sep 2025 12:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9986061055
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9986061055;
	Fri, 19 Sep 2025 12:42:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC4CE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D2E940C2A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuB4reDrgYHZ for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E57BA40C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57BA40C38
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3F2A85E80; Fri, 19 Sep 2025 12:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 16:44:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8549ce667e60883cdf86136e22cd73f8dff362c2
X-Git-Newrev: b536f9d69be49e0a74ad5105fd1ee0ece63cc377
X-Patchwork-Hint: ignore
Message-Id: <20250919124235.E3F2A85E80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsemanage: fix
 build issue due to basename()
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

commit: https://git.buildroot.net/buildroot/commit/?id=b536f9d69be49e0a74ad5105fd1ee0ece63cc377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The build of libsemanage on musl configurations fails with:

direct_api.c: In function 'semanage_direct_install_file':
direct_api.c:1746:20: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
 1746 |         filename = basename(path);
      |                    ^~~~~~~~

This fails to build even with a GCC 14.x toolchain, even with
libsemanage 3.7, which is the version we have in our LTS branch.

Let's backport an upstream patch fixing this issue.

Fixes:

  https://autobuild.buildroot.net/results/913852e35c925888ced37e15be3731b9d3963019/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 79031b79c273c9346487592ee1638bdd48ba7749)
[thomas: backport patch to v3.7]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-create-semanage_basename-to-ensure-posix.patch | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch b/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
new file mode 100644
index 0000000000..7c129127b1
--- /dev/null
+++ b/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
@@ -0,0 +1,126 @@
+From 795f8381fd64abf692b26d01369561fc68be230c Mon Sep 17 00:00:00 2001
+From: Rahul Sandhu <nvraxn@gmail.com>
+Date: Fri, 21 Feb 2025 09:39:10 +0000
+Subject: [PATCH] libsemanage: create semanage_basename to ensure posix
+ compliance
+
+Passing a const char * to basename(3) is a glibc-specific extension, so
+create our own basename implementation. As it's a trivial 2 LOC, always
+use our implementation of basename even if glibc is available to avoid
+the complications of attaining the non-posix glibc implementation of
+basename(3) as _GNU_SOURCE needs to be defined, but libgen.h also needs
+to have not been included.
+
+Also fix a missing check for selinux_policy_root(3). From the man page:
+On failure, selinux_policy_root returns NULL.
+
+As the glibc basename(3) (unlike posix basename(3)) does not support
+having a nullptr passed to it, only pass the policy_root to basename(3)
+if it is non-null.
+
+Signed-off-by: Rahul Sandhu <nvraxn@gmail.com>
+Acked-by: James Carter <jwcart2@gmail.com>
+Upstream: a339594da6f027aed5d66ec6798a3d732df235e4
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[thomas: backport to v3.7]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/conf-parse.y       | 13 ++++++++++---
+ src/direct_api.c       |  1 +
+ src/utilities.c        |  9 +++++++++
+ src/utilities.h        | 13 +++++++++++++
+ 5 files changed, 59 insertions(+), 3 deletions(-)
+
+diff --git a/src/conf-parse.y b/src/conf-parse.y
+index 6cb8a598..d3ca5f1f 100644
+--- a/src/conf-parse.y
++++ b/src/conf-parse.y
+@@ -21,6 +21,7 @@
+ %{
+ 
+ #include "semanage_conf.h"
++#include "utilities.h"
+ 
+ #include <sepol/policydb.h>
+ #include <selinux/selinux.h>
+@@ -350,7 +351,10 @@ external_opt:   PROG_PATH '=' ARG  { PASSIGN(new_external->path, $3); }
+ static int semanage_conf_init(semanage_conf_t * conf)
+ {
+ 	conf->store_type = SEMANAGE_CON_DIRECT;
+-	conf->store_path = strdup(basename(selinux_policy_root()));
++	const char *policy_root = selinux_policy_root();
++	if (policy_root != NULL) {
++		conf->store_path = strdup(semanage_basename(policy_root));
++	}
+ 	conf->ignoredirs = NULL;
+ 	conf->store_root_path = strdup("/var/lib/selinux");
+ 	conf->compiler_directory_path = strdup("/usr/libexec/selinux/hll");
+@@ -505,8 +509,11 @@ static int parse_module_store(char *arg)
+ 	free(current_conf->store_path);
+ 	if (strcmp(arg, "direct") == 0) {
+ 		current_conf->store_type = SEMANAGE_CON_DIRECT;
+-		current_conf->store_path =
+-		    strdup(basename(selinux_policy_root()));
++		const char *policy_root = selinux_policy_root();
++		if (policy_root != NULL) {
++			current_conf->store_path =
++			    strdup(semanage_basename(policy_root));
++		}
+ 		current_conf->server_port = -1;
+ 	} else if (*arg == '/') {
+ 		current_conf->store_type = SEMANAGE_CON_POLSERV_LOCAL;
+diff --git a/src/direct_api.c b/src/direct_api.c
+index 99cba7f7..ce12ccaf 100644
+--- a/src/direct_api.c
++++ b/src/direct_api.c
+@@ -26,6 +26,7 @@
+ 
+ #include <assert.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+ #include <stdlib.h>
+diff --git a/src/utilities.c b/src/utilities.c
+index 70b5b677..004ffb62 100644
+--- a/src/utilities.c
++++ b/src/utilities.c
+@@ -328,3 +328,12 @@ semanage_list_t *semanage_slurp_file_filter(FILE * file,
+ 
+ 	return head.next;
+ }
++
++#ifdef __GNUC__
++__attribute__((nonnull))
++#endif
++char *semanage_basename(const char *filename)
++{
++	char *p = strrchr(filename, '/');
++	return p ? p + 1 : (char *)filename;
++}
+diff --git a/src/utilities.h b/src/utilities.h
+index c2d484a7..7481077a 100644
+--- a/src/utilities.h
++++ b/src/utilities.h
+@@ -144,4 +144,18 @@ void semanage_keep_until_space(char *data);
+ semanage_list_t *semanage_slurp_file_filter(FILE * file,
+ 					    int (*pred) (const char *))
+     WARN_UNUSED;
++
++/**
++ * Portable implementation of the glibc version of basename(3).
++ *
++ * @param filename  path to find basename of
++ *
++ * @return          basename of filename
++ */
++
++#ifdef __GNUC__
++__attribute__((nonnull))
++#endif
++char *semanage_basename(const char *filename);
++
+ #endif
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
