Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 08:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7CF82FB1;
	Tue, 11 Oct 2022 08:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7CF82FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDXCQtT3Ia9h; Tue, 11 Oct 2022 08:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A4082E1A;
	Tue, 11 Oct 2022 08:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A4082E1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E40DC1BF302
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 08:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEBCD82E1A
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 08:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEBCD82E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2ZDsHKKhuQM for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 08:49:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AA5C82DD9
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AA5C82DD9
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 08:49:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bv10so16942550wrb.4
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 01:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzD4hn+ftYN2ugUAbVSnKhQTScGNYB8rlzlpeYRGvuA=;
 b=v8rNg1D5oFee/kAM5cuzyxMt5Ld0EZdUBhVAdtqPFmO1a+wJd11eai/YKd5ZS5/hD8
 UC+2v9m2AfU9UxyEg9UuCMo3pxWL6SXO9VB1i5tfmUBSFQbq1ZCjpjlDKmLKcDNMj8eG
 HlxBJBgpyy5eYu30IhM/1OGYTCliNLDw/nveCgaRdWt/yNQMFetkdDBkdAm16mlTsJd4
 b48NUVY3m0Q8eTuRZY/QUKxN+cuGvIoxtspv6VAdEeaOgJSeTUO2rNj0Cheu3Fje9ffV
 o4UjUYa+ZrW+ubXhdCWugcNacxpaf1/qkKGRBSkVId0Dtc7K9YVV5unuJyfM90YWCvbt
 njIQ==
X-Gm-Message-State: ACrzQf1pgajxpHMXJl3/73d+bOMEc3mnkg/UUK9/9WCtb64Wz2K93TC4
 YTZ9IT5XpVXQmAFikx0ljGyiYv6q+zMPtQ==
X-Google-Smtp-Source: AMsMyM5u/LjupWJi78cV4+g1OsGa9Bd4zG+QwyyC5oTWaGiCU61P2GPAZ07yrYARV4OB/+oOFbdF8A==
X-Received: by 2002:a5d:4687:0:b0:22f:21c6:4b66 with SMTP id
 u7-20020a5d4687000000b0022f21c64b66mr10555077wrq.154.1665478196461; 
 Tue, 11 Oct 2022 01:49:56 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm3396826wrt.53.2022.10.11.01.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 01:49:55 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 10:49:46 +0200
Message-Id: <20221011084946.2276735-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzD4hn+ftYN2ugUAbVSnKhQTScGNYB8rlzlpeYRGvuA=;
 b=qTCWkJ83rTVKVqp+FjczDH+/8fNCy1G/lpGsTYarYhdrgg95YqmIaWWZSRkdMxlkWj
 bozBHvVsrD2PzFYPg5K2/v1/swa5TKtsKQSgKiF73L+j3LLzBGbMSZC9kGiySaiTQVml
 nWHaztZ7tHbCTxe+fNrlU7DyYD9U15L1QZxYC/iSQmdy1bnEIvL0sLKV2qwOYXCcSxmA
 6+hUwFN3GQuyKMB/xwASBE4wAJpwQuj2+Yys9n+30bxzkrDNsRyxcHaDOkO6V3i5JEVP
 3sw7T5HTQQTV/AK8xAFoI+jAXDjTbs1ElGteQrNYzuVsY1ekvldwi48oIucV8tFf9sIX
 cKcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qTCWkJ83
Subject: [Buildroot] [PATCH] package/efivar: fix build with musl libc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream patch to fix build with musl libc.
This patch is only a requirement since efivar 38 and was applied
upstream shortly after the 38 version tag.

Fixes:
http://autobuild.buildroot.net/results/c49d894b109d68e2624074eab8b939fefa3b42ef/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 ...04-efisecdb-fix-build-with-musl-libc.patch | 185 ++++++++++++++++++
 1 file changed, 185 insertions(+)
 create mode 100644 package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch

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
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
