Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F50C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4360382443;
	Mon, 20 Feb 2023 23:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4360382443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beAlgUeCZdQ9; Mon, 20 Feb 2023 23:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D228838C0;
	Mon, 20 Feb 2023 23:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D228838C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 626151BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E9B4174F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70E9B4174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_6B8BILkB2b for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FD4C41749
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FD4C41749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9033C828C8; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 22:26:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccaf9f316544f0c8c3546b70568ed48c265e801b
X-Git-Newrev: 4b6ccffcfb84938d2f0813d7c98907d75b49b842
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.9033C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ipmitool: fix broken
 IANA PEN registry URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b6ccffcfb84938d2f0813d7c98907d75b49b842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport the upstream fix for the IANA Private Enterprise Numbers
registry URL so the correct file gets downloaded and installed.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../ipmitool/0002-Fix-enterprise-numbers-URL.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
new file mode 100644
index 0000000000..07cdbd4527
--- /dev/null
+++ b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
@@ -0,0 +1,36 @@
+From 1edb0e27e44196d1ebe449aba0b9be22d376bcb6 Mon Sep 17 00:00:00 2001
+From: Alexander Amelkin <alexander@amelkin.msk.ru>
+Date: Tue, 22 Nov 2022 13:55:33 +0300
+Subject: [PATCH] Fix enterprise-numbers URL
+
+IANA has changed their URL scheme, and the content at the old URL for
+enterprise-numbers switched from text/plain to text/html.
+
+Fix Makefile.am to use the new URL
+
+Resolves ipmitool/ipmitool#377
+
+Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
+
+[vfazio: backport from upstream 1edb0e27e44196d1ebe449aba0b9be22d376bcb6]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ce3267f..3182a52 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -41,7 +41,7 @@ MAINTAINERCLEANFILES = Makefile.in aclocal.m4 configure configure-stamp \
+ 	$(distdir).tar.gz $(distdir).tar.bz2
+ 
+ SUBDIRS = lib src include doc contrib control
+-IANA_PEN = http://www.iana.org/assignments/enterprise-numbers
++IANA_PEN = http://www.iana.org/assignments/enterprise-numbers.txt
+ 
+ dist-hook:
+ 	cp control/ipmitool.spec $(distdir)
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
