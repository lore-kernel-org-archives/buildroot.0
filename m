Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03AFCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5829D42825;
	Fri, 29 May 2026 21:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAQRRNFpMH-O; Fri, 29 May 2026 21:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7281E42838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780090929;
	bh=B4rMt6yEYctQfW6WIC1YCxWd+GxfDt5STmtpTl2XtIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bbtrV7uGZj7McDEfOjGwBtCxetZo7TeCPftwWCskUvSSWbx5evE76uY8XPNXUaKbe
	 zZJtIXBWLfJUG+detMQLG31ShgSQjKR1aqHifALVhFAA8xhXwSU1vKZmtazo2xmvxC
	 5fxlgPnSPkEmxjtQnQdPD6I1opI+VXfcuHCQjYma2wMGCsMdmKkYJ7l9rzVAMQo992
	 Z+GDEIVforNZLDrLDaHWsxswKmDZo+0/xMc8R5KFVaqGz859IhdIjcb15dDyAHEjMu
	 e7Z/dz/A8Gir5PcaMAc1GqdHAFO432uLYZbNp8pMY0d2hH8LkUOcXQVPYthtzEc2fx
	 j+/SKH7thaTiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7281E42838;
	Fri, 29 May 2026 21:42:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F33F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 418624236C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jlpvBOeHuWv for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7576E42367
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7576E42367
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:42:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B53B98749B; Fri, 29 May 2026 21:41:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:41:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 020d575bcc9c78ca47cd1ff5fb46caff472ddb36
X-Git-Newrev: 7811063db22404cd020ec6ba558247a8cb6d0eb7
X-Patchwork-Hint: ignore
Message-Id: <20260529214153.B53B98749B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libenca: fix C23 compatibility for
 getenv/getopt prototypes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7811063db22404cd020ec6ba558247a8cb6d0eb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

GCC 15 defaults to C23, which removes support for K&R-style
unprototyped function declarations. This causes build failures
with strict modern C libraries.

Add proper function prototypes for getopt, getopt_long,
getopt_long_only, getenv, and _getopt_internal to comply
with C23 requirements.

Fixes build with musl libc and GCC 15.

Upstream: https://github.com/Project-OSS-Revival/enca/pull/97

Fixes:

  https://autobuild.buildroot.net/results/982831f380ba21a28d4a9a0cb100d055771898e2/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-compatibility-for-getenv-getopt-prototyp.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch b/package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch
new file mode 100644
index 0000000000..74e92ce677
--- /dev/null
+++ b/package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch
@@ -0,0 +1,69 @@
+From 1782ea5dd749cd66b38b03aa02bd0c2f9d558f83 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sat, 18 Apr 2026 14:25:27 +0530
+Subject: [PATCH] src: fix C23 compatibility for getenv/getopt prototypes
+
+GCC 15 defaults to C23, which no longer supports unprototyped function
+declarations (K&R style). This fixes conflicts with strict prototypes
+in modern C libraries like musl.
+
+Build-tested in Buildroot using musl libc and C23.
+
+Upstream: https://github.com/Project-OSS-Revival/enca/pull/97
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/getopt.h      | 16 +++++++++++-----
+ src/getopt_long.c |  2 +-
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/src/getopt.h b/src/getopt.h
+index 2eae587..91647ae 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -144,7 +144,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int __argc, char *const *__argv, const char *__shortopts);
+ # else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int argc, char * const argv[], const char *shortopts);
+ # endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+@@ -161,12 +161,18 @@ extern int _getopt_internal (int __argc, char *const *__argv,
+ 			     int __long_only);
+ # endif
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int argc, char * const argv[], const char *shortopts);
+ # ifndef __need_getopt
+-extern int getopt_long ();
+-extern int getopt_long_only ();
++extern int getopt_long (int argc, char *const *argv, const char *shortopts,
++		        const struct option *longopts, int *longind);
++extern int getopt_long_only (int argc, char *const *argv,
++			     const char *shortopts,
++		             const struct option *longopts, int *longind);
+ 
+-extern int _getopt_internal ();
++extern int _getopt_internal (int __argc, char *const *__argv,
++			     const char *__shortopts,
++		             const struct option *__longopts, int *__longind,
++			     int __long_only);
+ # endif
+ #endif /* __STDC__ */
+ 
+diff --git a/src/getopt_long.c b/src/getopt_long.c
+index caba753..a55fe2a 100644
+--- a/src/getopt_long.c
++++ b/src/getopt_long.c
+@@ -199,7 +199,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *name);
+ #endif
+ 
+ static char *
+-- 
+2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
