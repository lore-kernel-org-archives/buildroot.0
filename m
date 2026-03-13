Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88B5105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A80160F1C;
	Sat, 14 Mar 2026 07:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rnpf-X09i9sR; Sat, 14 Mar 2026 07:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FCAA60F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474587;
	bh=LpiOwu0UQk+4fgg9Q7Qytg14Uo9bsSKSB4hyBx8Oof4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O88D6qmtu7KdOqIQ5e+rd9NL6iZXoJzrV6XKu7bG9B33bfZ4b58yDcVo7gr8JGkrC
	 iA/80hCYRON9wbS/neDCvlYnWpfCXm4YyR7d0xLzhihVBLRgewqa38iovpAahWNUQw
	 aG+oAp8cUy22BAJ3a8VPFe5tCVN5SfVS8j4FNvHkQKyvTAw0qv4xVBAXdzOO/KNRdv
	 KM3llQwIKXDyN5WJ6EZkbyIThvnWgKEaMnN15om3p2UlLEj/cq5O02Ue3woHtAw9iF
	 nNPtxsopgt/M6Vxbtr7Dy4ZG+qQBER25ByrsABeWOkvJb1JRmpUn0rZ1LPSPlRm2aB
	 FLorgwM2XjEGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FCAA60F28;
	Sat, 14 Mar 2026 07:49:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16721786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7454D60EF4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0eRDhwNxqQ9 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0546D60EF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0546D60EF7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF6D86365; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:11:04 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 70302f9267f15e2f132731ef2b04a24f69bc9c28
X-Git-Newrev: 254712b12a862887a7c6c73540d102fc29943e1b
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.1BF6D86365@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/docker: Fix build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/254712b12a862887a7c6c73540d102fc29943e1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
