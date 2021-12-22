Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 08:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68AAB82F99;
	Wed, 22 Dec 2021 08:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FcsjMCT68w2; Wed, 22 Dec 2021 08:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7356D82F6F;
	Wed, 22 Dec 2021 08:35:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD861BF2FA
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 084B2415D7
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QuAQ-v9w2-n for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 08:35:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AE05415D8
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 08:35:26 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bn20so2576987ljb.8
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 00:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yrRMG30NtscgbWc4uFq25lvqvRD00ghKnHZJN4yWicY=;
 b=IUmKpycKl5hpmvxvpi3j7RXBB4WyoL13R7dQl97CRmXbByefXcl+84xGcQygW1zGMq
 YKvrjs4Uj8Xk4iSoMaW8McCPj2xqREBojpjvBHWeGR6m55mOv3u3AfaxXocXT3qdE94w
 8DKUS9//cybRqh46Fx5cS1wwSSQ0Qtp45GgdHuRPlZFOBKuK9tE/MJPaRIIBJ27akgjY
 LvGXqn56v9XtrAY7JE0XXsSCe/IoGDRIcXp+F8b2rz5CbEwa6eOBGaGkPbATnSPsRFtA
 bMTKVzewprDhYBUazL3tCeEWyCvjO8fv0KASbaJ3nVRDUQwtzClpsxORJr31pwLMgqBH
 cWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrRMG30NtscgbWc4uFq25lvqvRD00ghKnHZJN4yWicY=;
 b=S+I2jYpqj6pUpUKJduP4hYw87djUFSYe96sPWi4PDvOAe1aRRWRMCoWEfUoJtFtxVU
 v+Qv6hXuWvZay4IX2jZHQ6ro4LAf/hknbQ8H3OUzKonUiD3wsiV5gyQF/zvZGiFYtDAc
 MMGmW0nlKw+6/PS5lHY0a1jeD8c7zBDIDirPbYdkl8Sw7Oc46hZStWt1PV1jKAzQUEGU
 rOqDx+J0MjrAS166+vYf7rOa5KsUaTbx1LTItOd6eIAyC/lkszal+GINlqpwsmfz2pSq
 D3Z/NcTQkMu4Q0OhLe8hTSQZdNf2qwmo1qR8WccWACwFcipwjoqOwBShveMFlFg35wZc
 UsqQ==
X-Gm-Message-State: AOAM531rdrbTDWrR7HhI21RYEeEBicTr/+IS+YmYLmsAq4TN3zl5iRkH
 YG/WlcYxFp2TzqxLK1KbEtIvsqEjm1E=
X-Google-Smtp-Source: ABdhPJxC0/bz938XkRtujorQcRHJaeMAMiA6UvvCGEiMGqnPaZzV4dsesHfGK+PYPxl8RKsuxWm1mw==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr1464367ljq.222.1640162124718; 
 Wed, 22 Dec 2021 00:35:24 -0800 (PST)
Received: from localhost.localdomain ([98.128.186.122])
 by smtp.gmail.com with ESMTPSA id x28sm147988lfa.85.2021.12.22.00.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:35:24 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 09:35:15 +0100
Message-Id: <20211222083515.1150267-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222083515.1150267-1-troglobit@gmail.com>
References: <20211222083515.1150267-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/makedevs: coding style and
 whitespace cleanup
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This program is cobbled up with parts from all over the place, mostly
BusyBox.  This patch is a modest attempt to clean up the coding style
and fix some whitespace issues.  Some changes, e.g., comments are for
consistency with the rest fo the program.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/makedevs/makedevs.c | 74 +++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 634ae7c3d8..d321b9651a 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -44,7 +44,7 @@ uid_t recursive_uid;
 gid_t recursive_gid;
 unsigned int recursive_mode;
 #define PASSWD_PATH "etc/passwd"  /* MUST be relative */
