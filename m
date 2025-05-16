Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B36C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C565C70DDA;
	Mon, 19 May 2025 11:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sVLghfZOrYQ; Mon, 19 May 2025 11:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD3D70DD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD3D70DD7;
	Mon, 19 May 2025 11:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25CA8193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E43640DBA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhkrSJWHXspe for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA1A4183C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FA1A4183C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48B618348A; Mon, 19 May 2025 10:40:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 15:36:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f5d4ed04acd448fc70d330edf3c2a6ac886749b1
X-Git-Newrev: 22cd2e0bc4545d46d92936e5bb5c98f1e22d58f8
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.48B618348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unifdef: fix build
 with gcc 15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22cd2e0bc4545d46d92936e5bb5c98f1e22d58f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch fixing compilation on hosts with gcc 15.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-Don-t-use-C23-constexpr-keyword.patch     | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
new file mode 100644
index 0000000000..5b5c9690da
--- /dev/null
+++ b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
@@ -0,0 +1,60 @@
+From d616741e6b0d5b57b66447e85ad32b283b28adde Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 17 Nov 2024 01:26:27 +0000
+Subject: [PATCH] Don't use C23 constexpr keyword
+
+This fixes building with upcoming GCC 15 which defaults to -std=gnu23.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/fanf2/unifdef/pull/19
+---
+ unifdef.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/unifdef.c b/unifdef.c
+index dc145a2..4bd3bda 100644
+--- a/unifdef.c
++++ b/unifdef.c
+@@ -202,7 +202,7 @@ static int              depth;			/* current #if nesting */
+ static int              delcount;		/* count of deleted lines */
+ static unsigned         blankcount;		/* count of blank lines */
+ static unsigned         blankmax;		/* maximum recent blankcount */
+-static bool             constexpr;		/* constant #if expression */
++static bool             is_constexpr;		/* constant #if expression */
+ static bool             zerosyms;		/* to format symdepth output */
+ static bool             firstsym;		/* ditto */
+ 
+@@ -1086,7 +1086,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			*valp = (value[sym] != NULL);
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else if (!endsym(*cp)) {
+ 		debug("eval%d symbol", prec(ops));
+ 		sym = findsym(&cp);
+@@ -1103,7 +1103,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 			cp = skipargs(cp);
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else {
+ 		debug("eval%d bad expr", prec(ops));
+ 		return (LT_ERROR);
+@@ -1170,10 +1170,10 @@ ifeval(const char **cpp)
+ 	long val = 0;
+ 
+ 	debug("eval %s", *cpp);
+-	constexpr = killconsts ? false : true;
++	is_constexpr = killconsts ? false : true;
+ 	ret = eval_table(eval_ops, &val, cpp);
+ 	debug("eval = %d", val);
+-	return (constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
++	return (is_constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
+ }
+ 
+ /*
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
