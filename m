Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF68EEC281
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 21:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54674612BC;
	Mon, 23 Feb 2026 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XfXij-8s5LT; Mon, 23 Feb 2026 21:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E5861246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771881113;
	bh=ECSJbs4ndBlMKhCT4k7dPeQAYVbMsxewpHXhCdvj8bg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l8nZek7gXfo/IAOk1cZNi2wUUCI8+vn2tXBdrkUi67B9qm8RVx9oWtPimEcQRdxIi
	 6qYpALJyndETf5el20POFKcIDirks/Ba5aunyDGKcLC1kgmlL0cO+EuiHn2aD5JPe8
	 xWID0yEbqOTMM+gjCK4PCLp7AHPcQqWs2hLgvU72N6QyLIHmCQDU7+y0fOg2sGp4ml
	 z21+4n8OIZklcatij41S070tOqVVyGmOrqVs2J0ZysrnbCcapwiwb2B5JdCWr/mnLN
	 rs5bk//9bxwfk5vK7Xz/ohcFrL4AlUpSpTwHZFZ+yDtTnAvHq8BQxdfIUO3B+6eOAK
	 y47SyGFX3R6zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E5861246;
	Mon, 23 Feb 2026 21:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D1DD249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E76361246
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZRE4vmKKGmm for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 21:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4898861224
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4898861224
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 21:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6530F8714E; Mon, 23 Feb 2026 21:06:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 22:05:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 421b5545f8110faf2de9b2165956d9d897f483fe
X-Git-Newrev: 173841426fe0edb1e80a47bdfdaf0f7ea1320d42
X-Patchwork-Hint: ignore
Message-Id: <20260223210652.6530F8714E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpir: fix build with gcc 15.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/173841426fe0edb1e80a47bdfdaf0f7ea1320d42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/8e8/8e87fc05c41eb420a026a7df86efcd9662b74353/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpir/0004-fix-configure-with-gcc-15.patch | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/mpir/0004-fix-configure-with-gcc-15.patch b/package/mpir/0004-fix-configure-with-gcc-15.patch
new file mode 100644
index 0000000000..32ca76dde6
--- /dev/null
+++ b/package/mpir/0004-fix-configure-with-gcc-15.patch
@@ -0,0 +1,41 @@
+From da003143cc6f217dcf474517d54b3aee06c9c18f Mon Sep 17 00:00:00 2001
+From: Leon White <l.white@interstellarlab.earth>
+Date: Mon, 25 Aug 2025 17:24:55 +0200
+Subject: [PATCH] fix configure with gcc-15
+
+Added to Alpine Linux with commit
+https://gitlab.alpinelinux.org/alpine/aports/-/commit/ded83e23c95b2560d2d77c0e61a6425872aa273b
+
+Fixes compile error
+
+conftest.c: In function 'f':
+conftest.c:14:48: error: too many arguments to function 'g'; expected 0, have 6
+   14 | for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+      |                                                ^ ~
+conftest.c:13:17: note: declared here
+   13 | void h(){} void g(){}
+      |                 ^
+
+Upstream: https://github.com/wbhart/mpir/pull/300
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index cd917567..53b9ef9c 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -590,7 +590,7 @@ extern
+ __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
+ void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
+-void h(){} void g(){}
++void h(){} void g(int, t1 *, t1, t1 *, t1 *, int) {}
+ for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
+ #else
+ int dummy;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