-#define GROUP_PATH "etc/group"  /* MUST be relative */
+#define GROUP_PATH  "etc/group"   /* MUST be relative */
 
 void bb_verror_msg(const char *s, va_list p)
 {
@@ -76,10 +76,14 @@ void bb_error_msg_and_die(const char *s, ...)
 
 void bb_vperror_msg(const char *s, va_list p)
 {
-	int err=errno;
-	if(s == 0) s = "";
+	int err = errno;
+
+	if (s == 0)
+	  s = "";
 	bb_verror_msg(s, p);
-	if (*s) s = ": ";
+
+	if (*s)
+	  s = ": ";
 	fprintf(stderr, "%s%s\n", s, strerror(err));
 }
 
@@ -99,14 +103,17 @@ void bb_perror_msg_and_die(const char *s, ...)
 	va_start(p, s);
 	bb_vperror_msg(s, p);
 	va_end(p);
+
 	exit(1);
 }
 
 FILE *bb_xfopen(const char *path, const char *mode)
 {
 	FILE *fp;
+
 	if ((fp = fopen(path, mode)) == NULL)
 		bb_perror_msg_and_die("%s", path);
+
 	return fp;
 }
 
@@ -154,8 +161,10 @@ int bb_make_directory (char *path, long mode, int flags)
 		}
 
 		if (mkdir(path, 0777) < 0) {
-			/* If we failed for any other reason than the directory
-			 * already exists, output a diagnostic and return -1.*/
+			/*
+			 * If we failed for any other reason than the directory
+			 * already exists, output a diagnostic and return -1.
+			 */
 			if ((errno != EEXIST && errno != EISDIR)
 					|| !(flags & FILEUTILS_RECUR)
 					|| (stat(path, &st) < 0 || !S_ISDIR(st.st_mode))) {
@@ -163,9 +172,12 @@ int bb_make_directory (char *path, long mode, int flags)
 				umask(mask);
 				break;
 			}
-			/* Since the directory exists, don't attempt to change
+
+			/*
+			 * Since the directory exists, don't attempt to change
 			 * permissions if it was the full target.  Note that
-			 * this is not an error conditon. */
+			 * this is not an error conditon.
+			 */
 			if (!c) {
 				umask(mask);
 				return 0;
@@ -173,11 +185,13 @@ int bb_make_directory (char *path, long mode, int flags)
 		}
 
 		if (!c) {
-			/* Done.  If necessary, updated perms on the newly
+			/*
+			 * Done.  If necessary, updated perms on the newly
 			 * created directory.  Failure to update here _is_
-			 * an error.*/
+			 * an error.
+			 */
 			umask(mask);
-			if ((mode != -1) && (chmod(path, mode) < 0)){
+			if ((mode != -1) && (chmod(path, mode) < 0)) {
 				fail_msg = "set permissions of";
 				break;
 			}
@@ -198,16 +212,20 @@ const char * const bb_msg_memory_exhausted = "memory exhausted";
 void *xmalloc(size_t size)
 {
 	void *ptr = malloc(size);
+
 	if (ptr == NULL && size != 0)
 		bb_error_msg_and_die(bb_msg_memory_exhausted);
+
 	return ptr;
 }
 
 void *xcalloc(size_t nmemb, size_t size)
 {
 	void *ptr = calloc(nmemb, size);
+
 	if (ptr == NULL && nmemb != 0 && size != 0)
 		bb_error_msg_and_die(bb_msg_memory_exhausted);
+
 	return ptr;
 }
 
@@ -216,6 +234,7 @@ void *xrealloc(void *ptr, size_t size)
 	ptr = realloc(ptr, size);
 	if (ptr == NULL && size != 0)
 		bb_error_msg_and_die(bb_msg_memory_exhausted);
+
 	return ptr;
 }
 
@@ -249,6 +268,7 @@ char *private_get_line_from_file(FILE *file, int c)
 		}
 		linebuf[idx] = 0;
 	}
+
 	return linebuf;
 }
 
