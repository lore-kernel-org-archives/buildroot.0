Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52ADCD342C
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 01:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8484040830;
	Tue,  5 May 2026 01:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5E1PrLkcTq1F; Tue,  5 May 2026 01:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D0740832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777943522;
	bh=ZX0C73jfFBt6xViWELhRp1UldLTyG1xbuCZ0B2yyUZM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzW3qlu6DXdF22RCct8WdFQPBMEuczkRFhmWzHu8GVpG1lF6CClAmm+m+P1A76BiI
	 7bPQ34Z/fcpEiJZsR3uv+CTfwm0xDcN/V3VIZwmrdbp+cgFlBZ5vEFUeCj5qodS6M6
	 F3GNcAQ286t911Jv+qn3qEW/V6OpCOZJJ417MmzKiM3ArSxs0N4Fuyfwvq9Jj58EYo
	 F7hITujdIOtV0W1IT28piu52C92JJHwLWfBC2s9tG7IZYncIKOmEGMfdvUJXwmKcMk
	 G4XHMAYMwJi+GDrsK4Gr+z76284UaevfjrliNtdLqDUN8g+c5NcwjNMObaOggx/Gp/
	 deSecYyMNqQgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D0740832;
	Tue,  5 May 2026 01:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 5D46130A
 for <buildroot@buildroot.org>; Tue,  5 May 2026 01:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 4025F40832
 for <buildroot@buildroot.org>; Tue,  5 May 2026 01:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id Csm8Y9Gu546Y for <buildroot@buildroot.org>;
 Tue,  5 May 2026 01:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=143.55.232.41;
 helo=v541.v5f06b487.use4.send.mailgun.net;
 envelope-from=bounce+4afdde.7f991a-buildroot=buildroot.org@drhouck.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 185D840830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 185D840830
Received: from v541.v5f06b487.use4.send.mailgun.net
 (v541.v5f06b487.use4.send.mailgun.net [143.55.232.41])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 185D840830
 for <buildroot@buildroot.org>; Tue,  5 May 2026 01:11:58 +0000 (UTC)
X-Mailgun-Sid: WyI3M2VlNiIsImJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIiwiN2Y5OTFhIl0=
Received: from dhouck-linux (unknown [73.82.189.57]) by
 7b260426155fb601497502ba67b714589b2cf9c4b894d90c376fc980477728c9 with SMTP id
 69f943dd12b51e904e255724; Tue, 05 May 2026 01:11:57 GMT
X-Mailgun-Sending-Ip: 143.55.232.41
From: Daniel Houck <Software@DRHouck.me>
To: buildroot@buildroot.org
Cc: Daniel Houck <Software@DRHouck.me>
Date: Mon,  4 May 2026 21:11:39 -0400
Message-ID: <20260505011139.2973700-1-Software@DRHouck.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504230627.2963070-1-Software@DRHouck.me>
References: <20260504230627.2963070-1-Software@DRHouck.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed;
 d=drhouck.me; q=dns/txt; s=krs; t=1777943517; x=1777950717; 
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender; 
 bh=8ZVVeTQL6lOQVHnl1EJN6JKhL61WIxKCXwQEenB4fAI=;
 b=KF9aFimS66kUrlnXe7IywrT1SZHB6jhDR9WmvwPvKlIbM2HIv77ofHnJwWHn0o4hJlTMHwrtLwUP5/JqgY4YRryGvtGOlQnPe+77dywCeX52lYEiXAI3zFb/cC+cWLj1yQ9O19tRgrn6WAbm4Q+9ikkU+NG69uYXlVxFTKddLzg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=DRHouck.me
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=drhouck.me header.i=@drhouck.me header.a=rsa-sha256
 header.s=krs header.b=KF9aFimS
Subject: [Buildroot] [PATCH v3] package/make: fix build with musl and
 gcc-15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch the parts of Make that use code invalid in C23.  It wasn't
included when compiling with glibc but failed to build with musl.

Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302

Signed-off-by: Daniel Houck <Software@DRHouck.me>
---
Changes v3 -> v2:
  - Format the patch as specified in Buildroot manual.  I thought I'd
    done that for v2 but forgot to actually commit that change, oops.

Changes v1 -> v2:
  - patch make instead of using CFLAGS (suggested by Marcus)

 ...1-fix-compilation-on-musl-with-gcc15.patch | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/make/0001-fix-compilation-on-musl-with-gcc15.patch

diff --git a/package/make/0001-fix-compilation-on-musl-with-gcc15.patch b/package/make/0001-fix-compilation-on-musl-with-gcc15.patch
new file mode 100644
index 0000000000..990aee0abf
--- /dev/null
+++ b/package/make/0001-fix-compilation-on-musl-with-gcc15.patch
@@ -0,0 +1,66 @@
+From 31bc8976fb7bfdde8b9293e6a4eb2becb29a73bc Mon Sep 17 00:00:00 2001
+From: Bobby Bingham <koorogi@koorogi.info>
+Date: Wed, 2 Jul 2025 18:09:28 -0500
+Subject: [PATCH] fix compilation on musl with gcc15
+
+Patch originally from https://codeberg.org/gentoo/gentoo/raw/branch/master/dev-build/make/files/make-4.4.1-c23.patch
+
+This addresses the same issues as, but is not quite identical to, the
+patch linked to as upstream.  Upstream has not acknowledged its patch in
+any way.
+
+Signed-off-by: Daniel Houck <Software@DRHouck.me>
+Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html
+---
+ lib/fnmatch.c | 2 +-
+ src/getopt.c  | 2 +-
+ src/getopt.h  | 7 -------
+ 3 files changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/lib/fnmatch.c b/lib/fnmatch.c
+index 01da376..9b54022 100644
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@ USA.  */
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ # endif
+ 
+ # ifndef errno
+diff --git a/src/getopt.c b/src/getopt.c
+index 7a792de..9b56abe 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char*);
+ #endif
+ 
+ static char *
+diff --git a/src/getopt.h b/src/getopt.h
+index df18cee..a6cc621 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -96,14 +96,7 @@ struct option
+ #define optional_argument	2
+ 
+ #if defined (__STDC__) && __STDC__
+-#ifdef __GNU_LIBRARY__
+-/* Many other libraries have conflicting prototypes for getopt, with
+-   differences in the consts, in stdlib.h.  To avoid compilation
+-   errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+-#else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
+-#endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+ extern int getopt_long_only (int argc, char *const *argv,
+-- 
+2.50.0
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
