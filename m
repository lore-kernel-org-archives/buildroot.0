Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D002C54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5654160A;
	Sun, 29 Jan 2023 21:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5654160A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiM81xuntonW; Sun, 29 Jan 2023 21:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FD8409A5;
	Sun, 29 Jan 2023 21:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03FD8409A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D51351BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB8EC400CC
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB8EC400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY1XLbqUOPq6 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:06:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2FC4403A2
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2FC4403A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A9A387C4F; Sun, 29 Jan 2023 21:06:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 21:57:26 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0682418f5a763dd83b443385c24cbccbe313f1a2
X-Git-Newrev: 85e4bb34379126110a34785d7645929f1c3874eb
X-Patchwork-Hint: ignore
Message-Id: <20230129210621.9A9A387C4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/ipmitool: fix
 broken IANA PEN registry URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=85e4bb34379126110a34785d7645929f1c3874eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Backport the upstream fix for the IANA Private Enterprise Numbers
registry URL so the correct file gets downloaded and installed.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4b6ccffcfb84938d2f0813d7c98907d75b49b842)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