@@ -263,7 +283,7 @@ long my_getpwnam(const char *name)
 	FILE *stream;
 
 	stream = bb_xfopen(PASSWD_PATH, "r");
-	while(1) {
+	while (1) {
 		errno = 0;
 		myuser = fgetpwent(stream);
 		if (myuser == NULL)
@@ -284,7 +304,7 @@ long my_getgrnam(const char *name)
 	FILE *stream;
 
 	stream = bb_xfopen(GROUP_PATH, "r");
-	while(1) {
+	while (1) {
 		errno = 0;
 		mygroup = fgetgrent(stream);
 		if (mygroup == NULL)
@@ -312,14 +332,16 @@ unsigned long get_ug_id(const char *s, long (*my_getxxnam)(const char *))
 	return r;
 }
 
-char * last_char_is(const char *s, int c)
+char *last_char_is(const char *s, int c)
 {
 	char *sret = (char *)s;
+
 	if (sret) {
 		sret = strrchr(sret, c);
-		if(sret != NULL && *(sret+1) != 0)
+		if (sret != NULL && *(sret+1) != 0)
 			sret = NULL;
 	}
+
 	return sret;
 }
 
@@ -437,9 +459,8 @@ void bb_show_usage(void)
 	exit(1);
 }
 
-int bb_recursive(const char *fpath, const struct stat *sb,
-		int tflag, struct FTW *ftwbuf){
-
+int bb_recursive(const char *fpath, const struct stat *_, int __, struct FTW *___)
+{
 	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
 		bb_perror_msg("chown failed for %s", fpath);
 		return -1;
@@ -467,7 +488,7 @@ int main(int argc, char **argv)
 	bb_applet_name = basename(argv[0]);
 
 	while ((opt = getopt(argc, argv, "d:")) != -1) {
-		switch(opt) {
+		switch (opt) {
 			case 'd':
 				table = bb_xfopen((line=optarg), "r");
 				break;
@@ -528,8 +549,7 @@ int main(int argc, char **argv)
 		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
 						&type, &mode, user, group, &major,
 						&minor, &start, &increment, &count)) ||
-				((major | minor | start | count | increment) > 0xfffff))
-		{
+				((major | minor | start | count | increment) > 0xfffff)) {
 			if (*line=='\0' || *line=='#' || isspace(*line))
 				continue;
 			bb_error_msg("line %d invalid: '%s'\n", linenum, line);
@@ -565,16 +585,17 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
-			if ((mode != -1) && (chmod(full_name, mode) < 0)){
+			if ((mode != -1) && (chmod(full_name, mode) < 0)) {
 				bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
 		} else if (type == 'f' || type == 'F') {
 			struct stat st;
+
 			if ((stat(full_name, &st) < 0 || !S_ISREG(st.st_mode))) {
 				if (type == 'F') {
-					continue; /*Ignore optional files*/
+					continue; /* Ignore optional files */
 				}
 				bb_perror_msg("line %d: regular file '%s' does not exist", linenum, full_name);
 				ret = EXIT_FAILURE;
@@ -585,7 +606,7 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
-			if ((mode != -1) && (chmod(full_name, mode) < 0)){
+			if ((mode != -1) && (chmod(full_name, mode) < 0)) {
 				bb_perror_msg("line %d: chmod failed for %s", linenum, full_name);
 				ret = EXIT_FAILURE;
 				goto loop;
@@ -599,8 +620,7 @@ int main(int argc, char **argv)
 				ret = EXIT_FAILURE;
 				goto loop;
 			}
-		} else
-		{
+		} else {
 			dev_t rdev;
 			unsigned i;
 			char *full_name_inc;
@@ -619,7 +639,7 @@ int main(int argc, char **argv)
 				goto loop;
 			}
 
-			full_name_inc = xmalloc(strlen(full_name) + sizeof(int)*3 + 2);
+			full_name_inc = xmalloc(strlen(full_name) + sizeof(int) * 3 + 2);
 			if (count)
 				count--;
 			for (i = start; i <= start + count; i++) {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
