Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBEAC54757
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 09:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9945940B3A;
	Wed, 28 Aug 2024 09:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8sbt5z_LxgF; Wed, 28 Aug 2024 09:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8B5640B4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B5640B4A;
	Wed, 28 Aug 2024 09:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 772671BF980
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 09:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B7D860A71
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 09:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eos8iJDnWUGD for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 09:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F09460A8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F09460A8C
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 09:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF4B7865C4; Wed, 28 Aug 2024 09:18:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 11:07:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d2865a73fa330c77cd099329ef6b4f327b68ce2b
X-Git-Newrev: 574d6b128830fa7e6992d4829e5cf4bab23534ca
X-Patchwork-Hint: ignore
Message-Id: <20240828091802.DF4B7865C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/uclibc: add patch
 for libucontext usage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=574d6b128830fa7e6992d4829e5cf4bab23534ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

*ucontext functions are only implemented for a subset of
uClibc supported architectures. To allow the external library
libucontext to be used this small patch is required.
Tested for riscv64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f761a8c4516d88d70ae6f5d192fdb99cafa761a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../uclibc/0001-allow-to-use-sys-ucontext.h.patch  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch b/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch
new file mode 100644
index 0000000000..b6bd5602d9
--- /dev/null
+++ b/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch
@@ -0,0 +1,35 @@
+From 903da45dde43836e35a295226c5b1efccd413c08 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 17 Jul 2024 15:41:40 +0200
+Subject: [PATCH] allow to use <sys/ucontext.h>
+
+For architectures without ucontext implementation it is possible
+to use libucontext with this small adaptation.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MZCPGG56TL7SVOZY2L3AGHLREJ76BYZE/
+---
+ include/ucontext.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/ucontext.h b/include/ucontext.h
+index 4ce114ef1..76b4f375e 100644
+--- a/include/ucontext.h
++++ b/include/ucontext.h
+@@ -23,11 +23,11 @@
+ 
+ #include <features.h>
+ 
+-#ifdef __UCLIBC_HAS_CONTEXT_FUNCS__
+-
+ /* Get machine dependent definition of data structures.  */
+ #include <sys/ucontext.h>
+ 
++#ifdef __UCLIBC_HAS_CONTEXT_FUNCS__
++
+ __BEGIN_DECLS
+ 
+ /* Get user context and store it in variable pointed to by UCP.  */
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
