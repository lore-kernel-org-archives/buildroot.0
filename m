Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD276C001B0
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 09:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8ED835D3;
	Fri, 11 Aug 2023 09:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C8ED835D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ES9czUBGxQs1; Fri, 11 Aug 2023 09:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE20835E9;
	Fri, 11 Aug 2023 09:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE20835E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2196B1BF5DF
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 09:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED59F41AFC
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 09:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED59F41AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaKKfbLXQzzU for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 09:45:51 +0000 (UTC)
X-Greylist: delayed 684 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Aug 2023 09:45:51 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFD5A41A60
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFD5A41A60
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 09:45:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (30)
Received: from bartekk-pc.lan (ip-194.4.61.77.edial.pl [194.4.61.77])
 by server220076.nazwa.pl (Postfix) with ESMTP id 7BF111BC9B1;
 Fri, 11 Aug 2023 11:34:24 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 11:34:21 +0200
Message-ID: <20230811093421.300794-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] gdb: disable source-highlight
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's being found from the host's source-highlight library
which results in the following build errors:

../../gdb/source-cache.c:37:10: fatal error: srchilite/sourcehighlight.h: No such file or directory
   37 | #include <srchilite/sourcehighlight.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [Makefile:1645: source-cache.o] Error 1
make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
