Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B4107BCFF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 261654104B;
	Sat, 14 Mar 2026 08:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9sxm0wXLoLk; Sat, 14 Mar 2026 08:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C174102C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475231;
	bh=CxVXWkC1rUmIDlZgcQLnliDyZKv6GhVTksnXIeL0iN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F01OhRXsKnmy+osrbz/zQJyHCchhgtnWp3OuoPlFQPw88kl+19omaftKrdtbbqrxy
	 hnatjYiUhm1iTos1azMp82sDLyeZQ2FZc7ue4n8o6C1m4gYJaEeEnzZt5P65O6KODF
	 ugy0fM5ZjNSFQi6tLk3SU9ndyznkH+JhZewBobAzcmtmCJ6gbEmsI1ktYRSf+04asx
	 jGHzOSOn+BUUjdWlkvGYFZoT8tBQ2KciB6UT91V5bHhTE2HLnWZ72AmQq3Hq1AIWdy
	 FqWagof/HKap6qeZSTV5yWOjsW53IXQZlQyR9tSsHW2Oz0Ct3YAAAblXCkuDN50VnE
	 4N4CsNJxR0PwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C174102C;
	Sat, 14 Mar 2026 08:00:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B0AD1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A95D841042
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmuYT9fVQKfs for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7804101B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB7804101B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F15E386365; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:11:01 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d7e87b8b6ef1adc0aad5c2f1d9bd383b4021744c
X-Git-Newrev: 50645ad43590c330aa56b54df954b2841e7a7d49
X-Patchwork-Hint: ignore
Message-Id: <20260314080009.F15E386365@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/docker: Fix build
 with gcc-15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50645ad43590c330aa56b54df954b2841e7a7d49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add patch from Debian to fix build error with gcc-15.x

Fixes:
https://autobuild.buildroot.net/results/495/4956555fd033d43c1877e66141789bcd06aff5be/

Patch sent to fork which is used by Arch Linux:
https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wmdocker

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cc3647e73fdf7f392f36f8160e164ec8e0698cc0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
