Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A208BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54A68402F2;
	Tue,  2 Jan 2024 20:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54A68402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpr-_5XOeoDw; Tue,  2 Jan 2024 20:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A79D408C0;
	Tue,  2 Jan 2024 20:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A79D408C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 252021BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F261440118
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F261440118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GvkviSpNOBxT for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:43:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37F6C400FC
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F6C400FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22AD683CEE; Tue,  2 Jan 2024 20:43:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:42:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6257fa486013538a47313f16e51b8515d189c17b
X-Git-Newrev: 7077476c8c85f23897ce14a203cc91596a63b202
X-Patchwork-Hint: ignore
Message-Id: <20240102204305.22AD683CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: Remove special handling of
 libstdc++ for ARC
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

commit: https://git.buildroot.net/buildroot/commit/?id=7077476c8c85f23897ce14a203cc91596a63b202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Effectively that's a revert of a very old fix [1]
which is no longer needed.

[1] https://git.buildroot.net/buildroot/commit/?id=ca99d0ea925e5a8e42bd270402b0171a39d1d955

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/gdb.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index af40f7f986..c67a292619 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -182,13 +182,6 @@ else
 GDB_CONF_OPTS += --disable-gdbserver
 endif
 
-# When gdb is built as C++ application for ARC it segfaults at runtime
-# So we pass --disable-build-with-cxx config option to force gdb not to
-# be built as C++ app.
-ifeq ($(BR2_arc),y)
-GDB_CONF_OPTS += --disable-build-with-cxx
-endif
-
 # gdb 7.12+ by default builds with a C++ compiler, which doesn't work
 # when we don't have C++ support in the toolchain
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
