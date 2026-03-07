Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26118FC9EF5
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C07FF84187;
	Sat,  7 Mar 2026 10:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ivOiFkHaOGW; Sat,  7 Mar 2026 10:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD0E084188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772880530;
	bh=vdquAj9b5etSj8sykMWq5plFGY7uw7BvTbm6jw5VEEI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iDp68GATodXOVH4kf7mVaHQqePE7hVxzCwKFdduVUgXZ7l9ONrIRSq/tBko/Twbrn
	 KWL+rZVcdeZBVDNUgtI5r+k4UZq6YXqD1RG2hNkarPsUHYgWdLwktMLCW8vOhvYSqY
	 sNSmu4QpzRN00Ghjw8fcSZGm/wkZfAG1BnZzGmfG2ekj1USMh5sOE+hnnl+xgV41To
	 +lq4Z3rQ31ZyE+PWZq/tcROBikq8PfSxVkKIh807cr7orfL8x2CAZlZarnMTcqNTtV
	 ZnCf3gU+R6Dhop6eIrIbJgM8GdP29cc/j9jMENOOnD4GcKfFt/Fw5PBuvySDX7Acol
	 TNxSqzxlzGX2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0E084188;
	Sat,  7 Mar 2026 10:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2462C223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2205884188
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnFtH83j2ERt for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6560F84187
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6560F84187
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:48:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D81A842AE; Sat,  7 Mar 2026 10:48:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:47:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e6c4f0888fb926c63e41e18ec2bdabafa8390be
X-Git-Newrev: cc3647e73fdf7f392f36f8160e164ec8e0698cc0
X-Patchwork-Hint: ignore
Message-Id: <20260307104847.6D81A842AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker: Fix build with gcc-15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc3647e73fdf7f392f36f8160e164ec8e0698cc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add patch from Debian to fix build error with gcc-15.x

Fixes:
https://autobuild.buildroot.net/results/495/4956555fd033d43c1877e66141789bcd06aff5be/

Patch sent to fork which is used by Arch Linux:
https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wmdocker

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...compatibility-explicit-fallthrough-undecl.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
new file mode 100644
index 0000000000..c0dc18d17a
--- /dev/null
+++ b/package/docker/0001-fix-gcc-15-compatibility-explicit-fallthrough-undecl.patch
@@ -0,0 +1,38 @@
+From 55054532589041e3c7b970fefaeeeee871f4f6be Mon Sep 17 00:00:00 2001
+From: Tianon Gravi <tianon@debian.org>
+Date: Wed, 25 Feb 2026 08:24:26 +0100
+Subject: [PATCH] fix gcc-15+ compatibility (explicit fallthrough,
+ undeclared/unused arguments)
+
+Downloaded from Debian:
+https://sources.debian.org/src/docker/1.5-6/debian/patches/gcc-15.patch
+
+Upstream: https://github.com/mdomlop/wmdocker/commit/55054532589041e3c7b970fefaeeeee871f4f6be
+
+[Bernd: rebased patch]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ docker.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/docker.c b/docker.c
+index 4cc8d78..6105ab8 100644
+--- a/docker.c
++++ b/docker.c
+@@ -46,7 +46,7 @@ void signal_handler(int signal)
+ }
+ 
+ 
+-void parse_cmd_line()
++void parse_cmd_line(int argc, char **argv)
+ {
+   int i;
+   gboolean help = FALSE;
+@@ -283,6 +283,7 @@ void event_loop()
+       case ReparentNotify:
+         if (e.xany.window == win) /* reparented to us */
+           break;
++        /* fallthrough */
+       case UnmapNotify:
+       case DestroyNotify:
+         for (it = icons; it; it = g_slist_next(it)) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
