Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85462CA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293CD610F4;
	Tue, 12 Sep 2023 06:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 293CD610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CddU-epwGSUA; Tue, 12 Sep 2023 06:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83930610F2;
	Tue, 12 Sep 2023 06:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83930610F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71501BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A13914019D
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A13914019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YACAZmkO6Pf3 for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E83D140105
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83D140105
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6CC386D76; Tue, 12 Sep 2023 06:27:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 08:08:02 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 39e856e8911ce71f7065be2413373c0a5a8ea70f
X-Git-Newrev: e8077da481b8b22512ab70ddcedbf82e128e1fc3
X-Patchwork-Hint: ignore
Message-Id: <20230912062709.D6CC386D76@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gdb: disable
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e8077da481b8b22512ab70ddcedbf82e128e1fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 4de60e41c3487946712da6d889ef89d325c2032a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
