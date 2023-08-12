Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A74EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F8BD40C43;
	Mon, 21 Aug 2023 20:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F8BD40C43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnorB_cVmtYI; Mon, 21 Aug 2023 20:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 730C540CB3;
	Mon, 21 Aug 2023 20:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 730C540CB3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A788F1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B447D414E4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B447D414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uwpl3Paq4yGs for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A07A410A5
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A07A410A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0697686025; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 12:49:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff6d6c79d3d0014b2111399fdf5353a825cc37a9
X-Git-Newrev: 4de60e41c3487946712da6d889ef89d325c2032a
X-Patchwork-Hint: ignore
Message-Id: <20230821200126.0697686025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: disable
 source-highlight
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4de60e41c3487946712da6d889ef89d325c2032a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The dependency is not provided by Buildroot, and it can potentially be
found by gdb's build system from the host system, which results in the
following build errors:

../../gdb/source-cache.c:37:10: fatal error: srchilite/sourcehighlight.h: No such file or directory
   37 | #include <srchilite/sourcehighlight.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [Makefile:1645: source-cache.o] Error 1
make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4b9c5c6b70..cee7b37bcd 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -134,7 +134,8 @@ GDB_CONF_OPTS = \
 	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
-	--without-mpfr
+	--without-mpfr \
+	--disable-source-highlight
 
 ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
 GDB_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
