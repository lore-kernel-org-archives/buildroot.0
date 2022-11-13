Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24013C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 11:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADA3B819D1;
	Sun, 13 Nov 2022 11:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADA3B819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FToje-56ad64; Sun, 13 Nov 2022 11:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C7F81911;
	Sun, 13 Nov 2022 11:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C7F81911
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCE051BF42E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B568440165
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B568440165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9pBhkG_rtOQ for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 11:51:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C31F840127
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 11:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C31F840127
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF64C83454; Sun, 13 Nov 2022 11:51:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 12:46:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57a1ce00a2c9f4b4b988f41b15ad01c6abc2a99c
X-Git-Newrev: cf14df13358ddd1b06709924a84f87dfa711cceb
X-Patchwork-Hint: ignore
Message-Id: <20221113115100.AF64C83454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efivar: fix build with musl libc
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf14df13358ddd1b06709924a84f87dfa711cceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch to fix build with musl libc.
This patch is only a requirement since efivar 38 and was applied
upstream shortly after the 38 version tag.

Fixes:
http://autobuild.buildroot.net/results/c49d894b109d68e2624074eab8b939fefa3b42ef/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0004-efisecdb-fix-build-with-musl-libc.patch   | 185 +++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch b/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..9815a9d0cf
--- /dev/null
+++ b/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
@@ -0,0 +1,185 @@
+From cece3ffd5be2f8641eb694513f2b73e5eb97ffd3 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Fri, 28 Jan 2022 12:13:30 +0100
+Subject: [PATCH] efisecdb: fix build with musl libc
+
+Refactor code to use POSIX atexit(3) instead of the GNU specific
+on_exit(3).
+
+Resolves: #197
+Resolves: #202
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+[Erico: backport from upstream commit
+cece3ffd5be2f8641eb694513f2b73e5eb97ffd3]
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+---
+ src/compiler.h |  2 --
+ src/efisecdb.c | 68 +++++++++++++++++++-------------------------------
+ 2 files changed, 26 insertions(+), 44 deletions(-)
+
+diff --git a/src/compiler.h b/src/compiler.h
+index e2f18f0..d95fb01 100644
+--- a/src/compiler.h
++++ b/src/compiler.h
+@@ -7,8 +7,6 @@
+ #ifndef COMPILER_H_
+ #define COMPILER_H_
+ 
+-#include <sys/cdefs.h>
+-
+ /* GCC version checking borrowed from glibc. */
+ #if defined(__GNUC__) && defined(__GNUC_MINOR__)
+ #  define GNUC_PREREQ(maj,min) \
+diff --git a/src/efisecdb.c b/src/efisecdb.c
+index f882373..6bd5ad9 100644
+--- a/src/efisecdb.c
++++ b/src/efisecdb.c
+@@ -25,6 +25,10 @@
+ extern char *optarg;
+ extern int optind, opterr, optopt;
+ 
++static efi_secdb_t *secdb = NULL;
++static list_t infiles;
++static list_t actions;
++
+ struct hash_param {
+ 	char *name;
+ 	efi_secdb_type_t algorithm;
+@@ -187,12 +191,11 @@ add_action(list_t *list, action_type_t action_type, const efi_guid_t *owner,
+ }
+ 
+ static void
+-free_actions(int status UNUSED, void *actionsp)
++free_actions(void)
+ {
+-	list_t *actions = (list_t *)actionsp;
+ 	list_t *pos, *tmp;
+ 
+-	for_each_action_safe(pos, tmp, actions) {
++	for_each_action_safe(pos, tmp, &actions) {
+ 		action_t *action = list_entry(pos, action_t, list);
+ 
+ 		list_del(&action->list);
+@@ -202,12 +205,11 @@ free_actions(int status UNUSED, void *actionsp)
+ }
+ 
+ static void
+-free_infiles(int status UNUSED, void *infilesp)
++free_infiles(void)
+ {
+-	list_t *infiles = (list_t *)infilesp;
+ 	list_t *pos, *tmp;
+ 
+-	for_each_ptr_safe(pos, tmp, infiles) {
++	for_each_ptr_safe(pos, tmp, &infiles) {
+ 		ptrlist_t *entry = list_entry(pos, ptrlist_t, list);
+ 
+ 		list_del(&entry->list);
+@@ -216,27 +218,12 @@ free_infiles(int status UNUSED, void *infilesp)
+ }
+ 
+ static void
+-maybe_free_secdb(int status UNUSED, void *voidp)
++maybe_free_secdb(void)
+ {
+-	efi_secdb_t **secdbp = (efi_secdb_t **)voidp;
+-
+-	if (secdbp == NULL || *secdbp == NULL)
++	if (secdb == NULL)
+ 		return;
+ 
+-	efi_secdb_free(*secdbp);
+-}
+-
+-static void
+-maybe_do_unlink(int status, void *filep)
+-{
+-	char **file = (char **)filep;
+-
+-	if (status == 0)
+-		return;
+-	if (file == NULL || *file == NULL)
+-		return;
+-
+-	unlink(*file);
++	efi_secdb_free(secdb);
+ }
+ 
+ static void
+@@ -323,15 +310,6 @@ parse_input_files(list_t *infiles, char **outfile, efi_secdb_t **secdb,
+ 	return status;
+ }
+ 
+-/*
+- * These need to be static globals so that they're not on main's stack when
+- * on_exit() fires.
+- */
+-static efi_secdb_t *secdb = NULL;
+-static list_t infiles;
+-static list_t actions;
+-static char *outfile = NULL;
+-
+ int
+ main(int argc, char *argv[])
+ {
+@@ -351,6 +329,7 @@ main(int argc, char *argv[])
+ 	bool do_sort_data = false;
+ 	bool sort_descending = false;
+ 	int status = 0;
++	char *outfile = NULL;
+ 
+ 	const char sopts[] = ":aAc:dfg:h:i:Lo:rs:t:v?";
+ 	const struct option lopts[] = {
+@@ -376,10 +355,9 @@ main(int argc, char *argv[])
+ 	INIT_LIST_HEAD(&infiles);
+ 	INIT_LIST_HEAD(&actions);
+ 
+-	on_exit(free_actions, &actions);
+-	on_exit(free_infiles, &infiles);
+-	on_exit(maybe_free_secdb, &secdb);
+-	on_exit(maybe_do_unlink, &outfile);
++	atexit(free_actions);
++	atexit(free_infiles);
++	atexit(maybe_free_secdb);
+ 
+ 	/*
+ 	 * parse the command line.
+@@ -587,24 +565,30 @@ sort_err:
+ 	outfd = open(outfile, flags, 0600);
+ 	if (outfd < 0) {
+ 		char *tmpoutfile = outfile;
+-		if (errno == EEXIST)
+-			outfile = NULL;
++		if (errno != EEXIST)
++			unlink(outfile);
+ 		err(1, "could not open \"%s\"", tmpoutfile);
+ 	}
+ 
+ 	rc = ftruncate(outfd, 0);
+-	if (rc < 0)
++	if (rc < 0) {
++		unlink(outfile);
+ 		err(1, "could not truncate output file \"%s\"", outfile);
++	}
+ 
+ 	void *output;
+ 	size_t size = 0;
+ 	rc = efi_secdb_realize(secdb, &output, &size);
+-	if (rc < 0)
++	if (rc < 0) {
++		unlink(outfile);
+ 		secdb_err(1, "could not realize signature list");
++	}
+ 
+ 	rc = write(outfd, output, size);
+-	if (rc < 0)
++	if (rc < 0) {
++		unlink(outfile);
+ 		err(1, "could not write signature list");
++	}
+ 
+ 	close(outfd);
+ 	xfree(output);
+-- 
+2.37.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
