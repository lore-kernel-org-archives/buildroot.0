Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831CC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3278040E10;
	Mon, 19 May 2025 16:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEIzbTXTPbvc; Mon, 19 May 2025 16:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC5240C3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC5240C3E;
	Mon, 19 May 2025 16:42:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4CD1196
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B621E408BF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qg6ddFrtDAgb for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCA0240C3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCA0240C3E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBFDA8745E; Mon, 19 May 2025 16:42:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:40:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ba0f2cc8ad63b534150040fb84e25938630e515
X-Git-Newrev: 90c5270bac3c3d637ac798a6a8a55de58a2b6b67
X-Patchwork-Hint: ignore
Message-Id: <20250519164229.BBFDA8745E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pppd: fix build with
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5275518273132008356=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5275518273132008356==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=90c5270bac3c3d637ac798a6a8a55de58a2b6b67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...2-pppd-Fix-building-session.c-with-GCC-15.patch | 36 ++++++++++
 .../0003-pppdump-Fixed-building-with-GCC-15.patch  | 76 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/package/pppd/0002-pppd-Fix-building-session.c-with-GCC-15.patch b/package/pppd/0002-pppd-Fix-building-session.c-with-GCC-15.patch
new file mode 100644
index 0000000000..4fcd492562
--- /dev/null
+++ b/package/pppd/0002-pppd-Fix-building-session.c-with-GCC-15.patch
@@ -0,0 +1,36 @@
+From fb769c380eeacf23b64cb3bf7860ba49a0e0eed5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Apr 2025 00:15:57 -0700
+Subject: [PATCH] pppd: Fix building session.c with GCC 15 (#553)
+
+Fixed building with GCC 15 which defaults to C23
+and find conflicting declration of getspnam() here
+with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
+
+Fixes
+../../ppp-2.5.2/pppd/session.c: In function 'session_start':
+../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
+  185 |     struct spwd *getspnam();
+      |                  ^~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/ppp-project/ppp/commit/fb769c380eeacf23b64cb3bf7860ba49a0e0eed5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pppd/session.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pppd/session.c b/pppd/session.c
+index f08d8e19..9cc75389 100644
+--- a/pppd/session.c
++++ b/pppd/session.c
+@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
+     char *cbuf;
+ #ifdef HAVE_SHADOW_H
+     struct spwd *spwd;
+-    struct spwd *getspnam();
+     long now = 0;
+ #endif /* #ifdef HAVE_SHADOW_H */
+ #endif /* #ifdef PPP_WITH_PAM */
diff --git a/package/pppd/0003-pppdump-Fixed-building-with-GCC-15.patch b/package/pppd/0003-pppdump-Fixed-building-with-GCC-15.patch
new file mode 100644
index 0000000000..ab7c94e506
--- /dev/null
+++ b/package/pppd/0003-pppdump-Fixed-building-with-GCC-15.patch
@@ -0,0 +1,76 @@
+From 05361692ee7d6260ce5c04c9fa0e5a1aa7565323 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Thu, 27 Feb 2025 23:00:16 +0100
+Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC 15 defaults to C23 which does not allow K&R declarations.
+
+Credit Yaakov Selkowitz in:
+https://src.fedoraproject.org/rpms/ppp/pull-request/12
+
+Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com>
+
+Upstream: https://github.com/ppp-project/ppp/commit/05361692ee7d6260ce5c04c9fa0e5a1aa7565323
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pppdump/pppdump.c | 20 +++++++-------------
+ 1 file changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
+index c24208af..1534036c 100644
+--- a/pppdump/pppdump.c
++++ b/pppdump/pppdump.c
+@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
+ extern int optind;
+ extern char *optarg;
+ 
+-void dumplog();
+-void dumpppp();
+-void show_time();
++void dumplog(FILE *);
++void dumpppp(FILE *);
++void show_time(FILE *, int);
+ 
+ int
+-main(ac, av)
+-    int ac;
+-    char **av;
++main(int ac, char **av)
+ {
+     int i;
+     char *p;
+@@ -97,8 +95,7 @@ main(ac, av)
+ }
+ 
+ void
+-dumplog(f)
+-    FILE *f;
++dumplog(FILE *f)
+ {
+     int c, n, k, col;
+     int nb, c2;
+@@ -241,8 +238,7 @@ struct pkt {
+ unsigned char dbuf[8192];
+ 
+ void
+-dumpppp(f)
+-    FILE *f;
++dumpppp(FILE *f)
+ {
+     int c, n, k;
+     int nb, nl, dn, proto, rv;
+@@ -375,9 +371,7 @@ dumpppp(f)
+ }
+ 
+ void
+-show_time(f, c)
+-    FILE *f;
+-    int c;
++show_time(FILE *f, int c)
+ {
+     time_t t;
+     int n;

--===============5275518273132008356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5275518273132008356==--
