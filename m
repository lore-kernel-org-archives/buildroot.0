Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013FDC87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04D840D9A;
	Sun, 10 Aug 2025 16:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMGHk4yFVXWJ; Sun, 10 Aug 2025 16:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F00D240D6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00D240D6A;
	Sun, 10 Aug 2025 16:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE7931
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88C964027D
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqNY9ikXfuwE for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D51A04017B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D51A04017B
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:59:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C537D87129; Sun, 10 Aug 2025 16:59:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Aug 2025 18:52:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6db1aeaeef3726ad07e6d6afc90a3e8c721d3728
X-Git-Newrev: 0bf9eae25ce67937b4b9de89f616a31e17c6327e
X-Patchwork-Hint: ignore
Message-Id: <20250810165912.C537D87129@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nanocom: fix build with GCC 15
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0bf9eae25ce67937b4b9de89f616a31e17c6327e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 15 switched to C23 by default, which made "void foo()" equivalent to
"void foo(void)". This causes a build error because init_comm() doesn't
actually take any arguments.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/nanocom/0003-fix-build-with-gcc-15.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/nanocom/0003-fix-build-with-gcc-15.patch b/package/nanocom/0003-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..59a2095337
--- /dev/null
+++ b/package/nanocom/0003-fix-build-with-gcc-15.patch
@@ -0,0 +1,19 @@
+GCC 15 switched to C23 by default, which made "void foo()" equivalent to
+"void foo(void)". This causes a build error because init_comm() doesn't
+actually take any arguments.
+
+Upstream: Submitted to author via email
+Signed-off-by: Florian Larysch <fl@n621.de>
+
+diff -purN old/nanocom.c new/nanocom.c
+--- old/nanocom.c	2025-08-10 01:34:12.000284003 +0200
++++ new/nanocom.c	2025-08-10 01:31:05.639050630 +0200
+@@ -329,7 +329,7 @@ int main(int argc, char *argv[]) {
+     memcpy(&pots, &pts, sizeof(pots));
+     
+     /*setup serial port with new settings*/
+-    init_comm(&pts);
++    init_comm();
+         
+     fprintf(stderr,"Press CTRL+T for menu options");   
+     display_state();
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
